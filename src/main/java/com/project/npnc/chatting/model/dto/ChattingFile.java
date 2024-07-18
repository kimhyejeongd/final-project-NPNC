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
    private int chatRoomKey;
    private int chatMsgKey;
    private String fileContentType;
    

    public static ChattingFile createChattingFile(int chatFileKey, int memberKey, String chatMsgFileOri, String chatMsgFilePost, Date chatFileTime, int chatRoomKey, int chatMsgKey,String fileContentType) {
        return ChattingFile.builder()
                .chatFileKey(chatFileKey)
                .memberKey(memberKey)
                .chatMsgFileOri(chatMsgFileOri)
                .chatMsgFilePost(chatMsgFilePost)
                .chatFileTime(chatFileTime)
                .chatRoomKey(chatRoomKey)
                .chatMsgKey(chatMsgKey)
                .fileContentType(fileContentType)
                .build();
    }
}
