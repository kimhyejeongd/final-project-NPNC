package com.project.npnc.security.common.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import com.project.npnc.security.dto.Member;

@Mapper
public interface MemberMapper {
    
    @Select("SELECT * FROM MEMBER")
    List<Member> selectMemberAll();
    
    @Select("SELECT * FROM MEMBER WHERE MEMBER_ID=#{userId}")
    Member selectMemberById(String userId);
    
//    @Insert("INSERT INTO MEMBER(MEMBER_ID, MEMBER_PW) VALUES (#{userId}, #{password})")
//    int insertMember(Member m);
    
	/*
	 * @SelectProvider(type=MemberMapperBuilder.class, method="selectMember") public
	 * List<Member> selectMemberByWhere(Map<String,Object> param);
	 */
}
