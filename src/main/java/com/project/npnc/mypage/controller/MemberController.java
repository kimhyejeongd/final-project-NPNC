package com.project.npnc.mypage.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.messaging.MessagingException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.npnc.mypage.service.MemberService;
import com.project.npnc.security.dto.Member;

import jakarta.mail.internet.MimeMessage;



@Controller
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;
    private final JavaMailSender mailSender;
    private String generatedCode;

    @Autowired
    public MemberController(MemberService memberService, JavaMailSender mailSender) {
        this.memberService = memberService;
        this.mailSender = mailSender;
    }
    
    @GetMapping("/mypage")
    public String mypage(Model m) {
    	Member loginMember=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	m.addAttribute("member",memberService.getMemberById(loginMember.getMemberId()));
    	return "mypage/Mypage";
    }
    
    @PostMapping("/sendPasswordResetEmail")
    @ResponseBody
    public Map<String, Object> sendPasswordResetEmail(@RequestBody Map<String, String> request) throws MessagingException {
        String email = request.get("email");
        generatedCode = generateRandomCode();

//        // HTML 이메일 내용 생성
//        Context context = new Context();
//        context.setVariable("code", generatedCode);
        //String htmlContent = templateEngine.process("password_reset_email", context);
       String htmlContent="""
	       	<style>
		        .email-container {
		            font-family: Arial, sans-serif;
		            max-width: 600px;
		            margin: 0 auto;
		            padding: 20px;
		            border: 1px solid #ddd;
		            border-radius: 5px;
		            background-color: #f9f9f9;
		        }
		
		        .email-header {
		            text-align: center;
		            margin-bottom: 20px;
		        }
	        </style>

      
       		 <div class="email-container">
		        <div class="email-header">
		            <h2>Password Reset</h2>
		        </div>
		        <div class="email-body">
		            <p>Hello,</p>
		            <p>We received a request to reset your password. Use the code below to reset it.</p>
		            <h3>%s</h3>
		            <p>If you did not request a password reset, please ignore this email.</p>
		        </div>
		        <div class="email-footer">
		            <p>&copy; 2024 Your Company. All rights reserved.</p>
		        </div>
		    </div>
       		""".formatted(generatedCode);
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper=null;
        Map<String, Object> response=null;
        try {
	        helper= new MimeMessageHelper(message, true, "UTF-8");
	        response = new HashMap<>();
	        helper.setTo(email);
	        helper.setSubject("비밀번호 변경을 위한 인증 코드");
				helper.setText(htmlContent, true);
	        helper.setFrom("heajung2665@naver.com");
	        mailSender.send(message);
	        response.put("success", true);
        } catch (jakarta.mail.MessagingException e) {
        	// TODO Auto-generated catch block
        	e.printStackTrace();
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
        return String.format("%06d", new Random().nextInt(999999));
    }
}