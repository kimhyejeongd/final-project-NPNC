package com.project.npnc.attendance.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.npnc.admin.member.model.service.AdminMemberService;
import com.project.npnc.attendance.model.dto.Attendance;
import com.project.npnc.attendance.model.service.AttendanceService;
import com.project.npnc.common.PageFactory;
import com.project.npnc.common.SearchPageFactory;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class IndexAttendanceController {

	private final AdminMemberService memberService;
	private final AttendanceService attendanceService;	

	@GetMapping("/ss")
	public String mainAttendance(
			Authentication authentication,
			Model m) {
		int memberKey =memberService.selectMemberKeyById(authentication.getName());
		Attendance attendCheck=attendanceService.selectAttendanceByMemberKey(memberKey);
		m.addAttribute("checkStartTime", attendCheck.getAttendanceStart());
		m.addAttribute("checkEndTime", attendCheck.getAttendanceEnd());
		return "index";
	}
	
	
}
