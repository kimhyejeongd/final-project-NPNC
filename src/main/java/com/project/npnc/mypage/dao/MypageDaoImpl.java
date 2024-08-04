package com.project.npnc.mypage.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.npnc.security.dto.Member;

@Repository
public class MypageDaoImpl implements MemberDao {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public Member findById(SqlSession session, String memberId) {
        return session.selectOne("mypage.findById", memberId);
    }

    @Override
    public int updateProfileImage(SqlSession session, Map<String, Object> paramMap) {
        return session.update("mypage.updateProfileImage", paramMap); // 프로필 이미지 업데이트
    }

    @Override
    public Member findByEmail(SqlSession session, String email) {
        return session.selectOne("mypage.findByEmail", email);
    }

    @Override
    public int updatePassword(SqlSession session, Map<String, Object> paramMap) {
        return session.update("mypage.updatePassword", paramMap);
    }

    @Override
    public int updateProfileImage(Map<String, Object> paramMap) {
        return sqlSession.update("mypage.updateProfileImage", paramMap);
    }
    @Override
    public String getProfileImageFileName(SqlSession session, String memberId) {
        return session.selectOne("MemberMapper.getProfileImageFileName", memberId);
    }
    @Override
    public void updateAddress(String memberId, String fullAddress) {
        Map<String, Object> paramMap = Map.of(
            "memberId", memberId,
            "fullAddress", fullAddress
        );
        sqlSession.update("mypage.updateAddress", paramMap);
    }
}
