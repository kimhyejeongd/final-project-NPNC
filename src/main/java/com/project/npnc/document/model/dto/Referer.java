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
	private String memberTeamKey;
	private String memberTeamName;
	private String memberJobKey;
	private String memberJobName;
	private String memberName;
	private int memberKey;
}
