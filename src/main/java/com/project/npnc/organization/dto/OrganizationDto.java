package com.project.npnc.organization.dto;

import java.sql.Date;
import java.util.List;

import com.project.npnc.member.model.dto.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrganizationDto {
	private String departmentKey;
	private String departmentName;
	private List<Member> memberlist;
}
