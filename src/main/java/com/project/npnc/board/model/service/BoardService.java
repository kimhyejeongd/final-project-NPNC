package com.project.npnc.board.model.service;

import java.util.List;

import com.project.npnc.board.model.dto.BoardCategoryDto;
import com.project.npnc.board.model.dto.BoardCommentDto;
import com.project.npnc.board.model.dto.BoardDto;
import com.project.npnc.board.model.dto.BoardFileDto;

public interface BoardService {
    List<BoardDto> getAllBoards();
    BoardDto getBoardById(int boardKey);
    void createBoard(BoardDto boardDto, List<BoardFileDto> fileList);
    void updateBoard(BoardDto boardDto);
    void deleteBoard(int boardKey);
    
    List<BoardCommentDto> getCommentsByBoardId(int boardKey);
    void createComment(BoardCommentDto commentDto);
    void updateComment(BoardCommentDto commentDto);
    void deleteComment(int commentKey);
    
    List<BoardCategoryDto> getAllCategories();
}