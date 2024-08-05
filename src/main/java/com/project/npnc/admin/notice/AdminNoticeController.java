package com.project.npnc.admin.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.npnc.notice.model.dto.NoticeDto;
import com.project.npnc.notice.model.service.NoticeService;
import com.project.npnc.security.dto.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminNoticeController {
    private final NoticeService noticeService;
    
 
    // 관리자 페이지 - 공지사항 목록
    @GetMapping("/notice")
    public String listNoticesAdmin(Authentication authentication,Model model) {
		Member loginMem=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("loginMember",loginMem);
        List<NoticeDto> noticeList = noticeService.getAllNotices();
        model.addAttribute("noticeList", noticeList);
        return "notice/admin_notice_list";  // 관리자 페이지 JSP 파일 경로
    }
}
