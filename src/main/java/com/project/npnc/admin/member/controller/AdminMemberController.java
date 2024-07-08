package com.project.npnc.admin.member.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.npnc.admin.department.model.dto.Department;
import com.project.npnc.admin.department.model.service.DepartmentService;
import com.project.npnc.admin.job.model.dto.Job;
import com.project.npnc.admin.job.model.service.JobService;
import com.project.npnc.admin.member.model.dto.AdminMember;
import com.project.npnc.admin.member.model.service.AdminMemberService;
import com.project.npnc.common.PageFactory;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/member")
@Slf4j
public class AdminMemberController {
	
	private final AdminMemberService service;
	private final DepartmentService deptService;
	private final JobService jobService;
//	private final BCryptPasswordEncoder pwencoder;
	private final PageFactory pageFactory;

	
	
	@GetMapping("/selectmemberall.do")
	public String selectMemberAll(
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "5") int numPerpage,			
			Model m){
		
		//페이징처리
		Map page=Map.of("cPage",cPage,"numPerpage",numPerpage);
		int totaldata=service.selectMemberCount();
		List<AdminMember> members= service.selectMemeberAll(page);
		m.addAttribute("pagebar",pageFactory.getPage(cPage, numPerpage, totaldata, "selectmemberall.do"));
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
	
	@GetMapping("/insertmember.do")
	public void insertMember(Model m) {
		List<Department> dept=deptService.selectDeptAll();
		List<Job> job=jobService.selectJobAll();
		m.addAttribute("dept",dept);
		m.addAttribute("job",job);
	}
	
	
	@PostMapping("/insertmemberend.do")
	public String insertMember(AdminMember mem,String jobKey,String deptKey,Model m) {
		mem.setJob(Job.builder().jobKey(jobKey).build());
		mem.setDepartment(Department.builder().deptKey(deptKey).build());
		log.info("{}",mem);
		//패스워드 암호화
//		String encodePw=pwencoder.encode(mem.getMemberPw());
//		mem.setMemberPw(encodePw);
		
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
	public String updateMember(Model m,int memberKey) {
		AdminMember member =service.selectMemberByNo(memberKey);
		List<Department> dept=deptService.selectDeptAll();
		List<Job> job=jobService.selectJobAll();
		m.addAttribute("dept",dept);
		m.addAttribute("job",job);
		m.addAttribute("member",member);
		
		return "admin/member/updatemember";
	}
	
	@PostMapping("/updatememberend.do")
	public String updateMember(AdminMember mem,String jobKey,String deptKey,Model m) {
		mem.setJob(Job.builder().jobKey(jobKey).build());
		mem.setDepartment(Department.builder().deptKey(deptKey).build());
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
