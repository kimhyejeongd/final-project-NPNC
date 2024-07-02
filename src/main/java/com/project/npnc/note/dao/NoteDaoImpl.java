package com.project.npnc.note.dao;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.note.dto.NoteDto;

public class NoteDaoImpl implements NoteDao {

	@Override
	public int noteOneWrite(SqlSession session, NoteDto note) {
	
		return session.insert("note.noteOneWrite", note);
	}

}
