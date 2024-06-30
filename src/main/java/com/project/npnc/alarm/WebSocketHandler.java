package com.project.npnc.alarm;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.npnc.note.dto.Note;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class WebSocketHandler extends TextWebSocketHandler {
	private Map<String,WebSocketSession> clients=new HashMap<>();
	
	@Autowired
	private ObjectMapper mapper;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("손님들어왔다!");
		
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		// TODO Auto-generated method stub
		super.handleMessage(session, message);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//		String id="";
//		for(Map.Entry<String, WebSocketSession> client:clients.entrySet()) {
//			WebSocketSession cSession=client.getValue();
//			if(session.equals(cSession)) {
//				id=client.getKey();
//			}
//		}
//		clients.remove(id);
//		sendMessage(Note.builder().type("close").sender(id).build());
//		attendMessage();
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Note note= mapper.readValue(message.getPayload(), Note.class);//json방식으로 넘어옴
		switch(note.getType()) {
		case "open" : addClient(session, note); break;
		case "msg" : sendMessage(note); break;
		case "close" : break;
		
		}
//		
	}
	
	private void attendMessage() {
		try {
			Note note=Note.builder().type("attend")
					.msg(mapper.writeValueAsString(clients.keySet()))
					.build();
			sendMessage(note);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	private void addClient(WebSocketSession session, Note note) {
		clients.put(note.getSender(), session);//한개 아이디로 접속하면 계속 덮어쓰기 되면서
//		한개 아이디로 계속 주고 받을 수 있는 것이다. 
		sendMessage(note);
		attendMessage();
		
	}
	private void sendMessage(Note note) {
		for(Map.Entry<String, WebSocketSession> client:clients.entrySet()) {
			WebSocketSession cSession=client.getValue();
			try {
				String message=mapper.writeValueAsString(note);
				cSession.sendMessage(new TextMessage(message)); //등록된 모든 클라이언트들
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
