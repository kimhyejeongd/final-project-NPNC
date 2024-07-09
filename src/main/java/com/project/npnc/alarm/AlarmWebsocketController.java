package com.project.npnc.alarm;

import static com.project.npnc.chatting.model.dto.ChattingMessage.createChattingMessage;

import java.util.Map;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.npnc.alarm.dto.AlarmMessage;
import com.project.npnc.alarm.service.AlarmService;
import com.project.npnc.chatting.model.dto.ChattingMessage;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AlarmWebsocketController {
	
	@MessageMapping("/msg/{reMemberKey}") //여기로 전송되면 메서드 호출 -> WebSocketConfig prefixes 에서 적용한건 앞에 생략
	@SendTo("/sub/{reMemberKey}")   //구독하고 있는 장소로 메시지 전송 (목적지)  -> WebSocketConfig Broker 에서 적용한건 앞에 붙어줘야됨
	public AlarmMessage test(@DestinationVariable int reMemberKey, AlarmMessage message) {
		System.out.println(reMemberKey);
		System.out.println(message);

        return message;
    
	}
	
	@MessageMapping("/all") //여기로 전송되면 메서드 호출 -> WebSocketConfig prefixes 에서 적용한건 앞에 생략
	@SendTo("/sub/broadcast")   //구독하고 있는 장소로 메시지 전송 (목적지)  -> WebSocketConfig Broker 에서 적용한건 앞에 붙어줘야됨
	public AlarmMessage test2(AlarmMessage message) {
		
		System.out.println(message);

        return message;
    
	}
}
