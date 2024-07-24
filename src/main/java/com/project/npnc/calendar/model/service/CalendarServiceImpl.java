package com.project.npnc.calendar.model.service;

import java.util.List;
import java.util.Map;

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
	@Override
	public int updateCalendar(Calendar calendar) {
		System.out.println(calendar);
		int result =  dao.updateCalendar(session,calendar);
			dao.deleteCalendarRef(session,calendar.getCalendarKey());
			
			for(int i=0; i<calendar.getSelectedMembers().size();i++) {
				dao.insertCalendarReference(session,calendar.getSelectedMembers().get(i).getRefEmpNo(),calendar.getCalendarKey());
			}
			return result;
	}
	@Override
	public int selectLastInsertKey() {
		return dao.selectLastInsertKey(session);
	}
	@Override
	public int deleteCalendar(int calKey) {
		return dao.deleteCalendar(session, calKey);
	}
	@Override
	public int insertCalendarReference(int empKey, int calendarKey) {
		return dao.insertCalendarReference(session, empKey,calendarKey);
	}
	@Override
	public List<Calendar> checkCalendar(Map<String, Object> param) {
		return dao.checkCalendar(session, param);
	}

}
