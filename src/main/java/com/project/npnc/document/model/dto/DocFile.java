package com.project.npnc.document.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DocFile {
	private int fileKey;
	private String fileOriName;
	private String fileRename;
	private int erDocKey;
	private String erDocSerialKey;
	private String fileSize;
	private String fileForm;
	private Date fileUploadDate;
	private int fileOrderby;
	private int fileUploader;
	private Date fileUpdateDate;
	private int fileUpdater;
	private String fileUpdateReason;
}
