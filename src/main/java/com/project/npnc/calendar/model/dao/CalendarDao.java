package com.project.npnc.calendar.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.calendar.model.dto.Calendar;
import com.project.npnc.calendar.model.dto.Reservation;
import com.project.npnc.calendar.model.dto.ReserveItem;
import com.project.npnc.calendar.model.dto.Vacation;

public interface CalendarDao {
	int insertCalendar(SqlSession session,Calendar calendar);
	
	List<Calendar> selectAllByKey(SqlSession session,int memberKey);
	int updateCalendar(SqlSession session, Calendar calendar);
	int selectLastInsertKey(SqlSession session);
	int deleteCalendar(SqlSession session, int calKey);
	int insertCalendarReference(SqlSession session,int empKey, int calendarKey);
	
	void deleteCalendarRef(SqlSession session, int calendarKey);
	List<Calendar> checkCalendar(SqlSession session,Map<String,Object> param);
	List<Reservation> selectReservationAll(SqlSession session);
	int insertReservation(SqlSession session, Reservation reservation);
	int deleteReservation(SqlSession session,int itemKey);
	int updateReservation(SqlSession session, Reservation reservation);
	int insertReCalendar(SqlSession session,ReserveItem reserveItem);
	int insertRes(SqlSession session,int calKey, int itemKey);
	List<ReserveItem> selectReserveAll(SqlSession session);
	List<ReserveItem> selectMyReserve(SqlSession session, int memberKey);
	int updateReCalendar(SqlSession session,ReserveItem reserveItem);
	
	List<Vacation> checkVacation(SqlSession session, Map<String,Object> param);
}
