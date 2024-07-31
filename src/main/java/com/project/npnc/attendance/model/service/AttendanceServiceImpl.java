package com.project.npnc.attendance.model.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.project.npnc.admin.member.model.dto.AdminMember;
import com.project.npnc.attendance.model.dao.AttendanceDao;
import com.project.npnc.attendance.model.dto.Attendance;
import com.project.npnc.attendance.model.dto.AttendanceEdit;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AttendanceServiceImpl implements AttendanceService {

	private final AttendanceDao attendanceDao;
	private final SqlSession session;
	
	
	
	//메인화면 출근퇴근
	
	@Override
	public int startAttendance(Attendance a) {
		
		return attendanceDao.startAttendance(session, a);
	}

	@Override
	public int endAttendance(Attendance a) {
		
		return attendanceDao.endAttendance(session, a);
	}


	@Override
	public Attendance selectAttendanceById(int memberKey) {

		return attendanceDao.selectAttendanceById(session, memberKey);
	}

	@Override
	public int selectAttendanceByMemberKeyAndDate(int memberKey) {
		
		return attendanceDao.selectAttendanceByMemberKeyAndDate(session, memberKey);
	}

	@Override
	public int selectAttendanceKeyByMemberKeyAndDate(int memberKey) {
		
		return attendanceDao.selectAttendanceKeyByMemberKeyAndDate(session, memberKey);
	}

	@Override
	public List<Attendance> selectAttendanceToday() {

		return attendanceDao.selectAttendanceToday(session);
	}

	@Override
	public int insertAbsent(int memberKey) {
		
		return attendanceDao.insertAbsent(session, memberKey);
	}

	@Override
	public void updateAttendanceState(Attendance a,Map<Integer, Boolean> result) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		result.forEach((key, value) -> {

		    if (value) {
			    	int startHour;
			    	int endHour;
			    	Attendance at=selectAttendanceByMemberKey(key);
			    	a.setMember(AdminMember.builder().memberKey(key).build());
			    	if(at.getAttendanceEnd()==null) {
			    		a.setAttendanceState("결근");
			    	}else {
				    	try {		    			    	
				    	Date startTime=sdf.parse(at.getAttendanceStart());
				    	Date endTime=sdf.parse(at.getAttendanceEnd());
				    	
				    	Calendar startCal= Calendar.getInstance();
				    	startCal.setTime(startTime);
				    	startHour=startCal.get(Calendar.HOUR_OF_DAY);
				    	
				    	Calendar endCal= Calendar.getInstance();
				    	endCal.setTime(endTime);
				    	endHour=endCal.get(Calendar.HOUR_OF_DAY);
				    			
				    	if(startHour<9 && endHour>18) {
				    		a.setAttendanceState("출근");
				    	}else if(startHour<9 && endHour<18) {
				    		a.setAttendanceState("조퇴");
				    	}else if(startHour>16) {
				    		a.setAttendanceState("결근");
				    	}else if(startHour>9 && endHour>18) {
				    		a.setAttendanceState("지각");
				    	}else if(startHour>9 && endHour<18) {
				    		a.setAttendanceState("조퇴");
				    	}

				    	}catch(ParseException e) {
				    		e.printStackTrace();
				    	}
			    	}
			    	attendanceDao.updateAttendanceState(session, a);
		    	

		    }else {
		    	attendanceDao.insertAbsent(session, key);
//		    	insertAbsent(key);
		    }
		    	 
		});

	}
	
	@Override
	public Attendance selectAttendanceByMemberKey(int memberKey) {
		Attendance a=attendanceDao.selectAttendanceByMemberKey(session,memberKey);
		Attendance na=Attendance.builder().build();
		if(a==null) {
			a=na;
		}
		return a;
	}

	
	// 사원 근태관리 화면
	
	
	@Override
	public List<Attendance> selectAttendanceAll(Map page,int memberKey) {

		return attendanceDao.selectAttendanceAll(session, page,memberKey);
	}

	@Override
	public int selectAttendanceCount(int memberKey) {

		return attendanceDao.selectAttendanceCount(session,memberKey);
	}

	@Override
	public Attendance selectAttendanceByAttendanceKey(int attendanceKey) {
		
		return attendanceDao.selectAttendanceByAttendanceKey(session, attendanceKey);
	}

	@Override
	public List<Attendance> searchAttendance(Map searchMap, Map page) {
		
		return attendanceDao.searchAttendance(session,searchMap, page);
	}

	@Override
	public int searchAttendanceCount(Map searchMap) {
		
		return attendanceDao.searchAttendanceCount(session,searchMap);
	}
	
	@Override
	public Map<String,Integer> selectAttendanceMonthCount(Attendance a) {
		Map<String,Integer> attendanceCount=new HashMap<>();
		a.setAttendanceState("출근");
		attendanceCount.put("gotowork",attendanceDao.selectAttendanceMonthCount(session, a));
		
		a.setAttendanceState("결근");
		attendanceCount.put("absent",attendanceDao.selectAttendanceMonthCount(session, a));
		
		a.setAttendanceState("휴가");
		attendanceCount.put("vaca",attendanceDao.selectAttendanceMonthCount(session, a));
		
		a.setAttendanceState("지각");
		attendanceCount.put("late",attendanceDao.selectAttendanceMonthCount(session, a));
		
		a.setAttendanceState("조퇴");
		attendanceCount.put("ealryLeave",attendanceDao.selectAttendanceMonthCount(session, a));
		
		return attendanceCount;
	}
	
	
	//attendanceEdit
	
	
	@Override
	public int insertAttendanceEdit(AttendanceEdit ae) {
		
		return attendanceDao.insertAttendanceEdit(session, ae);
	}

	@Override
	public List<AttendanceEdit> selectAttendanceEditById(String memberId,Map page) {

		return attendanceDao.selectAttendanceEditById(session, memberId,page);
	}

	@Override
	public int selectAttendanceEditCount(String memberId) {
		
		return attendanceDao.selectAttendanceEditCount(session,memberId);
	}

	@Override
	public AttendanceEdit selectAttendanceEditByKey(int attendanceEditKey) {
		return attendanceDao.selectAttendanceEditByKey(session, attendanceEditKey);
	}

	@Override
	public int deleteAttendanceEdit(int attendanceEditKey) {
		
		return attendanceDao.deleteAttendanceEdit(session, attendanceEditKey);
	}

	@Override
	public List<AttendanceEdit> searchAttendanceEdit(Map<String,Object> searchMap, Map<String, Integer> page) {
		
		return attendanceDao.searchAttendanceEdit(session, searchMap, page);
	}

	@Override
	public int searchAttendanceEditCount(Map<String,Object> searchMap) {
		// TODO Auto-generated method stub
		return attendanceDao.searchAttendanceEditCount(session, searchMap);
	}
	
	
	//admin attendance
	
	@Override
	public List<Attendance> selectAdminAttendanceAll(Map page) {
		
		return attendanceDao.selectAdminAttendanceAll(session, page);
	}

	@Override
	public int selectAdminAttendanceAllCount() {
		
		return attendanceDao.selectAdminAttendanceAllCount(session);
	}

	@Override
	public List<AttendanceEdit> selectAdminAttendanceEditAll(Map page) {

		return attendanceDao.selectAdminAttendanceEditAll(session, page);
	}

	@Override
	public int selectAdminAttendanceEditCount() {
		
		return attendanceDao.selectAdminAttendanceEditCount(session);
	}

	@Override
	public int updateAttendanceEdit(AttendanceEdit attendanceEdit) {
		
		return attendanceDao.updateAttendanceEdit(session, attendanceEdit);
	}

	@Override
	public int updateAttendance(AttendanceEdit attendanceEdit) {
		int result=attendanceDao.updateAttendance(session,attendanceEdit);
		if(result>0) {
			return attendanceDao.updateAttendanceEditState(session,attendanceEdit);
		}else {
			session.rollback();
			return 0;
		}
	}

	@Override
	public List<Attendance> selectAdminAttendanceBymemberKey(int memberKey, Map page) {
		
		return attendanceDao.selectAdminAttendanceBymemberKey(session, memberKey, page);
	}

	@Override
	public int selectAdminAttendanceBymemberKeyCount(int memberKey) {
		
		return attendanceDao.selectAdminAttendanceBymemberKeyCount(session, memberKey);
	}

	@Override
	public List<AttendanceEdit> searchAdminAttendanceEdit(Map<String, Object> searchMap, Map<String, Integer> page) {
		
		return attendanceDao.searchAdminAttendanceEdit(session, searchMap, page);
	}

	@Override
	public int searchAdminAttendanceEditCount(Map<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return attendanceDao.searchAdminAttendanceEditCount(session, searchMap);
	}

	@Override
	public List<Attendance> searchAdminAttendance(Map<String, Object> searchMap, Map<String, Integer> page) {
		
		return attendanceDao.searchAdminAttendance(session, searchMap, page);
	}

	@Override
	public int searchAdminAttendanceCount(Map<String, Object> searchMap) {
		
		return attendanceDao.searchAdminAttendanceCount(session, searchMap);
	}





	
	
	
	
	
	
	
	
	
	
}
