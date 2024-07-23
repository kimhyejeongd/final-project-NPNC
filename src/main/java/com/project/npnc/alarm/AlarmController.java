package com.project.npnc.alarm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.npnc.alarm.dto.AlarmMessage;
import com.project.npnc.alarm.service.AlarmService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AlarmController {
	private final AlarmService alarmService;
	
	@ResponseBody
	@RequestMapping("/alarmSelectAll")
	public List<AlarmMessage> alarmSelectAll(int memberKey) {
		List<AlarmMessage> result = alarmService.alarmSelectAll(memberKey);
		
		
		return result;
	} 
	
	@ResponseBody
	@RequestMapping("/alarmDeleteAll")
	public String alarmDeleteAll(int memberKey) {
		int result = alarmService.alarmDeleteAll(memberKey);
		
		
		return "";
	} 
	
	@ResponseBody
	@RequestMapping("/alarmDeleteOne")
	public String alarmDeleteOne(int memberKey, int alarmKey) {
		Map<String, Integer> param=new HashMap<>();
		param.put("memberKey", memberKey);
		param.put("alarmKey", alarmKey);
		int result = alarmService.alarmDeleteOne(param);
		
		
		return "";
	} 
}
