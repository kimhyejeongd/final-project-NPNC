package com.project.npnc.mypage.repository;

import com.project.npnc.security.dto.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MemberRepository {

    @Select("SELECT * FROM Member WHERE MEMBER_ID = #{memberId}")
    Member findByMemberId(@Param("memberId") String memberId);

    @Update("UPDATE Member SET MEMBER_PROFILE_IMAGE = #{memberProfileImage} WHERE MEMBER_ID = #{memberId}")
    void updateMember(Member member);
}
