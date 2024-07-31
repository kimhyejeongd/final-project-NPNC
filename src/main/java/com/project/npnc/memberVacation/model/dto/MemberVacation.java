package com.project.npnc.memberVacation.model.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberVacation {
	private int memberVacKey;
	private int memberKey;
	private int memberVacTotal;
	private String memberVacYear;
	private int memberVacUsed;
	private int memberVacRemaining;
	private Date memberEnrollDate;
}
