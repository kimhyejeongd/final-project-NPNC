package com.project.npnc.note.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoteController {
	
	@RequestMapping("/note")
	public String note() {
		
		return "note/note";
	}
}
