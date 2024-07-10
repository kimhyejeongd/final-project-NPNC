package com.project.npnc.calendar.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Calendar {
	private String _id;
	private int calendarKey;
	private int memberKey;
	private String title;
	private String start;
	private String end;
	private String description;
	private String type;
	private String username;
	private String backgroundColor;
	private String textColor;
	private boolean allDay;
}
