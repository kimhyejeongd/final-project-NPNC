package com.project.npnc.board.model.dao;

import java.util.List;

import com.project.npnc.board.model.dto.BoardCategoryDto;
import com.project.npnc.board.model.dto.BoardCommentDto;
import com.project.npnc.board.model.dto.BoardDto;
import com.project.npnc.board.model.dto.BoardFileDto;


public interface BoardDao {
    List<BoardDto> selectAllBoards();
    BoardDto selectBoardById(int boardKey);
    void insertBoard(BoardDto boardDto);
    void updateBoard(BoardDto boardDto);
    void deleteBoard(int boardKey);
    
    List<BoardCommentDto> selectCommentsByBoardId(int boardKey);
    void insertComment(BoardCommentDto commentDto);
    void updateComment(BoardCommentDto commentDto);
    void deleteComment(int commentKey);
    
    List<BoardCategoryDto> selectAllCategories();
    void insertBoardFile(BoardFileDto fileDto);
}