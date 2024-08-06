package com.project.npnc.admin.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
    // 공지사항 상세 보기
    @GetMapping("/detail")
    public String viewNoticeDetail(@RequestParam("noticeKey") int noticeKey, Model model) {
        NoticeDto notice = noticeService.getNoticeById(noticeKey);
        if (notice != null) {
            model.addAttribute("notice", notice);
            return "notice/admin_notice_detail";  // JSP 파일 경로
        } else {
            return "redirect:/admin/notice"; // 공지사항을 찾을 수 없을 때
        }
    }
    // 공지사항 수정 폼 보기
    @GetMapping("/edit1/{id}")
    public String editNoticeForm(@PathVariable int id, Model model) {
        NoticeDto notice = noticeService.getNoticeById(id);
        if (notice != null) {
            model.addAttribute("notice", notice);
            return "notice/edit_notice"; // JSP 파일 경로
        } else {
            return "redirect:/admin/notice"; // 공지사항을 찾을 수 없을 때
        }
    }
    // 공지사항 수정 처리
    @GetMapping("/edit/{id}")
    public String updateNotice(@PathVariable int id, @ModelAttribute NoticeDto notice) {
        notice.setNoticeKey(id);
        noticeService.updateNotice(notice);
        return "redirect:/admin/notice"; // 수정 후 목록으로 리다이렉트
    }
    
    // 공지사항 삭제
    @GetMapping("/delete/{id}")
    public String deleteNotice(@PathVariable int id) {
        noticeService.deleteNotice(id);
        return "redirect:/admin/notice"; // 삭제 후 목록으로 리다이렉트
    }
    // 공지사항 작성 처리
    @GetMapping("/create")
    public String createNotice() {
	
        return "notice/create_notice"; // 생성 후 목록으로 리다이렉트
    }
    @PostMapping("/create1")
    public String createNotice1(@ModelAttribute NoticeDto notice) {
    	 noticeService.createNotice(notice); 
    	return "redirect:/admin/notice"; // 생성 후 목록으로 리다이렉트
    }
    
}
