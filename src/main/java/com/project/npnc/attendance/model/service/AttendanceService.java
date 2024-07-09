package com.project.npnc.attendance.model.service;

import java.util.List;
import java.util.Map;

import com.project.npnc.attendance.model.dto.Attendance;

public interface AttendanceService {
	
	List<Attendance> selectAttendanceAll();
	Attendance selectAttendanceById(int memberKey);
	int selectAttendanceByMemberKeyAndDate(Map ac);
	int selectAttendanceKeyByMemberKeyAndDate(Map ac);

	
	int startAttendance(Attendance a);
	int endAttendance(Attendance a);
	int checkAttendance(Attendance a);
}
