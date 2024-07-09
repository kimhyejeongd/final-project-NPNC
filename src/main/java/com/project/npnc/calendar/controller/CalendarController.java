package com.project.npnc.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class CalendarController {
	
	@GetMapping("/calendar.do")
	public String test() {
		return "calendar/mainCalendar";
	}
}
