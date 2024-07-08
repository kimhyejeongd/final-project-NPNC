package com.project.npnc.security.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.SqlSession;

import com.project.npnc.security.dto.Member;

public interface MemberDao {
	
   List<Member> selectMemberAll(SqlSession session);
   
	
}
 