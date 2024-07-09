package com.project.npnc.chatting.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.project.npnc.admin.member.model.dto.AdminMember;
import com.project.npnc.chatting.model.dao.ChatDao;
import com.project.npnc.chatting.model.dto.ChattingGroup;
import com.project.npnc.chatting.model.dto.ChattingMessage;
import com.project.npnc.chatting.model.dto.ChattingRoom;

import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Service
public class ChatService {
//	private final HttpSession session1;
	private final SqlSessionTemplate session;
	private final ChatDao dao;
	public Map<String, Object> insertChat(ChattingMessage chat) {
		int chatSeq = dao.selectChatSeq(session);
		
		Map<String, Object> chatInfo = new HashMap<>();
		chatInfo.put("seq", chatSeq);
		chatInfo.put("chat", chat);
		chatInfo.put("memberNo", chat.getMemberKey());
		
		//내 방에 있는 멤버의 넘버들

		List<ChattingGroup> myRoomMembers = dao.selectMyRoomMembers(session,chat);
		int readCount = 0;
		if(myRoomMembers!=null) readCount = myRoomMembers.size();
		dao.updateRecentChat(session, chatInfo);
	    chatInfo.put("readCount", readCount);
			dao.insertChat(session,chatInfo);
	    for (ChattingGroup m : myRoomMembers) {
	            AdminMember member = dao.selectMemberByNo(session, m.getMemberKey());				
	            chatInfo.put("member", member);
	            dao.insertChattingIsRead(session, chatInfo);
	    }
	    	chatInfo.put("readCount", readCount);
		return chatInfo;
		}
	
	
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

		public List<AdminMember> selectAllMembers(){
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
		
		public Map<Integer,List<AdminMember>> selectMyRoomMemberList(int memberNo){
			
			Map<Integer, List<AdminMember>>roomMemberInfo = new HashMap<>();
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
		

		
		public AdminMember selectMemberById(String memberId) {
			return dao.selectMemberById(session,memberId);
		}
		public void updateChatStatus(int roomId) {
			dao.updateChatStatus(session,roomId);
		}
		
		public int countRoomMember(int roomId) {
			return dao.countRoomMember(session,roomId);
		}

}
