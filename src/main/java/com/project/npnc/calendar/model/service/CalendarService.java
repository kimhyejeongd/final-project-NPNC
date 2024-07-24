package com.project.npnc.calendar.model.service;

import java.util.List;
import java.util.Map;

import com.project.npnc.calendar.model.dto.Calendar;

public interface CalendarService {
	int insertCalendar(Calendar calendar);
	List<Calendar> selectAllByKey(int memberKey);
	int updateCalendar(Calendar calendar);
	int selectLastInsertKey();
	int deleteCalendar(int calKey);
	int insertCalendarReference(int EmpKey,int calendarKey);
	List<Calendar> checkCalendar(Map<String,Object> param);
	
	
}
