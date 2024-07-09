package com.project.npnc.note.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.project.npnc.note.dao.NoteDao;
import com.project.npnc.note.dto.NoteDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoteServiceImpl implements NoteService{

	private final NoteDao dao;
	private final SqlSession session;
	
	@Override
	public int noteOneWrite(int reMemberKey , NoteDto note) {
		int noteMsgKey=dao.noteMsgKey(session);
		note.setPostMsgKey(noteMsgKey);
		int result=dao.noteOneWrite(session, note);
		
		Map<String,Object> param=new HashMap();
		
		param.put("reMemberKey", reMemberKey);
		param.put("noteMsgKey", noteMsgKey);
		
		int result2=dao.noteReciver(session, param);
		
		
		return result;
	}

	@Override
	public int noteWrites(int[] reMemberKey, NoteDto note) {
	
		int noteMsgKey=dao.noteMsgKey(session);
		note.setPostMsgKey(noteMsgKey);
		int result=dao.noteOneWrite(session, note);
	
		for (int i=0; i<reMemberKey.length; i++) {
			Map<String,Object> param=new HashMap();
			
			param.put("reMemberKey", reMemberKey[i]);
			param.put("noteMsgKey", noteMsgKey);
			int result2=dao.noteReciver(session, param);
			
		}
		
		
		return noteMsgKey;
	}



}
