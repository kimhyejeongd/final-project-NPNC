package com.project.npnc.attendance.model.service;

import java.util.List;

import com.project.npnc.attendance.model.dto.Attendance;

public interface AttendanceService {
	int startAttendance(Attendance a);
	int endAttendance(Attendance a);
	int checkAttendance(Attendance a);
}
