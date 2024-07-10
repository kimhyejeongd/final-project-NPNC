package com.project.npnc.mypage.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.npnc.mypage.service.MemberService;
import com.project.npnc.security.dto.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;

    @GetMapping("/mypage")
    public String myPage(Model model, Authentication authentication) {
        Member member = (Member) authentication.getPrincipal();
        model.addAttribute("member", member);
        return "mypage";
    }

    @PostMapping("/updateProfileImage")
    public String updateProfileImage(@RequestParam("profileImage") MultipartFile file, Authentication authentication) {
        Member member = (Member) authentication.getPrincipal();
        
        if (!file.isEmpty()) {
            try {
                String fileName = member.getMEMBER_ID() + "_" + file.getOriginalFilename();
                String uploadDir = "uploads/profile_images/";
                File uploadFile = new File(uploadDir + fileName);
                
                // 디렉토리가 존재하지 않으면 생성
                if (!uploadFile.getParentFile().exists()) {
                    uploadFile.getParentFile().mkdirs();
                }
                
                file.transferTo(uploadFile);
                member.setMEMBER_PROFILE_IMAGE(uploadDir+fileName);
                memberService.updateMember(member); // 멤버 정보 업데이트
                
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        
        return "redirect:/mypage";
    }
}
