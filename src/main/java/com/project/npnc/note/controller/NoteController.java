package com.project.npnc.note.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.npnc.note.dto.NoteDto;
import com.project.npnc.note.service.NoteService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class NoteController {
	
	private final NoteService service;

	@RequestMapping("/note")
	public String note() {
		
		return "note/note";
	}
	
	@RequestMapping("/notewrite")
	public String noteOneWrite(NoteDto note) {
		
		NoteDto insertNote=NoteDto.builder()
				.memberKey(note.getMemberKey())
				.postMsgDetail(note.getPostMsgDetail())
				.build();
		int result=service.noteOneWrite(insertNote);
		
		
		return "note/note";
		
	}
}
