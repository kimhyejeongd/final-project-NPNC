package com.project.npnc.attendance.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.attendance.model.dto.Attendance;

public interface AttendanceService {
	
	List<Attendance> selectAttendanceAll();
	Attendance selectAttendanceById(int memberKey);
	int selectAttendanceByMemberKeyAndDate(int memberKey);
	int selectAttendanceKeyByMemberKeyAndDate(int memberKey);
	List<Attendance> selectAttendanceToday();
	
	void updateAttendanceState(Attendance a,Map<Integer, Boolean> result);
	int insertAbsent(int memberKey);
	int startAttendance(Attendance a);
	int endAttendance(Attendance a);
	int checkAttendance(Attendance a);
}
