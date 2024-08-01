package com.project.npnc.chatting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		List<Member> allMembers = service.selectAllMembers();
		
		  List<Integer> roomMemberKeys = roomMembers.stream()
                  .map(Member::getMemberKey)
                  .collect(Collectors.toList());
		
		Gson gson = new Gson();
		model.addAttribute("chatList",gson.toJson(chats));
		model.addAttribute("roomId",roomId);
		model.addAttribute("countRoomMember",countRoomMember);
		model.addAttribute("roomMembers", gson.toJson(roomMembers));
		model.addAttribute("allMembers",allMembers);
		model.addAttribute("roomMemberKeys",roomMemberKeys);
		
		
		

		return "chatting/chat";
	}
//	@GetMapping("/")
//	public String index() {
//		return "index";
//	}

	@GetMapping("chatRoom")
	public String chatRoom(Model model,HttpSession session) {
		

		Member member = getCurrentUser();
        
        
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

    private Member getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return (Member) authentication.getPrincipal();
    }
	
}