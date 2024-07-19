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
	private int erApStorageKey;
	private String erApStorageName;
	private int memberKey;
	private int erApKey;
	private String erApTeamName;
	private String erApJobName;
	private String erApName;
	private String erApCategory;
	private String erApOrderby;
}
