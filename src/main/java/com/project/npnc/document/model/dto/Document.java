package com.project.npnc.document.model.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.annotation.Transient;
import org.springframework.web.multipart.MultipartFile;

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
	private List<Approver> approvers = new ArrayList<Approver>();
	private List<DocFile> files = new ArrayList<DocFile>();
//	private List<MultipartFile> multifiles = new ArrayList<MultipartFile>();
	private List<Referer> referers = new ArrayList<Referer>();
}
