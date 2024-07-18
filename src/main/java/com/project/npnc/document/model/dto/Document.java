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
	private int erDocKey;
	private String erDocSerialKey;
	private int erDocWriter;
	private String erDocTitle;
	private Date erDocCreateDate;
	private String erDocEmergencyYn;
	private String erDocDeleteYn;
	private String erDocStorage;
	private String erDocFilename;
	private String erDocState;
	private Date erDocStateUpdateDate;
	private int erDocLastUpdater;
	private Date erDocUpdateDate;
	private String erDocUpdateReason;
	private List<Approver> approvers;
	private List<DocFile> files;
	private List<Referer> referers;
}
