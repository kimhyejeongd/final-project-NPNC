package com.project.npnc.document.model.dto;

import java.sql.Date;

import com.project.npnc.admin.department.model.dto.Department;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DocumentForm {
	private String erFormKey;
	private String erFormName;
	private String erFormCreater;
	private Date erFormCreateDate;
	private int erFormFolderKey;
	private String erFormYn;
	private String erFormUpdater;
	private Date erFormUpdateDate;
	private String erFormOrderby;
	private String erDocFileName;
	private Department department;
}
