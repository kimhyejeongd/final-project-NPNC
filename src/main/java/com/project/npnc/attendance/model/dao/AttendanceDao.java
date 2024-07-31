package com.project.npnc.attendance.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.admin.member.model.dto.AdminMember;
import com.project.npnc.attendance.model.dto.Attendance;
import com.project.npnc.attendance.model.dto.AttendanceEdit;


public interface AttendanceDao {


	Attendance selectAttendanceById(SqlSession session,int memberKey);
	Attendance selectAttendanceByMemberKey(SqlSession session,int memberKey);
	
	List<Attendance> selectAttendanceToday(SqlSession session);
	int selectAttendanceByMemberKeyAndDate(SqlSession session,int memberKey);
	int selectAttendanceKeyByMemberKeyAndDate(SqlSession session,int memberKey);
	
	List<Attendance> selectAttendanceAll(SqlSession session,Map<String,Integer> page,int memberKey);
	int selectAttendanceCount(SqlSession session,int memberKey);
	
	Attendance selectAttendanceByAttendanceKey(SqlSession session,int attendanceKey);
	int updateAttendanceState(SqlSession session,Attendance a);
	int insertAbsent(SqlSession session,int memberKey);
	int startAttendance(SqlSession session, Attendance a);
	int endAttendance(SqlSession session, Attendance a);
	
	List<Attendance> searchAttendance(SqlSession session,Map<String,Object> searchMap,Map<String,Integer> page);
	int searchAttendanceCount(SqlSession session,Map<String,Object> searchMap);
	
	int selectAttendanceMonthCount(SqlSession session,Attendance a);
	
	//attendanceEdit
	int insertAttendanceEdit(SqlSession session,AttendanceEdit ae);
	List<AttendanceEdit> selectAttendanceEditById(SqlSession session,String memberId,Map<String,Integer> page);
	int selectAttendanceEditCount(SqlSession session,String memberId);
	AttendanceEdit selectAttendanceEditByKey(SqlSession session,int attendanceEditKey);
	int deleteAttendanceEdit(SqlSession session,int attendanceEditKey);
	
	List<AttendanceEdit> searchAttendanceEdit(SqlSession session,Map<String,Object> searchMap,Map<String,Integer> page);
	int searchAttendanceEditCount(SqlSession session,Map<String,Object> searchMap);
	
	//admin attendacne
	List<Attendance> selectAdminAttendanceAll(SqlSession session,Map<String,Integer> page);
	int selectAdminAttendanceAllCount(SqlSession session);
	List<AttendanceEdit> selectAdminAttendanceEditAll(SqlSession session,Map<String,Integer> page);
	int selectAdminAttendanceEditCount(SqlSession session);
	int updateAttendanceEdit(SqlSession session,AttendanceEdit attendanceEdit);
	int updateAttendance(SqlSession session,AttendanceEdit attendanceEdit);
	int updateAttendanceEditState(SqlSession session,AttendanceEdit attendanceEdit);
	List<Attendance> selectAdminAttendanceBymemberKey(SqlSession session,int memberKey,Map<String,Integer> page);
	int selectAdminAttendanceBymemberKeyCount(SqlSession session,int memberKey);
	
	List<AttendanceEdit> searchAdminAttendanceEdit(SqlSession session,Map<String,Object> searchMap,Map<String,Integer> page);
	int searchAdminAttendanceEditCount(SqlSession session,Map<String,Object> searchMap);
	
	List<Attendance> searchAdminAttendance(SqlSession session,Map<String,Object> searchMap, Map<String,Integer> page);
	int searchAdminAttendanceCount(SqlSession session,Map<String,Object> searchMap);
	
	
	
}
