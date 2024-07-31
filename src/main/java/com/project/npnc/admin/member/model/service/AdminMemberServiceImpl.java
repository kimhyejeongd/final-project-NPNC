package com.project.npnc.admin.member.model.service;

import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.project.npnc.admin.member.model.dao.AdminMemberDao;
import com.project.npnc.admin.member.model.dto.AdminMember;
import com.project.npnc.memberVacation.model.dao.MemberVacationDao;
import com.project.npnc.memberVacation.model.dto.MemberVacation;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminMemberServiceImpl implements AdminMemberService {
	
	private final AdminMemberDao dao;
	private final MemberVacationDao memberVacationDao;
	private final SqlSession session;
	
	@Override
	public List<AdminMember> selectMemeberAll(Map<String,Integer> page) {

		return dao.selectMemeberAll(session, page);
	}

	@Override
	public int selectMemberCount() {
		
		return dao.selectMemberCount(session);
	}

	@Override
	public AdminMember selectMemberByNo(int memberkey) {
		
		return dao.selectMemberByNo(session, memberkey);
	}

	@Override
	public int insertMember(AdminMember m) {
		
		int result=dao.insertMember(session, m);
		int result2=0;
		int memberVacTotal=12;
		/* System.out.println("서비스 테스트 : "+m.getMemberEnrollDate() ); */
		int memberKey=m.getMemberKey();
		
		if(result>0) {
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
			
			MemberVacation mv=MemberVacation.builder().memberKey(memberKey).memberVacTotal(memberVacTotal).memberVacRemaining(memberVacTotal).build();
			result2=memberVacationDao.insertMemberVacation(session, mv);
		}

		return result2;
	}

	@Override
	public int updateMember(AdminMember m) {

		return dao.updateMember(session, m);
	}

	@Override
	public int deleteMember(int memberKey) {
		return dao.deleteMember(session, memberKey);
	}

	@Override
	public int selectMemberKeyById(String MemberId) {
		
		return dao.selectMemberKeyById(session, MemberId);
	}

	@Override
	public List selectMemberKeyAll() {
		
		return dao.selectMemberKeyAll(session);
	}

	@Override
	public List<AdminMember> searchMember(Map searchMap, Map<String, Integer> page) {
		
		return dao.searchMember(session, searchMap, page);
	}

	@Override
	public int searchMemberCount(Map searchMap) {
	
		return dao.searchMemberCount(session, searchMap);
	}

	
	
}
