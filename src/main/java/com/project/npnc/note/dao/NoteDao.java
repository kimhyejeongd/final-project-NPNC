package com.project.npnc.note.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.note.dto.NoteDto;

public interface NoteDao {
	
	public int noteOneWrite(SqlSession session, NoteDto note);
	public int noteReciver(SqlSession session, Map<String, Object> param);
	public int noteMsgKey(SqlSession session);
	
	
}
