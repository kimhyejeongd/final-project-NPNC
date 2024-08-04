package com.project.npnc.mypage.service;

import com.project.npnc.security.dto.Member;
import org.springframework.web.multipart.MultipartFile;

public interface MemberService {
    Member getMemberById(String memberId);
    void updateProfileImage(String memberId, MultipartFile file);
    Member getMemberByEmail(String email);
    void changePassword(String memberId, String newPassword);
    String getProfileImageFileName(String memberId);
    void updateAddress(String memberId,String roadAddress, String detailedAddress ,String postcode);


    
}