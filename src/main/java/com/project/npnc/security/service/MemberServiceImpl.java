package com.project.npnc.security.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.project.npnc.security.dto.Member;
import com.project.npnc.security.model.dao.MemberDao;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service

public class MemberServiceImpl implements MemberService{
	
	private final MemberDao dao;
	private final SqlSession session;
	
	@Override
	public List<Member> selectMemberAll(){
		return dao.selectMemberAll(session);
	}
	
	
}
