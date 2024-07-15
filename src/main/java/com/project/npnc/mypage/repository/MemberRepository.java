package com.project.npnc.mypage.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.project.npnc.security.dto.Member;
@Repository
@Mapper
public interface MemberRepository {
   
    Member findByMemberId(String memberId);

    void updateMember(Member member);
}