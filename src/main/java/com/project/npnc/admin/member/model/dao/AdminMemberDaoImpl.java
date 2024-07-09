package com.project.npnc.admin.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.admin.member.model.dto.AdminMember;

@Repository
public class AdminMemberDaoImpl implements AdminMemberDao {

	@Override
	public List<AdminMember> selectMemeberAll(SqlSession session, Map<String,Integer> page) {
		RowBounds rb=new RowBounds((page.get("cPage")-1)*page.get("numPerpage"),page.get("numPerpage"));
		return session.selectList("member.selectMemberAll",null,rb);
	}

	@Override
	public int selectMemberCount(SqlSession session) {
	
		return session.selectOne("member.selectMemberCount");
	}

	@Override
	public AdminMember selectMemberByNo(SqlSession session, int memberKey) {
		
		return session.selectOne("member.selectMemberByNo",memberKey);
	}

	@Override
	public int insertMember(SqlSession session, AdminMember m) {
		
		return session.insert("member.insertMember",m);
	}

	@Override
	public int updateMember(SqlSession session, AdminMember m) {
		
		return session.update("member.updateMember",m);
	}

	@Override
	public int deleteMember(SqlSession session, int memberKey) {
		
		return session.delete("member.deleteMember",memberKey);
	}

	@Override
	public int selectMemberKeyById(SqlSession session, String memberId) {
		
		return session.selectOne("member.selectMemberKeyById",memberId);
	}
	
	
}
