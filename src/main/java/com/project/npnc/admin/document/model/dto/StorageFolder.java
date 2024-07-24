package com.project.npnc.admin.document.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class StorageFolder {
	   private Long folderKey;
	    private String folderName;
	    private Long parentFolderKey;
	    private int folderLevel;
	    private char useYn;
}