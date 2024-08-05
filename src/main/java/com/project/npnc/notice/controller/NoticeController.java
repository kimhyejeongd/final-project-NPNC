package com.project.npnc.notice.controller;

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

import com.project.npnc.notice.model.dto.NoticeDto;
import com.project.npnc.notice.model.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    private final NoticeService noticeService;

    @Autowired
    public NoticeController(NoticeService noticeService) {
        this.noticeService = noticeService;
    }
    @GetMapping("/list")
    public String listNotices(@RequestParam(value = "searchKeyword", required = false, defaultValue = "") String searchKeyword, Model model) {
        List<NoticeDto> noticeList = noticeService.searchNoticesByTitle(searchKeyword);
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("searchKeyword", searchKeyword);
        return "notice/noticeList"; // 이 뷰가 실제로 있는지 확인하세요
    }
    // 공지사항 상세 보기
    @GetMapping("/detail")
    public String viewNoticeDetail(@RequestParam("noticeKey") int noticeKey, Model model) {
        NoticeDto notice = noticeService.getNoticeById(noticeKey);
        if (notice != null) {
            model.addAttribute("notice", notice);
            return "notice/notice_detail";  // JSP 파일 경로
        } else {
            return "redirect:/notice/list"; // 공지사항을 찾을 수 없을 때
        }
    }


}
