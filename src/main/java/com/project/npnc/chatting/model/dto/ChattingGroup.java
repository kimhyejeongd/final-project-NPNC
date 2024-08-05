package com.project.npnc.chatting.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChattingGroup {
    private int chatGroupKey;
    private int memberKey;
    private int chatRoomKey;
    private String departmentName;

    public static ChattingGroup createChattingGruop(int chatGroupKey,int memberKey,int chatRoomKey) {
    	return ChattingGroup.builder()
    			.chatGroupKey(chatGroupKey)
    			.memberKey(memberKey)
    			.chatRoomKey(chatRoomKey)
    			.build();
    }
}
