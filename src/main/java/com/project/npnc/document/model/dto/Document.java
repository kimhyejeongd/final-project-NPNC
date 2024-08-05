package com.project.npnc.document.model.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
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
	private String writerDeptKey;//join용 writer_name memeberTable
	private String writer;
	private String writerDeptName;//join용 writer_dept_name
	private String writerJobKey;//join용 writer_job_key
	private String writerJobName;//join용 writer_job_name
	
	@NotNull(message = "문서 제목은 필수 입력 항목입니다.")
	@NotBlank(message = "문서 제목은 필수 입력 항목입니다.")
	private String erDocTitle;
	private Date erDocCreateDate;
	private String erDocEmergencyYn;
	private String erDocDeleteYn;
	@NotNull(message = "보관함은 필수 선택 항목입니다.")
	@Min(value = 1, message = "보관함은 필수 선택 항목입니다.")
	private int erDocStorageKey; //보관함 pk
	private String erDocStorageName; //join용 이름
	private int erDocStorageTerm; //join용
	private String erDocStorageFolderName; //join용 이름
	private String erDocFilename;
	private String erDocState;
	private Date erDocStateUpdateDate;
	private int erDocLastUpdater;
	private Date erDocUpdateDate;
	private String erDocUpdateReason;
	private Date erDocCompleteDate;
	private int docFormKey;
	private List<Approver> approvers = new ArrayList<Approver>();
	private List<DocFile> files = new ArrayList<DocFile>();
//	private List<MultipartFile> multifiles = new ArrayList<MultipartFile>();
	private List<Referer> referers = new ArrayList<Referer>();
}
