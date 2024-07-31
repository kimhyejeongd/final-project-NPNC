package com.project.npnc.document.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

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

public interface MemberDocumentDao {
	
 	int insertDoc(SqlSession session, Document d);
 	int insertDraftDoc(SqlSession session, Document d);
	int insertApprovers(SqlSession session, List<Approver> list);
	int insertReferer(SqlSession session, List<Referer> list);
	int insertApproverLineStorage(SqlSession session, Map<String,Object> map);
	int insertApproverLine(SqlSession session, Map<String,Object> map);
	int insertDocFile(SqlSession session, DocFile d);
	int insertDraftDocFile(SqlSession session, DocFile d);
	
	int deleteDraftDoc(SqlSession session, String erDocSerialKey);
	int deleteDocFile(SqlSession session, String erDocSerialKey);
	int deleteApproverLines(SqlSession session, int no);
	
	int retrieveDoc(SqlSession session, String erDocSerialKey);
	int retrieveDocFile(SqlSession session, String erDocSerialKey);
	
	int updateDocFilename(SqlSession session, String erDocFilename);
	int updateDocStatefinalize(SqlSession session, String serial);
	int updateDocStateReject(SqlSession session, String serial);
	int updateApprovalState(SqlSession session, String serial, int memberKey, String msg, String state);
	
	List<Document> selectRetrieveDocs(SqlSession session, int no);
	List<Document> selectInprocessDocs(SqlSession session, int no);
	List<Document> selectWaitingDocs(SqlSession session, int no);
	List<Document> selectDraftDocs(SqlSession session, int no);
	List<Document> selectPendingDocs(SqlSession session, int no);
	List<Document> selectMyCompleteDocs(SqlSession session, int no);
	List<Document> selectMyRejectDocs(SqlSession session, int no);
	List<Document> selectCompleteDocs(SqlSession session, int no);
	List<Document> selectRejectedDocs(SqlSession session, int no);
	List<Document> selectReferenceDocs(SqlSession session, int no);
	List<DocFile> selectDocFile(SqlSession session, String erDocSerialKey);
	List<DocumentFormFolder> selectformFolders(SqlSession session);
	List<DocumentForm> selectForms(SqlSession session, int no);
	List<DocumentForm> selectFormsBySearch(SqlSession session, String target);
	
	DocumentForm selectFormByNo(SqlSession session, int no);
	Document selectDocById(SqlSession session, int docId);
	Document selectDocBySerial(SqlSession session, String serial);
	
	List<Referer> selectReferer(SqlSession session, String serial);
	List<ApproverLine> selectApproverLineList(SqlSession session, Map<String,Integer> map);
	List<ApproverLineStorage> selectApproverLines(SqlSession session, int no);
	List<Approver> selectDocApprovers(SqlSession session, String serial);
	
	int selectRemainingVac(SqlSession session, int memberKey);
	int insertVacationApply(SqlSession session, VacationApply vac);
	int deleteVacationApply(SqlSession session, String serial);
	int insertVacationApplyDraft(SqlSession session, VacationApply vac);
	int updateVacationApply(SqlSession session, String docSerial, String status);
	int updateVacationCalc(SqlSession session, int memberKey, String serial);
	
	int insertOvertimeApply(SqlSession session, OvertimeApply ot);
	int updateOvertimeApply(SqlSession session, String docSerial, String status);
	int deleteOvertimeApply(SqlSession session, String serial);
}
