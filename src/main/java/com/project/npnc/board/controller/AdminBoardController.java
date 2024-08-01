package com.project.npnc.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.npnc.board.model.dto.BoardCommentDto;
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
    public String getAllBoards(@RequestParam(value = "searchKeyword", required = false) String searchKeyword, Model model) {
        List<BoardDto> boards;
        if (searchKeyword != null && !searchKeyword.isEmpty()) {
            boards = boardService.searchBoardsByTitle(searchKeyword);
        } else {
            boards = boardService.getAllBoards();
        }
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
    // 게시물 상세 페이지
    @GetMapping("/detail/{boardKey}")
    public String showBoardDetail(@PathVariable("boardKey") int boardKey, Model model) {
        BoardDto board = boardService.getBoardById(boardKey);
        List<BoardCommentDto> comments = boardService.getCommentsByBoardId(boardKey);
        Map<Integer, List<BoardCommentDto>> commentRepliesMap = getCommentRepliesMap(boardKey);

        model.addAttribute("boardDto", board);
        model.addAttribute("comments", comments);
        model.addAttribute("commentRepliesMap", commentRepliesMap);

        return "board/adminBoardDetail"; // 상세 페이지 JSP
    }
    // 댓글 삭제
    @PostMapping("/deleteComment/{commentKey}")
    public String deleteComment(@PathVariable("commentKey") int commentKey, @RequestParam("boardKey") int boardKey) {
        boardService.deleteComment(commentKey);
        return "redirect:/admin/board/detail/" + boardKey; // 삭제 후 게시물 상세보기 페이지로 리다이렉트
    }

    // 대댓글 삭제
    @PostMapping("/deleteReply/{commentKey}")
    public String deleteReply(@PathVariable("commentKey") int commentKey, @RequestParam("boardKey") int boardKey) {
        boardService.deleteComment(commentKey);
        return "redirect:/admin/board/detail/" + boardKey; // 삭제 후 게시물 상세보기 페이지로 리다이렉트
    }

    // 게시물의 댓글과 대댓글을 맵으로 반환
    private Map<Integer, List<BoardCommentDto>> getCommentRepliesMap(int boardKey) {
        List<BoardCommentDto> comments = boardService.getCommentsByBoardId(boardKey);
        Map<Integer, List<BoardCommentDto>> commentRepliesMap = new HashMap<>();
        for (BoardCommentDto comment : comments) {
            List<BoardCommentDto> replies = boardService.getRepliesByCommentId(comment.getBOARD_COMMENT_KEY());
            commentRepliesMap.put(comment.getBOARD_COMMENT_KEY(), replies);
        }
        return commentRepliesMap;
    }
}