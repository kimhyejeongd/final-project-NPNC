package com.project.npnc.note.dto;

import java.util.Date;

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
	private Date postMsgSendTime;
	private Date postMsgSendReservation;
	
	
}
