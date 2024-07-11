package com.project.npnc.attendance.model.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AttendanceEdit {
	private int attendanceEditKey;
	private String attendanceEditMember;
	private LocalDate attendanceEditDate;
	private LocalDate attendanceEditRequestDate;
	private String attendanceEditBeforeTime;
	private String attendanceEditAfterTime;
	private String attendanceEditRequest;
	private String attendanceEditOpinion;

}
