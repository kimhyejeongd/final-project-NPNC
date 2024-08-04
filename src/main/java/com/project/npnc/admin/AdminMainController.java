package com.project.npnc.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.npnc.admin.department.model.dto.Department;
import com.project.npnc.admin.job.model.dto.Job;
import com.project.npnc.admin.member.model.service.AdminMemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminMainController {

	private final AdminMemberService memberService;
	
	
	@GetMapping("/adminMain")
	public String adminMain(Model m) {
		int memberCount=memberService.selectMemberCount();
		List<Department> dept=memberService.selectMemberCountByDept();
		List<Job> job=memberService.selectMemberCountByJob();
		m.addAttribute("memberCount",memberCount);
		m.addAttribute("job",job);
		m.addAttribute("dept",dept);
		
		
		return "admin/adminMain";
	}
	
	@GetMapping("/manageAdminMain")
	public String manageAdminMain(Model m) {
		int memberCount=memberService.selectMemberCount();
		List<Department> dept=memberService.selectMemberCountByDept();
		List<Job> job=memberService.selectMemberCountByJob();
		m.addAttribute("memberCount",memberCount);
		m.addAttribute("job",job);
		m.addAttribute("dept",dept);
		
		
		return "admin/manageAdminMain";
	}
	
	@GetMapping("/personAdminMain")
	public String personAdminMain(Model m) {
		int memberCount=memberService.selectMemberCount();
		List<Department> dept=memberService.selectMemberCountByDept();
		List<Job> job=memberService.selectMemberCountByJob();
		m.addAttribute("memberCount",memberCount);
		m.addAttribute("job",job);
		m.addAttribute("dept",dept);
		
		
		return "admin/personAdminMain";
	}
	
	
	
	
}
