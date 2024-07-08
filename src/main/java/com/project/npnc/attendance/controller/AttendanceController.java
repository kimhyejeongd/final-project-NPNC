package com.project.npnc.attendance.controller;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.npnc.admin.member.model.dto.AdminMember;
import com.project.npnc.admin.member.model.service.AdminMemberService;
import com.project.npnc.attendance.model.dto.Attendance;
import com.project.npnc.attendance.model.service.AttendanceService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/attendance")
public class AttendanceController{

	private final AdminMemberService memberService;
	private final AttendanceService attendanceService;
	
	
	@Scheduled(cron="0 0 22 * * ?")
	public void AttendanceCheck() {
		
	}
	
//	@PostMapping("/startattendance.do")
//	public String startAttendance(Attendance a,Model m,Authentication authentication) {
//		String memberId = authentication.getName();
//		a.setMember(AdminMember.builder().memberId(memberId).build());
//		int result=attendanceService.startAttendance(a);
//		
//		return "/";
//		
//	}
	
	
}
