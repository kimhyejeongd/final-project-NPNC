package com.project.npnc.document.model.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ApproverLineStorage {
	private int erApLineStorageKey;
	private String erApLineStorageName;
	private int memberKey; //"OWNER_MEMBER_KEY"
	private List<ApproverLine> approvers;
}
