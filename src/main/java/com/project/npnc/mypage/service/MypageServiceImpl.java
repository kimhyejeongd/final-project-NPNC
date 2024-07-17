package com.project.npnc.mypage.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.project.npnc.mypage.dao.MemberDao;
import com.project.npnc.security.dto.Member;

import lombok.RequiredArgsConstructor;

@Service
public class MypageServiceImpl implements MemberService {

    private final SqlSession sqlSession;
    private final MemberDao memberDao;

    public MypageServiceImpl(SqlSession sqlSession, MemberDao memberDao) {
        this.sqlSession = sqlSession;
        this.memberDao = memberDao;
    }

    @Override
    public Member getMemberById(String memberId) {
        return memberDao.findById(sqlSession, memberId);
    }

    @Override
    @Transactional
    public void updateProfileImage(String memberId, MultipartFile file) {
        // 프로필 이미지 업데이트 로직 구현
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
}