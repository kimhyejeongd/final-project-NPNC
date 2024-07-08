package com.project.npnc.attendance.model.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import com.project.npnc.admin.member.model.dto.AdminMember;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Attendance {
	private int attenanceKey;
	private AdminMember member;
	private LocalDate attendanceDate;
	private LocalDateTime attendanceStart;
	private LocalDateTime attendanceEnd;
	private String attendanceState;
	private int overtimeKey;
	
	
	
}
