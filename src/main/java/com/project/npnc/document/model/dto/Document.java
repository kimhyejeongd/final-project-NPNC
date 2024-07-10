package com.project.npnc.document.model.dto;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Document {
	private String erDocKey;
	private int erDocWriter;
	private String erDocTitle;
	private Date erDocCreateDate;
	private Date erDocApprovalDate;
	private String erDocEmergencyYn;
	private String erDocDeleteYn;
	private Date erDocUpdateDate;
	private String erDocStorage;
	private String erDocFilename;
	private List<Approver> approvers;
//	private approversList approvers;
}
