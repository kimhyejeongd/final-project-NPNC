package com.project.npnc.note.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.note.dto.NoteReceptionDto;
import com.project.npnc.note.dto.NoteSendDto;

public interface NoteDao {
	
	public int noteOneWrite(SqlSession session, NoteReceptionDto note);
	public int noteReciver(SqlSession session, Map<String, Object> param);
	public int noteMsgKey(SqlSession session);
	public List<NoteReceptionDto> selectNoteAll(SqlSession session, Map<String,Integer> page) ;
	public int noteSelectTotalData(SqlSession session, int memberKey);
	public NoteReceptionDto selectNoteOne(SqlSession session);
	public int sendNoteOneWrite(SqlSession session, NoteReceptionDto sendNote);
	public List<NoteSendDto> sendNoteSelectAll(SqlSession session, Map<String, Integer> page);
	public int sendNoteSelectTotalData(SqlSession session, int memberKey);
	public NoteSendDto selectSendOne(SqlSession session, Map<String, Integer> param);
}
