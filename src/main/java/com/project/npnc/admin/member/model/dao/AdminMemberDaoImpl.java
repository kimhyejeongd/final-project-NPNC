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
		return session.selectList("adminmember.selectMemberAll",null,rb);
	}

	@Override
	public int selectMemberCount(SqlSession session) {
	
		return session.selectOne("adminmember.selectMemberCount");
	}

	@Override
	public AdminMember selectMemberByNo(SqlSession session, int memberKey) {
		
		return session.selectOne("adminmember.selectMemberByNo",memberKey);
	}

	@Override
	public int insertMember(SqlSession session, AdminMember m) {
		
		return session.insert("adminmember.insertMember",m);
	}

	@Override
	public int updateMember(SqlSession session, AdminMember m) {
		
		return session.update("adminmember.updateMember",m);
	}

	@Override
	public int deleteMember(SqlSession session, int memberKey) {
		
		return session.delete("adminmember.deleteMember",memberKey);
	}

	@Override
	public int selectMemberKeyById(SqlSession session, String memberId) {
		
		return session.selectOne("adminmember.selectMemberKeyById",memberId);
	}

	@Override
	public List selectMemberKeyAll(SqlSession session) {
		
		return session.selectList("adminmember.selectMemberKeyAll");
	}

	@Override
	public List<AdminMember> searchMember(SqlSession session, Map searchMap, Map<String,Integer> page) {
		RowBounds rb=new RowBounds((page.get("cPage")-1)*page.get("numPerpage"),page.get("numPerpage"));
		return session.selectList("adminmember.searchMember",searchMap,rb);
	}

	@Override
	public int searchMemberCount(SqlSession session, Map searchMap) {
		
		return session.selectOne("adminmember.searchMemberCount",searchMap);
	}
	
	
	
	
}
