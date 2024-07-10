package com.project.npnc.attendance.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.attendance.model.dto.Attendance;


public interface AttendanceDao {

	List<Attendance> selectAttendanceAll(SqlSession session);
	Attendance selectAttendanceById(SqlSession session,int memberKey);
	Attendance selectAttendanceByMemberKey(SqlSession session,int memberKey);
	
	List<Attendance> selectAttendanceToday(SqlSession session);
	int selectAttendanceByMemberKeyAndDate(SqlSession session,int memberKey);
	int selectAttendanceKeyByMemberKeyAndDate(SqlSession session,int memberKey);
	
	int updateAttendanceState(SqlSession session,Attendance a);
	int insertAbsent(SqlSession session,int memberKey);
	int startAttendance(SqlSession session, Attendance a);
	int endAttendance(SqlSession session, Attendance a);
	int checkAttendance(SqlSession session, Attendance a);
	
}
