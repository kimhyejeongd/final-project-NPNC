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
	private String memberTeam;
	private String memberJob;
	private String memberName;
	private int memberKey;
}
