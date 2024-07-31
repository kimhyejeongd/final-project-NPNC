package com.project.npnc.calendar.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.project.npnc.calendar.model.dao.CalendarDao;
import com.project.npnc.calendar.model.dto.Calendar;
import com.project.npnc.calendar.model.dto.Reservation;
import com.project.npnc.calendar.model.dto.ReserveItem;
import com.project.npnc.calendar.model.dto.Vacation;

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
	@Override
	public List<Reservation> selectReservationAll() {
		return dao.selectReservationAll(session);
	}
	@Override
	public int insertReservation(Reservation reservation) {
		return dao.insertReservation(session,reservation);
	}
	@Override
	public int deleteReservation(int itemKey) {
		return dao.deleteReservation(session,itemKey);
	}
	@Override
	public int updateReservation(Reservation reservation) {
		return dao.updateReservation(session,reservation);
	}
	@Override
	public int insertReCalendar(ReserveItem reserveItem) {
		return dao.insertReCalendar(session,reserveItem);
	}
	@Override
	public int insertRes(int calKey, int itemKey) {
		return dao.insertRes(session,calKey,itemKey);
	}
	@Override
	public List<ReserveItem> selectReserveAll() {
		return dao.selectReserveAll(session);
	}
	@Override
	public List<ReserveItem> selectMyReserve(int memberKey) {
		return dao.selectMyReserve(session,memberKey);
	}
	@Override
	public int updateReCalendar(ReserveItem reserveItem) {
		return dao.updateReCalendar(session, reserveItem);
	}
	@Override
	public List<Vacation> checkVacation(Map<String, Object> param) {
		return dao.checkVacation(session, param);
	}


}
