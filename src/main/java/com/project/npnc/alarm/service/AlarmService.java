package com.project.npnc.alarm.service;

import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Service;

import com.project.npnc.alarm.dto.AlarmMessage;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AlarmService {
	
	 private final SimpMessageSendingOperations messagingTemplate;

	    public void alarmByMessage(AlarmMessage messageDto) {
	        messagingTemplate.convertAndSend("/sub/" + messageDto.getMemberKey(), messageDto);
	    }
	
}
