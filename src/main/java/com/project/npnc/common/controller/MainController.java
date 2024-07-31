package com.project.npnc.common.controller;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.project.npnc.attendance.model.dto.Attendance;
import com.project.npnc.attendance.model.service.AttendanceService;
import com.project.npnc.calendar.model.dto.Calendar;
import com.project.npnc.calendar.model.service.CalendarService;
import com.project.npnc.chatting.model.dto.ChattingRoom;
import com.project.npnc.chatting.model.service.ChatService;
import com.project.npnc.document.model.service.MemberDocumentService;
import com.project.npnc.security.dto.Member;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MainController {
	private final ChatService chatserv;
	private final AttendanceService attendanceService;	
	private final MemberDocumentService docserv;
	private final CalendarService calservice;
	@GetMapping("/")
    public String home(Model model) {
		Member member = getCurrentUser();
		
		//채팅
		List<ChattingRoom> mychatRoomList = chatserv.selectMyChatRoomList(member.getMemberKey());
		model.addAttribute("mychatRoomList",mychatRoomList);
		System.out.println(mychatRoomList+"========================================");
		System.out.println("========================================");
		Attendance attendCheck=attendanceService.selectAttendanceByMemberKey(member.getMemberKey());
		model.addAttribute("checkStartTime", attendCheck.getAttendanceStart());
		model.addAttribute("checkEndTime", attendCheck.getAttendanceEnd());
		
		//전자문서 위젯
		model.addAttribute("doclist", docserv.selectInprocessDocs(member.getMemberKey()));
		log.debug("{}", model.getAttribute("doclist"));
		model.addAttribute("waitinglist", docserv.selectWaitingDocs(member.getMemberKey()));
		log.debug("{}", model.getAttribute("waitinglist"));
		
		return "index";
    }
	@PostMapping("/homecalendar")
	@ResponseBody
	public List<Calendar> homeCalendar(){
		Member member = getCurrentUser();
		System.out.println(member.getMemberKey());
		
		List<Calendar> homeCal = calservice.selectAllByKey(member.getMemberKey());
		System.out.println(" =====" + homeCal);
		return homeCal;
	}
	
	
	@PostMapping("/login")
    public String login(@RequestParam("memberKey") String memberKey, HttpSession session) {
		Member loginMember = chatserv.selectMemberById(memberKey);
        session.setAttribute("loginMember", loginMember);
        
        return "redirect:/"; // 로그인 후 리다이렉트할 페이지
    }

    @PostMapping("/logout")
    public String logout(SessionStatus sessionStatus) {
        sessionStatus.setComplete(); // 세션에서 사용자 정보 제거
        return "redirect:/"; // 로그아웃 후 리다이렉트할 페이지
    }
	
	private Member getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return (Member) authentication.getPrincipal();
    }
}
