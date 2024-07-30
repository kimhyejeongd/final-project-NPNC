package com.project.npnc.calendar.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.calendar.model.dto.Calendar;
import com.project.npnc.calendar.model.dto.Reservation;
import com.project.npnc.calendar.model.dto.ReserveItem;
import com.project.npnc.calendar.model.dto.Vacation;

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
	public int deleteReservation(SqlSession session, int itemKey) {
		return session.update("reservation.deleteReservation",itemKey);
	}

	@Override
	public int updateReservation(SqlSession session, Reservation reservation) {
		return session.update("reservation.updateReservation", reservation);
	}

	@Override
	public int insertReservation(SqlSession session, Reservation reservation) {
		return session.insert("reservation.insertReservation",reservation);
	}

	@Override
	public List<Reservation> selectReservationAll(SqlSession session) {
		return session.selectList("reservation.selectReservationAll");
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
	public int updateReCalendar(SqlSession session, ReserveItem reserveItem) {
		return session.update("calendar.updateReCalendar",reserveItem);
	}

	@Override
	public List<ReserveItem> selectMyReserve(SqlSession session, int memberKey) {
		return session.selectList("reservation.selectMyReserve",memberKey);
	}

	@Override
	public int deleteCalendar(SqlSession session, int calKey) {
		return session.update("calendar.deleteByKey",calKey);
	}

	@Override
	public List<ReserveItem> selectReserveAll(SqlSession session) {
		return session.selectList("reservation.selectReserveAll");
	}

	@Override
	public int insertRes(SqlSession session, int calKey, int itemKey) {
		Map<String,Object> param = Map.of("calKey",calKey,"itemKey",itemKey);
		return session.insert("reservation.insertRes",param);
	}

	@Override
	public List<Calendar> selectAllByKey(SqlSession session, int memberKey) {
		return session.selectList("calendar.selectAllByKey",memberKey);
	}

	@Override
	public int insertReCalendar(SqlSession session, ReserveItem reserveItem) {
		return session.insert("calendar.insertReCalendar",reserveItem);
	}

	@Override
	public List<Calendar> checkCalendar(SqlSession session, Map<String, Object> param) {
		return session.selectList("calendar.checkcalendar",param);
	}

	@Override
	public int updateCalendar(SqlSession session, Calendar calendar) {
		return session.update("calendar.updateByKey",calendar);
	}

	@Override
	public List<Vacation> checkVacation(SqlSession session, Map<String, Object> param) {
		return session.selectList("calendar.checkVacation",param);
	}

}
