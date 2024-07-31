package com.project.npnc.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.npnc.board.model.dto.BoardCommentDto;
import com.project.npnc.board.model.dto.BoardDto;
import com.project.npnc.board.model.dto.BoardFileDto;
import com.project.npnc.board.model.service.BoardService;

import jakarta.servlet.http.HttpSession;

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
    
    @PostMapping("/new")
    public String createBoard(BoardDto boardDto, @RequestParam("upFile") MultipartFile[] files,
    		HttpSession session, @RequestParam("MEMBER_KEY") String memberKeyStr) {
        // boardDto의 MEMBER_KEY가 숫자인지 확인
        try {
            int memberKey = Integer.parseInt(memberKeyStr);
            boardDto.setMEMBER_KEY(memberKey);
        } catch (NumberFormatException e) {
            return "error"; // 또는 다른 오류 페이지로 리다이렉트
        }
        String path=session.getServletContext().getRealPath("/resources/hj/");
        File dir=new File(path);
        if(!dir.exists()) dir.mkdirs();
        
        List<BoardFileDto> fileList = new ArrayList<>();
        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
            	String renameFile=UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
            	try {
            		file.transferTo(new File(path,renameFile));
            		BoardFileDto fileDto = BoardFileDto.builder()
            				.BOARD_FILE_ORI(file.getOriginalFilename())
            				.BOARD_FILE_POST(renameFile)
            				.build();
            		
            		fileList.add(fileDto);
            	}catch(IOException e) {
            		e.printStackTrace();
            	}
            }
        }
        System.out.println(fileList);
        boardService.createBoard(boardDto, fileList);
        return "redirect:/board/list";
    }

    @GetMapping("/detail/boardKey")
    public String getBoardById(int boardKey, Model model) {
        BoardDto board = boardService.getBoardById(boardKey);
        List<BoardFileDto> fileList = boardService.getFilesByBoardId(boardKey);
        
        model.addAttribute("board", board);
        model.addAttribute("fileList", fileList); // 첨부파일 목록 추가
        
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
