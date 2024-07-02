package com.project.npnc.admin.member.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.npnc.admin.member.model.service.AdminMemberService;
import com.project.npnc.member.model.dto.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/member")
public class AdminMemberController {
	
private final AdminMemberService service;
	
	
	@GetMapping("/selectmemberall.do")
	public String selectMemberAll(Model m){
		
		//페이징처리 해야함
		
		List<Member> members= service.selectMemeberAll(null);
		m.addAttribute("members",members);
		return "admin/member/memberlist";
	
		
	}
	
	@GetMapping("/selectmemberbyno.do")
	public String selectMemberByNo(int memberKey,Model m) {
		Member member=service.selectMemberByNo(memberKey);
		m.addAttribute("member",member);
		return "admin/member/memberdetail";
	}
	
	@PostMapping("/insertmember.do")
	public String insertMember(Member mem,Model m) {
		int result=service.insertMember(mem);
		String msg,loc;
		if(result>0) {
			msg="등록성공";
			loc="/member/selectmemberall.do";
		}else {
			msg="등록실패";
			loc="/member/selectmemberall.do";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	@PostMapping("/updatemember.do")
	public String updateMember(Member mem,Model m) {
		int result=service.updateMember(mem);
		String msg,loc;
		if(result>0) {
			msg="수정성공";
			loc="/member/selectmemberall.do";
		}else {
			msg="수정실패";
			loc="/member/selectmemberall.do";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	@PostMapping("/deletemember.do")
	public String deleteMember(int memberKey,Model m) {
		int result=service.deleteMember(memberKey);
		String msg,loc;
		if(result>0) {
			msg="삭제성공";
			loc="/member/selectmemberall.do";
		}else {
			msg="삭제실패";
			loc="/member/selectmemberall.do";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	
}
