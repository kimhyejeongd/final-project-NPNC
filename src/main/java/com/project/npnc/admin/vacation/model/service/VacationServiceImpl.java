package com.project.npnc.admin.vacation.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.project.npnc.admin.vacation.model.dao.VacationDao;
import com.project.npnc.admin.vacation.model.dto.Vacation;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class VacationServiceImpl implements VacationService {

	private final VacationDao dao;
	private final SqlSession session;
	
	
	@Override
	public List<Vacation> selectVacationAll() {
		
		return dao.selectVacationAll(session);
	}

	@Override
	public int insertVacation(String vacationName) {
		
		return dao.insertVacation(session, vacationName);
	}

	@Override
	public int updateVacation(Vacation v) {
		
		return dao.updateVacation(session, v);
	}

	@Override
	public int deleteVacation(int vacationKey) {
		
		return dao.deleteVacation(session, vacationKey);
	}

	
	
	
}
