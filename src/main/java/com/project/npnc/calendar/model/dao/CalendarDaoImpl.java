package com.project.npnc.calendar.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.calendar.model.dto.Calendar;

@Repository
public class CalendarDaoImpl implements CalendarDao {

	@Override
	public int insertCalendar(SqlSession session, Calendar calendar) {
		if(calendar.isAllDay()) {
			return session.insert("insertCalendar",calendar);
		}
		return session.insert("insertCalendar2",calendar);
	}

	@Override
	public List<Calendar> selectAllByKey(SqlSession session, int memberKey) {
		
		System.out.println(memberKey);
		return session.selectList("selectAllByKey",memberKey);
	}

}
