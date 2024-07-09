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
		return session.selectList("member.selectMemeberAll",null,rb);
	}

	@Override
	public int selectMemberCount(SqlSession session) {
	
		return session.selectOne("member.selectMemberCount");
	}

	@Override
	public Member selectMemberByNo(SqlSession session, int memberKey) {
		
		return session.selectOne("member.selectMemberByNo",memberKey);
	}

	@Override
	public int insertMember(SqlSession session, Member m) {
		
		return session.insert("member.insertMember",m);
	}

	@Override
	public int updateMember(SqlSession session, Member m) {
		
		return session.update("member.updateMember",m);
	}

	@Override
	public int deleteMember(SqlSession session, int memberKey) {
		
		return session.delete("member.deleteMember",memberKey);
	}
	
}
