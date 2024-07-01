package com.project.npnc.document.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DocumentStorage {
	private String erStorageKey;
	private String erStorageFolerKey;
	private String erStorageName;
	private String erStorageTerm;
	private String erStorageManager;
	private String erStorageOrderby;
}
