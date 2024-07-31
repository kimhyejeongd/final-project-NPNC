package com.project.npnc.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.npnc.calendar.model.dto.Calendar;
import com.project.npnc.calendar.model.dto.Vacation;
import com.project.npnc.calendar.model.service.CalendarService;
import com.project.npnc.organization.dto.OrganizationDto;
import com.project.npnc.organization.service.OrganizationService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor 
@Controller
public class CalendarController {
	private final CalendarService service;
	private final OrganizationService organService;
	
	
	@GetMapping("/calendar")
	public String test(Model m) {
		List<OrganizationDto> organlist = organService.selectOrganAll();
		
		m.addAttribute("organlist",organlist);
		return "calendar/calendar";
	}
	
	
	@PostMapping("/calendar/insertcalendar")
	public ResponseEntity<Map<String,Object>> ajaxtest(@RequestBody Calendar calendar) {
		System.out.println(calendar);
		int result = service.insertCalendar(calendar);
		Map<String,Object> response = new HashMap<>();
		if(result>0) {
			int calendarKey = service.selectLastInsertKey();
			response.put("status","success");
			response.put("calendarKey",calendarKey);
			System.out.println("calendarKey :" +calendarKey);
			response.put("message","일정이 새로 등록되었습니다.");
			for(int i=0;i<calendar.getSelectedMembers().size();i++) {
				service.insertCalendarReference(calendar.getSelectedMembers().get(i).getRefEmpKey(),calendarKey);
			}
		}
		else {
			response.put("status", "error");
			response.put("message", "일정등록에 실패했습니다.");
		}
		return ResponseEntity.ok(response);
	
	}

	/*
	 * @GetMapping("/calendar/selectcalendar")
	 * 
	 * @ResponseBody public List<Calendar> selectCalendar(int memberKey){
	 * List<Calendar> list = service.selectAllByKey(memberKey); return list; }
	 */
	@PostMapping("/calendar/updatecalendar.do")
	public ResponseEntity<Map<String,Object>> updateCalendar(@RequestBody Calendar calendar){
		System.out.println(calendar.getEnd());
		int result =service.updateCalendar(calendar);
		Map<String,Object> response = new HashMap<>();
		if(result>0) {
			response.put("status", "success");
			response.put("message", "일정이 수정되었습니다.");
		}else {
			response.put("status", "error");
			response.put("message", "일정수정에 실패했습니다.");
		}
		return ResponseEntity.ok(response);
	}
	@PostMapping("/calendar/deletecalendar")
	public ResponseEntity<Map<String,Object>> deleteCalendar(@RequestBody int calendarKey){
		int result = service.deleteCalendar(calendarKey);
		Map<String,Object> response = new HashMap<>();
		
		if(result>0) {
			response.put("status", "success");
			response.put("message", "일정이 삭제되었습니다.");
		}
		else {
			response.put("status", "error");
			response.put("message", "일정 삭제를 실패했습니다.");
		}
		return ResponseEntity.ok(response);
	}
	@PostMapping("/calendar/checkcalendar")
	@ResponseBody
	public List<Calendar> checkCalendar(@RequestBody Map<String,Object> param){
		
		String deptCode = (String) param.get("deptCode");
		
		String searchType = (String) param.get("searchType");
		if(searchType.indexOf('A')> -1) {param.put("searchA","A");}
		if(searchType.indexOf('B')> -1) {param.put("searchB","B");}
		if(searchType.indexOf('C')> -1) {param.put("searchC","C");}
		if(searchType.indexOf('D')> -1) {param.put("searchD","D");}
		
		List<Calendar> calendarList = service.checkCalendar(param);
		
		return calendarList;
	}
	@PostMapping("/calendar/checkvacation")
	@ResponseBody
	public List<Vacation> checkVacation(@RequestBody Map<String,Object> param){
		String deptCode = (String) param.get("deptCode");
		String searchType = (String) param.get("searchType");
		if(searchType.indexOf('A')> -1) {param.put("searchA","A");}
		if(searchType.indexOf('B')> -1) {param.put("searchB","B");}
		
		List<Vacation> vacationList = service.checkVacation(param);
		
		return vacationList;
	}
	
	
}
