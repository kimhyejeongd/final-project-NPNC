package com.project.npnc.memberVacation.model.service;

import java.util.List;

import com.project.npnc.memberVacation.model.dto.MemberVacation;

public interface MemberVacationService {

	int insertMemberVacation(MemberVacation mv);
	
	MemberVacation selectMemberVacationByMemberKey(int memberKey);
	List<MemberVacation> selectMemberVacationEnrollDate();
	
	void updateMemberVacationYear(List<MemberVacation>  mv);
	
}
