package com.project.npnc.mypage.repository;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.project.npnc.security.dto.Member;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberRespositoryImpl implements MemberRepository {
	
	 @Override
	 @Select("SELECT * FROM members WHERE MEMBER_ID = #{memberId}")
	public Member findByMemberId(String memberId) {
		// TODO Auto-generated method stub
	//	return mypageRepository.findByMemberId(memberId);
		 return null;
	}

	@Override
	@Update("UPDATE members SET MEMBER_NAME = #{MEMBER_NAME}, MEMBER_EMAIL = #{MEMBER_EMAIL}, MEMBER_PHONE = #{MEMBER_PHONE}, MEMBER_ADDRESS = #{MEMBER_ADDRESS} WHERE MEMBER_ID = #{MEMBER_ID}")
	public void updateMember(Member member) {
	}
}

