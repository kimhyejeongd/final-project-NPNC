package com.project.npnc.board.model.service;

import java.util.List;
import com.project.npnc.board.model.dto.BoardCategoryDto;
import com.project.npnc.board.model.dto.BoardCommentDto;
import com.project.npnc.board.model.dto.BoardDto;
import com.project.npnc.board.model.dto.BoardFileDto;

public interface BoardService {
    List<BoardDto> getAllBoards();
    List<BoardDto> getNotices(); // 공지사항 조회
    BoardDto getBoardById(int boardKey);
    void createBoard(BoardDto boardDto, List<BoardFileDto> fileList); // 파일 리스트를 인자로 받는 메서드
    void updateBoard(BoardDto boardDto);
    void deleteBoard(int boardKey);
    
    List<BoardCommentDto> getCommentsByBoardId(int boardKey);
    void createComment(BoardCommentDto commentDto);
    void updateComment(BoardCommentDto commentDto);
    void deleteComment(int commentKey);
    BoardCommentDto getCommentById(int commentKey);
    void createReply(BoardCommentDto commentDto);
    // 게시물의 댓글을 가져오는 메서드

    // 댓글에 대한 대댓글을 가져오는 메서드
    List<BoardCommentDto> getRepliesByCommentId(int commentKey);

    List<BoardCategoryDto> getAllCategories();
    
    List<BoardFileDto> getFilesByBoardId(int boardKey);
    List<BoardDto> searchBoardsByTitle(String title);
 
}
