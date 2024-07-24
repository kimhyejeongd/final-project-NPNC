package com.project.npnc.common;

import org.springframework.core.convert.converter.Converter;
import org.springframework.web.multipart.MultipartFile;

import com.project.npnc.document.model.dto.DocFile;

public class MultipartFileToDocFileConverter implements Converter<MultipartFile, DocFile> {
	 @Override
	    public DocFile convert(MultipartFile file) {
	        DocFile docFile = new DocFile();
	        docFile.setFileOriName(file.getOriginalFilename());
	        return docFile;
	    }
}
