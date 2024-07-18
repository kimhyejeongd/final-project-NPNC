package com.project.npnc.chatting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.google.gson.Gson;
import com.project.npnc.chatting.model.dto.ChattingMessage;
import com.project.npnc.chatting.model.dto.ChattingRoom;
import com.project.npnc.chatting.model.service.ChatService;
import com.project.npnc.security.dto.Member;

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
			HttpSession session,
			@RequestParam(required = false) List<String> memberNo,
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
		Member loginMember =getCurrentUser();
		
		int loginMemberKey = loginMember.getMemberKey();
		
		int countRoomMember = service.countRoomMember(roomId);
		List<Member>roomMembers = service.selectMyRoomMembers(roomId);
		Map<String, Object> readInfo = new HashMap<>();
		readInfo.put("loginMemberKey", loginMemberKey);
		readInfo.put("roomId", roomId);
		List<ChattingMessage> chats = service.selectRoomChatList(readInfo);
		

		
		Gson gson = new Gson();
		model.addAttribute("chatList",gson.toJson(chats));
		model.addAttribute("roomId",roomId);
		model.addAttribute("countRoomMember",countRoomMember);
		model.addAttribute("roomMembers", gson.toJson(roomMembers));
		model.addAttribute("allMembers",service.selectAllMembers());
		
		

		return "chatting/chat";
	}
//	@GetMapping("/")
//	public String index() {
//		return "index";
//	}

	@GetMapping("chatRoom")
	public String chatRoom(Model model,HttpSession session,@RequestParam String inputValue) {
		
//        임시 로그인
		Member member = getCurrentUser();
        session.setAttribute("loginMember", member); 

        
        
		Map<Integer,List<Member>>myRoomMemberList = service.selectMyRoomMemberList(member.getMemberKey());
//		model.addAttribute("roomId",roomId);
		List<ChattingRoom> mychatRoomList = service.selectMyChatRoomList(member.getMemberKey());
		
		Gson gson = new Gson();
		model.addAttribute("myRoomMemberList",myRoomMemberList);
		model.addAttribute("mychatRoomListJ",gson.toJson(mychatRoomList));
		model.addAttribute("mychatRoomList",mychatRoomList);
		List<Member>members = service.selectAllMembers();	
		model.addAttribute("members",members);
		
		

		return "chatting/chatRoom";
	}
	
	 

		


    @PostMapping("/login")
    public String login(@RequestParam("memberKey") String memberKey, HttpSession session) {
		Member loginMember = service.selectMemberById(memberKey);
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