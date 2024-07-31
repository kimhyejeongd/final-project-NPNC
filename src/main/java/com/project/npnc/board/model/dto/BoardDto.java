package com.project.npnc.board.model.dto;



import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardDto {
	//게시판 메인
	private int BOARD_KEY;
	private int BOARD_CATEGORY_KEY;
	private int MEMBER_KEY;
	private String BOARD_DETAIL;
	private Date BOARD_ENROLL_DATE;
	private Date BOARD_UPDATE_DATE;
	private String BOARD_DELETE;
	private String BOARD_TITLE;
//	private List<BoardFileDto> files;
}
