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

import com.google.gson.Gson;
import com.project.npnc.chatting.model.dto.ChattingMessage;
import com.project.npnc.chatting.model.service.ChatService;
import com.project.npnc.member.model.dto.Member;

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
		Member loginMember = (Member)session.getAttribute("loginMember");
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
	@GetMapping("/")
	public String index() {
		return "index";
	}

	@GetMapping("chatRoom")
	public String chatRoom(Model model,HttpSession session,@RequestParam String inputValue) {
		
		Member member = service.selectMemberById(inputValue);
        session.setAttribute("loginMember", member); 
		Map<Integer,List<Member>>roomList = service.selectMyRoomList(member.getMemberKey());
//		model.addAttribute("roomId",roomId);
		model.addAttribute("roomList",roomList);
		List<Member>members = service.selectAllMembers();	
		model.addAttribute("members",members);
		
		return "chatting/chatRoom";
	}
	@PostMapping("loadRecentChat")
	@ResponseBody
	public List<ChattingMessage> loadChat(@RequestParam int chatRoomKey) {
		Map<String, Object> readInfo = new HashMap<>();
		readInfo.put("roomId", chatRoomKey);
	    List<ChattingMessage> chats = service.selectRoomChatList(readInfo);
	    System.out.println("=====");
	    for(ChattingMessage c : chats) {
	    	System.out.println(c);
	    }
	    return chats;
	}
//	@PostMapping("/updateReadStatus")
//    @ResponseBody
//    public ResponseEntity<?> updateReadStatus(@RequestParam int chatId, @RequestParam int memberNo) {
//        try {
//            service.updateReadStatus(chatId, memberNo);
//            return ResponseEntity.ok("Read status updated successfully.");
//        } catch (Exception e) {
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error updating read status.");
//        }
//    }


	
}