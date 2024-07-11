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
	public List<Document> selectInprocessDocs(SqlSession session, int no) {
		return session.selectList("document.selectInprocessDocs", no);
	}
	@Override
	public List<Document> selectRetrieveDocs(SqlSession session, int no) {
		return session.selectList("document.selectRetrieveDocs", no);
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
		return session.insert("document.insertDoc", d);
	}

	@Override
	public int insertApproval(SqlSession session, approversList request) {
		int result =0;
		for(int i=0; i<request.getApprovers().size();i++) {
			result = session.insert("document.insertApproval", request.getApprovers().get(i)); 
		}
		return result;
	}

	@Override
	public int retrieveDoc(SqlSession session, String erDocSerialKey) {
		return session.update("document.retrieveDoc", erDocSerialKey);
	}

	@Override
	public int retrieveDocFile(SqlSession session, String erDocSerialKey) {
		return session.delete("document.retrieveDocFile", erDocSerialKey);
	}

	@Override
	public int selectDocFile(SqlSession session, String erDocSerialKey) {
		return session.selectOne("document.selectDocFile", erDocSerialKey);
	}

	@Override
	public int deleteDocFile(SqlSession session, String erDocSerialKey) {
		return session.delete("document.deleteDocFile", erDocSerialKey);
	}

	@Override
	public Document selectDocBySerial(SqlSession session, String docId) {
		return session.selectOne("document.selectDocBySerial", docId);
	}

}
