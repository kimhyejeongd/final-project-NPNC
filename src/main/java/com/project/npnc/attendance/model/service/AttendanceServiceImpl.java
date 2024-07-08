package com.project.npnc.attendance.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.npnc.attendance.model.dao.AttendanceDao;
import com.project.npnc.attendance.model.dto.Attendance;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AttendanceServiceImpl implements AttendanceService {

	private final AttendanceDao attendancdDao;
	private SqlSession session;
	
	@Override
	public int startAttendance(Attendance a) {

		return 0;
	}

	@Override
	public int endAttendance(Attendance a) {

		return 0;
	}

	@Override
	public int checkAttendance(Attendance a) {

		return 0;
	}
	
	
}
