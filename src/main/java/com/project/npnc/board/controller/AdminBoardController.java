package com.project.npnc.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.npnc.board.model.dto.BoardDto;
import com.project.npnc.board.model.service.BoardService;

@Controller
@RequestMapping("/admin/board")
public class AdminBoardController {

    private final BoardService boardService;

    @Autowired
    public AdminBoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @GetMapping("/list")
    public String getAllBoards(Model model) {
        List<BoardDto> boards = boardService.getAllBoards();
        model.addAttribute("boardList", boards);
        return "board/adminBoardList";
    }
    
    @PostMapping("/create")
    public String createBoard(BoardDto boardDto) {
        boardService.createBoard(boardDto, List.of());
        return "redirect:/admin/board/list"; // 작성 후 게시물 목록 페이지로 리다이렉트
    }

    @GetMapping("/create")
    public String showCreateBoardForm(Model model) {
        model.addAttribute("boardDto", new BoardDto());
        return "board/createBoard"; // 작성 폼 JSP 페이지
    }
    
    @GetMapping("/edit/{boardKey}")
    public String showEditBoardForm(@PathVariable("boardKey") int boardKey, Model model) {
        BoardDto board = boardService.getBoardById(boardKey);
        model.addAttribute("boardDto", board);
        return "board/adminboardedit"; // 수정 폼 JSP 페이지
    }
    
    @PostMapping("/edit")
    public String editBoard(@ModelAttribute BoardDto boardDto) {
        boardService.updateBoard(boardDto);
        return "redirect:/admin/board/list"; // 수정 후 게시물 목록 페이지로 리다이렉트
    }

    @PostMapping("/delete/{boardKey}")
    public String deleteBoard(@PathVariable("boardKey") int boardKey) {
        boardService.deleteBoard(boardKey);
        return "redirect:/admin/board/list"; // 삭제 후 게시물 목록 페이지로 리다이렉트
    }
}