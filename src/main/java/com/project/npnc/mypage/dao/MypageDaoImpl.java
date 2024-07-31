package com.project.npnc.mypage.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.security.dto.Member;

@Repository
public class MypageDaoImpl implements MemberDao {
	
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
}