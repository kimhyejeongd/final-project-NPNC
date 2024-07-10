package com.project.npnc.attendance.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.npnc.attendance.model.dao.AttendanceDao;
import com.project.npnc.attendance.model.dto.Attendance;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AttendanceServiceImpl implements AttendanceService {

	private final AttendanceDao attendanceDao;
	private SqlSession session;
	
	@Override
	public int startAttendance(Attendance a) {

		return attendanceDao.startAttendance(session, a);
	}

	@Override
	public int endAttendance(Attendance a) {

		return attendanceDao.endAttendance(session, a);
	}

	@Override
	public int checkAttendance(Attendance a) {

		return attendanceDao.checkAttendance(session, a);
	}

	@Override
	public List<Attendance> selectAttendanceAll() {
		
		return attendanceDao.selectAttendanceAll(session);
	}

	@Override
	public Attendance selectAttendanceById(int memberKey) {

		return attendanceDao.selectAttendanceById(session, memberKey);
	}
	
	
	
}
