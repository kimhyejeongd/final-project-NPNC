package com.project.npnc.calendar.model.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class WeekCalendar {
	private int calendarKey;
	private int memberKey;
	private int type;
	private String title;
	private String start;
	private String end;
	private String description;
	private String backgroundColor;
	private String allDay;
//	private Date startDate;
//	private Date endDate;
}
