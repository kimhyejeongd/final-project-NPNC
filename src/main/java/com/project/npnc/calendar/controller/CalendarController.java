package com.project.npnc.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.npnc.calendar.model.dto.Calendar;
import com.project.npnc.calendar.model.service.CalendarService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor 
@Controller
public class CalendarController {
	private final CalendarService service;
	
	
	@GetMapping("/calendar.do")
	public String test() {
		return "calendar/mainCalendar";
	}
	
	@PostMapping("/calendar/insertcalendar.do")
	public ResponseEntity<Map<String,Object>> ajaxtest(@RequestBody Calendar calendar) {
		System.out.println(calendar);
		int result = service.insertCalendar(calendar);
		Map<String,Object> response = new HashMap<>();
		if(result>0) {
			int calendarKey = service.selectLastInsertKey();
			response.put("status","success");
			response.put("calendarKey",calendarKey);
			response.put("message","일정이 새로 등록되었습니다.");
		}
		else {
			response.put("status", "error");
			response.put("message", "일정등록에 실패했습니다.");
		}
		return ResponseEntity.ok(response);
	
	}
	@GetMapping("/calendar/selectcalendar.do")
	@ResponseBody
	public List<Calendar> selectCalendar(int memberKey){
		List<Calendar> list = service.selectAllByKey(memberKey);
		return list;
		
	}
	@PostMapping("/calendar/updatecalendar.do")
	public ResponseEntity<Map<String,Object>> updateCalendar(@RequestBody Calendar calendar){
		int result = service.updateCalendar(calendar);
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
	@PostMapping("/calendar/deletecalendar.do")
	public ResponseEntity<Map<String,Object>> deleteCalendar(@RequestBody Integer calKey){
		int result = service.deleteCalendar(calKey);
		Map<String,Object> response = new HashMap<>();
		
		if(result>0) {
			response.put("status", "success");
			response.put("message", "일정이 삭제되었습니다.");
		}
		else {
			response.put("status", "error");
			response.put("message", "일정수정에 실패했습니다.");
		}
		return ResponseEntity.ok(response);
	}
	
	
}
