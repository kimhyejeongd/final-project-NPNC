package com.project.npnc.calendar.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.calendar.model.dto.Calendar;

public interface CalendarDao {
	int insertCalendar(SqlSession session,Calendar calendar);
	List<Calendar> selectAllByKey(SqlSession session,int memberKey);
	int updateCalendar(SqlSession session, Calendar calendar);
	int selectLastInsertKey(SqlSession session);
	int deleteCalendar(SqlSession session, int calKey);
}
