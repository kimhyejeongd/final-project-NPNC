package com.project.npnc.calendar.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReserveItem {
	private int calendarKey;
	private int reservationKey;
	private int memberKey;
	private int itemKey;
	private String itemType;
	private int itemMax;
	private String itemName;
	private String date;
	private int[] time;
	private String start;
	private String end;
}
