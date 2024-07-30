package com.project.npnc.admin.vacation.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.admin.vacation.model.dto.Vacation;

public interface VacationDao {

	List<Vacation> selectVacationAll(SqlSession session);
	Vacation selectVacationByKey(SqlSession session,int vacationKey);
	int insertVacation(SqlSession session,Vacation v);
	int updateVacation(SqlSession session,Vacation v);
	int deleteVacation(SqlSession session,int vacationKey);
}
