package com.project.npnc.note.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.npnc.common.NotePageFactory;
import com.project.npnc.common.NotePageFactory2;
import com.project.npnc.member.model.dto.SrMember;
import com.project.npnc.member.model.service.MemberService;
import com.project.npnc.note.dto.NoteFileDto;
import com.project.npnc.note.dto.NoteReceptionDto;
import com.project.npnc.note.dto.NoteSendDto;
import com.project.npnc.note.service.NoteService;
import com.project.npnc.organization.dto.OrganizationDto;
import com.project.npnc.organization.service.OrganizationService;
import com.project.npnc.security.dto.Member;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class NoteController {
	private final OrganizationService service;

	private final NoteService noteService;
	private final MemberService memberService;
	private final NotePageFactory pageBar;
	private final NotePageFactory2 pageBar2;
	
	//	즐겨찾기 화면 
	@RequestMapping("/noteBookMark")
	public String noteBookMark(@RequestParam(defaultValue="1") int cPage, 
			@RequestParam(defaultValue = "6") int numPerpage ,  Model m) {

		Member loginMember = getCurrentUser();

		List<NoteReceptionDto> notelist=noteService.noteBookMarkPaging(Map.of("cPage",cPage,"numPerpage",numPerpage,"memberKey",loginMember.getMemberKey()));
		m.addAttribute("notelist",notelist);
		notelist.forEach(data -> System.out.print("data" + data));
		int totalData=noteService.noteBookMarkTotalData(loginMember.getMemberKey());
		m.addAttribute("totalData",totalData);

		m.addAttribute("pageBar",pageBar.getPage(cPage, numPerpage, totalData,  "/noteBookMarkPaging"));



		return"note/noteBookMark";

	}

	//	즐겨찾기 삭제
	@RequestMapping("/noteBookMarkDelete")
	@ResponseBody
	public String noteBookMarkDelete(int memberKey, int postMsgRecKey) {
		Map<String, Object> param=new HashMap();

		param.put("memberKey", memberKey);
		param.put("postMsgRecKey", postMsgRecKey);

		int result=noteService.noteBookMarkDelete(param);


		return "";
	}
	
	//  즐겨찾기 추가
	@RequestMapping("/noteBookMarkInsert")
	@ResponseBody
	public String noteBookMarkInsert(int memberKey, int postMsgRecKey) {
		Map<String, Object> param=new HashMap();

		param.put("memberKey", memberKey);
		param.put("postMsgRecKey", postMsgRecKey);

		int result=noteService.noteBookMarkInsert(param);


		return "";
	}
	
	private Member getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return (Member) authentication.getPrincipal();
    }
	
	

	
//	개별 파일 다운로드
	@RequestMapping("/note/filedownload")
	public void filedownload(String oriname,String rename, HttpServletResponse response, HttpSession session) {
		String path=session.getServletContext().getRealPath("/resources/upload/");
		

		System.out.println(path);
		System.out.println(rename);
		File downloadFile=new File(path+rename);
		try(FileInputStream fis=new FileInputStream(downloadFile);
				BufferedInputStream bis=new BufferedInputStream(fis);
				BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream())){
			String encoding=new String(oriname.getBytes("UTF-8"),"ISO-8859-1");
//			컨텐트타입에 따라서 브라우저가 반응하는 것이 다르다. 그래서 흰화면이 안 뜨는 것이다.
			response.setContentType("application/octet-stream;charset-utf-8");
			response.setHeader("Content-disposition", "attachment;filename=\""+encoding+"\"");
			int data=1;
			while((data=bis.read())!=-1) {
				bos.write(data);
			}
		}catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
//	보낸 쪽지함
	@RequestMapping("/sendNoteHome")
	public String sendNoteHome(@RequestParam(defaultValue="1") int cPage, 
			@RequestParam(defaultValue = "6") int numPerpage ,  Model m) {
		
		Member loginMember = getCurrentUser();
	
		List<NoteSendDto> notelist=noteService.sendNoteSelectAllPaging(Map.of("cPage",cPage,"numPerpage",numPerpage,"memberKey",loginMember.getMemberKey()));
		m.addAttribute("notelist",notelist);
		notelist.forEach(data -> System.out.print("data" + data));
		int totalData=noteService.sendNoteSelectTotalData(loginMember.getMemberKey());
		m.addAttribute("totalData",totalData);
		
		m.addAttribute("pageBar",pageBar.getPage(cPage, numPerpage, totalData,  "/notepagingsend"));

		
		
		return"note/noteSending";
		
	}
	
