package com.project.npnc.document.model.service;

import java.util.List;

import com.project.npnc.document.model.dto.DocumentForm;
import com.project.npnc.document.model.dto.DocumentFormFolder;

public interface MemberDocumentService {
	
	List<DocumentFormFolder> selectformFolders();
	List<DocumentForm> selectForms(int no);
	List<DocumentForm> selectFormsBySearch(String target);
}