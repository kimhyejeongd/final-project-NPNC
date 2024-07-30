package com.project.npnc.calendar.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Reservation {
	private int reservationKey;
	private int itemKey;
	private String itemType;
	private String itemName;
	private int itemMax;
	private String itemUse;
	private String itemCreator;
	private Date itemCreateDate;
	private String delete;
}
