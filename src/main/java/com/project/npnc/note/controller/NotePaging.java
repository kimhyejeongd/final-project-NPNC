package com.project.npnc.note.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.npnc.common.NotePageFactory;
import com.project.npnc.note.dto.NoteSendDto;
import com.project.npnc.note.service.NoteService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class NotePaging {
	private final NoteService noteService;	
	private final NotePageFactory paging;
	
	//받은 쪽지함 페이징
	@RequestMapping("/notepaging")
	public Map<String,Object> pagingNote(@RequestParam(defaultValue="1") int cPage, 
			@RequestParam(defaultValue = "6") int numPerpage, int memberKey ){
		System.out.println(cPage);
		System.out.println(numPerpage);
		  Map<String, Object> response = new HashMap<>();
		  int totalData= noteService.noteSelectTotalData(memberKey);
		  response.put("notepagelist", noteService.selectNoteAll(Map.of("cPage",cPage,"numPerpage",numPerpage,"memberKey",memberKey)));
		  response.put("pagebar", paging.getPage(cPage, numPerpage, totalData, "/notepaging"));
		
		return response	;

	}
	
	//보낸 쪽지함 페이징
	@RequestMapping("/notepagingsend")
	public Map<String,Object> pagingNoteSend(@RequestParam(defaultValue="1") int cPage, 
			@RequestParam(defaultValue = "6") int numPerpage, int memberKey ){
		System.out.println(cPage);
		System.out.println(numPerpage);
		  Map<String, Object> response = new HashMap<>();
		  int totalData= noteService.sendNoteSelectTotalData(memberKey);
		  List<NoteSendDto> notepagelist= noteService.sendNoteSelectAll(Map.of("cPage",cPage,"numPerpage",numPerpage,"memberKey",memberKey));
		  response.put("notepagelist", notepagelist);
		  System.out.println(notepagelist);
		  response.put("pagebar", paging.getPage(cPage, numPerpage, totalData, "/notepagingsend"));
		
		return response	;

	}
	
}
