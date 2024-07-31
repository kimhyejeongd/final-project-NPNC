package com.project.npnc.document.model.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OvertimeApply {
	private int overtimeKey;
	private String erDocSerialKey;
	private Date overtimeApplyDate;
	private Date overtimeDate;
	private String overtimeReason;
	private String overtimeStatus;
	private Timestamp overtimeStartTime;
	private Timestamp overtimeEndTime;
	private int overtimeMemberKey;
	private String overtimeCategory;
	private Date overtimeUpdateDate;
}
