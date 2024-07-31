package com.project.npnc.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.npnc.board.model.dto.BoardCategoryDto;
import com.project.npnc.board.model.dto.BoardCommentDto;
import com.project.npnc.board.model.dto.BoardDto;
import com.project.npnc.board.model.dto.BoardFileDto;

@Repository
public class BoardDaoImpl implements BoardDao {

    private final SqlSession sqlSession;

    @Autowired
    public BoardDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public List<BoardDto> selectAllBoards() {
        return sqlSession.selectList("com.project.npnc.board.model.dao.BoardDao.selectAllBoards");
    }

    @Override
    public List<BoardDto> selectNotices() {
        return sqlSession.selectList("com.project.npnc.board.model.dao.BoardDao.selectNotices");
    }

    @Override
    public BoardDto selectBoardById(int boardKey) {
        return sqlSession.selectOne("com.project.npnc.board.model.dao.BoardDao.selectBoardById", boardKey);
    }

    @Override
    public void insertBoard(BoardDto boardDto) {
        sqlSession.insert("com.project.npnc.board.model.dao.BoardDao.insertBoard", boardDto);
    }

    @Override
    public void updateBoard(BoardDto boardDto) {
        sqlSession.update("com.project.npnc.board.model.dao.BoardDao.updateBoard", boardDto);
    }

    @Override
    public void deleteBoard(int boardKey) {
        sqlSession.delete("com.project.npnc.board.model.dao.BoardDao.deleteBoard", boardKey);
    }

    @Override
    public List<BoardCommentDto> selectCommentsByBoardId(int boardKey) {
        return sqlSession.selectList("com.project.npnc.board.model.dao.BoardDao.selectCommentsByBoardId", boardKey);
    }

    @Override
    public void insertComment(BoardCommentDto commentDto) {
        sqlSession.insert("com.project.npnc.board.model.dao.BoardDao.insertComment", commentDto);
    }

    @Override
    public void updateComment(BoardCommentDto commentDto) {
        sqlSession.update("com.project.npnc.board.model.dao.BoardDao.updateComment", commentDto);
    }

    @Override
    public void deleteComment(int commentKey) {
        sqlSession.delete("com.project.npnc.board.model.dao.BoardDao.deleteComment", commentKey);
    }

    @Override
    public List<BoardCategoryDto> selectAllCategories() {
        return sqlSession.selectList("com.project.npnc.board.model.dao.BoardDao.selectAllCategories");
    }
    

    @Override
    public void insertBoardFile(BoardFileDto boardFileDto) {
        sqlSession.insert("com.project.npnc.board.model.dao.BoardDao.insertBoardFile", boardFileDto);
    }
    
    @Override
    public List<BoardFileDto> selectFilesByBoardId(int boardKey) {
        return sqlSession.selectList("com.project.npnc.board.model.dao.BoardDao.selectFilesByBoardId", boardKey);
    }

}
