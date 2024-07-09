package com.project.npnc.member.model.service;

import java.util.List;
import java.util.Map;

import com.project.npnc.member.model.dto.Member;

public interface MemberService {
	
	List<Member> selectMemeberAll(Map<String,Integer> page);
	int selectMemberCount();
	Member selectMemberByNo(int memberKey);
	
	int insertMember(Member m);
	int updateMember(Member m);
	int deleteMember(int memberKey);
	
	
}