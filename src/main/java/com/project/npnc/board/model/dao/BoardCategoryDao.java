package com.project.npnc.board.model.dao;

import com.project.npnc.board.model.dto.BoardCategoryDto;

import java.util.List;

public interface BoardCategoryDao {

    List<BoardCategoryDto> selectAllCategories();

    BoardCategoryDto selectCategoryById(int categoryKey);

    void insertCategory(BoardCategoryDto categoryDto);

    void updateCategory(BoardCategoryDto categoryDto);

    void deleteCategory(int categoryKey);
}
