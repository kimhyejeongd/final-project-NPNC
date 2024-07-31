package com.project.npnc.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.member.model.dto.SrMember;

public interface MemberDao {

	List<SrMember> selectMemeberAll(SqlSession session, Map<String,Integer> page);
	int selectMemberCount(SqlSession session);
	SrMember selectMemberByNo(SqlSession session,int memberKey);
	
	int insertMember(SqlSession session,SrMember m);
	int updateMember(SqlSession session,SrMember m);
	int deleteMember(SqlSession session,int memberKey);
	public List<SrMember> selectMemberAllNoPaging(SqlSession session);
}
