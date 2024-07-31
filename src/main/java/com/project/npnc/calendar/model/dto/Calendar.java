package com.project.npnc.calendar.model.dto;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Calendar {
	private int calendarKey;
	//memberKey
	private int _id;
	private int empNo;
	private String empName;
	private String deptCode;
	private int type;
	private String title;
	private String start;
	private String end;
	private String description;
	private String backgroundColor;
	private String allDay;
	private Date update;
	private Date enroll;
	private String delete;
	private List<ReferenceEmp> selectedMembers;
}
