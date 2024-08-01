package com.project.npnc.mypage.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.project.npnc.mypage.dao.MemberDao;
import com.project.npnc.security.dto.Member;

@Service
public class MypageServiceImpl implements MemberService {

    private final SqlSession sqlSession;
    private final MemberDao memberDao;

    @Value("${file.upload-dir}")
    private String uploadDir; // uploadDir을 @Value로 주입받습니다.

    public MypageServiceImpl(SqlSession sqlSession, MemberDao memberDao) {
        this.sqlSession = sqlSession;
        this.memberDao = memberDao;
    }

    @Override
    public Member getMemberById(String memberId) {
        return memberDao.findById(sqlSession, memberId);
    }

    @Override
    public Member getMemberByEmail(String email) {
        return memberDao.findByEmail(sqlSession, email);
    }

    @Override
    @Transactional
    public void changePassword(String memberId, String newPassword) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("memberId", memberId);
        paramMap.put("newPassword", newPassword);
        memberDao.updatePassword(sqlSession, paramMap);
    }

    @Override
    @Transactional
    public void updateProfileImage(String memberId, MultipartFile file) {
        try {
            String fileName = StringUtils.cleanPath(file.getOriginalFilename());
            Path uploadPath = Paths.get(uploadDir).toAbsolutePath().normalize();
            System.out.println("Upload directory: " + uploadPath.toString());

            // 디렉토리 존재 여부 확인 및 생성
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
                System.out.println("Created directories: " + uploadPath.toString());
            }

            Path filePath = uploadPath.resolve(fileName);
            System.out.println("File path: " + filePath.toString());

            // 파일 복사
            try (var inputStream = file.getInputStream()) {
                Files.copy(inputStream, filePath);
                System.out.println("File stored: " + filePath.toString());
            }

            Map<String, Object> paramMap = new HashMap<>();
            paramMap.put("memberId", memberId);
            paramMap.put("profileImage", fileName);
            memberDao.updateProfileImage(paramMap);

        } catch (IOException e) {
            String errorMsg = String.format("Could not store file '%s'. Error: %s", file.getOriginalFilename(), e.getMessage());
            System.err.println(errorMsg); // 로그로 예외 메시지 출력
            e.printStackTrace(); // 예외의 스택 트레이스도 출력하여 디버깅에 도움을 줍니다
            throw new RuntimeException(errorMsg, e);
        }
    }
    @Override
    public String getProfileImageFileName(String memberId) {
        Member member = memberDao.findById(sqlSession, memberId);
        return member != null ? member.getMemberProfileImage() : null;
    }
}
