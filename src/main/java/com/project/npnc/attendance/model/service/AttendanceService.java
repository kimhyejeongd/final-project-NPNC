package com.project.npnc.attendance.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

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
	
	List<Attendance> searchAttendance(Map searchMap,Map page);
	int searchAttendanceCount(Map searchMap);
	
	Map selectAttendanceMonthCount(Attendance a);

	//attendanceEdit
	int insertAttendanceEdit(AttendanceEdit ae);
 	List<AttendanceEdit> selectAttendanceEditById(String memberId,Map page);
 	int selectAttendanceEditCount(String memberId);
	AttendanceEdit selectAttendanceEditByKey(int attendanceEditKey);
	int deleteAttendanceEdit(int attendanceEditKey);
	
	List<AttendanceEdit> searchAttendanceEdit(Map<String,Object> searchMap,Map<String,Integer> page);
	int searchAttendanceEditCount(Map<String,Object> searchMap);
	
	//admin attendance
	List<Attendance> selectAdminAttendanceAll(Map page);
	int selectAdminAttendanceAllCount();
	List<AttendanceEdit> selectAdminAttendanceEditAll(Map page);
	int selectAdminAttendanceEditCount();
	int updateAttendanceEdit(AttendanceEdit attendanceEdit);
	int updateAttendance(AttendanceEdit attendanceEdit);
	List<Attendance> selectAdminAttendanceBymemberKey(int memberKey,Map page);
	int selectAdminAttendanceBymemberKeyCount(int memberKey);
	
	List<AttendanceEdit> searchAdminAttendanceEdit(Map<String,Object> searchMap,Map<String,Integer> page);
	int searchAdminAttendanceEditCount(Map<String,Object> searchMap);
	
	List<Attendance> searchAdminAttendance(Map<String,Object> searchMap, Map<String,Integer> page);
	int searchAdminAttendanceCount(Map<String,Object> searchMap);
	
}
