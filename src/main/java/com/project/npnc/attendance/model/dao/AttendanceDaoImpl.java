package com.project.npnc.attendance.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.attendance.model.dto.Attendance;

@Repository
public class AttendanceDaoImpl implements AttendanceDao {

	@Override
	public int startAttendance(SqlSession session, Attendance a) {

		return session.insert("attendance.startAttendance",a);
	}

	@Override
	public int endAttendance(SqlSession session, Attendance a) {
		
		return session.update("attendance.endAttendance",a);
	}

	@Override
	public Attendance selectAttendanceById(SqlSession session, int memberKey) {
		// TODO Auto-generated method stub
		return session.selectOne("attendance.selectAttendanceById",memberKey);
	}

	@Override
	public int selectAttendanceByMemberKeyAndDate(SqlSession session, int memberKey) {
		
		return session.selectOne("attendance.selectAttendanceByMemberKeyAndDate", memberKey);
	}

	@Override
	public int selectAttendanceKeyByMemberKeyAndDate(SqlSession session, int memberKey) {
		
		return session.selectOne("attendance.selectAttendanceKeyByMemberKeyAndDate", memberKey);
	}

	@Override
	public List<Attendance> selectAttendanceToday(SqlSession session) {
		
		return session.selectList("attendance.selectAttendanceToday");
	}

	@Override
	public int insertAbsent(SqlSession session, int memberKey) {
	
		return session.insert("attendance.insertAbsent",memberKey);
	}

	@Override
	public int updateAttendanceState(SqlSession session, Attendance a) {
		
		return session.update("attendance.updateAttendanceState",a);
	}

	@Override
	public Attendance selectAttendanceByMemberKey(SqlSession session, int memberKey) {
		
		return session.selectOne("attendance.selectAttendanceByMemberKey",memberKey);
	}

	@Override
	public List<Attendance> selectAttendanceAll(SqlSession session, Map<String,Integer> page,int memberKey) {
		RowBounds rb=new RowBounds((page.get("cPage")-1)*page.get("numPerpage"),page.get("numPerpage"));
		return session.selectList("attendance.selectAttendanceAll",memberKey,rb);
	}

	@Override
	public int selectAttendanceCount(SqlSession session,int memberKey) {
		
		return session.selectOne("attendance.selectAttendanceCount",memberKey);
	}

	
	
	

	
	
	
}
