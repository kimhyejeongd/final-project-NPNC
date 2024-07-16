package com.project.npnc.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.member.model.dto.Member;

@Repository
public class MemberDaoImpl2 implements MemberDao {

	@Override
	public List<Member> selectMemeberAll(SqlSession session, Map<String,Integer> page) {
		RowBounds rb=new RowBounds((page.get("cPage")-1)*page.get("numPerpage"),page.get("numPerpage"));
		return session.selectList("memberSr.selectMemeberAll",null,rb);
	}
	
	@Override
	public List<Member> selectMemberAllNoPaging(SqlSession session){
		return session.selectList("memberSr.selectMemeberAll");
	}
	
	
	
	@Override
	public int selectMemberCount(SqlSession session) {
	
		return session.selectOne("memberSr.selectMemberCount");
	}

	@Override
	public Member selectMemberByNo(SqlSession session, int memberKey) {
		
		return session.selectOne("memberSr.selectMemberByNo",memberKey);
	}

	@Override
	public int insertMember(SqlSession session, Member m) {
		
		return session.insert("memberSr.insertMember",m);
	}

	@Override
	public int updateMember(SqlSession session, Member m) {
		
		return session.update("memberSr.updateMember",m);
	}

	@Override
	public int deleteMember(SqlSession session, int memberKey) {
		
		return session.delete("memberSr.deleteMember",memberKey);
	}
	
}
