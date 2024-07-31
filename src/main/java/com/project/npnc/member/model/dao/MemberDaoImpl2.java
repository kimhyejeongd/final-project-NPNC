package com.project.npnc.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.member.model.dto.SrMember;

@Repository
public class MemberDaoImpl2 implements MemberDao {

	@Override
	public List<SrMember> selectMemeberAll(SqlSession session, Map<String,Integer> page) {
		RowBounds rb=new RowBounds((page.get("cPage")-1)*page.get("numPerpage"),page.get("numPerpage"));
		return session.selectList("memberSr.selectMemeberAll",null,rb);
	}
	
	@Override
	public List<SrMember> selectMemberAllNoPaging(SqlSession session){
		return session.selectList("memberSr.selectMemeberAll");
	}
	
	
	
	@Override
	public int selectMemberCount(SqlSession session) {
	
		return session.selectOne("memberSr.selectMemberCount");
	}

	@Override
	public SrMember selectMemberByNo(SqlSession session, int memberKey) {
		
		return session.selectOne("memberSr.selectMemberByNo",memberKey);
	}

	@Override
	public int insertMember(SqlSession session, SrMember m) {
		
		return session.insert("memberSr.insertMember",m);
	}

	@Override
	public int updateMember(SqlSession session, SrMember m) {
		
		return session.update("memberSr.updateMember",m);
	}

	@Override
	public int deleteMember(SqlSession session, int memberKey) {
		
		return session.delete("memberSr.deleteMember",memberKey);
	}
	
}
