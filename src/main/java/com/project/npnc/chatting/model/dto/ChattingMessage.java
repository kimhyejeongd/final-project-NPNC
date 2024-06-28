package com.project.npnc.chatting.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChattingMessage {
	private int chatMsgKey;
    private int memberKey;
    private int chatRoomKey;
    private String chatMsgDetail;
    private Date chatMsgTime;
    private String chatMsgNotice;
    private int chatReadCount;
    

    public static ChattingMessage createChattingMessage(int chatMsgKey, int memberKey, int chatRoomKey, String chatMsgDetail, Date chatMsgTime, String chatMsgNotice,int chatReadCount) {
        return ChattingMessage.builder()
                .chatMsgKey(chatMsgKey)
                .memberKey(memberKey)
                .chatRoomKey(chatRoomKey)
                .chatMsgDetail(chatMsgDetail)
                .chatMsgTime(chatMsgTime)
                .chatMsgNotice(chatMsgNotice)
                .chatReadCount(chatReadCount)
                .build();
    }
}
