package com.project.npnc.member.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Member {
	private int memberKey;
	private String departmentKey;
	private String jobKey;
	private String memberId;
	private String memberPw;
	private String memberPhone;
	private String memberEmail;
	private String memberMessage;
	private Date enrollDate;
	private Date memberLeaveDate;
	private String memberTell;
	private String memberAddress;
	private int accessKey;
	private String memberName;
	private String memberGender;
	private String memberState;
	private Date memberBirthdate;
}
