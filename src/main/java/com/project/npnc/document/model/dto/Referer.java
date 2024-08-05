package com.project.npnc.document.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Referer {
	private int erRefererKey;
	private String erDocSerialKey;
	private String memberTeamKey; //ER_REFERER_TEAM_KEY
	private String memberTeamName; //ER_REFERER_TEAM_NAME
	private String memberJobKey; //ER_REFERER_JOB_KEY
	private String memberJobName; //ER_REFERER_JOB_NAME
	private String memberName; //ER_REFERER_NAME
	private int memberKey;
}
