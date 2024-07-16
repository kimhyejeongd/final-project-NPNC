package com.project.npnc.mypage.dao;

import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import com.project.npnc.security.dto.Member;

public interface MemberDao {
    Member findById(SqlSession session, String memberId);
    int updateProfileImage(SqlSession session, Map<String, Object> paramMap);
}