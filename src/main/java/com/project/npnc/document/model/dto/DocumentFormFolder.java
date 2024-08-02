package com.project.npnc.document.model.dto;

import java.sql.Date;

import com.project.npnc.security.dto.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DocumentFormFolder {
	private int erFormFolderKey;
	private String erFormFolderName;
	private int erFormFolderCreater;
	private Date erFormFolderCreateDate;
	private int erFormFolderUpdater;
	private Date erFormFolderUpdateDate;
	private int erFormFolderOrderBy;
	private String[] erFormKey;
	private String erFormFolderOrderby;
}