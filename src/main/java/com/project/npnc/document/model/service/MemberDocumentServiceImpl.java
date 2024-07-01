package com.project.npnc.document.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.project.npnc.document.model.dao.MemberDocumentDaoImpl;
import com.project.npnc.document.model.dto.DocumentFormFolder;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberDocumentServiceImpl implements MemberDocumentService {
	private final SqlSession session;
	private final MemberDocumentDaoImpl dao;
	@Override
	public List<DocumentFormFolder> selectformFolders() {
		return dao.selectformFolders(session);
	}

}
