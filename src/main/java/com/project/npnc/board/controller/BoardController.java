package com.project.npnc.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.npnc.board.model.dto.BoardDto;
import com.project.npnc.board.model.dto.BoardFileDto;
import com.project.npnc.board.model.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;

    @Autowired
    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @GetMapping("/list")
    public String getAllBoards(Model model) {
        List<BoardDto> boards = boardService.getAllBoards();
        model.addAttribute("boardList", boards);
        return "board/boardList";
    }

    @GetMapping("/notices")
    public String getNotices(Model model) {
        List<BoardDto> notices = boardService.getNotices();
        model.addAttribute("boardList", notices);
        return "board/noticeList";
    }

    @GetMapping("/write")
    public String showWriteBoardForm(Model model) {
        model.addAttribute("boardDto", new BoardDto()); // 빈 BoardDto를 모델에 추가
        return "board/writeBoard"; // 게시물 작성 뷰 반환
    }
    

    @GetMapping("/detail/boardKey")
    public String getBoardById(int boardKey, Model model) {
        BoardDto board = boardService.getBoardById(boardKey);
        model.addAttribute("board", board);
        return "board/boardDetail";
    }
    
    
}
