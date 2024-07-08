package com.project.npnc.admin.member.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.project.npnc.admin.member.model.dao.AdminMemberDao;
import com.project.npnc.member.model.dto.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminMemberServiceImpl implements AdminMemberService {
	
	private final AdminMemberDao dao;
	private SqlSession session;
	
	@Override
	public List<Member> selectMemeberAll(Map<String,Integer> page) {

		return dao.selectMemeberAll(session, page);
	}

	@Override
	public int selectMemberCount() {
		
		return dao.selectMemberCount(session);
	}

	@Override
	public Member selectMemberByNo(int memberkey) {
		
		return dao.selectMemberByNo(session, memberkey);
	}

	@Override
	public int insertMember(Member m) {

		return dao.insertMember(session, m);
	}

	@Override
	public int updateMember(Member m) {

		return dao.updateMember(session, m);
	}

	@Override
	public int deleteMember(int memberKey) {
		return dao.deleteMember(session, memberKey);
	}

	
}