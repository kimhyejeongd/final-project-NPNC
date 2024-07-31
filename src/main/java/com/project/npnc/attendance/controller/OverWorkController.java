package com.project.npnc.attendance.controller;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.npnc.attendance.model.service.AttendanceService;
import com.project.npnc.document.model.dto.OvertimeApply;
import com.project.npnc.security.dto.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/overwork")
@RequiredArgsConstructor
public class OverWorkController {

	private final AttendanceService service;
	
	@GetMapping("/selectoverworkByMemberKey")
	public String selectoverworkByMemberKey(
			Authentication authentication,
			Model m
			){
		Member member=(Member)authentication.getPrincipal();
		
		List<OvertimeApply> ota=service.selectoverworkByMemberKey(member.getMemberKey());
		m.addAttribute("ota",ota);
		
		return "attendance/overwork/overworklis";
	}
	
	
	
	
}
