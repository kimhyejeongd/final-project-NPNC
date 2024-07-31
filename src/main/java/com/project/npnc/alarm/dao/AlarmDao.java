package com.project.npnc.alarm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.alarm.dto.AlarmMessage;
import com.project.npnc.member.model.dto.SrMember;

public interface AlarmDao {
	public List<AlarmMessage> alarmSelectAll(SqlSession session, int memberKey);
	public int alarmInsert(SqlSession session, AlarmMessage message);
	public int alarmDeleteAll(SqlSession session, int memberKey);
	public int alarmDeleteOne(SqlSession session, Map<String, Integer> param);
}
