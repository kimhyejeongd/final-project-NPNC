package com.project.npnc.memberVacation.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.memberVacation.model.dto.MemberVacation;

public interface MemberVacationDao {

	int insertMemberVacation(SqlSession session,MemberVacation mv);
}
