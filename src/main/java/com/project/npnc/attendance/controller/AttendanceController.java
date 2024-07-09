package com.project.npnc.attendance.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@GetMapping("/startattendance.do")
	public String startAttendance(Attendance a,Model m,Authentication authentication) {
		int memberKey =memberService.selectMemberKeyById(authentication.getName());
		LocalDate today=LocalDate.now();
		Map StartCheck=Map.of("memberKey",memberKey,"date",today);//오늘날짜와 멤버키로 오늘 출근을 하고 다시 눌렀을때 막기위해
		int attendanceCheck=attendanceService.selectAttendanceByMemberKeyAndDate(StartCheck);
		
		
		String msg,loc;
		if(attendanceCheck>0) {
			msg="오늘 이미 출근 등록이 완료되었습니다";
			loc="/";
		}else {
			LocalTime attendanceStart=LocalTime.now();
			int attendanceHour=attendanceStart.getHour();
			DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		    String attendanceStartTime = attendanceStart.format(timeFormatter);
		    
			a.setMember(AdminMember.builder().memberKey(memberKey).build());
			a.setAttendanceStart(attendanceStartTime);
			if(attendanceHour < 9) {
				a.setAttendanceState("출근");
			}else {
				a.setAttendanceState("지각");
			}
			
			int result=attendanceService.startAttendance(a);
			m.addAttribute("attenance",a);
			msg="출근완료!";
			loc="/";
		}
		
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		return "common/msg";
		
	}
	
	@GetMapping("endattendance.do")
	public String endAttendance(Attendance a,Model m,Authentication authentication) {
		int memberKey =memberService.selectMemberKeyById(authentication.getName());
		LocalDate today=LocalDate.now();
		Map EndCheck=Map.of("memberKey",memberKey,"date",today);//오늘날짜와 멤버키로 오늘 출근을 하고 다시 눌렀을때 막기위해
//		int attendanceCheck=attendanceService.selectAttendanceByMemberKeyAndDate(EndCheck);
		int attendanceKey=attendanceService.selectAttendanceKeyByMemberKeyAndDate(EndCheck);
		
		String msg,loc;
		if(attendanceKey>0) {
			msg="퇴근완료!";
			loc="/";
			LocalTime attendanceEnd=LocalTime.now();
			int attendanceHour=attendanceEnd.getHour();
			DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		    String attendanceEndTime = attendanceEnd.format(timeFormatter);
			a.setMember(AdminMember.builder().memberKey(memberKey).build());
			a.setAttendanceEnd(attendanceEndTime);
			a.setAttendanceKey(attendanceKey);

			if(attendanceHour < 18) {
				a.setAttendanceState("조퇴");
			}else {
				a.setAttendanceState("출근");
			}
			
			int result=attendanceService.endAttendance(a);
			m.addAttribute("attenance",a);
		}else {
			msg="출근부터 해주세요!";
			loc="/";
		}
		
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		return "common/msg";
	}
	
	
}
