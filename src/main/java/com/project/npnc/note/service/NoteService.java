package com.project.npnc.note.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.member.model.dto.SrMember;
import com.project.npnc.note.dto.NoteFileDto;
import com.project.npnc.note.dto.NoteReceptionDto;
import com.project.npnc.note.dto.NoteSendDto;

public interface NoteService {
	
	public int noteOneWrite(int reMemberKey, NoteReceptionDto note);
	public int noteWrites(int[] reMemberKey, NoteReceptionDto note);
	public List<NoteReceptionDto> selectNoteAll(Map<String,Object> page) ;
	public int noteSelectTotalData(Map<String,Object> param);
	public NoteReceptionDto selectNoteOne(Map<String,Integer> page);
	public int noteAllWrite(NoteReceptionDto note);
	public int noteAllWriteAndFile(NoteReceptionDto note, List<NoteFileDto> upfiles);
	public List<NoteSendDto> sendNoteSelectAll(Map<String, Integer> page);
	public int sendNoteSelectTotalData(int memberKey);
	public NoteSendDto selectSendOne(Map<String, Integer> param);
	public List<NoteSendDto> sendNoteSelectAllPaging(Map<String, Integer> page);
	public int noteWritesAndFile(int[] reMemberKey, NoteReceptionDto note, List<NoteFileDto> upfiles);
	public int noteSendDelete(int[] checkDeleteValue);
	public int noteRecDelete(int[] checkDeleteValue, int memberKey);
	public List<SrMember> selectMemberAllNoPaging();
	public List<NoteReceptionDto> selectNoteMeAll(Map<String, Integer> page);
	public int selectNoteMeTotalData(int memberKey);
	public int noteBookMarkInsert(Map<String, Object> param);
	public int noteBookMarkDelete(Map<String, Object> param);
	public List<NoteReceptionDto> noteBookMarkPaging(Map<String, Object> page);
	public int noteBookMarkTotalData(int memberKey);
}
