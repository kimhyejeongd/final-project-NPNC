package com.project.npnc.document.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.document.model.dto.DocumentFormFolder;

public interface MemberDocumentDao {
	List<DocumentFormFolder> selectformFolders(SqlSession session);
}
