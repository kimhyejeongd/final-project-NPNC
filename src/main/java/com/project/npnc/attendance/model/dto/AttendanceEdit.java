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
	private Attendance attendance;
	private String attendanceEditMember;
	private LocalDate attendanceEditDate;
	private LocalDate attendanceEditRequestDate;
	private String attendanceEditStartEnd;
	private String attendanceEditBeforeTime;
	private String attendanceEditBeforeState;
	private String attendanceEditAfterTime;
	private String attendanceEditAfterState;
	private String attendanceEditRequest;
	private String attendanceEditOpinion;
	private String attendanceEditState;
 
}
