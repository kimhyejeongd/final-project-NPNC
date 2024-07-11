package com.project.npnc.chatting.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.project.npnc.chatting.controller.WebSocketEventListener;
import com.project.npnc.chatting.model.dao.ChatDao;
import com.project.npnc.chatting.model.dto.ChattingFile;
import com.project.npnc.chatting.model.dto.ChattingGroup;
import com.project.npnc.chatting.model.dto.ChattingMessage;
import com.project.npnc.chatting.model.dto.ChattingRoom;
import com.project.npnc.member.model.dto.Member;

import jakarta.servlet.ServletContext;
import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Service
public class ChatService {
//	private final HttpSession session1;
	private final SqlSessionTemplate session;
	private final ChatDao dao;
	private final WebSocketEventListener webSocketEventListener;
    private final ServletContext servletContext;  // ServletContext 주입

	public void deleteReadBadge(int currRoomId,List<Integer> currMemberKey){
		Map<String,Integer> deleteInfo = new HashMap<>();
		deleteInfo.put("currRoomId", currRoomId);
		for(int i :currMemberKey) {
			deleteInfo.put("currMemberKey", i);
			dao.deleteReadBadge(session,deleteInfo);
			System.out.println("--------"+i+"-----------");
		}
		


	}
	
	//채팅 입력 시 db에 저장하기
	public Map<String, Object> insertChat(ChattingMessage chat) {


		
		int chatSeq = dao.selectChatSeq(session);
		
		Map<String, Object> chatInfo = new HashMap<>();
		chatInfo.put("seq", chatSeq);
		chatInfo.put("chat", chat);
		chatInfo.put("memberNo", chat.getMemberKey());
		chatInfo.put("chatRoomKey", chat.getChatRoomKey());
		
		//내 방에 있는 멤버의 넘버들

		List<ChattingGroup> myRoomMembers = dao.selectMyRoomMembers(session,chat);
		int readCount = 0;
		if(myRoomMembers!=null) readCount = myRoomMembers.size();
		dao.updateRecentChat(session, chatInfo);
	    chatInfo.put("readCount", readCount);
		dao.insertChat(session,chatInfo);
		
//		public ChattingFile insertChattingFile(ChattingFile chattingFile) {
//		int msgSeq = dao.selectChatSeq(session);
//		int fileSeq = dao.selectChatSeq(session);
//		chattingFile.setChatFileKey(fileSeq);
//		chattingFile.setChatMsgKey(msgSeq);
//		dao.insertChattingFile(session,chattingFile);
//		return chattingFile;
//	}
			
			
	    // 접속 중인 멤버 키를 가져옴
	    Set<String> connectedMemberKeys = webSocketEventListener.getConnectedMemberKeys(String.valueOf(chat.getChatRoomKey()), "chat");

	    System.out.println(connectedMemberKeys.toString()+"============connectedMemberKeys");
			
		    for (ChattingGroup m : myRoomMembers) {
		            Member member = dao.selectMemberByNo(session, m.getMemberKey());				
		            if (!connectedMemberKeys.contains(String.valueOf(member.getMemberKey()))) {
		                chatInfo.put("member", member);
		                dao.insertChattingIsRead(session, chatInfo);
		            }
		    }
		    	chatInfo.put("readCount", readCount);
			return chatInfo;
		}
	
		//채팅방 입장할 때 채팅정보 리스트 불러오기 
		public List<ChattingMessage> selectRoomChatList(Map<String, Object>readInfo){
			int roomId = (int)readInfo.get("roomId");
			List<ChattingMessage> chatList = dao.selectRoomChatList(session, roomId);
			if(chatList!=null && readInfo.get("loginMemberKey")!=null) {
				for(int i=0;chatList.size()>i;i++) {
					readInfo.put("chatList", chatList.get(i));
					dao.deleteChatRead(session,readInfo);
					dao.updateChatReadCount(session, readInfo);
				}
			}
			return dao.selectRoomChatList(session,roomId);
		}

		public List<Member> selectAllMembers(){
			return dao.selectAllMembers(session);
		};
		public int selectRoomId(Map<String,Object> param) {
			Integer roomId = dao.selectRoomId(session,param);
			System.out.println(param.get("memberNos")+"dadasddsadsasad");
			List<Integer> memberNos=(List<Integer>) param.get("memberNos");
			if(roomId==null){
				dao.insertRoomId(session,memberNos);
				roomId = dao.selectRoomId(session,param);
				System.out.println(roomId+"charserviceRommIDdkasnkdlasndlaskdnaslkdlkjnsadlnk");
				}
			
			return roomId;
		}
		
		public Map<Integer,List<Member>> selectMyRoomMemberList(int memberNo){
			
			Map<Integer, List<Member>>roomMemberInfo = new HashMap<>();
			List<Integer> myRoomId = dao.selectMyRoomId(session,memberNo);
			for(int i:myRoomId) {
//				이거 사실 selectRoomMemberList임 
				roomMemberInfo.put(i , dao.selectMyRoomMemberList(session,i)); 
			}
			return roomMemberInfo;
		}
		public List<ChattingRoom> selectMyChatRoomList(int memberNo){
			return dao.selectMyChatRoomList(session,memberNo);
		}
		
		public List<Member> selectMyRoomMembers(int roomNo){
			return dao.selectMyRoomMemberList(session, roomNo);
		}
		public Member selectMemberById(String memberId) {
			return dao.selectMemberById(session,memberId);
		}
		public void updateChatStatus(int roomId) {
			dao.updateChatStatus(session,roomId);
		}
		
		public int countRoomMember(int roomId) {
			return dao.countRoomMember(session,roomId);
		}
		
		public int selectUnreadCount(Map<String, Object> readInfo) {
			System.out.println(readInfo.get("memberId")+"=======================");
			return dao.selectUnreadCount(session,readInfo);
		}
		public void exitChatRoom(Map<String, Integer> exitInfo) {
			
			dao.exitChatRoom(session,exitInfo);
		}
		
		   

}
