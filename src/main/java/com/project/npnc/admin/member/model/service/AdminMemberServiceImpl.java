package com.project.npnc.admin.member.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.project.npnc.admin.member.model.dao.AdminMemberDao;
import com.project.npnc.admin.member.model.dto.AdminMember;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminMemberServiceImpl implements AdminMemberService {
	
	private final AdminMemberDao dao;
	private final SqlSession session;
	
	@Override
	public List<AdminMember> selectMemeberAll(Map<String,Integer> page) {

		return dao.selectMemeberAll(session, page);
	}

	@Override
	public int selectMemberCount() {
		
		return dao.selectMemberCount(session);
	}

	@Override
	public AdminMember selectMemberByNo(int memberkey) {
		
		return dao.selectMemberByNo(session, memberkey);
	}

	@Override
	public int insertMember(AdminMember m) {

		return dao.insertMember(session, m);
	}

	@Override
	public int updateMember(AdminMember m) {

		return dao.updateMember(session, m);
	}

	@Override
	public int deleteMember(int memberKey) {
		return dao.deleteMember(session, memberKey);
	}

	@Override
	public int selectMemberKeyById(String MemberId) {
		
		return dao.selectMemberKeyById(session, MemberId);
	}

	
}
