package com.project.npnc.note.service;

import com.project.npnc.note.dto.NoteDto;

public interface NoteService {
	
	public int noteOneWrite(int reMemberKey, NoteDto note);
	public int noteWrites(int[] reMemberKey, NoteDto note);
}
