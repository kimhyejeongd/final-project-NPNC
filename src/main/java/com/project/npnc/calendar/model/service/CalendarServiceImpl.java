package com.project.npnc.calendar.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.project.npnc.calendar.model.dao.CalendarDao;
import com.project.npnc.calendar.model.dto.Calendar;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CalendarServiceImpl implements CalendarService {
	
	private final CalendarDao dao;
	private final SqlSession session;
	@Override
	public int insertCalendar(Calendar calendar) {
		return dao.insertCalendar(session, calendar);
	}
	@Override
	public List<Calendar> selectAllByKey(int memberKey) {
		return dao.selectAllByKey(session,memberKey);
	}

}
