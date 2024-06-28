package com.project.npnc.alarm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebSocketalarm {
	
	@RequestMapping("/alarmgo")
	public String alarm() {
		return "alaram/alaramPrint";
	}
	
}
