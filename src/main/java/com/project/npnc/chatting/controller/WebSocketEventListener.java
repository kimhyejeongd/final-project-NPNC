package com.project.npnc.chatting.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.GenericMessage;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.messaging.SessionConnectedEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import com.project.npnc.chatting.model.service.ChatService;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class WebSocketEventListener {
    private final SimpMessagingTemplate messagingTemplate;
    private final Map<String, Map<String, Set<String>>> roomSessions = new ConcurrentHashMap<>();
    private final Map<String, String> sessionMemberMap = new ConcurrentHashMap<>();
    private final ChatService service;


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
            roomSessions
                .computeIfAbsent(roomId, k -> new ConcurrentHashMap<>())
                .computeIfAbsent(type, k -> ConcurrentHashMap.newKeySet())
                .add(sessionId);

            sessionMemberMap.put(sessionId, memberKey);

            System.out.println("Session connected: " + sessionId + ", Type: " + type + ", Room: " + roomId + ", Member Key: " + memberKey);
            System.out.println("Current sessions: " + roomSessions);
            

            // 세션 수 브로드캐스트
            broadcastSessionCount(roomId);
        }
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
        });
    }

    public int getChatSessionCount(String roomId) {
        return (int) roomSessions.getOrDefault(roomId, Collections.emptyMap())
                .getOrDefault("chat", Collections.newSetFromMap(new ConcurrentHashMap<>()))
                .stream()
                .map(sessionMemberMap::get)
                .distinct()
                .count();
    }

    public Set<String> getSessionsForRoom(String roomId) {
        System.out.println(ConcurrentHashMap.newKeySet() + "ConcurrentHashMap.newKeySet()");
        return roomSessions.getOrDefault(roomId, Collections.emptyMap())
                .getOrDefault("chat", Collections.newSetFromMap(new ConcurrentHashMap<>()));
    }

    private void broadcastSessionCount(String roomId) {
        int sessionCount = getChatSessionCount(roomId);
        messagingTemplate.convertAndSend("/room/" + roomId + "/sessionCount", sessionCount);
    }
}
