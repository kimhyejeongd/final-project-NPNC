package com.project.npnc.attendance.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.npnc.attendance.model.dto.Attendance;
import com.project.npnc.attendance.model.dto.AttendanceEdit;

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

	@Override
	public Attendance selectAttendanceByAttendanceKey(SqlSession session, int attendanceKey) {
		
		return session.selectOne("attendance.selectAttendanceByAttendanceKey",attendanceKey);
	}

	@Override
	public List<Attendance> searchAttendance(SqlSession session,Map<String, Object> searchMap, Map<String, Integer> page) {
		RowBounds rb=new RowBounds((page.get("cPage")-1)*page.get("numPerpage"),page.get("numPerpage"));
		return session.selectList("attendance.searchAttendance",searchMap,rb);
	}

	@Override
	public int searchAttendanceCount(SqlSession session,Map<String, Object> searchMap) {
		
		return session.selectOne("attendance.searchAttendanceCount",searchMap);
	}
	
	@Override
	public int selectAttendanceMonthCount(SqlSession session, Attendance a) {
		
		return session.selectOne("attendance.selectAttendanceMonthCount",a);
	}
	
	//attendanceEdit
	
	
	@Override
	public int insertAttendanceEdit(SqlSession session, AttendanceEdit ae) {
		
		return session.insert("attendance.insertAttendanceEdit",ae);
	}

	
	@Override
	public List<AttendanceEdit> selectAttendanceEditById(SqlSession session,String memberId,Map<String,Integer> page) {
		RowBounds rb=new RowBounds((page.get("cPage")-1)*page.get("numPerpage"),page.get("numPerpage"));
		return session.selectList("attendance.selectAttendanceEditById",memberId,rb);
	}

	@Override
	public int selectAttendanceEditCount(SqlSession session,String memberId) {
		
		return session.selectOne("attendance.selectAttendanceEditCount",memberId);
	}

	@Override
	public AttendanceEdit selectAttendanceEditByKey(SqlSession session, int attendanceEditKey) {
		
		return session.selectOne("attendance.selectAttendanceEditByKey",attendanceEditKey);
	}

	@Override
	public int deleteAttendanceEdit(SqlSession session,int attendanceEditKey) {
		
		return session.delete("attendance.deleteAttendanceEdit",attendanceEditKey);
	}

	@Override
	public List<AttendanceEdit> searchAttendanceEdit(SqlSession session, Map<String,Object> searchMap, Map<String, Integer> page) {
		RowBounds rb=new RowBounds((page.get("cPage")-1)*page.get("numPerpage"),page.get("numPerpage"));
		return session.selectList("attendance.searchAttendanceEdit",searchMap,rb);
	}

	@Override
	public int searchAttendanceEditCount(SqlSession session, Map<String,Object> searchMap) {
		
		return session.selectOne("attendance.searchAttendanceEditCount",searchMap);
	}
	
	
	//admin attendance
	
	@Override
	public List<Attendance> selectAdminAttendanceAll(SqlSession session, Map<String,Integer> page) {
		RowBounds rb=new RowBounds((page.get("cPage")-1)*page.get("numPerpage"),page.get("numPerpage"));
		return session.selectList("attendance.selectAdminAttendanceAll",null,rb);
	}

	@Override
	public int selectAdminAttendanceAllCount(SqlSession session) {
		
		return session.selectOne("attendance.selectAdminAttendanceAllCount");
	}

	@Override
	public List<AttendanceEdit> selectAdminAttendanceEditAll(SqlSession session, Map<String, Integer> page) {
		RowBounds rb=new RowBounds((page.get("cPage")-1)*page.get("numPerpage"),page.get("numPerpage"));
		return session.selectList("attendance.selectAdminAttendanceEditAll",null,rb);
	}

	@Override
	public int selectAdminAttendanceEditCount(SqlSession session) {

		return session.selectOne("attendance.selectAdminAttendanceEditCount");
	}

	@Override
	public int updateAttendanceEdit(SqlSession session,AttendanceEdit attendanceEdit) {
		
		return session.update("attendance.updateAttendanceEdit",attendanceEdit);
	}

	@Override
	public int updateAttendance(SqlSession session, AttendanceEdit attendanceEdit) {
		
		return session.update("attendance.updateAttendance",attendanceEdit);
	}

	@Override
	public int updateAttendanceEditState(SqlSession session, AttendanceEdit attendanceEdit) {
		// TODO Auto-generated method stub
		return session.update("attendance.updateAttendanceEditState",attendanceEdit);
	}

	@Override
	public List<Attendance> selectAdminAttendanceBymemberKey(SqlSession session, int memberKey,
			Map<String, Integer> page) {
		RowBounds rb=new RowBounds((page.get("cPage")-1)*page.get("numPerpage"),page.get("numPerpage"));
		return session.selectList("attendance.selectAdminAttendanceBymemberKey",null,rb);
	}

	@Override
	public int selectAdminAttendanceBymemberKeyCount(SqlSession session, int memberKey) {
		
		return session.selectOne("attendance.selectAdminAttendanceBymemberKeyCount",memberKey);
	}

	@Override
	public List<AttendanceEdit> searchAdminAttendanceEdit(SqlSession session, Map<String, Object> searchMap,
			Map<String, Integer> page) {
		RowBounds rb=new RowBounds((page.get("cPage")-1)*page.get("numPerpage"),page.get("numPerpage"));
		return session.selectList("attendance.searchAdminAttendanceEdit",searchMap,rb);
	}

	@Override
	public int searchAdminAttendanceEditCount(SqlSession session, Map<String, Object> searchMap) {
		
		return session.selectOne("attendance.searchAdminAttendanceEditCount",searchMap);
	}

	@Override
	public List<Attendance> searchAdminAttendance(SqlSession session, Map<String, Object> searchMap,
			Map<String, Integer> page) {
		RowBounds rb=new RowBounds((page.get("cPage")-1)*page.get("numPerpage"),page.get("numPerpage"));
		return session.selectList("attendance.searchAdminAttendance",searchMap,rb);
	}

	@Override
	public int searchAdminAttendanceCount(SqlSession session, Map<String, Object> searchMap) {
		
		return session.selectOne("attendance.searchAdminAttendanceCount",searchMap);
	}






	


	
	
	
	
	
	
	

	
	
	
}
