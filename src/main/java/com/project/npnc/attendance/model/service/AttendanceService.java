package com.project.npnc.attendance.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.attendance.model.dto.Attendance;

public interface AttendanceService {
	
	Attendance selectAttendanceById(int memberKey);
	int selectAttendanceByMemberKeyAndDate(int memberKey);
	int selectAttendanceKeyByMemberKeyAndDate(int memberKey);
	List<Attendance> selectAttendanceToday();
	
	List<Attendance> selectAttendanceAll(Map page,int memberKey);
	int selectAttendanceCount(int memberKey);
	Attendance selectAttendanceByMemberKey(int memberKey);	
	
	
	Attendance selectAttendanceByAttendanceKey(int attendanceKey);
	void updateAttendanceState(Attendance a,Map<Integer, Boolean> result);
	int insertAbsent(int memberKey);
	int startAttendance(Attendance a);
	int endAttendance(Attendance a);

}
