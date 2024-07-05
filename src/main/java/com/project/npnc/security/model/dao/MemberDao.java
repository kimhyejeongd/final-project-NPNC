package com.project.npnc.security.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.SqlSession;

import com.project.npnc.security.dto.Member;
@Mapper
public interface MemberDao {
	
   List<Member> selectMemberAll(SqlSession session);
   
	@Select("SELECT * FROM MEMBER WHERE USERID=#{userId}")
	Member selectMemberById(String userId);
	
}
 