package com.project.npnc.board.model.dao;

import com.project.npnc.board.model.dto.BoardFileDto;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface BoardFileDao {
    List<BoardFileDto> selectFilesByBoardId(int boardKey);
    void insertFile(BoardFileDto fileDto);
    void deleteFile(int fileKey);
}
