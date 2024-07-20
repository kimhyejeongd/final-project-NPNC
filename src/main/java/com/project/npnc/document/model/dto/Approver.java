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
public class Approver {
	private String erApproverKey;
	private int memberKey;
	private String memberTeamKey;
	private String memberTeamName;//join용
	private String memberJobKey;
	private String memberJobName;//join용
	private String memberName;
	private String category;
	private String state;
	private String opinion;
	private String erDocSerialKey;
	private Date date;
	private int orderby;
}
