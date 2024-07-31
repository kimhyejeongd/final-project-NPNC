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
public class BoardCategoryDto {
	//게시판 카테고리
	private int BOARD_CATEGORY_KEY;
	private String BOARD_CATEGORY_NAME;
}
