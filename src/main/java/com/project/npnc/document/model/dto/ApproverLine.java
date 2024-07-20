package com.project.npnc.document.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ApproverLine {
	private int erApLineKey;
	private int erApLineStorageKey;
	private int memberKey;
	private int erApTeamKey;
	private String erApTeamName; //join용
	private int erApJobKey;
	private String erApJobName; //join용
	private String erApName;
	private String erApCategory;
	private String erApOrderby;
}
