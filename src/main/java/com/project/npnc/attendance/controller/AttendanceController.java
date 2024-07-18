package com.project.npnc.attendance.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.npnc.admin.member.model.dto.AdminMember;
import com.project.npnc.admin.member.model.service.AdminMemberService;
import com.project.npnc.attendance.model.dto.Attendance;
import com.project.npnc.attendance.model.dto.AttendanceEdit;
import com.project.npnc.attendance.model.service.AttendanceService;
import com.project.npnc.common.PageFactory;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/attendance")
public class AttendanceController{

	private final AdminMemberService memberService;
	private final AttendanceService attendanceService;
	private final PageFactory pageFactory;
	
	
	@Scheduled(cron="0 0 23 1 * ?")
	public void AttendanceCheck() {
		List<Attendance> todayAttendance=selectAttendanceToday();
		List<Integer> memberKeys=selectMemberKeyAll();
		Attendance a=new Attendance();
		Map<Integer, Boolean> result = new HashMap<>();

		memberKeys.forEach(memberKey -> {
		    boolean checkKey = todayAttendance.stream().anyMatch(as -> as.getMember().getMemberKey() == memberKey);
		    
		    result.put(memberKey, checkKey);
		});
		
		attendanceService.updateAttendanceState(a,result);

//		result.forEach((key, value) -> {
//		    if (value) {
//		        a.setMember(AdminMember.builder().memberKey(key).build());
//		        attendanceService.updateAttendanceState(a);
//		    	
//		    } else {
//		        attendanceService.insertAbsent(key);
//		    }
//		});
		
		System.out.println(result);
	}
	
	private List<Attendance> selectAttendanceToday(){
		return attendanceService.selectAttendanceToday();
	}
	
	private List selectMemberKeyAll() {
		return memberService.selectMemberKeyAll();
	}
	

	
	@PostMapping("/startattendance")
	public ResponseEntity<Map<String,String>> startAttendance(Attendance a,Model m,Authentication authentication) {
		int memberKey =memberService.selectMemberKeyById(authentication.getName());
//		LocalDate today=LocalDate.now();
//		Map StartCheck=Map.of("memberKey",memberKey,"date",today);//오늘날짜와 멤버키로 오늘 출근을 하고 다시 눌렀을때 막기위해
//		int attendanceCheck=attendanceService.selectAttendanceByMemberKeyAndDate(memberKey);
		Map<String,String> response =new HashMap<>();
//		String msg;
//		if(attendanceCheck>0) {
//			msg="오늘 이미 출근 등록이 완료되었습니다";+
//			
//		}else {
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
			
//			int result=attendanceService.startAttendance(a);
//			response.put("attendanceStart",attendanceStartTime);
//			msg="출근완료!";
//		}
		attendanceService.startAttendance(a); //insert
		response.put("attendanceStart",attendanceStartTime);
		response.put("msg","출근완료!");
		return ResponseEntity.ok(response);
		
	}
	
	@PostMapping("/endattendance")
	public ResponseEntity<Map<String,String>> endAttendance(Attendance a,Model m,Authentication authentication) {
		int memberKey =memberService.selectMemberKeyById(authentication.getName());
		LocalDate today=LocalDate.now();
//		Map EndCheck=Map.of("memberKey",memberKey,"date",today);//오늘날짜와 멤버키로 오늘 출근을 하고 다시 눌렀을때 막기위해
		int attendanceCheck=attendanceService.selectAttendanceByMemberKeyAndDate(memberKey);

		Map<String,String> response =new HashMap<>();
		if(attendanceCheck>0) {
			int attendanceKey=attendanceService.selectAttendanceKeyByMemberKeyAndDate(memberKey);
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
			
			attendanceService.endAttendance(a);
			response.put("attendanceEnd",attendanceEndTime);
			response.put("msg","퇴근완료");
		}
		return ResponseEntity.ok(response);
	}
	
	
	//사원 근태관리 화면
	
