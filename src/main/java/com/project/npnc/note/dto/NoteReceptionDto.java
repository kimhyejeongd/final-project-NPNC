package com.project.npnc.note.dto;

import java.sql.Date;
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

public class NoteReceptionDto {
	
	private int postMsgRecKey;
	private int memberKey;
	private String postMsgDetail;
	private Date postMsgTime;
	private Date postMsgReservation;
	private String postMsgTitle;
	private String postMsgRecStatus;
	private List<SrMember> recMember;
	private List<NoteFileDto> files;
	
}
