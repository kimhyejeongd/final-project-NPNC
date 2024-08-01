package com.project.npnc.chatting.controller;



import static com.project.npnc.chatting.model.dto.ChattingMessage.createChattingMessage;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.PutObjectResult;
import com.project.npnc.chatting.model.dto.ChattingFile;
import com.project.npnc.chatting.model.dto.ChattingMessage;
import com.project.npnc.chatting.model.dto.ChattingRoom;
import com.project.npnc.chatting.model.service.ChatService;
import com.project.npnc.security.dto.Member;

import jakarta.servlet.ServletContext;
import lombok.RequiredArgsConstructor;
@Controller
@RequiredArgsConstructor
public class ChatController {
    private final WebSocketEventListener webSocketEventListener;
    private final ServletContext servletContext;
	private final ChatService service;
    private Set<Integer> users = new HashSet<>();

	@Value("${file.upload-dir}")
    private String uploadDir;
	
    @Value("${cloud.aws.s3.bucketName}")
    private String bucketName;
    
    private final AmazonS3 amazonS3;

    
	@MessageMapping("/{roomId}") //여기로 전송되면 메서드 호출 -> WebSocketConfig prefixes 에서 적용한건 앞에 생략
	@SendTo("/room/{roomId}")   //구독하고 있는 장소로 메시지 전송 (목적지)  -> WebSocketConfig Broker 에서 적용한건 앞에 붙어줘야됨
	public ChattingMessage test(@DestinationVariable int roomId,ChattingMessage message) {
    	System.out.println(message);
//		HttpSession session=(HttpSession)RequestContextHolder.currentRequestAttributes()
//		.resolveReference(RequestAttributes.REFERENCE_SESSION);
//		System.out.println(session);
		if(message.getFile()!=null) {
			System.out.println(message.getFile().toString());
		}
		System.out.println("Received message: " + message);
//		Received message: ChattingMessage(chatMsgKey=0, memberKey=2, chatRoomKey=10, chatMsgDetail=ㅈㅇㅂㅇㅈㅂ, chatMsgTime=Sun Jun 30 23:19:09 KST 2024, chatMsgNotice=null, chatReadCount=0)
// 		채팅 저장
        Map<String, Object> chatInfo = service.insertChat(message);
            System.out.println("Insert result: " + chatInfo.get("seq"));
            System.out.println(message);
      
            ChattingMessage chat = createChattingMessage(
	            		(int)chatInfo.get("seq"),
	            		message.getMemberKey(),
	            		roomId,
	            		message.getChatMsgDetail(),
	            		message.getChatMsgTime(),
	            		"N",
	            		(int)chatInfo.get("readCount"),
	            		message.getFile(),
	            		message.getFileContentType(),
	            		message.getMemberName()
            		);
        
        // 파일 메타 데이터 저장
       //ChattingFile chattingFile= service.insertChattingFile(chattingFile);

        webSocketEventListener.broadcastOpenedSession(Integer.toString(roomId));
        
        return chat;
	}
	
    @GetMapping("/room/{roomId}/users")
    @ResponseBody
    public Set<String> getUsersInRoom(@PathVariable String roomId) {
        return webSocketEventListener.getSessionsForRoom(roomId);
    }

    @GetMapping("/room/{roomId}/sessionCount")
    @ResponseBody
    public int getChatSessionCount(@PathVariable String roomId) {
        return webSocketEventListener.getChatSessionCount(roomId);
    }

    @PostMapping("/loadRecentChat")
	@ResponseBody
	public Map<String, Object> loadChat(@RequestParam int chatRoomKey ,@RequestParam int memberId) {
		Map<String, Object> readInfo = new HashMap<>();
		readInfo.put("roomId", chatRoomKey);
	    readInfo.put("memberKey", memberId);

	    List<ChattingMessage> chats = service.selectRoomChatList(readInfo);
	    int unreadCount = service.selectUnreadCount(readInfo);
	    readInfo.put("chats", chats);
	    readInfo.put("unreadCount", unreadCount);
	    
	    return readInfo;
	}
	
