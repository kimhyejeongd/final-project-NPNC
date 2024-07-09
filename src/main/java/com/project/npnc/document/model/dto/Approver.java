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
	//private String approvalMemberKey;
	private int memberKey;
	private String memberTeam;
	private String memberJob;
	private String memberName;
	private String category;
	private String state;
	private String opinion;
	private String erDocKey;
	private Date date;
	private int orderby;
}
