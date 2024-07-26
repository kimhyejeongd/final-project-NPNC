package com.project.npnc.alarm.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.project.npnc.alarm.dao.AlarmDao;
import com.project.npnc.alarm.dto.AlarmMessage;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AlarmSerivceImpl implements AlarmService {
	
	private final AlarmDao alarmDao;
	private final SqlSession session;
	
	@Override
	public int alarmInsert(AlarmMessage alarm) {
		int result= alarmDao.alarmInsert(session, alarm);
		
		return result;
	}

	@Override
	public List<AlarmMessage> alarmSelectAll(int memberKey) {
		// TODO Auto-generated method stub
		List<AlarmMessage> result=alarmDao.alarmSelectAll(session, memberKey);
		return result;
	}

	@Override
	public int alarmDeleteAll(int memberKey) {
		// TODO Auto-generated method stub
		int result=alarmDao.alarmDeleteAll(session, memberKey);
		return 0;
	}

	@Override
	public int alarmDeleteOne(Map<String, Integer> param) {

		return alarmDao.alarmDeleteOne(session, param);
	}
	
}
