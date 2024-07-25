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

 	<%@ include file="/WEB-INF/views/attendance/attendanceSidebar.jsp" %> 
 	<div class="main-panel">	
			<%@ include file="/WEB-INF/views/common/header_bar.jsp" %> 	
	<div>
	
		<div class="col-md-12">
		                <div class="card">
		                  <div class="card-header">
		                  	<br><br><br><br>
		                    <h4 class="card-title">근태현황</h4>
		                  </div>
		                  
		    <div class="row">
              <div class="col-sm-6 col-md-3">
                <div class="card card-stats card-round">
                  <div class="card-body">
                    <div class="row align-items-center">
                      <div class="col-icon">
                        <div
                          class="icon-big text-center icon-primary bubble-shadow-small"
                        >
                          <i class="fas fa-users"></i>
                        </div>
                      </div>
                      <div class="col col-stats ms-3 ms-sm-0">
                        <div class="numbers">
                          <p class="card-category">이번달 출근</p>
                          <h4 class="card-title">12</h4>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-md-3">
                <div class="card card-stats card-round">
                  <div class="card-body">
                    <div class="row align-items-center">
                      <div class="col-icon">
                        <div
                          class="icon-big text-center icon-info bubble-shadow-small"
                        >
                          <i class="fas fa-user-check"></i>
                        </div>
                      </div>
                      <div class="col col-stats ms-3 ms-sm-0">
                        <div class="numbers">
                          <p class="card-category">이번달 지각</p>
                          <h4 class="card-title">1</h4>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-md-3">
                <div class="card card-stats card-round">
                  <div class="card-body">
                    <div class="row align-items-center">
                      <div class="col-icon">
                        <div
                          class="icon-big text-center icon-success bubble-shadow-small"
                        >
                          <i class="fas fa-luggage-cart"></i>
                        </div>
                      </div>
                      <div class="col col-stats ms-3 ms-sm-0">
                        <div class="numbers">
                          <p class="card-category">이번달 휴가</p>
                          <h4 class="card-title">2</h4>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-md-3">
                <div class="card card-stats card-round">
                  <div class="card-body">
                    <div class="row align-items-center">
                      <div class="col-icon">
                        <div
                          class="icon-big text-center icon-secondary bubble-shadow-small"
                        >
                          <i class="far fa-check-circle"></i>
                        </div>
                      </div>
                      <div class="col col-stats ms-3 ms-sm-0">
                        <div class="numbers">
                          <p class="card-category">이번달 초과근무 시간</p>
                          <h4 class="card-title">15</h4>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
		                  
		                  
                  <div class="card-body">
                  			<div style="display: flex;">
                  			           <select class="form-select input-fixed" name="searchType" id="searchType">					              	
			              	<option></option>
			              	<option value="조퇴" <c:if test="${searchT eq '조퇴'}">selected</c:if>>조퇴</option>
			              	<option value="지각" <c:if test="${searchT eq '지각'}">selected</c:if>>지각</option>
			              	<option value="결근" <c:if test="${searchT eq '결근'}">selected</c:if>>결근</option>
			              	<option value="출근" <c:if test="${searchT eq '출근'}">selected</c:if>>출근</option>
			              </select>
                  				<input type="date" class="form-control" name="searchStartDate" id="searchStartDate" value="${searchSD }">
                  				<h3>~</h3>
                  				<input type="date" class="form-control" name="searchEndDate" id="searchEndDate" value="${searchED }">
                  				<button class="btn btn-search pe-1" id="searchbutton">
		                        	<i class="fa fa-search search-icon"></i>
		                      	</button>
                  			</div>

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
			
			<%@ include file="/WEB-INF/views/common/footer.jsp" %> 	
		</div>
	<script>
				
	
		document.getElementById("searchbutton").addEventListener("click",e=>{
			const searchType=document.getElementById("searchType").value;
			const searchStartDate=document.getElementById("searchStartDate").value;
			const searchEndDate=document.getElementById("searchEndDate").value;
			console.log(searchStartDate);
			console.log(searchEndDate);
			fetch("${path}/attendance/searchAttendance?searchType=" + searchType + "&searchStartDate=" + searchStartDate + "&searchEndDate=" + searchEndDate)
			.then(response => response.text())
			.then(data =>{
				document.querySelector("div[class='table-responsive']").innerHTML = data;
			})
		});
	
	
	
	
		//근태 출퇴근 버튼
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