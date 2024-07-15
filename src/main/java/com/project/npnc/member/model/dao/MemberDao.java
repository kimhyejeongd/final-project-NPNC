package com.project.npnc.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.member.model.dto.Member;

public interface MemberDao {

	List<Member> selectMemeberAll(SqlSession session, Map<String,Integer> page);
	int selectMemberCount(SqlSession session);
	Member selectMemberByNo(SqlSession session,int memberKey);
	
	int insertMember(SqlSession session,Member m);
	int updateMember(SqlSession session,Member m);
	int deleteMember(SqlSession session,int memberKey);
	public List<Member> selectMemberAllNoPaging(SqlSession session);
}
