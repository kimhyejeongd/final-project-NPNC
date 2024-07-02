package com.project.npnc.note.dao;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.note.dto.NoteDto;

public interface NoteDao {
	
	public int noteOneWrite(SqlSession session, NoteDto note);
	
}
