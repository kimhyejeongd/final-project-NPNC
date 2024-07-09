package com.project.npnc.document.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.project.npnc.document.model.dao.MemberDocumentDao;
import com.project.npnc.document.model.dto.Document;
import com.project.npnc.document.model.dto.DocumentForm;
import com.project.npnc.document.model.dto.DocumentFormFolder;
import com.project.npnc.document.model.dto.approversList;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberDocumentServiceImpl implements MemberDocumentService {
	private final SqlSession session;
	private final MemberDocumentDao dao;
	@Override
	public List<DocumentFormFolder> selectformFolders() {
		return dao.selectformFolders(session);
	}
	@Override
	public List<DocumentForm> selectForms(int no) {
		return dao.selectForms(session, no);
	}
	@Override
	public List<DocumentForm> selectFormsBySearch(String target) {
		return dao.selectFormsBySearch(session, target);
	}
	@Override
	public DocumentForm selectFormByNo(int no) {
		return dao.selectFormByNo(session, no);
	}
	@Override
	public int insertDoc(Document d, approversList request) {
		int result = dao.insertDoc(session, d); //문서 등록
		if(result>0) {
			log.debug("[1]문서 insert 성공");
			result=dao.insertDocFile(session, request); //결재자 등록
		}else {
			log.debug("[1]문서 insert 실패");
		}
		return result;
	}

}
