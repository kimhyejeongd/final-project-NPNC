package com.project.npnc.alarm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.alarm.dto.AlarmMessage;

@Repository
public class AlarmDaoImpl implements AlarmDao {

	@Override
	public List<AlarmMessage> alarmSelectAll(SqlSession session, int memberKey) {
		List<AlarmMessage> result= session.selectList("alarm.alarmSelectAll", memberKey);
		return result;
	}

	@Override
	public int alarmDeleteAll(SqlSession session, int memberKey) {
		// TODO Auto-generated method stub
		return session.update("alarm.alarmDeleteAll", memberKey);
	}

	@Override
	public int alarmInsert(SqlSession session, AlarmMessage message) {
		int result =session.insert("alarm.alarmInsert", message);
		
		return result;
	}

	@Override
	public int alarmDeleteOne(SqlSession session, Map<String, Integer> param) {
		
		return session.update("alarm.alarmDeleteOne", param);
	}
	
}
