package com.project.npnc.attendance.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.attendance.model.dto.Attendance;


public interface AttendanceDao {

	List<Attendance> selectAttendanceAll();
	Attendance selectAttendanceById();
	
	
	int startAttendance(SqlSession session, Attendance a);
	int endAttendance(SqlSession session, Attendance a);
	int checkAttendance(SqlSession session, Attendance a);
	
}
