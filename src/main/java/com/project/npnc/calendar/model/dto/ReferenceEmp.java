package com.project.npnc.calendar.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReferenceEmp {
	private int refEmpKey;
	private int refEmpNo;
	private String refEmpName;
	private String refDeptCode;
	private String refDeptName;
	private String refJobName;
	private String refDelete;
}
