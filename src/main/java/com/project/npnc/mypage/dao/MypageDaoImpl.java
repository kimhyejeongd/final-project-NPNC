package com.project.npnc.mypage.dao;

import java.util.Map;

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
        return session.update("mypage.updateMember", paramMap);
    }

    @Override
    public Member findByEmail(SqlSession session, String email) {
        return session.selectOne("mypage.findByEmail", email);
    }

    @Override
    public int updatePassword(SqlSession session, Map<String, Object> paramMap) {
        return session.update("mypage.updatePassword", paramMap);
    }

    // SqlSession을 사용하여 profileImage를 업데이트하는 메서드
    @Override
    public int updateProfileImage(Map<String, Object> paramMap) {
        return sqlSession.update("mypage.updateProfileImage", paramMap);
    }
}
