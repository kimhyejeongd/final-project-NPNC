package com.project.npnc.note.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.note.dto.NoteReceptionDto;
import com.project.npnc.note.dto.NoteSendDto;

@Repository
public class NoteDaoImpl implements NoteDao {

	@Override
	public int noteOneWrite(SqlSession session, NoteReceptionDto note) {
	System.out.println(note);
		return session.insert("note.noteOneWrite", note);
	}

	@Override
	public int sendNoteOneWrite(SqlSession session, NoteReceptionDto sendNote) {
		
		return session.insert("note.sendNoteOneWrite", sendNote);
	}

	

	@Override
	public int noteSelectTotalData(SqlSession session, int memberKey) {
		
		return session.selectOne("note.noteSelectTotalData",memberKey);
	}

	

	@Override
	public List<NoteReceptionDto> selectNoteAll(SqlSession session, Map<String, Integer> page) {
		RowBounds rb=new RowBounds((page.get("cPage")-1)*page.get("numPerpage"),page.get("numPerpage"));
		int memberKey=page.get("memberKey");
		System.out.println(memberKey+" 여기에 들어 왔냐고");
		return session.selectList("note.noteSelectAll",memberKey,rb);
	}

	@Override
	public NoteReceptionDto selectNoteOne(SqlSession session) {
	
		return session.selectOne("note.noteSelectOne");
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
	
	@Override
	public List<NoteSendDto> sendNoteSelectAll(SqlSession session, Map<String, Integer> page) {
		RowBounds rb=new RowBounds((page.get("cPage")-1)*page.get("numPerpage"),page.get("numPerpage"));
		int memberKey=page.get("memberKey");
		return session.selectList("note.sendNoteSelectAll",memberKey,rb);
	}

	@Override
	public int sendNoteSelectTotalData(SqlSession session, int memberKey) {
		
		return session.selectOne("note.sendNoteSelectTotalData",memberKey);
	}
	
	@Override
	public NoteSendDto selectSendOne(SqlSession session, Map<String, Integer> param) {
		
		return session.selectOne("note.selectSendOne", param);
	}

}
