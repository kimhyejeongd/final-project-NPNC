package com.project.npnc.external.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ExternalDto {
	
	private int AB_EXTERNAL_KEY; //외부 주소록 고유번호
	private String MEMBER_KEY; //멤버고유번호
	private String AB_EXTERNAL_NAME; //이름
	private String AB_EXTERNAL_TELL; //전화번호
	private String AB_EXTERNAL_EMAIL; //이메일
	private String AB_EXTERNAL_GENDER; //성별
	private String AB_EXTERNAL_DEPARTMENT; //부서
	private String AB_EXTERNAL_JOB; //직급
	private String AB_EXTERNAL_MEMO; //메모
	private String AB_EXTERNAL_BOOKMARK; //즐겨찾기
	private String AB_EXTERNAL_COMPANY; //회사명
	private String AB_EXTERNAL_DELETE; //삭제여부
	
}