	@GetMapping("/selectAttendanceAll.do")
	public String selectAttendanceAll(
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "5") int numPerpage,
			Authentication authentication,
			Model m){
		int memberKey =memberService.selectMemberKeyById(authentication.getName());
		Map page=Map.of("cPage",cPage,"numPerpage",numPerpage);
		Attendance attendCheck=attendanceService.selectAttendanceByMemberKey(memberKey);
		int totaldata=attendanceService.selectAttendanceCount(memberKey);
		List<Attendance> attendances=attendanceService.selectAttendanceAll(page,memberKey);
		m.addAttribute("pagebar",pageFactory.getPage(cPage, numPerpage, totaldata, "selectAttendanceAll.do"));
		m.addAttribute("attendances",attendances);
		m.addAttribute("checkStartTime", attendCheck.getAttendanceStart());
		m.addAttribute("checkEndTime", attendCheck.getAttendanceEnd());
		return "attendance/attendancelist";
		
	}
	
	@PostMapping("/updateAttendance")
	public String updateAttendance(int attendanceKey,Model m,Authentication authentication) {
		LocalDate today=LocalDate.now();
		Attendance a=attendanceService.selectAttendanceByAttendanceKey(attendanceKey);
		a.setMember(AdminMember.builder().memberId(authentication.getName()).build());
		System.out.println(a);
		m.addAttribute("today",today);
		m.addAttribute("attendance",a);
		return "attendance/updateattendance";
		
	}
	
	@PostMapping("/updateAttendanceEnd")
	public String updateAttendanceEnd(AttendanceEdit ae,int attendanceKey,String attendanceEditBeforeTimeEnd,Model m) {
		ae.setAttendance(Attendance.builder().attendanceKey(attendanceKey).build());
		if(ae.getAttendanceEditStartEnd().equals("퇴근")) {
			ae.setAttendanceEditBeforeTime(attendanceEditBeforeTimeEnd);
		}
		System.out.println(ae);
		if(ae.getAttendanceEditBeforeTime().equals("")) {
			
		}
		int result=attendanceService.insertAttendanceEdit(ae);
		
		String msg,loc;
		if(result>0) {
			msg="요청성공";
			loc="/attendance/selectAttendanceAll.do";
		}else {
			msg="요청실패";
			loc="/attendance/selectAttendanceAll.do";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		return "common/msg";
	}
	
	@GetMapping("/selectAttendanceEditById")
	public String updateAttendanceList(Model m,
				@RequestParam(defaultValue = "1") int cPage,
				@RequestParam(defaultValue = "5") int numPerpage,
				Authentication authentication) {
		Map page=Map.of("cPage",cPage,"numPerpage",numPerpage);
		List<AttendanceEdit> attendanceEdit= attendanceService.selectAttendanceEditById(authentication.getName(),page);
		int totaldata=attendanceService.selectAttendanceEditCount(authentication.getName());
		m.addAttribute("pagebar",pageFactory.getPage(cPage, numPerpage, totaldata, "attendanceEditList"));
		m.addAttribute("attendanceEdit",attendanceEdit);
		return "attendance/attendanceEditList";
	}
	
	@PostMapping("/attendanceEditDetail")
	public String attendanceEditDetail(int attendanceEditKey, Model m) {
		AttendanceEdit attendanceEdit= attendanceService.selectAttendanceEditByKey(attendanceEditKey);
		m.addAttribute("attendanceEdit",attendanceEdit);
		return "attendance/attendanceEditDetail";
	}
	
	@PostMapping("/deleteAttendanceEdit")
	public String deleteAttendanceEdit(int attendanceEditKey,Model m) {
		int result=attendanceService.deleteAttendanceEdit(attendanceEditKey);
		String msg,loc;
		if(result>0) {
			msg="삭제성공";
			loc="/attendance/attendanceEditList";
		}else {
			msg="삭제실패";
			loc="/attendance/attendanceEditList";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		return "common/msg";
		
		
	}
	
	

	
	
	
	
	
}
