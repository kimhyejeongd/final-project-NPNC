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
        return "board/boardList"; // 뷰 이름 반환 (JSP 파일명)
    }

    @GetMapping("/write")
    public String showWriteBoardForm(Model model) {
        model.addAttribute("boardDto", new BoardDto()); // 빈 BoardDto를 모델에 추가
        return "board/writeBoard"; // 뷰 이름 반환 (JSP 파일명)
    }

    @PostMapping("/new")
    public String createBoard(@ModelAttribute("boardDto") BoardDto boardDto, @RequestParam("upFile") MultipartFile file) {
        // 파일이 존재하면 처리
        if (!file.isEmpty()) {
            try {
                // 파일을 서버에 저장할 경로를 설정
                String uploadDir = "path/to/upload/dir"; // 실제 경로로 변경 필요
                File uploadFile = new File(uploadDir, file.getOriginalFilename());
                file.transferTo(uploadFile);

                // BoardFileDto 객체 생성 및 파일 정보 설정
                BoardFileDto boardFileDto = new BoardFileDto();
                boardFileDto.setBOARD_KEY(boardDto.getBOARD_KEY()); // 게시물 키는 게시물 저장 후 설정되어야 함
                boardFileDto.setBOARD_FILE_FILE_ORI(file.getOriginalFilename());
                boardFileDto.setBOARD_FILE_FILE_POST(uploadFile.getAbsolutePath());

                // 게시물과 파일 정보 저장
                boardService.createBoard(boardDto, List.of(boardFileDto));
            } catch (IOException e) {
                e.printStackTrace();
                // 파일 저장 실패 처리
            }
        } else {
            boardService.createBoard(boardDto, List.of()); // 파일이 없는 경우
        }
        return "redirect:/board/list"; // 리다이렉트
    }

    @GetMapping("/boardKey")
    public String getBoardById(int boardKey, Model model) {
        BoardDto board = boardService.getBoardById(boardKey);
        model.addAttribute("board", board);
        return "board/boardDetail"; // 뷰 이름 반환 (JSP 파일명)
    }
}
