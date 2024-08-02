package com.project.npnc.document.model.dto;

import java.sql.Date;

import com.project.npnc.admin.department.model.dto.Department;
import com.project.npnc.admin.job.model.dto.Job;
import com.project.npnc.security.dto.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DocumentForm {
	private int erFormKey;
	private String erFormName;
	private int erFormCreater;
	private Date erFormCreateDate;
	private int erFormFolderKey;
	private String erFormYn;
	private int erFormUpdater;
	private Date erFormUpdateDate;
	private String erFormOrderby;
	private String erDocFileName;
	private Department department;
	private Member member;
	private Job job;
}
