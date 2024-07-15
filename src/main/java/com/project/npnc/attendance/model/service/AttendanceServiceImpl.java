package com.project.npnc.attendance.model.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
	public int insertAttendanceEdit(AttendanceEdit ae) {
		
		return attendanceDao.insertAttendanceEdit(session, ae);
	}
	
	
	
	
	
	
	
	
	
	
	
}
