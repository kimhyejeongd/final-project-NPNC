package com.project.npnc.admin.vacation.model.service;

import java.util.List;

import com.project.npnc.admin.job.model.dto.Job;
import com.project.npnc.admin.vacation.model.dto.Vacation;

public interface VacationService {

	List<Vacation> selectVacationAll();
	int insertVacation(String vacationName);
	int updateVacation(Vacation v);
	int deleteVacation(int vacationKey);
	
}
