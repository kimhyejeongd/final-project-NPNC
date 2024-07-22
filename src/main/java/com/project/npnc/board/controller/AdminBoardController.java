package com.project.npnc.board.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String getAdminBoardList(Model model) {
        List<BoardDto> boards = boardService.getAllBoards();
        model.addAttribute("boardList", boards);
        return "board/adminBoardList"; // 수정된 뷰 이름
    }

    @GetMapping("/edit/{boardKey}")
    public String showEditBoardForm(@PathVariable("boardKey") int boardKey, Model model) {
        BoardDto board = boardService.getBoardById(boardKey);
        model.addAttribute("board", board);
        return "board/editBoard"; // 수정된 뷰 이름
    }

    @PostMapping("/update")
    public String updateBoard(BoardDto boardDto) {
        boardService.updateBoard(boardDto);
        return "redirect:/admin/board/list";
    }

    @PostMapping("/delete/{boardKey}")
    public String deleteBoard(@PathVariable("boardKey") int boardKey) {
        boardService.deleteBoard(boardKey);
        return "redirect:/admin/board/list";
    }

    @GetMapping("/create")
    public String showCreateBoardForm(Model model) {
        model.addAttribute("boardDto", new BoardDto());
        return "board/createBoard"; // 수정된 뷰 이름
    }
}
