package com.project.npnc.note.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.npnc.common.NotePageFactory;
import com.project.npnc.member.model.dto.Member;
import com.project.npnc.member.model.service.MemberService;
import com.project.npnc.note.dto.NoteReceptionDto;
import com.project.npnc.note.dto.NoteSendDto;
import com.project.npnc.note.service.NoteService;
import com.project.npnc.organization.dto.OrganizationDto;
import com.project.npnc.organization.service.OrganizationService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class NoteController {
	private final OrganizationService service;

	private final NoteService noteService;
	private final MemberService memberService;
	private final NotePageFactory pageBar;
	
	
	
	@RequestMapping("/noteprint")
	public String notePrint( Model m) {
		NoteReceptionDto noteOne= noteService.selectNoteOne();
		System.out.println(noteOne);
		m.addAttribute("noteOne",noteOne);
		return "note/noteprint";
	}
	
	@RequestMapping("/notewrite3")
	public String noteWrite() {
		return "note/notewrite";
	}
	
	@RequestMapping("/notein")
	public String notein() {
		
		return "note/notein";
	}
	
//	보낸 쪽지함
	@RequestMapping("/sendNoteHome")
	public String sendNoteHome(@RequestParam(defaultValue="1") int cPage, 
			@RequestParam(defaultValue = "6") int numPerpage ,  Model m) {
		int memberKey=1;
		List<NoteSendDto> notelist=noteService.sendNoteSelectAll(Map.of("cPage",cPage,"numPerpage",numPerpage,"memberKey",memberKey));
		m.addAttribute("notelist",notelist);
		System.out.println(notelist);
		int totalData=noteService.sendNoteSelectTotalData(memberKey);
		m.addAttribute("totalData",totalData);
		
		m.addAttribute("pageBar",pageBar.getPage(cPage, numPerpage, totalData,  "/notepagingsend"));

		
		
		return"note/noteSending";
		
	}
//	받은 쪽지함
	@RequestMapping("/notehome")
	public String notehome(@RequestParam(defaultValue="1") int cPage, 
			@RequestParam(defaultValue = "6") int numPerpage ,  Model m, int memberKey, HttpSession session) {
		System.out.println(memberKey);
		Member loginMember=memberService.selectMemberByNo(memberKey);
		
		session.setAttribute("loginMember", loginMember);
		List<NoteReceptionDto> notelist=noteService.selectNoteAll(Map.of("cPage",cPage,"numPerpage",numPerpage,"memberKey",memberKey));
		int totalData=noteService.noteSelectTotalData(memberKey);
		List<Member> AllMemberList=memberService.selectMemeberAll(Map.of("cPage",cPage,"numPerpage",numPerpage));
		
		List<OrganizationDto> organlist=service.selectOrganAll();
		System.out.println(organlist);
		m.addAttribute("organlist",organlist);
		
		m.addAttribute("totalData",totalData);
		m.addAttribute("AllMemberList",AllMemberList);
	
		
		m.addAttribute("notelist",notelist);
		m.addAttribute("pageBar",pageBar.getPage(cPage, numPerpage, totalData,  "/notepaging"));
		System.out.println(notelist);
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
	
//	개별,다중 쪽지 발송
	@RequestMapping("/notewrite")
	@ResponseBody
	public String noteOneWrite(int[] reMemberKey , int memberKey, String postMsgTitle , String postMsgDetail) {
		System.out.println(postMsgDetail);
		String replacePostMsgDetail=postMsgDetail.replace("\r\n","<br>");
		NoteReceptionDto insertNote=NoteReceptionDto.builder()
				.memberKey(memberKey)
				.postMsgTitle(postMsgTitle)
				.postMsgDetail(replacePostMsgDetail)
				.build();
//		int result=noteService.noteOneWrite(reMemberKey, insertNote);
		int result=noteService.noteWrites(reMemberKey, insertNote);

		
		
		return "";
		
	}
	
//  전체 쪽지 발송
	@RequestMapping("/noteAllwrite")
	@ResponseBody
	public String noteAllWrite( int memberKey, String postMsgTitle , String postMsgDetail) {
		System.out.println(postMsgDetail);
		String replacePostMsgDetail=postMsgDetail.replace("\r\n","<br>");
		NoteReceptionDto insertNote=NoteReceptionDto.builder()
				.memberKey(memberKey)
				.postMsgTitle(postMsgTitle)
				.postMsgDetail(replacePostMsgDetail)
				.build();
		int result=noteService.noteAllWrite(insertNote);

		
		
		return "";
		
	}
	
	@RequestMapping("/notewrite2")
	public String noteWrites(String[] reMemberKey, NoteReceptionDto note ) {
		
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
	

//	보낸 쪽지함 개별 조회
	@RequestMapping("/selectSendOne")
	@ResponseBody
	public NoteSendDto selectSendOne(int postMsgSendKey,int sendMemberKey) {
		Map<String,Integer> param=new HashMap<>();
		param.put("postMsgSendKey", postMsgSendKey);
		param.put("sendMemberKey", sendMemberKey);
		NoteSendDto sendDto=noteService.selectSendOne(param);
		return sendDto;
		
	}
	
}
