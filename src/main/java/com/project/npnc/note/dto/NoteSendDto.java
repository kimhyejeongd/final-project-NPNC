package com.project.npnc.note.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import com.project.npnc.member.model.dto.SrMember;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data


public class NoteSendDto {
	
	private int postMsgSendKey;
	private int sendMemberKey;
	private String postMsgSendTitle;
	private String postMsgSendDetail;
	private LocalDateTime postMsgSendTime;
	private Date postMsgSendReservation;
	private String memberName;
	private String jobName;
	private List<SrMember> recMember;
	private List<NoteFileDto> files;
	
	public String getFormattedPostMsgTime() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return postMsgSendTime.format(formatter);
    }
	
}
