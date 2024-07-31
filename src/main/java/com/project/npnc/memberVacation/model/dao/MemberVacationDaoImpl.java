package com.project.npnc.memberVacation.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.memberVacation.model.dto.MemberVacation;

@Repository
public class MemberVacationDaoImpl implements MemberVacationDao {

	@Override
	public int insertMemberVacation(SqlSession session, MemberVacation mv) {
		
		return session.insert("memberVacation.insertMemberVacation",mv);
	}

	@Override
	public MemberVacation selectMemberVacationByMemberKey(SqlSession session, int memberKey) {
		return session.selectOne("memberVacation.selectMemberVacationByMemberKey",memberKey);
	}

	@Override
	public List<MemberVacation> selectMemberVacationEnrollDate(SqlSession session) {
		
		return session.selectList("memberVacation.selectMemberVacationEnrollDate");
	}

	@Override
	public int updateMemberVacationYear(SqlSession session, MemberVacation mve) {
		
		return session.update("memberVacation.updateMemberVacationYear",mve);
	}



	
}
