package com.project.npnc.chatting.controller;



import java.util.Map;
import static com.project.npnc.chatting.model.dto.ChattingMessage.createChattingMessage;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.project.npnc.chatting.model.dto.ChattingMessage;
import com.project.npnc.chatting.model.service.ChatService;

import lombok.RequiredArgsConstructor;
@Controller
@RequiredArgsConstructor
public class ChatController {
	private final ChatService service;
	@MessageMapping("/{roomId}") //여기로 전송되면 메서드 호출 -> WebSocketConfig prefixes 에서 적용한건 앞에 생략
	@SendTo("/room/{roomId}")   //구독하고 있는 장소로 메시지 전송 (목적지)  -> WebSocketConfig Broker 에서 적용한건 앞에 붙어줘야됨
	public ChattingMessage test(@DestinationVariable int roomId, ChattingMessage message) {
//		HttpSession session=(HttpSession)RequestContextHolder.currentRequestAttributes()
//		.resolveReference(RequestAttributes.REFERENCE_SESSION);
//		System.out.println(session);
		
		System.out.println("Received message: " + message);
        // 채팅 저장
        System.out.println(message.getChatMsgTime());
        
        Map<String, Object> chatInfo = service.insertChat(message);
            System.out.println("Insert result: " + chatInfo.get("seq"));
      
            ChattingMessage chat = createChattingMessage((int)chatInfo.get("seq"),message.getMemberKey(),roomId,  message.getChatMsgDetail(), message.getChatMsgTime(),"N",(int)chatInfo.get("readCount"));

        System.out.println("After insertChat call"+ message);

        return chat;
    
	}

	
}
