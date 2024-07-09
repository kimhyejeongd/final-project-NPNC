package com.project.npnc.note.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class NoteDto {
	
	private int postMsgKey;
	private int memberKey;
	private String postMsgDetail;
	private Date postMsgTime;
	private Date postMsgReservation;
	
	
	
}
