package com.project.npnc.note.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.project.npnc.member.model.dao.MemberDao;
import com.project.npnc.member.model.dto.Member;
import com.project.npnc.note.dao.NoteDao;
import com.project.npnc.note.dto.NoteReceptionDto;
import com.project.npnc.note.dto.NoteSendDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoteServiceImpl implements NoteService{

	
	

	
	private final NoteDao dao;
	private final SqlSession session;
	private final MemberDao memberDao;
	
//	전체 쪽지 발송
	@Override
	public int noteAllWrite(NoteReceptionDto note) {
		int noteMsgKey=dao.noteMsgKey(session);
		note.setPostMsgRecKey(noteMsgKey);
		int result=dao.noteOneWrite(session, note);
		int result1=dao.sendNoteOneWrite(session, note);
		
		Map<String,Object> param=new HashMap();
		param.put("noteMsgKey", noteMsgKey);

		List<Member> members=memberDao.selectMemberAllNoPaging(session);
		
		for (int i=0; i<members.size(); i++) {
			
			param.put("reMemberKey",members.get(i).getMemberKey());
			int result2=dao.noteReciver(session, param);
			
		}
		
		return 0;
	}
	
	@Override
	public NoteReceptionDto selectNoteOne() {
		
		return dao.selectNoteOne(session);
	}

	
	@Override
	public int noteOneWrite(int reMemberKey , NoteReceptionDto note) {
		int noteMsgKey=dao.noteMsgKey(session);
		note.setPostMsgRecKey(noteMsgKey);
		int result=dao.noteOneWrite(session, note);
		int result1=dao.sendNoteOneWrite(session, note);
		
		Map<String,Object> param=new HashMap();
		
		param.put("reMemberKey", reMemberKey);
		param.put("noteMsgKey", noteMsgKey);
		
		int result2=dao.noteReciver(session, param);
		
		
		return result;
	}

	@Override
	public int noteWrites(int[] reMemberKey, NoteReceptionDto note) {
	
		int noteMsgKey=dao.noteMsgKey(session);
		note.setPostMsgRecKey(noteMsgKey);
		int result=dao.noteOneWrite(session, note);
		int result1=dao.sendNoteOneWrite(session, note);

		for (int i=0; i<reMemberKey.length; i++) {
			Map<String,Object> param=new HashMap();
			
			param.put("reMemberKey", reMemberKey[i]);
			param.put("noteMsgKey", noteMsgKey);
			int result2=dao.noteReciver(session, param);
			
		}
		
		
		return noteMsgKey;
	}

	@Override
	public List<NoteReceptionDto> selectNoteAll(Map<String, Integer> page) {
	
		return dao.selectNoteAll(session, page);
	}

	@Override
	public int noteSelectTotalData(int memberKey) {
		
		return dao.noteSelectTotalData(session, memberKey);
	}


	@Override
	public List<NoteSendDto> sendNoteSelectAll(Map<String, Integer> page) {
		// TODO Auto-generated method stub
		return dao.sendNoteSelectAll(session, page);
	}

	@Override
	public int sendNoteSelectTotalData(int memberKey) {
		
		return dao.sendNoteSelectTotalData(session, memberKey);
	}
	
	@Override
	public NoteSendDto selectSendOne(Map<String, Integer> param) {
		
		return dao.selectSendOne(session,param);
	}



}
