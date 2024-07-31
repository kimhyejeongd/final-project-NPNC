package com.project.npnc.note.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.note.dto.NoteFileDto;
import com.project.npnc.note.dto.NoteReceptionDto;
import com.project.npnc.note.dto.NoteSendDto;

public interface NoteDao {
	
	public int noteOneWrite(SqlSession session, NoteReceptionDto note);
	public int noteReciver(SqlSession session, Map<String, Object> param);
	public int noteMsgKey(SqlSession session);
	public List<NoteReceptionDto> selectNoteAll(SqlSession session, Map<String,Object> page) ;
	public int noteSelectTotalData(SqlSession session, Map<String,Object> param);
	public NoteReceptionDto selectNoteOne(SqlSession session, Map<String, Integer> param);
	public int sendNoteOneWrite(SqlSession session, NoteReceptionDto sendNote);
	public List<NoteSendDto> sendNoteSelectAll(SqlSession session, Map<String, Integer> page);
	public int sendNoteSelectTotalData(SqlSession session, int memberKey);
	public NoteSendDto selectSendOne(SqlSession session, Map<String, Integer> param);
	public List<NoteSendDto> sendNoteSelectAllPaging(SqlSession session,Map<String, Integer> page);
	public int noteFileInput(SqlSession session, NoteFileDto noteFile);
	public int noteSendDelete(SqlSession session, int checkDeleteValue);
	public int noteRecDelete(SqlSession session, Map<String, Integer> param);
	public List<NoteReceptionDto> selectNoteMeAll(SqlSession session, Map<String,Integer> page) ;
	public int selectNoteMeTotalData(SqlSession session, int memberKey);
	public int noteBookMarkInsert(SqlSession session, Map<String,Object> param);
	public int noteBookMarkDelete(SqlSession session, Map<String,Object> param);
	public List<NoteReceptionDto> noteBookMarkPaging(SqlSession session, Map<String,Object> param);
	public int noteBookMarkTotalData(SqlSession session, int memberKey);
}
