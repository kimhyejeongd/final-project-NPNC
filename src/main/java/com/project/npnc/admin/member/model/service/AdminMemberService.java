package com.project.npnc.admin.member.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.admin.member.model.dto.AdminMember;

public interface AdminMemberService {
	
	List<AdminMember> selectMemeberAll(Map<String,Integer> page);
	int selectMemberCount();
	AdminMember selectMemberByNo(int memberKey);
	int selectMemberKeyById(String MemberId);
	List selectMemberKeyAll();
	
	int insertMember(AdminMember m);
	int updateMember(AdminMember m);
	int deleteMember(int memberKey);
	List<AdminMember> searchMember(Map searchMap, Map<String,Integer> page);
	int searchMemberCount(Map searchMap);
	
}
