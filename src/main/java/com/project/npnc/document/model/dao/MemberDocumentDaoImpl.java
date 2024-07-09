package com.project.npnc.document.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.document.model.dto.Document;
import com.project.npnc.document.model.dto.DocumentForm;
import com.project.npnc.document.model.dto.DocumentFormFolder;
import com.project.npnc.document.model.dto.approversList;

@Repository
public class MemberDocumentDaoImpl implements MemberDocumentDao{

	@Override
	public List<DocumentFormFolder> selectformFolders(SqlSession session) {
		return session.selectList("document.selectformFolders");
	}

	@Override
	public List<DocumentForm> selectForms(SqlSession session, int no) {
		return session.selectList("document.selectForms", no);
	}

	@Override
	public List<DocumentForm> selectFormsBySearch(SqlSession session, String target) {
		return session.selectList("document.selectFormsBySearch", "%"+target+"%");
	}

	@Override
	public DocumentForm selectFormByNo(SqlSession session, int no) {
		return session.selectOne("document.selectFormByNo", no);
	}

	@Override
	public int insertDoc(SqlSession session, Document d) {
		return 0;
	}

	@Override
	public int insertDocFile(SqlSession session, approversList request) {
		// TODO Auto-generated method stub
		return 0;
	}

}
