package com.project.npnc.alarm;

import java.util.List;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.project.npnc.alarm.dto.AlarmMessage;
import com.project.npnc.alarm.service.AlarmService;
import com.project.npnc.member.model.dto.SrMember;
import com.project.npnc.note.service.NoteService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AlarmWebsocketController {
	
	private final NoteService noteService;
	private final AlarmService alarmService;
	
	@MessageMapping("/msg/{reMemberKey}") //여기로 전송되면 메서드 호출 -> WebSocketConfig prefixes 에서 적용한건 앞에 생략
	@SendTo("/sub/{reMemberKey}")   //구독하고 있는 장소로 메시지 전송 (목적지)  -> WebSocketConfig Broker 에서 적용한건 앞에 붙어줘야됨
	public AlarmMessage test(@DestinationVariable int reMemberKey, AlarmMessage message) {
		
		System.out.println(reMemberKey);
		System.out.println(message);
		
		int result = alarmService.alarmInsert(message);
	
		
        return message;
    
	}
	
	@MessageMapping("/all") //여기로 전송되면 메서드 호출 -> WebSocketConfig prefixes 에서 적용한건 앞에 생략
	@SendTo("/sub/broadcast")   //구독하고 있는 장소로 메시지 전송 (목적지)  -> WebSocketConfig Broker 에서 적용한건 앞에 붙어줘야됨
	public AlarmMessage test2(AlarmMessage message) {
		
		System.out.println(message);
		List<SrMember> list= noteService.selectMemberAllNoPaging();
		
		for(int i=0; i<list.size(); i++) {
			int memberKey= list.get(i).getMemberKey();
			message.setAlarmReMember(memberKey);
			int result = alarmService.alarmInsert(message);
			
			
		}
        return message;
    
	}
}
