package com.project.npnc.document.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class vacationApply {
	private int vacationUseKey;
	private int vacationKey;
	private String vacationDocSerialKey;
	private Date vacationApplyDate;
	private Date vacationStartDate;
	private Date vacationEndDate;
	private int vacationUseCount;
	private String vacationApplyStatus;
	private int vacationMemberKey;
	private String vacationReason;
	private int memberVacKey;
}
