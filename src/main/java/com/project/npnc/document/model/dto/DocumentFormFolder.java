package com.project.npnc.document.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DocumentFormFolder {
	private String erFormFolderKey;
	private String erFormFolderName;
	private String[] erFormKey;
	private String erFormFolderOrderby;
}
