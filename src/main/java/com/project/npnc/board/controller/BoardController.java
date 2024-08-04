package com.project.npnc.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.project.npnc.board.model.dto.BoardCommentDto;
import com.project.npnc.board.model.dto.BoardDto;
import com.project.npnc.board.model.dto.BoardFileDto;
import com.project.npnc.board.model.service.BoardService;
import com.project.npnc.security.dto.Member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
    public String getAllBoards(@RequestParam(value = "searchKeyword", required = false) String searchKeyword, Model model) {
        List<BoardDto> boards;
        if (searchKeyword != null && !searchKeyword.isEmpty()) {
            boards = boardService.searchBoardsByTitle(searchKeyword);
        } else {
            boards = boardService.getAllBoards();
        }
        model.addAttribute("boardList", boards);
        return "board/boardList";
    }
    
    @GetMapping("/loadMore")
    public void loadMoreBoards(@RequestParam("page") int page, HttpServletResponse response) throws IOException {
        int pageSize = 10; // 한 페이지당 데이터 개수
        List<BoardDto> boards = boardService.getBoardsWithPagination(page, pageSize);
        
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        Gson gson = new Gson();
        String json = gson.toJson(Collections.singletonMap("data", boards));
        out.print(json);
        out.flush();
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
        List<BoardCommentDto> comments = boardService.getCommentsByBoardId(boardKey);

        // 댓글에 대한 대댓글을 추가하기 위해 댓글과 대댓글을 맵에 저장
        Map<Integer, List<BoardCommentDto>> commentRepliesMap = new HashMap<>();
        for (BoardCommentDto comment : comments) {
            List<BoardCommentDto> replies = boardService.getRepliesByCommentId(comment.getBOARD_COMMENT_KEY());
            commentRepliesMap.put(comment.getBOARD_COMMENT_KEY(), replies);
        }

        model.addAttribute("board", board);
        model.addAttribute("comments", comments);
        model.addAttribute("commentRepliesMap", commentRepliesMap);        
        model.addAttribute("fileList", fileList); // 첨부파일 목록 추가
        System.out.println("ㅎㅇ");
        return "board/boardDetail";
    }
    
    
    @PostMapping("/addComment")
    public String addComment(BoardCommentDto commentDto, HttpSession session, Authentication authentication) {
        Member member = (Member) authentication.getPrincipal();
        commentDto.setMEMBER_KEY(member.getMemberKey());
        commentDto.setBOARD_COMMENT_LEVEL(0); // 기본 댓글 레벨 설정
        boardService.createComment(commentDto);
        return "redirect:/board/detail/boardKey?boardKey=" + commentDto.getBOARD_KEY();
    }

    // 댓글 수정
    @PostMapping("/updateComment")
    public String updateComment(BoardCommentDto commentDto, HttpSession session,Authentication authentication) {
    	Member member=(Member)authentication.getPrincipal();
        BoardCommentDto existingComment = boardService.getCommentById(commentDto.getBOARD_COMMENT_KEY());
        if (existingComment.getMEMBER_KEY() == member.getMemberKey()) {
            boardService.updateComment(commentDto);
        }
        return "redirect:/board/detail/boardKey?boardKey=" + commentDto.getBOARD_KEY();
    }

    // 댓글 삭제
    @PostMapping("/deleteComment")
    public String deleteComment(@RequestParam("commentKey") int commentKey, @RequestParam("boardKey") int boardKey, HttpSession session,Authentication authentication) {
    	Member member=(Member)authentication.getPrincipal();
        BoardCommentDto existingComment = boardService.getCommentById(commentKey);
        if (existingComment.getMEMBER_KEY() == member.getMemberKey()) {
            boardService.deleteComment(commentKey);
        }
        return "redirect:/board/detail/boardKey?boardKey=" + boardKey;
    }

    // 대댓글 추가
    @PostMapping("/addReply")
    public String addReply(BoardCommentDto commentDto, HttpSession session, Authentication authentication) {
        Member member = (Member) authentication.getPrincipal();
        commentDto.setMEMBER_KEY(member.getMemberKey());
        commentDto.setBOARD_COMMENT_LEVEL(1); // 대댓글 레벨 설정
        boardService.createComment(commentDto);
        return "redirect:/board/detail/boardKey?boardKey=" + commentDto.getBOARD_KEY();
    }
}