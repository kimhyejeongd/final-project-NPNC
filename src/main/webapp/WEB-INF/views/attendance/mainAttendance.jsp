<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
				<div id="attendanceResult" style="margin-top:20px;">
				<button id="startAttendanceBtn" style="display: ${not empty checkStartTime ? 'none' : 'inline'};">
						출근
				</button>
				<c:if test="${not empty checkStartTime}">
					출근 시간 : ${checkStartTime.substring(9, 17)}  
				</c:if>
				
			</div>
			<div id="attendanceEndResult" style="margin-top:20px;">
				<button id="endAttendanceBtn" style="display: ${not empty checkEndTime ? 'none' : 'inline'};">
					퇴근
				</button>
				<c:if test="${not empty checkEndTime}">
					퇴근 시간 : ${checkEndTime.substring(9, 17)}  
				</c:if>
			</div>

	<script>
	
	 $(document).ready(function(){
         $('#endAttendanceBtn').click(function(){
             $.ajax({
                 type: 'POST',
                 url: '${path}/attendance/endattendance',
                 success: function(response) {
                     var message = response.msg;
                     var attendanceEnd = response.attendanceEnd;
                     alert(message);
	                     $('#endAttendanceBtn').hide();
                     $('#attendanceEndResult').html('퇴근 시간 : ' + attendanceEnd);
                 },
                 error: function(xhr, status, error) {
                     alert('퇴근 처리에 실패하였습니다.');
                 }
             });
         });
     }); 
		 
		 $(document).ready(function(){
         $('#startAttendanceBtn').click(function(){
             $.ajax({
                 type: 'POST',
                 url: '${path}/attendance/startattendance',
                 success: function(response) {
                     var message = response.msg;
                     var attendanceStart = response.attendanceStart;
                     alert(message);
	                     $('#startAttendanceBtn').hide();
                     $('#attendanceResult').html('출근 시간 : ' + attendanceStart);
                 },
                 error: function(xhr, status, error) {
                     alert('출근 처리에 실패하였습니다.');
                 }
             });
         });
     }); 
	
	
	
	</script>
</body>
</html>