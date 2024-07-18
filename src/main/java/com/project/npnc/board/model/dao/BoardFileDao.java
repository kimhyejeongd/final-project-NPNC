package com.project.npnc.board.model.dao;

import com.project.npnc.board.model.dto.BoardFileDto;

import java.util.List;

public interface BoardFileDao {

    List<BoardFileDto> selectFilesByBoardId(int boardKey);

    void insertFile(BoardFileDto fileDto);

    void deleteFile(int fileKey);
}