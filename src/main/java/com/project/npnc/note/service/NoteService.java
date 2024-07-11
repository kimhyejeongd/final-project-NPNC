package com.project.npnc.note.service;

import java.util.List;
import java.util.Map;

import com.project.npnc.note.dto.Note;
import com.project.npnc.note.dto.NoteDto;

public interface NoteService {
	
	public int noteOneWrite(int reMemberKey, NoteDto note);
	public int noteWrites(int[] reMemberKey, NoteDto note);
	public List<NoteDto> selectNoteAll(Map<String,Integer> page) ;
	public int noteSelectTotalData();
	public NoteDto selectNoteOne();
}
