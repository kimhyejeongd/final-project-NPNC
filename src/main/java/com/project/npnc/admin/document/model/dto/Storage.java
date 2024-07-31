package com.project.npnc.admin.document.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Storage {
	private int storageKey;
	private int storageFolderKey;
	private String storageName;
	private int storageTerm;
	private int storageManager;
	private int storageOrderBy;
	private String oriName;
}
