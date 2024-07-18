package com.project.npnc.attendance.model.service;

import java.util.List;
import java.util.Map;

import com.project.npnc.attendance.model.dto.Attendance;
import com.project.npnc.attendance.model.dto.AttendanceEdit;

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

	//attendanceEdit
	int insertAttendanceEdit(AttendanceEdit ae);
 	List<AttendanceEdit> selectAttendanceEditById(String memberId,Map page);
 	int selectAttendanceEditCount(String memberId);
	AttendanceEdit selectAttendanceEditByKey(int attendanceEditKey);
	int deleteAttendanceEdit(int attendanceEditKey);
	
	//admin attendance
	List<Attendance> selectAdminAttendanceAll(Map page);
	int selectAdminAttendanceAllCount();
	List<AttendanceEdit> selectAdminAttendanceEditAll(Map page);
	int selectAdminAttendanceEditCount();
	
	
	
	
	
	
	
	
}
