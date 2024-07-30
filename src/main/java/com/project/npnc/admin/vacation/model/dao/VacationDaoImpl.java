package com.project.npnc.admin.vacation.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.admin.vacation.model.dto.Vacation;

@Repository
public class VacationDaoImpl implements VacationDao {

	@Override
	public List<Vacation> selectVacationAll(SqlSession session) {
		
		return session.selectList("adminVacation.selectVacationAll");
	}

	@Override
	public int insertVacation(SqlSession session, String vacationName) {
		
		return session.insert("adminVacation.insertVacation",vacationName);
	}

	@Override
	public int updateVacation(SqlSession session, Vacation v) {
		
		return session.update("adminVacation.updateVacation",v);
	}

	@Override
	public int deleteVacation(SqlSession session, int vacationKey) {
		
		return session.delete("adminVacation.deleteVacation",vacationKey);
	}

	
}
