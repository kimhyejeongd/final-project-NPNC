package com.project.npnc.chatting.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.npnc.chatting.model.dto.ChattingFile;
import com.project.npnc.chatting.model.dto.ChattingGroup;
import com.project.npnc.chatting.model.dto.ChattingMessage;
import com.project.npnc.chatting.model.dto.ChattingRoom;
import com.project.npnc.security.dto.Member;

@Repository
public class ChatDao {
	public void deleteReadBadge(SqlSessionTemplate session,Map<String,Integer> deleteInfo) {
		session.delete("chat.deleteReadBadge",deleteInfo);
		return;
	}
	public  void insertUploadedFile(SqlSessionTemplate session, Map<String, Object> fileInfo) {
		session.insert("chat.insertUploadedFile",fileInfo);
	}
	public List<ChattingRoom> selectMyChatRoomList(SqlSessionTemplate session, int memberNo){
		return session.selectList("chat.selectMyChatRoomList",memberNo);
	}
	public void updateRecentChat(SqlSessionTemplate session, Map<String, Object> chatInfo) {
		session.update("chat.updateRecentChat",chatInfo);
	}
	public List<ChattingGroup> selectMyRoomMembers(SqlSessionTemplate session, ChattingMessage chat){
		return session.selectList("chat.selectMyRoomMembers",chat);
	}

	public Member selectMemberById(SqlSessionTemplate session,String memberId) {
		return session.selectOne("chattingMember.selectMemberById",memberId);
	}
	public Member selectMemberByNo(SqlSessionTemplate session,int memberNo) {
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
	
	public List<Member>selectAllMembers(SqlSessionTemplate session){
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
	public List<Member> selectMyRoomMemberList(SqlSessionTemplate session, int roomId){
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

	public int countRoomMember(SqlSessionTemplate session,int roomId) {
		return session.selectOne("chat.countRoomMember",roomId);
	}
	
	public int selectUnreadCount(SqlSessionTemplate session, Map<String, Object> readInfo) {
		return session.selectOne("chat.selectUnreadCount",readInfo);
	}
	public void exitChatRoom(SqlSessionTemplate session, Map<String,Integer> exitInfo) {
		session.delete("chat.exitChatRoom",exitInfo);
		
	}
	public void insertChattingFile(SqlSessionTemplate session, ChattingFile chattingFile) {
		session.insert("chat.insertChattingFile",chattingFile);
	}
	public int selectFileSeq(SqlSessionTemplate session) {
		return session.selectOne("chat.selectFileSeq");
	}
	public int selectGroupStatus(SqlSessionTemplate session, Map<String, Integer> exitInfo) {
		return session.selectOne("chat.selectGroupStatus",exitInfo);
	}
	public void deleteRoom(SqlSessionTemplate session, Map<String,Integer> exitInfo) {
		session.delete("chat.deleteRoom",exitInfo);
	}
	public int insertChatMember(SqlSessionTemplate session, Map<String,Object> inviteInfo) {
		return session.insert("chat.insertChatMember",inviteInfo);
	}
	public int selectUnreadCurrent(SqlSessionTemplate session, int memberKey) {
		return session.selectOne("chat.selectUnreadCurrent",memberKey);
				
	}

}
