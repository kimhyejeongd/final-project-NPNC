package com.project.npnc.note.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.note.dto.NoteDto;

@Repository
public class NoteDaoImpl implements NoteDao {

	@Override
	public int noteOneWrite(SqlSession session, NoteDto note) {
	
		return session.insert("note.noteOneWrite", note);
	}

	@Override
	public int noteReciver(SqlSession session, Map<String, Object> param) {
		System.out.println(param+"여기 뭐가 들어가는데");
		return session.insert("note.noteReciver", param);
	}

	@Override
	public int noteMsgKey(SqlSession session) {
		
		return session.selectOne("note.noteMsgKey");
	}

}
