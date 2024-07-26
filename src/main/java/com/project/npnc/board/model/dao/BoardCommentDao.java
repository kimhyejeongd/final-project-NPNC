package com.project.npnc.board.model.dao;
import com.project.npnc.board.model.dto.BoardCommentDto;

import java.util.List;

public interface BoardCommentDao {

    List<BoardCommentDto> selectCommentsByBoardId(int boardKey);

    void insertComment(BoardCommentDto commentDto);

    void updateComment(BoardCommentDto commentDto);

    void deleteComment(int commentKey);
}
