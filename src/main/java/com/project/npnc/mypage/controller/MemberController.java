package com.project.npnc.mypage.controller;

import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.npnc.mypage.service.MemberService;
import com.project.npnc.security.dto.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
    private final MemberService memberService;

    @Autowired
    private JavaMailSender mailSender;

    private String generatedCode;

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

    @PostMapping("/sendPasswordResetEmail")
    @ResponseBody
    public Map<String, Object> sendPasswordResetEmail(@RequestBody Map<String, String> request) {
        String email = request.get("email");
        generatedCode = String.format("%06d", new Random().nextInt(999999));

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject("비밀번호 변경을 위한 인증 코드");
        message.setText("인증 코드: " + generatedCode);

        try {
            mailSender.send(message);
            return Map.of("success", true);
        } catch (Exception e) {
            return Map.of("success", false);
        }
    }

    @PostMapping("/verifyCode")
    @ResponseBody
    public Map<String, Object> verifyCode(@RequestBody Map<String, String> request) {
        String code = request.get("code");
        if (code.equals(generatedCode)) {
            return Map.of("success", true);
        } else {
            return Map.of("success", false);
        }
    }

    @PostMapping("/changePassword")
    @ResponseBody
    public Map<String, Object> changePassword(@RequestBody Map<String, String> request) {
        String email = request.get("email");
        String newPassword = request.get("newPassword");

        Member member = memberService.getMemberByEmail(email);
        if (member != null) {
            memberService.changePassword(member.getMemberId(), newPassword);
            return Map.of("success", true);
        } else {
            return Map.of("success", false);
        }
    }
}