package com.project.npnc.note.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.npnc.member.model.dto.Member;
import com.project.npnc.member.model.service.MemberService;
import com.project.npnc.note.dto.NoteDto;
import com.project.npnc.note.service.NoteService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class NoteController {
	
	private final NoteService noteService;
	private final MemberService memberService;
	
	
	@RequestMapping("/notein")
	public String notein() {
		
		return "note/notein";
	}
	@RequestMapping("/notehome")
	public String notehome() {
		
		return "note/notehome";
	}
	
	@RequestMapping("/notesession")
	public String notesession(@RequestParam(defaultValue="1") int memberKey, HttpSession session) {
		System.out.println(memberKey);
		Member loginMember=memberService.selectMemberByNo(memberKey);
				
		session.setAttribute("loginMember", loginMember);
		return "redirect:/note";
	}
	
	
	@RequestMapping("/note")
	public String note(@RequestParam(defaultValue="1") int cPage, 
			@RequestParam(defaultValue = "5") int numPerpage ,  Model m) {
		
	
		List<Member> list=memberService.selectMemeberAll(Map.of("cPage",cPage,"numPerpage",numPerpage));
		System.out.println(list);
		m.addAttribute("list",list);
		
		return "note/note";
	}
	
	
	@RequestMapping("/notewrite")
	@ResponseBody
	public String noteOneWrite(int reMemberKey , int memberKey, String postMsgDetail) {
		
		NoteDto insertNote=NoteDto.builder()
				.memberKey(memberKey)
				.postMsgDetail(postMsgDetail)
				.build();
		int result=noteService.noteOneWrite(reMemberKey, insertNote);
		
		
		return "";
		
	}
	
	@RequestMapping("/notewrite2")
	public String noteWrites(String[] reMemberKey, NoteDto note ) {
		
		int[] intArray = new int[reMemberKey.length];

		for(int i = 0; i < reMemberKey.length; i++){
		    intArray[i] = Integer.parseInt(reMemberKey[i]);
		}
		
		for(int i = 0; i < intArray.length; i++){
		    System.out.println(intArray[i]+"이건 제대로?");
		}
		
		int result=noteService.noteWrites(intArray, note);
		
		return "redirect:/note";
		
	}
}