//	내게 보낸 쪽지함
	@RequestMapping("/noteSendMe")
	public String noteSendMe(@RequestParam(defaultValue="1") int cPage, 
			@RequestParam(defaultValue = "6") int numPerpage ,  Model m) {
		
		Member loginMember = getCurrentUser();


		List<NoteReceptionDto> notelist=noteService.selectNoteMeAll(Map.of("cPage",cPage,"numPerpage",numPerpage,"memberKey", loginMember.getMemberKey()));
		int totalData=noteService.selectNoteMeTotalData(loginMember.getMemberKey());
		List<SrMember> AllMemberList=memberService.selectMemeberAll(Map.of("cPage",cPage,"numPerpage",numPerpage));

		List<OrganizationDto> organlist=service.selectOrganAll();
		m.addAttribute("organlist",organlist);
		
		m.addAttribute("totalData",totalData);
		m.addAttribute("AllMemberList",AllMemberList);
	
		
		m.addAttribute("notelist",notelist);
		m.addAttribute("pageBar",pageBar.getPage(cPage, numPerpage, totalData,  "/notePagingSendMe"));

		return "note/noteSendMe";
	}
	
//	받은 쪽지함
	@RequestMapping("/notehome")
	public String notehome(@RequestParam(defaultValue="1") int cPage, 
			@RequestParam(defaultValue = "6") int numPerpage ,  Model m) {
		
		Member loginMember = getCurrentUser();
		
		List<NoteReceptionDto> notelist=noteService.selectNoteAll(Map.of("cPage",cPage,"numPerpage",numPerpage,"memberKey", loginMember.getMemberKey()));
		
		Map<String, Object> param = new HashMap<>();
		  param.put("memberKey", loginMember.getMemberKey());

		int totalData=noteService.noteSelectTotalData(param);
		List<SrMember> AllMemberList=memberService.selectMemeberAll(Map.of("cPage",cPage,"numPerpage",numPerpage));
		
		List<OrganizationDto> organlist=service.selectOrganAll();
		System.out.println(organlist);
		m.addAttribute("organlist",organlist);
		
		m.addAttribute("totalData",totalData);
		m.addAttribute("AllMemberList",AllMemberList);
	
		
		m.addAttribute("notelist",notelist);
		m.addAttribute("pageBar",pageBar.getPage(cPage, numPerpage, totalData,  "/notepaging"));
		System.out.println(notelist);
		return "note/notehome";
	}
	
	
	
	
	
	
//	개별,다중 쪽지 발송
	@RequestMapping("/notewrite")
	@ResponseBody
	public String noteOneWrite(      
			 @RequestParam(value = "memberKey") int memberKey,
			@RequestParam(value = "reMemberKey") String reMemberKey,
           
            @RequestParam(value = "postMsgTitle") String postMsgTitle,
            @RequestParam(value = "postMsgDetail") String postMsgDetail,
            @RequestPart(value = "upFile", required = false) MultipartFile[] upFiles,
            HttpSession session) {
		
		System.out.println(reMemberKey);
		
		 String stringOne = reMemberKey.replaceAll("[\\[\\]]", "");  // 대괄호와 공백 제거
	    	System.out.println(stringOne);          
	        String[] stringArray = stringOne.replaceAll("\"", "").split(",");
	    	System.out.println(stringArray);          

	       String[] dfd={"1","2","3"};   
    	System.out.println(Arrays.toString(stringArray));          
    	System.out.println(Arrays.toString(dfd));          
    	int[] intArray = new int[stringArray.length];

        for (int i = 0; i < stringArray.length; i++) {
            intArray[i] = Integer.parseInt(stringArray[i]);
        }
		
		System.out.println(upFiles+"들어오나유 ");
		String replacePostMsgDetail=postMsgDetail.replace("\r\n","<br>");
		NoteReceptionDto insertNote=NoteReceptionDto.builder()
				.memberKey(memberKey)
				.postMsgTitle(postMsgTitle)
				.postMsgDetail(replacePostMsgDetail)
				.build();
		System.out.println(insertNote+"마지막");
		
		List<NoteFileDto> files=new ArrayList<>();
		String path=session.getServletContext().getRealPath("/resources/upload");
		if(upFiles!=null) {
			for(MultipartFile file:upFiles) {
				if(!file.isEmpty()) {
					//저장할 경로를 가져오고 파일 리네임을 설정한다.
					String oriName=file.getOriginalFilename();
					String ext=oriName.substring( oriName.lastIndexOf(".") );
					Date today=new Date(System.currentTimeMillis());
					int randomVal=(int)(Math.random()*10000)+1;
					String rename="qqqqq_"+(new SimpleDateFormat("yyyyMMdd_HHmmssSSS").format(today))+"_"+
							randomVal+ext;
					File dir=new File(path);
					if(!dir.exists()) dir.mkdirs();
					try {
						//			파일을 저장
					//				tomcat에 서버 모듈 윗아웃 퍼블리싱 체크 
									file.transferTo(new File(path,rename));
									files.add(NoteFileDto.builder().postMessageFileOri(oriName)
											.postMessageFilePost(rename).build());
												
								}catch(IOException e){
									e.printStackTrace();      
									
					}
					
				}
			}
			System.out.println("여기 안들어오니"+files);
			int result1=noteService.noteWritesAndFile(intArray, insertNote, files);
		    return "";
		}else {
			
			int result2=noteService.noteWrites(intArray, insertNote);
			return "";

		}
		
		
		
	}
	
