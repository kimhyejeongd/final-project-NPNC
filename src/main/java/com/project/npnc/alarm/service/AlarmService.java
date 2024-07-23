package com.project.npnc.alarm.service;

import java.util.List;
import java.util.Map;

import com.project.npnc.alarm.dto.AlarmMessage;

public interface AlarmService {

	public int alarmInsert(AlarmMessage alarm);
	public List<AlarmMessage> alarmSelectAll(int memberKey);
	public int alarmDeleteAll(int memberKey);
	public int alarmDeleteOne(Map<String, Integer> param);
}
