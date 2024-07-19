package com.project.npnc.mypage.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;


import com.project.npnc.mypage.service.MemberService;
import com.project.npnc.security.dto.Member;



@Controller
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;
    private final JavaMailSender mailSender;

    @Autowired
    public MemberController(MemberService memberService, JavaMailSender mailSender) {
        this.memberService = memberService;
        this.mailSender = mailSender;
    }

    private String generatedCode;

    @GetMapping("/mypage")
    public String myPage(@AuthenticationPrincipal Member currentMember, Model model) {
        Member member = memberService.getMemberById(currentMember.getMemberId());
        model.addAttribute("member", member);
        return "mypage/Mypage";
    }

    @PostMapping("/sendPasswordResetEmail")
    @ResponseBody
    public Map<String, Object> sendPasswordResetEmail(@RequestBody Map<String, String> request) {
        String email = request.get("email");
        generatedCode = generateRandomCode();

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject("비밀번호 변경을 위한 인증 코드");
        message.setText("인증 코드: " + generatedCode);
        message.setFrom("heajung2665@naver.com");
        Map<String, Object> response = new HashMap<>();
        try {
            mailSender.send(message);
            response.put("success", true);
        } catch (Exception e) {
        	System.out.println(e);
            response.put("success", false);
        }
        return response;
    }

    @PostMapping("/verifyCode")
    @ResponseBody
    public Map<String, Object> verifyCode(@RequestBody Map<String, String> request) {
        String code = request.get("code");
        Map<String, Object> response = new HashMap<>();
        if (code.equals(generatedCode)) {
            response.put("success", true);
        } else {
            response.put("success", false);
        }
        return response;
    }

    @PostMapping("/changePassword")
    @ResponseBody
    public Map<String, Object> changePassword(@RequestBody Map<String, String> request) {
        String email = request.get("email");
        String newPassword = request.get("newPassword");

        Member member = memberService.getMemberByEmail(email);
        Map<String, Object> response = new HashMap<>();
        if (member != null) {
            memberService.changePassword(member.getMemberId(), newPassword);
            response.put("success", true);
        } else {
            response.put("success", false);
        }
        return response;
    }

    private String generateRandomCode() {
        // 6자리 랜덤 코드 생성
        return String.format("%06d", new Random().nextInt(999999));
    }
}