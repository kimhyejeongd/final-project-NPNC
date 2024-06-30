package com.project.npnc.chatting.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.project.npnc.chatting.model.dao.ChatDao;
import com.project.npnc.chatting.model.dto.ChattingGroup;
import com.project.npnc.chatting.model.dto.ChattingMessage;
import com.project.npnc.member.model.dto.Member;

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
		System.out.println(chat.getChatRoomKey()+"roomKey");
		System.out.println(chat+"room");
		List<ChattingGroup> myRoomMembers = dao.selectMyRoomMembers(session,chat);
		System.out.println(myRoomMembers.size()+"roomMemberSize");
		int readCount = 0;
		if(myRoomMembers!=null) readCount = myRoomMembers.size();
		System.out.println(readCount+"readCount");

	    chatInfo.put("readCount", readCount);
			dao.insertChat(session,chatInfo);
	    for (ChattingGroup m : myRoomMembers) {
	            System.out.println("Processing member no: " + m.getMemberKey()); // 이거 한번밖에 안나옴
	            Member member = dao.selectMemberByNo(session, m.getMemberKey());
				
	            System.out.println("Member details: " + member.toString());
	            chatInfo.put("member", member);
	            dao.insertChattingIsRead(session, chatInfo);

//	            	int result = dao.insertChatStatus(session, chatInfo);       
//	            System.out.println(result+"dsadsaasddas+++====");
	    }
	    System.out.println(chatInfo.get("seq"));
	    

			
	  //  	readCount= dao.selectReadCount(session,chatInfo);
	    	chatInfo.put("readCount", readCount);
		return chatInfo;
		}
	
	
		public List<ChattingMessage> selectRoomChatList(Map<String, Object>readInfo){
			int roomId = (int)readInfo.get("roomId");
			List<ChattingMessage> chatList = dao.selectRoomChatList(session, roomId);
			System.out.println(chatList.toString()+"chatListToString");
			System.out.println(readInfo.get("loginMemberKey")+"loginMemberKey");
			if(chatList!=null && readInfo.get("loginMemberKey")!=null) {
				for(int i=0;chatList.size()>i;i++) {
					readInfo.put("chatList", chatList.get(i));
					System.out.println(chatList.get(i)+"chatList.get(i)");
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
		
		public Map<Integer,List<Member>> selectMyRoomList(int memberNo){
			Map<Integer, List<Member>>roomMemberInfo = new HashMap<>();
			List<Integer> myRoomId = dao.selectMyRoomId(session,memberNo);
			for(int i:myRoomId) {
				roomMemberInfo.put(i, dao.selectRoomList(session,i));
			}
			return roomMemberInfo;
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

}
