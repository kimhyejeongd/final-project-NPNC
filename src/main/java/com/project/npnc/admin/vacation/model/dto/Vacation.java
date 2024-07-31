package com.project.npnc.admin.vacation.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Vacation {
	private int vacationKey;
	private String vacationName;
	private String vacationCalcYN;	
}
