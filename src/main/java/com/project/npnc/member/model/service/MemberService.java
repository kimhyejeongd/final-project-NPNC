package com.project.npnc.member.model.service;

import java.util.List;
import java.util.Map;

import com.project.npnc.member.model.dto.SrMember;

public interface MemberService {
	
	List<SrMember> selectMemeberAll(Map<String,Integer> page);
	int selectMemberCount();
	SrMember selectMemberByNo(int memberKey);
	
	int insertMember(SrMember m);
	int updateMember(SrMember m);
	int deleteMember(int memberKey);
	
	
}