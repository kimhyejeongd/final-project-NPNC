package com.project.npnc.admin.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.admin.member.model.dto.AdminMember;

public interface AdminMemberDao {

	List<AdminMember> selectMemeberAll(SqlSession session, Map<String,Integer> page);
	int selectMemberCount(SqlSession session);
	AdminMember selectMemberByNo(SqlSession session,int memberKey);
	
	int insertMember(SqlSession session,AdminMember m);
	int updateMember(SqlSession session,AdminMember m);
	int deleteMember(SqlSession session,int memberKey);
	
}
