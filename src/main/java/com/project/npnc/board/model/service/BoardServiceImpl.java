package com.project.npnc.board.model.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.npnc.board.model.dao.BoardDao;
import com.project.npnc.board.model.dto.BoardCategoryDto;
import com.project.npnc.board.model.dto.BoardCommentDto;
import com.project.npnc.board.model.dto.BoardDto;
import com.project.npnc.board.model.dto.BoardFileDto;

@Service
public class BoardServiceImpl implements BoardService {
    
    @Autowired
    private BoardDao boardDao;

    @Override
    public List<BoardDto> getAllBoards() {
        return boardDao.selectAllBoards();
    }

    
    @Override
    public List<BoardDto> getNotices() {
        return boardDao.selectNotices(); // 공지사항 조회 메서드 호출
    }

    @Override
    public BoardDto getBoardById(int boardKey) {
        return boardDao.selectBoardById(boardKey);
    }

    @Override
    public void createBoard(BoardDto boardDto, List<BoardFileDto> fileList) {
        boardDao.insertBoard(boardDto);
        for (BoardFileDto fileDto : fileList) {
            fileDto.setBOARD_KEY(boardDto.getBOARD_KEY()); // 게시물 키 설정
            boardDao.insertBoardFile(fileDto);
    }
    
    }
    @Override
    public void updateBoard(BoardDto boardDto) {
        boardDao.updateBoard(boardDto);
    }

    @Override
    public void deleteBoard(int boardKey) {
        boardDao.deleteBoard(boardKey);
    }

    @Override
    public List<BoardCommentDto> getCommentsByBoardId(int boardKey) {
        return boardDao.selectCommentsByBoardId(boardKey);
    }

    @Override
    public void createComment(BoardCommentDto commentDto) {
        boardDao.insertComment(commentDto);
    }

    @Override
    public void updateComment(BoardCommentDto commentDto) {
        boardDao.updateComment(commentDto);
    }

    @Override
    public void deleteComment(int commentKey) {
        boardDao.deleteComment(commentKey);
    }

    @Override
    public List<BoardCategoryDto> getAllCategories() {
        return boardDao.selectAllCategories();
    }
    
    @Override
    public List<BoardFileDto> getFilesByBoardId(int boardKey) {
        return boardDao.selectFilesByBoardId(boardKey);
    }

}
