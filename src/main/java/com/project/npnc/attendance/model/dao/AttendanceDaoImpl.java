package com.project.npnc.attendance.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.attendance.model.dto.Attendance;

@Repository
public class AttendanceDaoImpl implements AttendanceDao {

	@Override
	public int startAttendance(SqlSession session, Attendance a) {

		return session.update("attendance.startAttendance",a);
	}

	@Override
	public int endAttendance(SqlSession session, Attendance a) {
		
		return session.update("attendance.endAttendance",a);
	}

	@Override
	public int checkAttendance(SqlSession session, Attendance a) {
	
		return session.update("attendance.checkAttendance",a);
	}

	@Override
	public List<Attendance> selectAttendanceAll(SqlSession session) {
		
		return session.selectList("attendance.selectAttendanceAll");
	}

	@Override
	public Attendance selectAttendanceById(SqlSession session, int memberKey) {
		// TODO Auto-generated method stub
		return session.selectOne("attendance.selectAttendanceById",memberKey);
	}



	
	
	
}
