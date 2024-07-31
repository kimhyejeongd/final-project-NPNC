package com.project.npnc.note.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.npnc.common.NotePageFactory;
import com.project.npnc.common.NotePageFactory2;
import com.project.npnc.note.dto.NoteReceptionDto;
import com.project.npnc.note.dto.NoteSendDto;
import com.project.npnc.note.service.NoteService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class NotePaging {
	private final NoteService noteService;	
	private final NotePageFactory paging;
	private final NotePageFactory2 paging2;
	
	//즐겨찾기 쪽지함 페이징 
		@RequestMapping("/noteBookMarkPaging")
		public Map<String,Object> noteBookMarkPaging(@RequestParam(defaultValue="1") int cPage, 
				@RequestParam(defaultValue = "6") int numPerpage, int memberKey){

			  Map<String, Object> response = new HashMap<>();
			  int totalData= noteService.noteBookMarkTotalData(memberKey);

			  response.put("notepagelist", noteService.noteBookMarkPaging(Map.of("cPage",cPage,"numPerpage",numPerpage,"memberKey",memberKey)));
			  response.put("pagebar", paging.getPage(cPage, numPerpage, totalData, "/noteBookMarkPaging"));
			  response.put("totalData", totalData);

			return response ;
		}
	
	//받은 쪽지함 기본 페이징 
	@RequestMapping("/notepaging")
	public Map<String,Object> pagingNote(@RequestParam(defaultValue="1") int cPage, 
			@RequestParam(defaultValue = "6") int numPerpage, int memberKey){
		System.out.println(cPage);
		System.out.println(numPerpage);
		  Map<String, Object> response = new HashMap<>();
		  Map<String, Object> param = new HashMap<>();
		  param.put("memberKey", memberKey);

	
	  	  
		  
		  int totalData= noteService.noteSelectTotalData(param);
	  	  
		  response.put("notepagelist", noteService.selectNoteAll(Map.of("cPage",cPage,"numPerpage",numPerpage,"memberKey",memberKey)));
		  response.put("pagebar", paging.getPage(cPage, numPerpage, totalData, "/notepaging"));
		  response.put("totalData", totalData);
		  
		
		  
		  
		return response	;

	}
	
	//받은 쪽지함 이름, 제목 페이징 
	@RequestMapping("/notepagingParam")
	public Map<String,Object> pagingNoteParam(@RequestParam(defaultValue="1") int cPage, 
			@RequestParam(defaultValue = "6") int numPerpage, int memberKey, @RequestParam(required = false) String paramKeyword, @RequestParam(required = false) String nameOrTitle ){

		  Map<String, Object> response = new HashMap<>();
		  Map<String, Object> param = new HashMap<>();
		  param.put("memberKey", memberKey);
		  
		  if(paramKeyword.equals("name")) {

		  param.put("name",nameOrTitle);
		  int totalData= noteService.noteSelectTotalData(param);
	  	  
		  response.put("notepagelist", noteService.selectNoteAll(Map.of("cPage",cPage,"numPerpage",numPerpage,"memberKey",memberKey,"name",nameOrTitle)));
		  response.put("pagebar", paging2.getPage(cPage, numPerpage, totalData, "/notepagingParam"));
		  response.put("totalData", totalData);
		  
		  }else if(paramKeyword.equals("title")){
		  param.put("title", nameOrTitle);
	  	  System.out.println("아니 여기 타이틀이라고 들어왔잖아");
		  int totalData= noteService.noteSelectTotalData(param);
		  response.put("notepagelist", noteService.selectNoteAll(Map.of("cPage",cPage,"numPerpage",numPerpage,"memberKey",memberKey,"title",nameOrTitle)));
		  response.put("pagebar", paging2.getPage(cPage, numPerpage, totalData, "/notepagingParam"));
		  response.put("totalData", totalData);
		  	  
			  
		  }
		  
		  
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
		  List<NoteSendDto> notepagelist= noteService.sendNoteSelectAllPaging(Map.of("cPage",cPage,"numPerpage",numPerpage,"memberKey",memberKey));
		  response.put("notepagelist", notepagelist);
		  System.out.println(notepagelist);
		  response.put("pagebar", paging.getPage(cPage, numPerpage, totalData, "/notepagingsend"));
		
		return response	;

	}
	
//	내게 보낸 쪽지함 페이징 
	@RequestMapping("/notePagingSendMe")
	public Map<String,Object> pagingNoteSendMe(@RequestParam(defaultValue="1") int cPage, 
			@RequestParam(defaultValue = "6") int numPerpage, int memberKey){
	
		  Map<String, Object> response = new HashMap<>();
		  int totalData= noteService.selectNoteMeTotalData(memberKey);
		  List<NoteReceptionDto> notepagelist= noteService.selectNoteMeAll(Map.of("cPage",cPage,"numPerpage",numPerpage,"memberKey",memberKey));
		  response.put("notepagelist", notepagelist);
		  System.out.println(notepagelist);
		  response.put("pagebar", paging.getPage(cPage, numPerpage, totalData, "/notePagingSendMe"));
		
		
		return response;
	}
}
