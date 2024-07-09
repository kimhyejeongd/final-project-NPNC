package com.project.npnc.attendance.model.service;

import java.util.List;
import java.util.Map;

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
	private final SqlSession session;
	
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

	@Override
	public int selectAttendanceByMemberKeyAndDate(Map ac) {
		
		return attendanceDao.selectAttendanceByMemberKeyAndDate(session, ac);
	}

	@Override
	public int selectAttendanceKeyByMemberKeyAndDate(Map ac) {
		
		return attendanceDao.selectAttendanceKeyByMemberKeyAndDate(session, ac);
	}
	
	
	
}
