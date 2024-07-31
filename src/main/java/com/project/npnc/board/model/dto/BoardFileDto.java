package com.project.npnc.board.model.dto;

import java.sql.Date;

import com.project.npnc.member.model.dto.SrMember;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardFileDto {

	//게시물 파일 첨부
	private int BOARD_KEY;
	private int BOARD_FILE_KEY;
	private String BOARD_FILE_ORI;
	private String BOARD_FILE_POST;
	
}
