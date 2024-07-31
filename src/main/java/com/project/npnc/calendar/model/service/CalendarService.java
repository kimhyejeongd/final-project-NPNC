package com.project.npnc.calendar.model.service;

import java.util.List;
import java.util.Map;

import com.project.npnc.calendar.model.dto.Calendar;
import com.project.npnc.calendar.model.dto.Reservation;
import com.project.npnc.calendar.model.dto.ReserveItem;
import com.project.npnc.calendar.model.dto.Vacation;

public interface CalendarService {
	int insertCalendar(Calendar calendar);	
	List<Calendar> selectAllByKey(int memberKey);
	int updateCalendar(Calendar calendar);
	int selectLastInsertKey();
	int deleteCalendar(int calKey);
	int insertCalendarReference(int EmpKey,int calendarKey);
	List<Calendar> checkCalendar(Map<String,Object> param);
	
	List<Reservation> selectReservationAll();
	int insertReservation(Reservation reservation);
	int deleteReservation(int itemKey);
	int updateReservation(Reservation reservation);
	int insertReCalendar(ReserveItem reserveItem);
	int insertRes(int calKey, int itemKey);
	List<ReserveItem> selectReserveAll();
	List<ReserveItem> selectMyReserve(int memberKey);
	
	int updateReCalendar(ReserveItem reserveItem);
	List<Vacation> checkVacation(Map<String,Object> param);

}
