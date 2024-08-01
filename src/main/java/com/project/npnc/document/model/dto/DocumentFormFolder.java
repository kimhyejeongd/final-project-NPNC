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
public class DocumentFormFolder {
	private String erFormFolderKey;
	private String erFormFolderName;
	private int erFormFolderCreater;
	private Date erFormFolderCreateDate;
	private int erFormFolderUpdater;
	private Date erFormFolderUpdateDate;
	private int erFormFolderOrderBy;
	private String[] erFormKey;
	private String erFormFolderOrderby;
}