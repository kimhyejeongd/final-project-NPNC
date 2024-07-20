package com.project.npnc.note.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NoteFileDto {
	private int postMsgFileKey;
	private int postMsgKey;
	private String postMessageFileOri;
	private String postMessageFilePost;
	private int postMsgSendKey;
	
}
