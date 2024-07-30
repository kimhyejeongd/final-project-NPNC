package com.project.npnc.memberVacation.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.project.npnc.memberVacation.model.dao.MemberVacationDao;
import com.project.npnc.memberVacation.model.dto.MemberVacation;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberVacationServiceImpl implements MemberVacationService {

	private final MemberVacationDao dao;
	private final SqlSession session;
	
	public int insertMemberVacation(MemberVacation mv) {
		
		return dao.insertMemberVacation(session, mv);
	}
	
	
	
}
