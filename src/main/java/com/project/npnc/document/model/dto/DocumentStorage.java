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
public class DocumentStorage {
	private String erStorageKey;
	private String erFolerKey;
	private String erStorageFolderKey;
	private String erStorageName;
	private String erStorageManager;
	private String erStorageOrderby;
}
