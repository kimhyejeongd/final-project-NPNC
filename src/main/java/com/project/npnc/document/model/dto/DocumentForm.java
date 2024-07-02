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
public class DocumentForm {
	private String erFormKey;
	private String erFormName;
	private String erFormUpdater;
	private String erFormYn;
	private String erFormOrderby;
	private Date erFormUpdateDate;
}
