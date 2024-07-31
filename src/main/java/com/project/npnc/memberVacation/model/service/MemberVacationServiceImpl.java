package com.project.npnc.memberVacation.model.service;

import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

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
	
	@Override
	public int insertMemberVacation(MemberVacation mv) {
		
		return dao.insertMemberVacation(session, mv);
	}

	@Override
	public MemberVacation selectMemberVacationByMemberKey(int memberKey) {
		return dao.selectMemberVacationByMemberKey(session, memberKey);
	}

	@Override
	public List<MemberVacation> selectMemberVacationEnrollDate() {
		
		return dao.selectMemberVacationEnrollDate(session);
	}

	@Override
	public void updateMemberVacationYear(List<MemberVacation> mv) {
		
		
		
		mv.forEach(m->{
			int memberVacTotal=12;
			Date enrollDate = m.getMemberEnrollDate();
			System.out.println("서비스 테스트1 : "+enrollDate );
		    LocalDate localEnrollDate = null;
		        
		    // java.sql.Date를 java.util.Date로 변환
            java.util.Date utilEnrollDate = new java.util.Date(enrollDate.getTime());
            // java.util.Date를 LocalDate로 변환
            localEnrollDate = utilEnrollDate.toInstant()
                                             .atZone(ZoneId.systemDefault())
                                             .toLocalDate();
		    
		    LocalDate currentDate = LocalDate.now();

		     // 근속 연수 계산
			Period period = Period.between(localEnrollDate, currentDate);
		    int yearsOfService = period.getYears();
			
			if(yearsOfService>=7) {
				memberVacTotal=20;
			}else if(yearsOfService>=5) {
				memberVacTotal=19;
			}else if(yearsOfService>=3) {
				memberVacTotal=17;
			}else if(yearsOfService>=1) {
				memberVacTotal=15;
			}
			
			MemberVacation mve=MemberVacation.builder().memberKey(m.getMemberKey()).memberVacTotal(memberVacTotal).memberVacRemaining(memberVacTotal).build();
			dao.updateMemberVacationYear(session, mve);
		});
		
		
		
		
	}
	
	
	
}
