package com.project.npnc.admin.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.npnc.notice.model.dto.NoticeDto;
import com.project.npnc.notice.model.service.NoticeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminNoticeController {
    private final NoticeService noticeService;
    
 
    // 관리자 페이지 - 공지사항 목록
    @GetMapping("/notice")
    public String listNoticesAdmin(Model model) {
        List<NoticeDto> noticeList = noticeService.getAllNotices();
        model.addAttribute("noticeList", noticeList);
        return "notice/admin_notice_list";  // 관리자 페이지 JSP 파일 경로
    }
}
