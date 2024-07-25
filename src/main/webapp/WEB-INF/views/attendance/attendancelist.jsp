<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%--  	<%@ include file="/WEB-INF/views/common/script_gather.jsp" %>  --%>
 	<%@ include file="/WEB-INF/views/admin/adminsidebar.jsp" %> 
 	<div class="main-panel">
	<div>
		<div class="col-md-12">
		                <div class="card">
		                  <div class="card-header">
		                    <h4 class="card-title">근태관리</h4>
		                  </div>
		                  <div class="card-body">
		                    <div class="table-responsive">
		                      <table
		                        id="multi-filter-select"
		                        class="display table table-striped table-hover"
		                      >
		                        <thead>
		                          <tr>
		                            <th>근무날짜</th>
		                            <th>출근시간</th>
		                            <th>퇴근시간</th>
		                            <th>초과근무시간</th>
		                            <th>상태</th>
		                          </tr>
		                        </thead>
		                        <tbody>	
		                        <c:if test="${not empty attendances }">
		                        	<c:forEach var="a" items="${attendances }">
				                          <tr>
				                            <td>${a.attendanceDate}</td>
				                            <td>${fn:substring(a.attendanceStart, fn:length(a.attendanceStart) - 8, fn:length(a.attendanceStart))}</td>
            								<td>${fn:substring(a.attendanceEnd, fn:length(a.attendanceEnd) - 8, fn:length(a.attendanceEnd))}</td>
				                            <td>${a.overtimeKey }</td>
				                            <td>${a.attendanceState}</td>
				                            <td>
				                            	<button onclick="updateAttendance('${a.attendanceKey}');" class="btn btn-success">근태수정요청</button>
				                            </td>
				                          </tr>
			                        </c:forEach>
		                         </c:if>
		                         <c:if test="${empty attendances }">
		                         	<tr>
		                         		<td><h3>등록된 근태가 없습니다.</h3></td>
		                         	</tr>
		                         	
		                         </c:if>
		                         
		                        </tbody>
		                      </table>
		              		<div>${pagebar}</div>
		                </div>
		              </div>
			</div>
			
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
			
			<div>
				<button onclick="location.assign('${path}/attendance/selectAttendanceEditById')">수정요청목록</button>
			</div>
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
	

 		 
 		 
 		 
 		 
 		 
 		 
				const updateAttendance=(a)=>{
				            let form = document.createElement("form");
				            form.setAttribute("method", "post");
				            form.setAttribute("action", "${path}/attendance/updateAttendance");

				            let $key = document.createElement("input");
				            $key.setAttribute("type", "hidden");
				            $key.setAttribute("name", "attendanceKey");
				            $key.setAttribute("value", a);

				            form.appendChild($key);

				            document.body.appendChild(form);
				            form.submit();
						}

	</script>


</body>
</html>