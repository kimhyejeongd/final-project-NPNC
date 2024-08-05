package com.project.npnc.mypage.controller;

import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.messaging.MessagingException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.npnc.mypage.service.MemberService;
import com.project.npnc.security.dto.Member;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;



@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
	
    @Value("${file.upload-dir}")
    private String uploadDir;

    private final MemberService memberService;
    private final JavaMailSender mailSender;
    private String generatedCode;
    private final BCryptPasswordEncoder pwencoder;

	/*
	 * @Autowired public MemberController(MemberService memberService,
	 * JavaMailSender mailSender) { this.memberService = memberService;
	 * this.mailSender = mailSender; }
	 */
    
    @GetMapping("/mypage")
    public String mypage(Model m) {
    	Member loginMember=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	m.addAttribute("member",memberService.getMemberById(loginMember.getMemberId()));
    	return "mypage/Mypage";
    }
    
    @PostMapping("/sendPasswordResetEmail")
    @ResponseBody
    	
    public Map<String, Object> sendPasswordResetEmail(@RequestBody Map<String, String> request) throws MessagingException {
		 String email = request.get("email"); // MAP  json방식으로 key email인거 
        generatedCode = generateRandomCode();
        System.out.println("ddd");
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
	        helper.setTo("heajung2665@naver.com"); // 이 값 null 
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
        String encodePw=pwencoder.encode(newPassword);
        Member member = memberService.getMemberByEmail(email);
        Map<String, Object> response = new HashMap<>();
        if (member != null) {
            memberService.changePassword(member.getMemberId(), encodePw);
            response.put("success", true);
        } else {
            response.put("success", false);
        }
        return response;
    }

    private String generateRandomCode() {
        return String.format("%06d", new Random().nextInt(999999));
    }
    
    @PostMapping("/updateProfileImage")
    public ResponseEntity<Map<String, String>> updateProfileImage(@RequestParam("profileImage") MultipartFile file) {
        Member loginMember = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Map<String, String> response = new HashMap<>();
        try {
            memberService.updateProfileImage(loginMember.getMemberId(), file);
            String newImageUrl = "/member/profileImage/" + loginMember.getMemberId();
            response.put("newImageUrl", newImageUrl);
            response.put("message", "Profile image updated successfully.");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("error", "Failed to update profile image.");
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

    @GetMapping("/profileImage/{memberId}")
    @ResponseBody
    public ResponseEntity<Resource> getProfileImage(@PathVariable String memberId) {
        try {
            String fileName = memberService.getProfileImageFileName(memberId);
            Path filePath = Paths.get(uploadDir).resolve(fileName).normalize();
            Resource resource = new UrlResource(filePath.toUri());
            return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(resource);
        } catch (MalformedURLException e) {
            return ResponseEntity.notFound().build();
        }
    }

    
    @PostMapping("/updateAddress")
    public @ResponseBody Map<String, Object> updateAddress(
        @RequestParam("roadAddress") String roadAddress,
        @RequestParam("detailedAddress") String detailedAddress,
        @RequestParam("postcode") String postcode,
        HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember != null) {
            memberService.updateAddress(loginMember.getMemberId(),roadAddress, detailedAddress,postcode);
            response.put("success", true);
            response.put("updatedAddress", roadAddress + " " + detailedAddress+" "+postcode);
        } else {
            response.put("success", false);	
            response.put("error", "User not logged in.");
        }
        return response;
    }


}