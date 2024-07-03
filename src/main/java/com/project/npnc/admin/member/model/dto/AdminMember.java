package com.project.npnc.admin.member.model.dto;

import java.sql.Date;

import com.project.npnc.admin.department.model.dto.Department;
import com.project.npnc.admin.job.model.dto.Job;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminMember {
	private int memberKey;
	private Department department;
	private Job job;
	private String memberId;
	private String memberPw;
	private String memberPhone;
	private String memberEmail;
	private String memberMessage;
	private Date memberEnrollDate;
	private Date memberLeaveDate;
	private String memberTell;
	private String memberAddress;
	private int accessKey;
	private String memberName;
	private String memberGender;
	private String memberState;
	private Date memberBirthdate;
}
