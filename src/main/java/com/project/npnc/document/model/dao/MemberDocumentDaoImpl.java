package com.project.npnc.document.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.document.model.dto.Approver;
import com.project.npnc.document.model.dto.ApproverLine;
import com.project.npnc.document.model.dto.ApproversList;
import com.project.npnc.document.model.dto.Document;
import com.project.npnc.document.model.dto.DocumentForm;
import com.project.npnc.document.model.dto.DocumentFormFolder;
import com.project.npnc.document.model.dto.Referer;
import com.project.npnc.document.model.dto.RefererList;

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
	public List<Document> selectWaitingDocs(SqlSession session, int no) {
		return session.selectList("document.selectWaitingDocs", no);
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
		int result = session.insert("document.insertDoc", d);
		return result;
	}
	@Override
	public int updateDocFilename(SqlSession session, String erDocFilename) {
		return session.insert("document.updateDocFilename", erDocFilename);
	}

	@Override
	public int insertApproval(SqlSession session, ApproversList request) {
		int result =0;
		for(int i=0; i<request.getApprovers().size();i++) {
			Approver ap = request.getApprovers().get(i);
			result = session.insert("document.insertApproval", ap); 
		}
		return result;
	}
	@Override
	public int insertApproval(SqlSession session, List<Approver> list) {
		int result =0;
		for(int i=0; i<list.size();i++) {
			Approver ap = list.get(i);
			result = session.insert("document.insertApproval", ap); 
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
	public Document selectDocById(SqlSession session, String docId) {
		return session.selectOne("document.selectDocBySerial", docId);
	}

	@Override
	public int insertReferer(SqlSession session, RefererList request) {
		int result =0;
		for(int i=0; i<request.getReferers().size();i++) {
			Referer r = request.getReferers().get(i);
			result = session.insert("document.insertReferer", r); 
		}
		return result;
	}
	@Override
	public int insertReferer(SqlSession session, List<Referer> list) {
		int result =0;
		for(int i=0; i<list.size();i++) {
			Referer r = list.get(i);
			result = session.insert("document.insertReferer", r); 
		}
		return result;
	}

	@Override
	public int insertApproverLine(SqlSession session, int no, String name, List<Approver> list) {
//		int result =0;
//		for (Approver approver : list) {
			Map<String,Object> map = new HashMap<>();
			map.put("no", no);
			map.put("name", name);
			map.put("approver", list);
//			map.put("approver", approver);
//			result = session.insert("document.insertApproverLine", map);
//		}
//		return result;
		return session.insert("document.insertApproverLine", map);
	}

	@Override
	public List<ApproverLine> selectApproverLines(SqlSession session, int no) {
		return session.selectList("document.selectApproverLines", no);
	}

	@Override
	public int deleteApproverLines(SqlSession session, int no) {
		return session.update("document.deleteApproverLines", no);
	}

}