	//채팅방이 열려있을 때 부재중 메시지 카운트를 업데이트 해주는 메소드
	@PostMapping("/deleteReadBadge")
	@ResponseBody
	public void deleteReadBadge(@RequestParam int currRoomId, @RequestParam List<Integer> currMemberKey) {
		//매개변수로 현재 열려있는 창의 방번호와 멤버 키를 가져옴
		//그리고 방번호에 해당하는 메시지를 선택해서 그중 멤버키와 같은 isRead로우를 삭제 
		service.deleteReadBadge(currRoomId,currMemberKey);
	}
	
	@PostMapping("/exitChatRoom")
	@ResponseBody
	public void exitChatRoom(@RequestParam int roomId, @RequestParam int memberKey) {

		Map<String, Integer> exitInfo = new HashMap<>();
		exitInfo.put("roomId", roomId);
		exitInfo.put("memberId", memberKey);
		service.exitChatRoom(exitInfo);
		
	}
	
    // 파일 업로드 핸들러 추가
    @PostMapping("/upload")
    @ResponseBody
    public ChattingFile uploadFile(@RequestParam("file") MultipartFile file, @RequestParam("chatId") int chatId, @RequestParam("memberId") int memberId) {
        try {
        	String originFileName = file.getOriginalFilename();
        	String ext = originFileName.substring(originFileName.lastIndexOf("."));
            // 고유한 파일 이름 생성 (UUID 사용)
            String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

            // 절대 경로 설정
            String uploadDir = Paths.get("src/main/webapp/resources/upload/chatting").toAbsolutePath().toString();

            // 파일 저장 경로 설정
            Path filePath = Paths.get(uploadDir, fileName);
            // 파일 저장
           // Files.copy(file.getInputStream(), filePath);
            ObjectMetadata metadata = new ObjectMetadata();
            metadata.setContentType("image/"+ext);
            metadata.setContentLength(file.getSize());
            
            String webPath = "resources/upload/chatting/" + fileName;
            // 파일 메타 데이터 생성
            
            String storagePath = amazonS3.getUrl(bucketName, webPath).toString();
            
            ChattingFile chattingFile = ChattingFile.builder()
                    .memberKey(memberId)
                    .chatMsgFileOri(file.getOriginalFilename())
                    .chatMsgFilePost(storagePath)
                    .chatFileTime(new Date(System.currentTimeMillis()))
                    .chatRoomKey(chatId)
                    .fileContentType(file.getContentType())
                    .build();
            System.out.println("PostFile================="+chattingFile.getChatMsgFilePost());
            
            PutObjectResult putObjectResult = amazonS3.putObject(new PutObjectRequest(bucketName, webPath, file.getInputStream(),metadata).withCannedAcl(CannedAccessControlList.PublicRead));
            
            
            
            return chattingFile;
        } catch (IOException e) {
            // 예외 처리 로직을 추가할 수 있습니다.
            e.printStackTrace();
            return null;
        }
    }
    
    @PostMapping("/deleteFile")
    public ResponseEntity<?> deleteFile(@RequestParam String filePath) {
        try {
            // 웹 경로를 실제 파일 시스템 경로로 변환
            String absolutePath = servletContext.getRealPath(filePath);
            File file = new File(absolutePath);
            
            if (file.exists()) {
                if (file.delete()) {
                    return ResponseEntity.ok().build();
                } else {
                    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 삭제 실패");
                }
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("파일이 존재하지 않습니다");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 삭제 중 오류 발생");
        }
    }
    
    @PostMapping("/inviteToRoom")
    public ResponseEntity<Integer> inviteToRoom (@RequestParam int roomId,@RequestParam List<Integer> memberIds) {
    	int result = service.inviteToRoom(roomId,memberIds);
        if (result > 0) {
            return ResponseEntity.ok(result);
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result);
        }
    }
    
    @PostMapping("/headerUnread")
    public  ResponseEntity<Integer> selectUnreadCurrent (@RequestParam int memberKey) {
    	int result =  service.selectUnreadCurrent(memberKey);
    	return  ResponseEntity.ok(result);
    }


    
    @PostMapping("/myChatRoomList")
    public ResponseEntity<?> myChatRoomList(@RequestParam("memberKey")int memberKey){
    	Member member = getCurrentUser();
    	System.out.println(member);
		List<ChattingRoom> mychatRoomList = service.selectMyChatRoomList(member.getMemberKey());
		return ResponseEntity.ok(mychatRoomList);

    }
    
    private Member getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return (Member) authentication.getPrincipal();
    }
}
