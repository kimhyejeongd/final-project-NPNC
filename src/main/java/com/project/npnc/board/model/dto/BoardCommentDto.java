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
public class BoardCommentDto {
    private int BOARD_COMMENT_KEY;
    private int BOARD_KEY;
    private int MEMBER_KEY;
    private int BOARD_COMMENT_LEVEL;
    private String BOARD_COMMENT_DETAIL; // 이 필드에 값이 있어야 합니다.
    private Date BOARD_COMMENT_DATE;
    private int BOARD_COMMENT_REF;
    private String BOARD_COMMENT_DELETE;
}


