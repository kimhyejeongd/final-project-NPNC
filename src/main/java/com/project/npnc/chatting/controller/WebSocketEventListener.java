package com.project.npnc.chatting.controller;

import java.security.Principal;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.stream.Collectors;

import org.springframework.context.event.EventListener;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.GenericMessage;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.messaging.SessionConnectedEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import com.google.gson.Gson;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class WebSocketEventListener {
	private final SimpMessagingTemplate messagingTemplate;
	private final Map<String, Map<String, Set<String>>> roomSessions = new ConcurrentHashMap<>();
	private final Map<String, WebSocketSession> roomListSessions = new ConcurrentHashMap<>();
	private final Map<String, String> sessionMemberMap = new ConcurrentHashMap<>();
	private final Map<String, String> websocketSessions = new HashMap<>();
    private final ConcurrentMap<String, Boolean> userStatusMap = new ConcurrentHashMap<>();

    @EventListener
    public void handleWebSocketConnectListener(SessionConnectedEvent event) {
        Principal user = event.getUser();
        System.out.println("PrincipalUser"+user.getName());
        if (user != null) {
            userStatusMap.put(user.getName(), true);
            sendUserStatus(user.getName(), true);
            messagingTemplate.convertAndSendToUser(user.getName(), "queue/users", new HashMap<>(userStatusMap));

        }
    }

    @EventListener
    public void handleWebSocketDisconnectListener(SessionDisconnectEvent event) {
        Principal user = event.getUser();
        if (user != null) {
            userStatusMap.put(user.getName(), false);
            sendUserStatus(user.getName(), false);
        }
    }

    private void sendUserStatus(String username, boolean isOnline) {
        Gson gson = new Gson();
        UserStatus user = new UserStatus(username, isOnline);
        String message = gson.toJson(user);
        System.out.println("Sending message: " + message); // 로그 추가
        messagingTemplate.convertAndSend("/topic/status", message);
    }
    
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class UserStatus {
        private String username;
        private boolean isOnline;
    }

	@EventListener
	private void onSessionConnectedEvent(SessionConnectedEvent event) {
		StompHeaderAccessor sha = StompHeaderAccessor.wrap(event.getMessage());
		String sessionId = sha.getSessionId();
		String type = getNativeHeader(sha, "type");
		String roomId = getNativeHeader(sha, "room");
		String memberKey = getNativeHeader(sha, "loginMemberKey");

		// 디버깅을 위한 로그 추가
		System.out.println("Headers: " + sha.toString());
		System.out.println("Native Headers: " + getNativeHeader(sha, "type"));
		System.out.println("Session ID: " + sessionId);
		System.out.println("Type: " + type);
		System.out.println("Room ID: " + roomId);
		System.out.println("Member Key: " + memberKey);

		if (type == null) {
			type = "unknown";
		}

		if (roomId != null && memberKey != null) {
//        	if("chat".equals(type)) {
//	            roomSessions
//	                .computeIfAbsent(roomId, k -> new ConcurrentHashMap<>())
//	                .computeIfAbsent(type, k -> ConcurrentHashMap.newKeySet())
//	                .add(sessionId);	
//        	} else if("room".equals(type)) {
//	            roomListSessions.put(roomId, event.getSource());
//        	}
			roomSessions
            .computeIfAbsent(roomId, k -> new ConcurrentHashMap<>())
            .computeIfAbsent(type, k -> ConcurrentHashMap.newKeySet())
            .add(sessionId);
			
			sessionMemberMap.put(sessionId, memberKey);

			System.out.println("Session connected: " + sessionId + ", Type: " + type + ", Room: " + roomId
					+ ", Member Key: " + memberKey);
			System.out.println("Current sessions: " + roomSessions);
			websocketSessions.put("memberKey", memberKey);
			websocketSessions.put("roomId", roomId);
			printAllSessionDetails();
			// 세션 수 브로드캐스트
			broadcastSessionCount(roomId);
			broadcastSession(roomId);
		}
	}

	public void printAllSessionDetails() {
		System.out.println("Current Session Details:");

		roomSessions.forEach((roomId, typeMap) -> {
			System.out.println("Room ID: " + roomId);
			typeMap.forEach((type, sessions) -> {
				System.out.println("\tType: " + type);
				sessions.forEach(sessionId -> {
					String memberKey = sessionMemberMap.get(sessionId);
					System.out.println("\t\tSession ID: " + sessionId + " - Member Key: " + memberKey);
				});
			});
		});
	}

	private String getNativeHeader(StompHeaderAccessor sha, String headerName) {
		GenericMessage<?> connectMessage = (GenericMessage<?>) sha.getHeader("simpConnectMessage");
		if (connectMessage != null) {
			Map<String, Object> nativeHeaders = (Map<String, Object>) connectMessage.getHeaders().get("nativeHeaders");
			if (nativeHeaders != null) {
				List<String> headerValues = (List<String>) nativeHeaders.get(headerName);
				if (headerValues != null && !headerValues.isEmpty()) {
					return headerValues.get(0);
				}
			}
		}
		return null;
	}

	@EventListener
	private void onSessionDisconnectEvent(SessionDisconnectEvent event) {
		StompHeaderAccessor sha = StompHeaderAccessor.wrap(event.getMessage());
		String sessionId = sha.getSessionId();
		String memberKey = sessionMemberMap.remove(sessionId);

		roomSessions.forEach((roomId, typeMap) -> {
			typeMap.forEach((type, sessions) -> {
				sessions.remove(sessionId);
			});
		});

		roomSessions.values().removeIf(Map::isEmpty);

		roomSessions.forEach((roomId, typeMap) -> {
			broadcastSessionCount(roomId);
			broadcastSession(roomId);
		});
	}

	public int getChatSessionCount(String roomId) {
		return (int) roomSessions.getOrDefault(roomId, Collections.emptyMap())
				.getOrDefault("chat", Collections.newSetFromMap(new ConcurrentHashMap<>())).stream()
				.map(sessionMemberMap::get).distinct().count();
	}

	public Set<String> getSessionsForRoom(String roomId) {
		System.out.println(ConcurrentHashMap.newKeySet() + "ConcurrentHashMap.newKeySet()");
		return roomSessions.getOrDefault(roomId, Collections.emptyMap()).getOrDefault("chat",
				Collections.newSetFromMap(new ConcurrentHashMap<>()));
	}

	private void broadcastSessionCount(String roomId) {
		int sessionCount = getChatSessionCount(roomId);
		messagingTemplate.convertAndSend("/room/" + roomId + "/sessionCount", sessionCount);
	}
//    private void broadcastSession(Map<String,String> session,String roomId) {
//    	 Map<String, String> currentSessions = roomSessions.getOrDefault(roomId, Collections.emptyMap())
//    	            .values().stream()
//    	            .flatMap(Set::stream)
//    	            .collect(Collectors.toMap(
//    	                sessionId -> "memberKey",
//    	                sessionId -> sessionMemberMap.get(sessionId),
//    	                (existingValue, newValue) -> existingValue 
//    	            ));
//    	    currentSessions.put("roomId", roomId); 
//    	    messagingTemplate.convertAndSend("/roomSession/" + roomId , currentSessions);
//    }

	private void broadcastSession(String roomId) {
		// 현재 방의 모든 세션을 가져와서 memberKey별로 세션 ID를 리스트로 매핑합니다.
		Map<String, List<String>> memberSessions = roomSessions.getOrDefault(roomId, new ConcurrentHashMap<>()).values()
				.stream().flatMap(Set::stream)
				.collect(Collectors.groupingBy(sessionId -> sessionMemberMap.get(sessionId), Collectors.toList()));

		// 데이터 구조를 {memberKey: [sessionId, sessionId, ...], roomId: roomId} 형식으로 조정
		Map<String, Object> broadcastData = new HashMap<>();
		broadcastData.put("memberSessions", memberSessions);
		broadcastData.put("roomId", roomId);

		System.out.println("/roomSession/" + roomId);
		System.out.println("/roomSession/" + memberSessions.toString());
		// Websocket을 통해 해당 방의 모든 클라이언트에 세션 정보를 방송
		messagingTemplate.convertAndSend("/roomSession/" + roomId, broadcastData);
	}

	public void broadcastOpenedSession(String openedRoomId) {
		roomSessions.forEach((roomId, typeMap) -> {
			System.out.println("Room ID: " + roomId);

			if (openedRoomId.equals(roomId)) {
				// roomListSessions에서 session을 가져옵니다.
				WebSocketSession session = roomListSessions.get(roomId);

				// session이 null이 아니고, 연결된 상태인지 확인합니다.
				if (session != null && session.isOpen()) {
					try {
						// 메시지를 보냅니다.
						session.sendMessage(new TextMessage("dd"));
					} catch (Exception e) {
						// 예외를 출력합니다.
						e.printStackTrace();
					}
				} else {
					// 세션이 null이거나 닫혀있는 경우 로그를 남깁니다.
					System.out.println("Session is null or not open for Room ID: " + roomId);
				}
			}
		});

	}

	public Set<String> getConnectedMemberKeys(String roomId, String type) {
		if (!"chat".equals(type)) {
			return Collections.emptySet();
		}
		return roomSessions.getOrDefault(roomId, Collections.emptyMap()).getOrDefault(type,
				Collections.newSetFromMap(new ConcurrentHashMap<>())).stream()
				.map(sessionMemberMap::get).collect(Collectors.toSet());
	}
}
