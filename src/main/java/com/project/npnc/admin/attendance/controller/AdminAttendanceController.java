package com.project.npnc.admin.attendance.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.npnc.admin.member.model.dto.AdminMember;
import com.project.npnc.attendance.model.dto.Attendance;
import com.project.npnc.attendance.model.dto.AttendanceEdit;
import com.project.npnc.attendance.model.service.AttendanceService;
import com.project.npnc.common.PageFactory;
import com.project.npnc.common.SearchPageFactory;
import com.project.npnc.organization.dto.OrganizationDto;
import com.project.npnc.organization.service.OrganizationService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/admin/attendance")
@Controller
@RequiredArgsConstructor
public class AdminAttendanceController {
	
	private final AttendanceService service;
	private final PageFactory pageFactory;
	private final OrganizationService organService;
	private final SearchPageFactory searchPageFactory;
	
	@GetMapping("/selectAdminAttendanceAll")
	public String selectAdminAttendanceAll(
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "10") int numPerpage,
			Model m) {
		Map page=Map.of("cPage",cPage,"numPerpage",numPerpage);
		int totaldata=service.selectAdminAttendanceAllCount();
		List<Attendance> attendance=service.selectAdminAttendanceAll(page);
		m.addAttribute("pagebar",pageFactory.getPage(cPage, numPerpage, totaldata, "selectAdminAttendanceAll"));
		m.addAttribute("attendance",attendance);
		return "admin/attendance/adminattendancelist";
	}

	@GetMapping("/selectAdminAttendanceEditAll")
	public String selectAdminAttendanceEditAll(
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "10") int numPerpage,	
			Model m) {
		Map page=Map.of("cPage",cPage,"numPerpage",numPerpage);
		int totaldata=service.selectAdminAttendanceEditCount();
		List<AttendanceEdit> attendanceEdit=service.selectAdminAttendanceEditAll(page);
		m.addAttribute("pagebar",pageFactory.getPage(cPage, numPerpage, totaldata, "selectAdminAttendanceEditAll"));
		m.addAttribute("attendanceEdited",attendanceEdit);
		return "admin/attendance/adminattendanceeditlist";
	}
	
	@PostMapping("/adminAttendanceEditDetail")
	public ResponseEntity<Map<String,AttendanceEdit>> adminAttendanceEditDetail(int attendanceEditKey) {
		AttendanceEdit attendanceEdit=service.selectAttendanceEditByKey(attendanceEditKey);
		System.out.println("admin : "+attendanceEdit);
		Map<String,AttendanceEdit> response =new HashMap<>();
		response.put("attendanceEdit", attendanceEdit);
		System.out.println("test");
		
		return ResponseEntity.ok(response);
	}
	
	@PostMapping("/updateAttendanceEdit")
	public String updateAttendanceEdit(int attendanceEditKey,String attendanceEditOpinion,Model m) {
		AttendanceEdit attendanceEdit=AttendanceEdit.builder().attendanceEditKey(attendanceEditKey).attendanceEditOpinion(attendanceEditOpinion).build();
		int result=service.updateAttendanceEdit(attendanceEdit);
		String msg,loc;
		if(result>0) {
			msg="반려성공";
			loc="/admin/attendance/selectAdminAttendanceEditAll";
		}else {
			msg="반려실패";
			loc="/admin/attendance/selectAdminAttendanceEditAll";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		return "common/msg";
	}
	
	
	@PostMapping("/updateAttendance")
	public String updateAttendance(AttendanceEdit attendanceEdit,int attendanceKey,Model m) {
		attendanceEdit.setAttendance(Attendance.builder().attendanceKey(attendanceKey).build());
		int result=service.updateAttendance(attendanceEdit);
		String msg,loc;
		if(result>0) {
			msg="승인성공";
			loc="/admin/attendance/selectAdminAttendanceEditAll";
		}else {
			msg="승인실패";
			loc="/admin/attendance/selectAdminAttendanceEditAll";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		return "common/msg";
	}
	
	
//	@PostMapping("/selectAdminAttendanceBymemberKey")
//	public String selectAdminAttendanceBymemberKey(
//			int memberKey,
//			@RequestParam(defaultValue = "1") int cPage,
//			@RequestParam(defaultValue = "10") int numPerpage,
//			Model m) {
//		
//		Map page=Map.of("cPage",cPage,"numPerpage",numPerpage);
//		List<Attendance> attendance=service.selectAdminAttendanceBymemberKey(memberKey, page);
//		int totaldata=service.selectAdminAttendanceBymemberKeyCount(memberKey);
//		m.addAttribute("pagebar",pageFactory.getPage(cPage, numPerpage, totaldata, "adminAttendanceByOrgan"));
//		m.addAttribute("attendance",attendance);
//		return null;
//		
//	}
	
	@GetMapping("searchAdminAttendanceEdit")
	public String searchAdminAttendanceEdit(
			String searchKey,
			String searchType,
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "10") int numPerpage,
			Model m) {
		Map<String,Object> searchMap=Map.of("searchKey",searchKey,"searchType",searchType);
		Map page=Map.of("cPage",cPage,"numPerpage",numPerpage);
		List<AttendanceEdit> attendanceEdit=service.searchAdminAttendanceEdit(searchMap,page);
		int totaldata=service.searchAdminAttendanceEditCount(searchMap);
		m.addAttribute("pagebar",searchPageFactory.getPage(cPage, numPerpage, totaldata,searchKey,searchType,null,null, "searchAdminAttendanceEdit"));
		m.addAttribute("attendanceEdited",attendanceEdit);
		m.addAttribute("searchK",searchKey);
		m.addAttribute("searchT",searchType);
		return "admin/attendance/adminattendanceeditlist";
	}
	
	@GetMapping("/searchAdminAttendance")
	public String searchAdminAttendance(
			String searchKey,
			String searchType,
			String searchStartDate,
			String searchEndDate,
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "10") int numPerpage,		
			Model m
			) {
		
		if(!searchEndDate.equals("")) {	
			LocalDate searchEndLocalDate = LocalDate.parse(searchEndDate).plusDays(1);
			searchEndDate = searchEndLocalDate.format(DateTimeFormatter.ISO_LOCAL_DATE);
		};
		System.out.println("시작시간 : "+searchStartDate
				+"끝나는시간 : "+searchEndDate);
		Map<String,Object> searchMap=Map.of("searchKey",searchKey,"searchType",searchType,"searchStartDate",searchStartDate,"searchEndDate",searchEndDate);
		System.out.println("tests");
		Map page=Map.of("cPage",cPage,"numPerpage",numPerpage);
		List<AttendanceEdit> attendance=service.searchAdminAttendance(searchMap,page);
		int totaldata=service.searchAdminAttendanceCount(searchMap);
		
		if(!searchEndDate.equals("")) {	
			LocalDate searchEndLocalDate = LocalDate.parse(searchEndDate).minusDays(1);
			searchEndDate = searchEndLocalDate.format(DateTimeFormatter.ISO_LOCAL_DATE);
		};
		
		m.addAttribute("pagebar",searchPageFactory.getPage(cPage, numPerpage, totaldata,searchKey,searchType,searchStartDate,searchEndDate,"searchAdminAttendance"));
		m.addAttribute("attendance",attendance);
		m.addAttribute("searchK",searchKey);
		m.addAttribute("searchT",searchType);
		m.addAttribute("searchSD",searchStartDate);
		m.addAttribute("searchED",searchEndDate);
		return "admin/attendance/adminattendancelist";
	}
	
	
}
