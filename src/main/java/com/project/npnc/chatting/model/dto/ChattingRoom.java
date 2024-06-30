package com.project.npnc.chatting.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChattingRoom {
	private int chatRoomKey;
	private String chatStatus;
	private int chatRecentMsgKey;
	private Date chatMsgTime;

    public static ChattingRoom createChattingRoom(int chatRoomKey, String chatStatus) {
        return ChattingRoom.builder()
                .chatRoomKey(chatRoomKey)
                .chatStatus(chatStatus)
                .build();
    }
}
