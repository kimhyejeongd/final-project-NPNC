package com.project.npnc.document.model.service;

import java.util.List;

import com.project.npnc.document.model.dto.Approver;

public interface MemberApproveService {
	int updateApproveDoc(int memberKey, String serial, String msg, int formNo, String html, String uploadDir) throws Exception;
	int updateRejectDoc(int memberKey, String serial, String msg) throws Exception;
	int updatePendDoc(int memberKey, String serial, String msg) throws Exception;
	List<Approver> selectDocApprovers(String serial);
}
