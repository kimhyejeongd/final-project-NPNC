package com.project.npnc.chatting.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.npnc.admin.member.model.dto.AdminMember;
import com.project.npnc.chatting.model.dto.ChattingGroup;
import com.project.npnc.chatting.model.dto.ChattingMessage;
import com.project.npnc.chatting.model.dto.ChattingRoom;

@Repository
public class ChatDao {
	public List<ChattingRoom> selectMyChatRoomList(SqlSessionTemplate session, int memberNo){
		return session.selectList("chat.selectMyChatRoomList",memberNo);
	}
	public void updateRecentChat(SqlSessionTemplate session, Map<String, Object> chatInfo) {
		session.update("chat.updateRecentChat",chatInfo);
	}
	public List<ChattingGroup> selectMyRoomMembers(SqlSessionTemplate session, ChattingMessage chat){
		return session.selectList("chat.selectMyRoomMembers",chat);
	}

	public AdminMember selectMemberById(SqlSessionTemplate session,String memberId) {
		return session.selectOne("chattingMember.selectMemberById",memberId);
	}
	public AdminMember selectMemberByNo(SqlSessionTemplate session,int memberNo) {
		return session.selectOne("chattingMember.selectMemberByNo",memberNo);
	}
	public int selectChatSeq(SqlSessionTemplate session) {
		return session.selectOne("chat.selectChatSeq");
	}
	
	public int insertChattingIsRead(SqlSessionTemplate session,Map<String, Object> chatInfo) {
		return session.insert("chat.insertChattingIsRead",chatInfo);
	}
	
	public int insertChat(SqlSessionTemplate session,Map<String, Object> chatInfo) {
		return	session.insert("chat.insertChat",chatInfo);
	}
	public int deleteChatRead(SqlSessionTemplate session,Map<String, Object> chatInfo) {
		int result =session.delete("chat.deleteChatRead",chatInfo);
		return result;
	}
	
	public int selectReadCount(SqlSessionTemplate session,Map<String, Object> chatInfo) {
		return session.selectOne("chat.selectReadCount",chatInfo);
	}
	
	public List<ChattingMessage>selectRoomChatList(SqlSessionTemplate session,int roomNo){
		return session.selectList("chat.selectRoomChatList",roomNo);
	}
	
	public List<AdminMember>selectAllMembers(SqlSessionTemplate session){
		return session.selectList("chattingMember.selectAllMembers");
	}
	public Integer selectRoomId(SqlSessionTemplate session,Map<String,Object>param) {
		Integer result = session.selectOne("chat.selectRoomId", param);
		return result;
	}	
	public int insertRoomId(SqlSessionTemplate session, List<Integer> memberNos) {
        int result = 0;
        int roomId = session.selectOne("chat.getSequenceValue");
        session.insert("chat.insertChattingRoom",roomId);
        for (int i = 0; i < memberNos.size(); i++) {
            Map<String, Object> params = new HashMap<>();
            params.put("roomId", roomId);
            params.put("memberNo", memberNos.get(i));
            result += session.insert("chat.insertSingleRoomId", params);
        }
        return roomId;
    }
	public List<AdminMember> selectMyRoomMemberList(SqlSessionTemplate session, int roomId){
		return session.selectList("chat.selectMyRoomMemberList",roomId);
	}
	public List<Integer> selectMyRoomId(SqlSessionTemplate session, int memberNo){
		return session.selectList("chat.selectMyRoomId",memberNo);
	}
	public void updateChatStatus(SqlSessionTemplate session, int memberNo) {
		session.update("chat.updateChatStatus",memberNo);
	}
	public void updateChatReadCount(SqlSessionTemplate session, Map<String,Object>chatInfo) {
			
			session.update("chat.updateChatReadCount",chatInfo);
	}
//	public void updateReadStatus(SqlSessionTemplate session, Map<String, Object> param) {
//        session.update("chat.updateReadStatus", param);
//    }
	public int countRoomMember(SqlSessionTemplate session,int roomId) {
		return session.selectOne("chat.countRoomMember",roomId);
	}

}
