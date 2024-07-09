package com.project.npnc.chatting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.google.gson.Gson;
import com.project.npnc.admin.member.model.dto.AdminMember;
import com.project.npnc.chatting.model.dto.ChattingMessage;
import com.project.npnc.chatting.model.dto.ChattingRoom;
import com.project.npnc.chatting.model.service.ChatService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class HomeController {
	private final ChatService service;
	
	@PostMapping("/chat")
	public String chat(
			Model model,
			@RequestParam(required = false) List<String> memberNo,
			HttpSession session,
			@RequestParam(required = false) Integer roomId
			) {
		if(memberNo!=null) {
			model.addAttribute("roomId",roomId);
		}
		
		if(roomId==null) {
			Map<String, Object> param = new HashMap<>();
			param.put("memberNos", memberNo);
			param.put("memberSize", memberNo.size());
			roomId = service.selectRoomId(param);
		}
		AdminMember loginMember = (AdminMember)session.getAttribute("loginMember");
		System.out.println("HomeController Chat");
		
		int loginMemberKey = loginMember.getMemberKey();
		
		int countRoomMember = service.countRoomMember(roomId);
		Map<String, Object> readInfo = new HashMap<>();
		readInfo.put("loginMemberKey", loginMemberKey);
		readInfo.put("roomId", roomId);
		List<ChattingMessage> chats = service.selectRoomChatList(readInfo);
		Gson gson = new Gson();
		model.addAttribute("chatList",gson.toJson(chats));
		model.addAttribute("roomId",roomId);
		model.addAttribute("countRoomMember",countRoomMember);

		return "chatting/chat";
	}
//	@GetMapping("/")
//	public String index() {
//		return "index";
//	}

	@GetMapping("chatRoom")
	public String chatRoom(Model model,HttpSession session,@RequestParam String inputValue) {
		
		AdminMember member = service.selectMemberById(inputValue);
        session.setAttribute("loginMember", member); 
		Map<Integer,List<AdminMember>>myRoomMemberList = service.selectMyRoomMemberList(member.getMemberKey());
//		model.addAttribute("roomId",roomId);
		List<ChattingRoom> mychatRoomList = service.selectMyChatRoomList(member.getMemberKey());
		
		model.addAttribute("myRoomMemberList",myRoomMemberList);
		model.addAttribute("mychatRoomList",mychatRoomList);
		List<AdminMember>members = service.selectAllMembers();	
		model.addAttribute("members",members);
		
		return "chatting/chatRoom";
	}
	
	 

		


    @PostMapping("/login")
    public String login(@RequestParam("memberKey") String memberKey, HttpSession session) {
		AdminMember loginMember = service.selectMemberById(memberKey);
        session.setAttribute("loginMember", loginMember);
        
        return "redirect:/"; // 로그인 후 리다이렉트할 페이지
    }

    @PostMapping("/logout")
    public String logout(SessionStatus sessionStatus) {
        sessionStatus.setComplete(); // 세션에서 사용자 정보 제거
        return "redirect:/"; // 로그아웃 후 리다이렉트할 페이지
    }

	
}