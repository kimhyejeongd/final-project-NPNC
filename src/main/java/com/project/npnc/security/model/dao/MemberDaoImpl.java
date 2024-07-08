package com.project.npnc.security.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.security.dto.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Override
	public List<Member> selectMemberAll(SqlSession session) {
		return session.selectList("member.selectMemberAll");
	}
}
