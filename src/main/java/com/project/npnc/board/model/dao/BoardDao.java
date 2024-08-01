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
    
  
    BoardCommentDto selectCommentById(int commentKey); // 누락된 메서드 추가
    void insertComment(BoardCommentDto commentDto);
    void updateComment(BoardCommentDto commentDto);
    void deleteComment(int commentKey);

    void insertReply(BoardCommentDto replyDto); // 대댓글 작성
    
    List<BoardCategoryDto> selectAllCategories();
    void insertBoardFile(BoardFileDto boardFileDto);
    
    List<BoardFileDto> selectFilesByBoardId(int boardKey);
    List<BoardDto> searchBoardsByTitle(String title);
    
    List<BoardCommentDto> selectCommentsByBoardId(int boardKey);
    // 댓글에 대한 대댓글을 가져오는 메서드
    List<BoardCommentDto> selectRepliesByCommentId(int commentKey);
}
