package com.project.npnc.chatting.model.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChattingMessage {
	private int chatMsgKey;
    private int memberKey;
    private int chatRoomKey;
    private List<Integer> receiverKey;
    private String chatMsgDetail;
    private Timestamp   chatMsgTime;
    private String chatMsgNotice;
    private int chatReadCount;
    private ChattingFile file; 
    private String chatMsgFileOri;
    private String chatMsgFilePost;
    private Date chatFileTime;
    private String fileContentType;
    private String memberName;
    

    public static ChattingMessage createChattingMessage
    (int chatMsgKey, int memberKey, int chatRoomKey, String chatMsgDetail, Timestamp chatMsgTime, String chatMsgNotice,int chatReadCount, ChattingFile file,String fileContentType,String memberName) {
        return ChattingMessage.builder()
                .chatMsgKey(chatMsgKey)
                .memberKey(memberKey)
                .chatRoomKey(chatRoomKey)
                .chatMsgDetail(chatMsgDetail)
                .chatMsgTime(chatMsgTime)
                .chatMsgNotice(chatMsgNotice)
                .chatReadCount(chatReadCount)
                .file(file)
                .fileContentType(fileContentType)
                .memberName(memberName)
                .build();
    }
}
