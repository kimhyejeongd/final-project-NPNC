package com.project.npnc.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.npnc.board.model.dto.BoardCommentDto;
import com.project.npnc.board.model.dto.BoardDto;
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
    // 댓글 추가
    @PostMapping("/addComment")
    public String addComment(BoardCommentDto commentDto) {
        boardService.createComment(commentDto);
        return "redirect:/board/detail?boardKey=" + commentDto.getBOARD_KEY();
    }

    // 댓글 수정
    @PostMapping("/updateComment")
    public String updateComment(BoardCommentDto commentDto) {
        boardService.updateComment(commentDto);
        return "redirect:/board/detail?boardKey=" + commentDto.getBOARD_KEY();
    }

    // 댓글 삭제
    @PostMapping("/deleteComment")
    public String deleteComment(@RequestParam("commentKey") int commentKey, @RequestParam("boardKey") int boardKey) {
        boardService.deleteComment(commentKey);
        return "redirect:/board/detail?boardKey=" + boardKey;
    }



    
    
}
