package com.project.npnc.admin.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.admin.member.model.dto.AdminMember;

public interface AdminMemberDao {

	List<AdminMember> selectMemeberAll(SqlSession session, Map<String,Integer> page);
	int selectMemberCount(SqlSession session);
	AdminMember selectMemberByNo(SqlSession session,int memberKey);
	List selectMemberKeyAll(SqlSession session);
	int selectMemberKeyById(SqlSession session,String memberId);
	
	int insertMember(SqlSession session,AdminMember m);
	int updateMember(SqlSession session,AdminMember m);
	int deleteMember(SqlSession session,int memberKey);
	
	List<AdminMember> searchMember(SqlSession session,Map searchMap, Map<String,Integer> page);
	int searchMemberCount(SqlSession session,Map searchMap);
	
}
