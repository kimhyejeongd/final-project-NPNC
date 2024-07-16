package com.project.npnc.mypage.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.project.npnc.mypage.service.MemberService;
import com.project.npnc.security.dto.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
    private final MemberService memberService;

    @GetMapping("/mypage")
    public String myPage(@AuthenticationPrincipal Member currentMember, Model model) {
        Member member = memberService.getMemberById(currentMember.getMemberId());
        model.addAttribute("member", member);
        return "mypage/Mypage";
    }

    @GetMapping("/updateProfileImage")
    public String updateProfileImage(@AuthenticationPrincipal Member currentMember, 
                                     @RequestParam("profileImage") MultipartFile file) {
        memberService.updateProfileImage(currentMember.getMemberId(), file);
        return "redirect:/member/mypage";
    }
} 