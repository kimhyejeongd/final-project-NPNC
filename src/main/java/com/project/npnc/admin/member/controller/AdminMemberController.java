package com.project.npnc.admin.member.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.npnc.admin.member.model.dto.AdminMember;
import com.project.npnc.admin.member.model.service.AdminMemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/member")
public class AdminMemberController {
	
private final AdminMemberService service;
	
	
	@GetMapping("/selectmemberall.do")
	public String selectMemberAll(
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "5") int numPerpage,			
			Model m){
		
		//페이징처리
		Map page=Map.of("cPage",cPage,"numPerpage",numPerpage);
		int totaldata=service.selectMemberCount();
		List<AdminMember> members= service.selectMemeberAll(page);
		
		m.addAttribute("members",members);
		m.addAttribute("totalContents",totaldata);
		return "admin/member/memberlist";
	
		
	}
	
	@GetMapping("/selectmemberbyno.do")
	public String selectMemberByNo(int memberKey,Model m) {
		AdminMember member=service.selectMemberByNo(memberKey);
		m.addAttribute("member",member);
		return "admin/member/memberdetail";
	}
	
	@PostMapping("/insertmemberend.do")
	public String insertMember(AdminMember mem,Model m) {
		int result=service.insertMember(mem);
		String msg,loc;
		if(result>0) {
			msg="등록성공";
			loc="/admin/member/selectmemberall.do";
		}else {
			msg="등록실패";
			loc="/admin/member/selectmemberall.do";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	@PostMapping("/updatemember.do")
	public String updateMember(AdminMember mem,Model m) {
		int result=service.updateMember(mem);
		String msg,loc;
		if(result>0) {
			msg="수정성공";
			loc="/admin/member/selectmemberall.do";
		}else {
			msg="수정실패";
			loc="/admin/member/selectmemberall.do";
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
			loc="/admin/member/selectmemberall.do";
		}else {
			msg="삭제실패";
			loc="/admin/member/selectmemberall.do";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	
}
