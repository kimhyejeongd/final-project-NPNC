package com.project.npnc.note.dto;

import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
	private String memberName;
	private String jobName;
	private String postMsgDetail;
	private LocalDateTime postMsgTime;
	private Date postMsgReservation;
	private String postMsgTitle;
	private String postMsgRecStatus;
	private List<SrMember> recMember;
	private List<NoteFileDto> files;
	private String bookMarkStatus;
	
	public String getFormattedPostMsgTime() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return postMsgTime.format(formatter);
    }
	
}
