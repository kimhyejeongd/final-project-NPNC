package com.project.npnc.document.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.document.model.dto.Approver;
import com.project.npnc.document.model.dto.ApproverLine;
import com.project.npnc.document.model.dto.ApproverLineStorage;
import com.project.npnc.document.model.dto.DocFile;
import com.project.npnc.document.model.dto.Document;
import com.project.npnc.document.model.dto.DocumentForm;
import com.project.npnc.document.model.dto.DocumentFormFolder;
import com.project.npnc.document.model.dto.OvertimeApply;
import com.project.npnc.document.model.dto.Referer;
import com.project.npnc.document.model.dto.VacationApply;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
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
	public List<Document> selectDraftDocs(SqlSession session, int no) {
		return session.selectList("document.selectDraftDocs", no);
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
	public int insertDraftDoc(SqlSession session, Document d) {
		int result = session.insert("document.insertDraftDoc", d);
		return result;
	}
	@Override
	public int updateDocFilename(SqlSession session, String erDocFilename) {
		return session.insert("document.updateDocFilename", erDocFilename);
	}

	@Override
	public int insertApprovers(SqlSession session, List<Approver> list) {
		int result =0;
		for(int i=0; i<list.size();i++) {
			Approver ap = list.get(i);
			result = session.insert("document.insertApproval", ap); 
			log.debug("결재자 등록 -> " + ap.toString());
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
	public List<DocFile> selectDocFile(SqlSession session, String erDocSerialKey) {
		return session.selectList("document.selectDocFile", erDocSerialKey);
	}

	@Override
	public int deleteDocFile(SqlSession session, String erDocSerialKey) {
		return session.delete("document.deleteDocFile", erDocSerialKey);
	}

	@Override
	public Document selectDocById(SqlSession session, int docId) {
		return session.selectOne("document.selectDocById", docId);
	}
	@Override
	public Document selectDocBySerial(SqlSession session, String serial) {
		return session.selectOne("document.selectDocBySerial", serial);
	}

	@Override
	public int insertReferer(SqlSession session, List<Referer> list) {
		int result =0;
		for(int i=0; i<list.size();i++) {
			Referer r = list.get(i);
			log.debug("{}", r);
			result = session.insert("document.insertReferer", r); 
		}
		return result;
	}

	@Override
	public int insertApproverLineStorage(SqlSession session, Map<String,Object> map) {
		//결재라인 테이블 저장
		return session.insert("document.insertApproverLineStorage", map);
	}
	@Override
	public int insertApproverLine(SqlSession session, Map<String,Object> map) {
		//결재라인 결재자 테이블 저장 
		return session.insert("document.insertApproverLine", map);
	}
	@Override
	public List<ApproverLine> selectApproverLineList(SqlSession session, Map<String,Integer> map) {
		return session.selectList("document.selectApproverList", map);
	}
	@Override
	public List<ApproverLineStorage> selectApproverLines(SqlSession session, int no) {
		return session.selectList("document.selectApproverLines", no);
	}

	@Override
	public int deleteApproverLines(SqlSession session, int no) {
		return session.update("document.deleteApproverLines", no);
	}

	@Override
	public int insertDocFile(SqlSession session, DocFile d) {
		return session.insert("document.insertDocFile", d);
	}
	@Override
	public List<Document> selectCompleteDocs(SqlSession session, int no) {
		return session.selectList("document.selectCompleteDocs", no);
	}

	@Override
	public List<Document> selectRejectedDocs(SqlSession session, int no) {
		return session.selectList("document.selectRejectedDocs", no);
	}

	@Override
	public int insertDraftDocFile(SqlSession session, DocFile d) {
		return session.insert("document.insertDraftDocFile", d);
	}

	@Override
	public int selectRemainingVac(SqlSession session, int memberKey) {
		return session.selectOne("document.selectRemainingVac", memberKey);
	}

	@Override
	public int deleteDraftDoc(SqlSession session, String erDocSerialKey) {
		return session.delete("document.deleteDraftDoc", erDocSerialKey);
	}

	@Override
	public List<Document> selectPendingDocs(SqlSession session, int no) {
		return session.selectList("document.selectPendingDocs", no);
	}

	@Override
	public List<Document> selectReferenceDocs(SqlSession session, int no) {
		return session.selectList("document.selectReferenceDocs", no);
	}

	@Override
	public List<Document> selectMyCompleteDocs(SqlSession session, int no) {
		return session.selectList("document.selectMyCompleteDocs", no);
	}
	
	@Override
	public List<Document> selectMyRejectDocs(SqlSession session, int no) {
		return session.selectList("document.selectMyRejectedDocs", no);
	}

	@Override
	public List<Referer> selectReferer(SqlSession session, String serial) {
		return session.selectList("document.selectReferer", serial);
	}

	@Override
	public List<Approver> selectDocApprovers(SqlSession session, String serial) {
		return session.selectList("document.selectDocApprovers", serial);
	}

	@Override
	public int updateDocStateReject(SqlSession session, String serial) {
		return session.update("document.updateDocStateReject", serial);
	}

	@Override
	public int updateDocStatefinalize(SqlSession session, String serial) {
		return session.update("document.updateDocStatefinalize", serial);
	}

	@Override
	public int updateApprovalState(SqlSession session, String serial, int memberKey, String msg, String state) {
		Map<String, Object> map = new HashMap<>();
		map.put("serial", serial);
		map.put("memberKey", (Integer) memberKey);
		map.put("msg", msg);
		map.put("state", state);
		log.debug("결재 업데이트 -> " + map.toString());
		return session.update("document.updateApprovalState", map);
	}

	@Override
	public int insertVacationApply(SqlSession session, VacationApply vac) {
		return session.insert("document.insertVacationApply", vac);
	}
	@Override
	public int deleteVacationApply(SqlSession session, String serial) {
		return session.delete("document.deleteVacationApply", serial);
	}
	@Override
	public int deleteOvertimeApply(SqlSession session, String serial) {
		return session.delete("document.deleteOvertimeApply", serial);
	}
	@Override
	public int insertOvertimeApply(SqlSession session, OvertimeApply ot) {
		return session.insert("document.insertOvertimeApply", ot);
	}
	@Override
	public int insertVacationApplyDraft(SqlSession session, VacationApply vac) {
		return session.insert("document.insertVacationApplyDraft", vac);
	}
	@Override
	public int updateVacationApply(SqlSession session, String docSerial, String status) {
		Map<String, Object> map = new HashMap<>();
		map.put("serial", docSerial);
		map.put("status", status);
		log.debug("휴가 신청 임시저장 -> " + map.toString());
		return session.update("document.updateVacationApply", map);
	}
	@Override
	public int updateOvertimeApply(SqlSession session, String docSerial, String status) {
		Map<String, Object> map = new HashMap<>();
		map.put("serial", docSerial);
		map.put("status", status);
		log.debug("추가근무 신청 임시저장 -> " + map.toString());
		return session.update("document.updateOvertimeApply", map);
	}
	@Override
	public int updateVacationCalc(SqlSession session, int memberKey, String serial) {
		Map<String, Object> map = new HashMap<>();
		map.put("serial", serial);
		log.debug("휴가 계산 테이블 업데이트 -> " + map.toString());
		return session.update("document.updateVacationCalc", map);
	}

}
