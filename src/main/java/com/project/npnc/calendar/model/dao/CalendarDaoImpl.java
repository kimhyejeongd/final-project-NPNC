package com.project.npnc.calendar.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.calendar.model.dto.Calendar;

@Repository
public class CalendarDaoImpl implements CalendarDao {

	@Override
	public int insertCalendar(SqlSession session, Calendar calendar) {
		return session.insert("calendar.insertCalendar",calendar);
	}

	@Override
	public int selectLastInsertKey(SqlSession session) {
		return session.selectOne("calendar.selectLastInsertKey");
	}

	@Override
	public int insertCalendarReference(SqlSession session, int empKey, int calendarKey) {
		Map<String,Object> param = Map.of("empKey",empKey,"calendarKey",calendarKey);
		System.out.println(calendarKey);
		return session.insert("calendar.insertCalendarReference",param);
	}

	@Override
	public void deleteCalendarRef(SqlSession session, int calendarKey) {
			session.delete("calendar.deleteCalendarRef",calendarKey);
		
	}

	@Override
	public int deleteCalendar(SqlSession session, int calKey) {
		return session.update("calendar.deleteByKey",calKey);
	}

	@Override
	public List<Calendar> selectAllByKey(SqlSession session, int memberKey) {
		return session.selectList("calendar.selectAllByKey",memberKey);
	}

	@Override
	public List<Calendar> checkCalendar(SqlSession session, Map<String, Object> param) {
		return session.selectList("calendar.checkcalendar",param);
	}

	@Override
	public int updateCalendar(SqlSession session, Calendar calendar) {
		return session.update("calendar.updateByKey",calendar);
	}

}
