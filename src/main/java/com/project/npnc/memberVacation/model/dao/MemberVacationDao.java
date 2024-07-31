package com.project.npnc.memberVacation.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.memberVacation.model.dto.MemberVacation;

public interface MemberVacationDao {

	int insertMemberVacation(SqlSession session,MemberVacation mv);
	
	MemberVacation selectMemberVacationByMemberKey(SqlSession session,int memberKey);
	
	List<MemberVacation> selectMemberVacationEnrollDate(SqlSession session);
	int updateMemberVacationYear(SqlSession session,MemberVacation mve);
}
