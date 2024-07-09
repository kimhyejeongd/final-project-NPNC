package com.project.npnc.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.project.npnc.calendar.model.dto.Calendar;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class CalendarController {
	
	
	
	@GetMapping("/calendar.do")
	public String test() {
		return "/calendar/mainCalendar";
	}
	
	@PostMapping("/calendar/insertcalendar.do")
	public String ajaxtest(@RequestBody Calendar calendar) {
		System.out.println(calendar);
		
		return "success";
	}
	
	
}
