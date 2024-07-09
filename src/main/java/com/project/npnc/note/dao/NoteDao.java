package com.project.npnc.note.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.note.dto.Note;
import com.project.npnc.note.dto.NoteDto;

public interface NoteDao {
	
	public int noteOneWrite(SqlSession session, NoteDto note);
	public int noteReciver(SqlSession session, Map<String, Object> param);
	public int noteMsgKey(SqlSession session);
	public List<Note> selectNoteAll(SqlSession session, Map<String,Integer> page) ;
	public int noteSelectTotalData(SqlSession session);
	
}
