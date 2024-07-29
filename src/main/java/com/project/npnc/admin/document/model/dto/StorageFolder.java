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
	   private int folderKey;
	    private String folderName;
	    private int folderGroup;
	    private int folderLevel;
	    private String useYn;
	    private int folderOrderBy;
}