//  전체 쪽지 발송
	@RequestMapping("/noteAllwrite")
	@ResponseBody
	public String noteAllWrite(
				@RequestParam(value = "memberKey") int memberKey,
	            @RequestParam(value = "postMsgTitle") String postMsgTitle,
	            @RequestParam(value = "postMsgDetail") String postMsgDetail,
	            @RequestPart(value = "upFile", required = false) MultipartFile[] upFiles,
	            HttpSession session
	            ) {
		System.out.println(postMsgDetail);
		String replacePostMsgDetail=postMsgDetail.replace("\r\n","<br>");
		NoteReceptionDto insertNote=NoteReceptionDto.builder()
				.memberKey(memberKey)
				.postMsgTitle(postMsgTitle)
				.postMsgDetail(replacePostMsgDetail)
				.build();
		

		
		List<NoteFileDto> files=new ArrayList<>();
		String path=session.getServletContext().getRealPath("/resources/upload");
		if(upFiles!=null) {
			for(MultipartFile file:upFiles) {
				if(!file.isEmpty()) {
					//저장할 경로를 가져오고 파일 리네임을 설정한다.
					String oriName=file.getOriginalFilename();
					String ext=oriName.substring( oriName.lastIndexOf(".") );
					Date today=new Date(System.currentTimeMillis());
					int randomVal=(int)(Math.random()*10000)+1;
					String rename="qqqqq_"+(new SimpleDateFormat("yyyyMMdd_HHmmssSSS").format(today))+"_"+
							randomVal+ext;
					File dir=new File(path);
					if(!dir.exists()) dir.mkdirs();
					try {
						//			파일을 저장
					//				tomcat에 서버 모듈 윗아웃 퍼블리싱 체크 
									file.transferTo(new File(path,rename));
									files.add(NoteFileDto.builder().postMessageFileOri(oriName)
											.postMessageFilePost(rename).build());
												
								}catch(IOException e){
									e.printStackTrace();      
									
					}
					
				}
			}
			System.out.println("여기 안들어오니"+files);
			int result1=noteService.noteAllWriteAndFile(insertNote, files);
		    return "";
		}else {
			
			int result=noteService.noteAllWrite(insertNote);
			return "";

		}
		
		
		
	}
	
	@RequestMapping("/notewrite2")
	public String noteWrites(String[] reMemberKey, NoteReceptionDto note ) {
		
		int[] intArray = new int[reMemberKey.length];

		for(int i = 0; i < reMemberKey.length; i++){
		    intArray[i] = Integer.parseInt(reMemberKey[i]);
		}
		
		for(int i = 0; i < intArray.length; i++){
		    System.out.println(intArray[i]+"이건 제대로?");
		}
		
		int result=noteService.noteWrites(intArray, note);
		
		return "redirect:/note";
		
	}
	

//	보낸 쪽지함 개별 조회
	@RequestMapping("/selectSendOne")
	@ResponseBody
	public NoteSendDto selectSendOne(int postMsgSendKey,int sendMemberKey) {
		Map<String,Integer> param=new HashMap<>();
		param.put("postMsgSendKey", postMsgSendKey);
		param.put("sendMemberKey", sendMemberKey);
		NoteSendDto sendDto=noteService.selectSendOne(param);
		System.out.println(sendDto+"파일 testestset");
		return sendDto;
		
	}
	
//	받은 쪽지함 개별 조회
	@RequestMapping("/noteSelectOne")
	@ResponseBody
	public NoteReceptionDto noteSelectOne(int postMsgRecKey,int memberKey) {
		Map<String,Integer> param=new HashMap<>();
		param.put("postMsgRecKey", postMsgRecKey);
		param.put("memberKey", memberKey);
		NoteReceptionDto noteReceptionDto=noteService.selectNoteOne(param);
		
		return noteReceptionDto;
		
	}
	
//	보낸 쪽지함 삭제
	@RequestMapping("/noteSendDelete")
	@ResponseBody
	public String noteSendDelete(int[] checkDeleteValue) {
		
		int result=noteService.noteSendDelete(checkDeleteValue);
		
		return "";
		
	}
	
//	받은 쪽지함 삭제
	@RequestMapping("/noteRecDelete")
	@ResponseBody
	public String noteRecDelete(int[] checkDeleteValue, int memberKey) {
		
		int result=noteService.noteRecDelete(checkDeleteValue, memberKey);
		
		return "";
		
	}
	
}
