package com.project.npnc.note.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.note.dto.NoteFileDto;
import com.project.npnc.note.dto.NoteReceptionDto;
import com.project.npnc.note.dto.NoteSendDto;

public interface NoteService {
	
	public int noteOneWrite(int reMemberKey, NoteReceptionDto note);
	public int noteWrites(int[] reMemberKey, NoteReceptionDto note);
	public List<NoteReceptionDto> selectNoteAll(Map<String,Integer> page) ;
	public int noteSelectTotalData(int memberKey);
	public NoteReceptionDto selectNoteOne(Map<String,Integer> page);
	public int noteAllWrite(NoteReceptionDto note);
	public List<NoteSendDto> sendNoteSelectAll(Map<String, Integer> page);
	public int sendNoteSelectTotalData(int memberKey);
	public NoteSendDto selectSendOne(Map<String, Integer> param);
	public List<NoteSendDto> sendNoteSelectAllPaging(Map<String, Integer> page);
	public int noteWritesAndFile(int[] reMemberKey, NoteReceptionDto note, List<NoteFileDto> upfiles);
	public int noteSendDelete(int[] checkDeleteValue);
	public int noteRecDelete(int[] checkDeleteValue, int memberKey);
}
