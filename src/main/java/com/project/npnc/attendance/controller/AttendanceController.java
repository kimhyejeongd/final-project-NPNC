package com.project.npnc.attendance.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;

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
	
	@PostMapping("/startattendance.do")
	public String startAttendance(Attendance a,Model m,Authentication authentication) {
		int memberKey =memberService.selectMemberKeyById(authentication.getName());
		LocalDateTime attendanceStart=LocalDateTime.now();
		int attendanceHour=attendanceStart.getHour();
		a.setMember(AdminMember.builder().memberKey(memberKey).build());
		a.setAttendanceStart(attendanceStart);
		if(attendanceHour < 9) {
			a.setAttendanceState("출근");
		}else {
			a.setAttendanceState("지각");
		}
		int result=attendanceService.startAttendance(a);
		m.addAttribute("attenance",a);
		return "redirect:/";
		
	}
	
	@PostMapping("endattendance.do")
	public String endAttendance(Attendance a,Model m,Authentication authentication) {
		int memberKey =memberService.selectMemberKeyById(authentication.getName());
		LocalDateTime attendanceEnd=LocalDateTime.now();
		int attendanceHour=attendanceEnd.getHour();
		LocalDate today=LocalDate.now();
		a.setMember(AdminMember.builder().memberKey(memberKey).build());
		a.setAttendanceEnd(attendanceEnd);
		a.setAttendanceDate(today);
		if(attendanceHour < 18) {
			a.setAttendanceState("조퇴");
		}else {
			a.setAttendanceState("출근");
		}
		
		int result=attendanceService.endAttendance(a);
		m.addAttribute("attenance",a);
		
		return "redirect:/";
	}
	
	
}
