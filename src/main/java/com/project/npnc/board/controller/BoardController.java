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
import org.springframework.web.bind.annotation.RequestParam;

import com.project.npnc.board.model.dto.BoardCategoryDto;
import com.project.npnc.board.model.dto.BoardCommentDto;
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
        System.out.println(boards);
        return "board/boardList"; // 뷰 이름 반환 (JSP 파일명)
    }

    @GetMapping("/{boardKey}")
    public String getBoardById(@PathVariable("boardKey") int boardKey, Model model) {
        BoardDto board = boardService.getBoardById(boardKey);
        model.addAttribute("board", board);
        List<BoardCommentDto> comments = boardService.getCommentsByBoardId(boardKey);
        model.addAttribute("comments", comments);
        return "board/detail"; // 뷰 이름 반환 (JSP 파일명)
    }

    @PostMapping("/new")
    public String createBoard(@ModelAttribute("boardDto") BoardDto boardDto,
                              @RequestParam(value = "fileList", required = false) List<BoardFileDto> fileList) {
        boardService.createBoard(boardDto, fileList);
        return "redirect:/board/list"; // 리다이렉트
    }

    @PostMapping("/{boardKey}/update")
    public String updateBoard(@PathVariable("boardKey") int boardKey,
                              @ModelAttribute("boardDto") BoardDto boardDto) {
        boardDto.setBOARD_KEY(boardKey); // 경로 변수로부터 boardKey 설정
        boardService.updateBoard(boardDto);
        return "redirect:/board/" + boardKey; // 수정된 게시글 상세 페이지로 리다이렉트
    }

    @PostMapping("/{boardKey}/delete")
    public String deleteBoard(@PathVariable("boardKey") int boardKey) {
        boardService.deleteBoard(boardKey);
        return "redirect:/board/list"; // 리다이렉트
    }

    @GetMapping("/{boardKey}/comments")
    public String getCommentsByBoardId(@PathVariable("boardKey") int boardKey, Model model) {
        List<BoardCommentDto> comments = boardService.getCommentsByBoardId(boardKey);
        model.addAttribute("comments", comments);
        return "board/comments"; // 뷰 이름 반환 (JSP 파일명)
    }

    @PostMapping("/{boardKey}/comments/new")
    public String createComment(@PathVariable("boardKey") int boardKey,
                                @ModelAttribute("commentDto") BoardCommentDto commentDto) {
        commentDto.setBOARD_KEY(boardKey); // 경로 변수로부터 boardKey 설정
        boardService.createComment(commentDto);
        return "redirect:/board/" + boardKey; // 댓글 작성 후 해당 게시글 상세 페이지로 리다이렉트
    }

    @PostMapping("/{boardKey}/comments/{commentKey}/update")
    public String updateComment(@PathVariable("boardKey") int boardKey,
                                @PathVariable("commentKey") int commentKey,
                                @ModelAttribute("commentDto") BoardCommentDto commentDto) {
        commentDto.setBOARD_KEY(boardKey); // 경로 변수로부터 boardKey 설정
        commentDto.setBOARD_COMMENT_KEY(commentKey); // 경로 변수로부터 commentKey 설정
        boardService.updateComment(commentDto);
        return "redirect:/board/" + boardKey; // 댓글 수정 후 해당 게시글 상세 페이지로 리다이렉트
    }

    @PostMapping("/{boardKey}/comments/{commentKey}/delete")
    public String deleteComment(@PathVariable("commentKey") int commentKey) {
        boardService.deleteComment(commentKey);
        // 댓글 삭제 후 해당 게시글 상세 페이지로 리다이렉트
        // 이 예시에서는 댓글 삭제 후 게시글 상세 페이지로 돌아가도록 구현하지 않았음
        return "redirect:/board/list"; // 임시로 게시판 리스트 페이지로 리다이렉트
    }

    @ModelAttribute("boardDto")
    public BoardDto boardDto() {
        return new BoardDto();
    }

    @ModelAttribute("commentDto")
    public BoardCommentDto commentDto() {
        return new BoardCommentDto();
    }

    @ModelAttribute("categories")
    public List<BoardCategoryDto> categories() {
        return boardService.getAllCategories();
    }
}