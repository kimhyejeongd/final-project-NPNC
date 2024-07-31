package com.project.npnc.calendar.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Vacation {
	private int memberKey;
	private int vacationKey;
	private String title;
	private String start;
	private String end;
	private String backgroundColor;
	private String description;
	private String empName;
	private String deptName;
	


}
