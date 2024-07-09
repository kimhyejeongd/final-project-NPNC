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
public class ChattingFile {
	private int chatFileKey;
    private int memberKey;
    private String chatMsgFileOri;
    private String chatMsgFilePost;
    private Date chatFileTime;
    private int chatKey;
    private int chatMsgKey;
    

    public static ChattingFile createChattingFile(int chatFileKey, int memberKey, String chatMsgFileOri, String chatMsgFilePost, Date chatFileTime, int chatKey, int chatMsgKey) {
        return ChattingFile.builder()
                .chatFileKey(chatFileKey)
                .memberKey(memberKey)
                .chatMsgFileOri(chatMsgFileOri)
                .chatMsgFilePost(chatMsgFilePost)
                .chatFileTime(chatFileTime)
                .chatKey(chatKey)
                .chatMsgKey(chatMsgKey)
                .build();
    }
}
