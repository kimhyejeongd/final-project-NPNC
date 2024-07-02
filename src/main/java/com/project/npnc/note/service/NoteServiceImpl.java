package com.project.npnc.note.service;

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
	public int noteOneWrite(NoteDto note) {
		
		int result=dao.noteOneWrite(session, note);
		
		return result;
	}


}
