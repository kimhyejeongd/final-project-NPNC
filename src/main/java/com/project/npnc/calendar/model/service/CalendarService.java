package com.project.npnc.calendar.model.service;

import java.util.List;

import com.project.npnc.calendar.model.dto.Calendar;

public interface CalendarService {
	int insertCalendar(Calendar calendar);
	List<Calendar> selectAllByKey(int memberKey);
}
