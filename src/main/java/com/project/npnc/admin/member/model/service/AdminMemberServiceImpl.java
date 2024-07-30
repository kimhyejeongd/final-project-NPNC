package com.project.npnc.admin.member.model.service;

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
		int memberVacTotal=15;
		System.out.println("서비스 테스트 : "+m.getMemberKey() );
		int memberKey=m.getMemberKey();

		if(result>0) {
			if(m.getJob().getJobKey().equals("J1")) {
				memberVacTotal=22;
			}else if(m.getJob().getJobKey().equals("J2")) {
				memberVacTotal=19;
			}else if(m.getJob().getJobKey().equals("J3")) {
				memberVacTotal=17;
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
