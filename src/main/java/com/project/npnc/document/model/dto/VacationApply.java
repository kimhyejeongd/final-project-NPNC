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
public class VacationApply {
	private int vacationUseKey;
	private int vacationKey;
	private String vacationDocSerialKey;
	private Timestamp vacationApplyDate;
	private String vacationApplyStatus;
	private Timestamp vacationStartDate;
	private Timestamp vacationEndDate;
	private int vacationUseCount;
	private int vacationMemberKey;
	private String vacationReason;
	private int memberVacKey;
	private Date vacationUpdateDate;
}
