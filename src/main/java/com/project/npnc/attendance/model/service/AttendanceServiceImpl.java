package com.project.npnc.attendance.model.service;

import java.sql.Timestamp;
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
import com.project.npnc.document.model.dto.VacationApply;

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
		
		//승인된 오늘날짜의 휴가시작날짜
		List<VacationApply> vApply=attendanceDao.selectVacationApplyApprove(session);
		

		result.forEach((key, value) -> {
			

		    if (value) {
			    	Attendance at=selectAttendanceByMemberKey(key);
			    	a.setMember(AdminMember.builder().memberKey(key).build());
			    	
			    	vApply.forEach(v->{
			    		Timestamp dateToCheck = new Timestamp(System.currentTimeMillis());
			   	     	Timestamp start = v.getVacationStartDate();
			   	     	Timestamp end = v.getVacationEndDate();
			   	     
		    	        boolean isInRange = isDateInRange(dateToCheck, start, end);
		    	        System.out.println("Is date in range? " + isInRange);
			    
			    		
//		    	        if(v.getVacationMemberKey()==key) {
		    	        if(isInRange) {
							if(v.getVacationKey()==1) {
								a.setAttendanceState("휴가");
							}else if(v.getVacationKey()==2) {
								a.setAttendanceState("병가");
							}else if(v.getVacationKey()==3) {
								a.setAttendanceState("공가");
							}else if(v.getVacationKey()==4) {
								a.setAttendanceState("오전반차");
							}else if(v.getVacationKey()==5) {
								a.setAttendanceState("오후반차");
							}
						}else if(at.getAttendanceEnd()==null) {
				    		a.setAttendanceState("결근");
				    	}else {
					    	try {	
						    	Date startTime=sdf.parse(at.getAttendanceStart());
						    	Date endTime=sdf.parse(at.getAttendanceEnd());
						    	
						    	Calendar startCal= Calendar.getInstance();
						    	startCal.setTime(startTime);
						    	int startHour=startCal.get(Calendar.HOUR_OF_DAY);
						    	
						    	Calendar endCal= Calendar.getInstance();
						    	endCal.setTime(endTime);
						    	int endHour=endCal.get(Calendar.HOUR_OF_DAY);
						    			
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
			    	
		    	});
			    	
			    	attendanceDao.updateAttendanceState(session, a);
		    	
		    }else {
		    	vApply.forEach(v->{
		    		
		    		Timestamp dateToCheck = new Timestamp(System.currentTimeMillis());
		   	     	Timestamp start = v.getVacationStartDate();
		   	     	Timestamp end = v.getVacationEndDate();
		   	     
	    	        boolean isInRange = isDateInRange(dateToCheck, start, end);
	    	        System.out.println("Is date in range? " + isInRange);
		    		
		    		String status="";
		    		if(isInRange) {
//					if(v.getVacationMemberKey()==key) {
						if(v.getVacationKey()==1) {
							status="휴가";
						}else if(v.getVacationKey()==2) {
							status="병가";
						}else if(v.getVacationKey()==3) {
							status="공가";
						}else if(v.getVacationKey()==4) {
							status="오전반차";
						}else if(v.getVacationKey()==5) {
							status="오후반차";
						}
						attendanceDao.insertAttendanceVacation(session,key,status);
					}else {
						attendanceDao.insertAbsent(session, key);						
					}
				});
		    	
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

	public static boolean isDateInRange(Timestamp timestampToCheck, Timestamp startTimestamp, Timestamp endTimestamp) {
        if (timestampToCheck == null || startTimestamp == null || endTimestamp == null) {
            throw new IllegalArgumentException("Timestamps cannot be null");
        }

        // 시작 시간과 종료 시간이 올바른지 확인
        if (startTimestamp.after(endTimestamp)) {
            throw new IllegalArgumentException("Start timestamp cannot be after end timestamp");
        }

        // timestampToCheck가 시작 시간과 종료 시간 사이에 있는지 확인
        return !timestampToCheck.before(startTimestamp) && !timestampToCheck.after(endTimestamp);
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
