package com.project.npnc.board.model.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.project.npnc.board.model.dto.BoardCategoryDto;
import com.project.npnc.board.model.dto.BoardCommentDto;
import com.project.npnc.board.model.dto.BoardDto;
import com.project.npnc.board.model.dto.BoardFileDto;

@Mapper
public interface BoardDao {

    List<BoardDto> selectAllBoards();
    List<BoardDto> selectNotices(); // 공지사항 조회 메서드 추가
    BoardDto selectBoardById(int boardKey);
    void insertBoard(BoardDto boardDto);
    void updateBoard(BoardDto boardDto);
    void deleteBoard(int boardKey);

    List<BoardCommentDto> selectCommentsByBoardId(int boardKey);
    void insertComment(BoardCommentDto commentDto);
    void updateComment(BoardCommentDto commentDto);
    void deleteComment(int commentKey);

    List<BoardCategoryDto> selectAllCategories();
    void insertBoardFile(BoardFileDto boardFileDto);
    
    List<BoardFileDto> selectFilesByBoardId(int boardKey);
}
