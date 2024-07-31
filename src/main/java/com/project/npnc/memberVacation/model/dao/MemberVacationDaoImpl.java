package com.project.npnc.memberVacation.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.memberVacation.model.dto.MemberVacation;

@Repository
public class MemberVacationDaoImpl implements MemberVacationDao {

	@Override
	public int insertMemberVacation(SqlSession session, MemberVacation mv) {
		
		return session.insert("memberVacation.insertMemberVacation",mv);
	}

	
}