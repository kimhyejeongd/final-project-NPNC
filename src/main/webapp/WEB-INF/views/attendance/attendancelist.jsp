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
                          <p class="card-category">${currentMonth}월 출근</p>
                          <h4 class="card-title"><c:if test="${empty attendanceCount.gotowork }">0</c:if>${attendanceCount.gotowork }</h4>
                          <p class="card-category">${currentMonth}월 결근</p>
						  <h4 class="card-title"><c:if test="${empty attendanceCount.absent }">0</c:if>${attendanceCount.absent }</h4>
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
                          <p class="card-category">${currentMonth}월 지각</p>
                          <h4 class="card-title"><c:if test="${empty attendanceCount.late }">0</c:if>${attendanceCount.late }</h4>
                          <p class="card-category">${currentMonth}월 조퇴</p>
                          <h4 class="card-title"><c:if test="${empty attendanceCount.ealryLeave }">0</c:if>${attendanceCount.ealryLeave}</h4>
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
                          <p class="card-category">${currentMonth}월 휴가</p>
                          <h4 class="card-title"><c:if test="${empty attendanceCount.vaca }">0</c:if>${attendanceCount.vaca}</h4>
                          <p class="card-category">남은 휴가</p>
                          <h4 class="card-title">${memberVacation.memberVacRemaining}</h4>
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
                          <p class="card-category">${currentMonth}월 초과근무</p>
                          <h4 class="card-title">0</h4>
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
			              	<option value="휴가" <c:if test="${searchT eq '휴가'}">selected</c:if>>휴가</option>
			              	<option value="유급휴가" <c:if test="${searchT eq '유급휴가'}">selected</c:if>>유급휴가</option>
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
		                            	<button type="button" class="btn btn-dark btn-round" data-toggle="modal" data-target="#updateAttendanceModal" data-member-key="${a.attendanceKey}">
											   수정요청
										</button>
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
			<%@ include file="/WEB-INF/views/common/footer.jsp" %> 	
	</div>
			 <%@ include file="/WEB-INF/views/attendance/updateattendance.jsp" %>
   </div>
	<!-- Bootstrap JS and dependencies -->
 	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 	
		
	<script>
		
	$(document).ready(function() {
	    $('#updateAttendanceModal').on('show.bs.modal', function (event) {
	        var button = $(event.relatedTarget); // 버튼을 클릭한 버튼을 참조합니다.
	        var attendanceKey = button.data('member-key'); // data-attendanceeditkey 속성의 값을 가져옵니다.
	        // AJAX를 사용하여 서버에서 데이터 가져오기
	        $.ajax({
	            url: '${path}/attendance/updateAttendance',
	            type: 'POST',
	            data: { attendanceKey: attendanceKey },
	            /* dataType: 'json', // 서버 응답을 JSON으로 처리 */
	            success: function(data) {
	            	console.log(data);
	            	console.log(data.attendance.attendanceKey);
	            	
	            	 function formatDate(timestamp) {
		                    var date = new Date(timestamp);
		                    var year = date.getFullYear();
		                    var month = ('0' + (date.getMonth() + 1)).slice(-2);
		                    var day = ('0' + date.getDate()).slice(-2);
		                    return year + '-' + month + '-' + day;
		                }

	                // 모달에 데이터 설정
	                $('#attendanceKey').val(data.attendance.attendanceKey );
	                $('#attendanceEditMember').val(data.attendance.member.memberId);
	                $('#attendanceEditDate').val(formatDate(data.today));
	                $('#attendanceEditRequestDate').val(formatDate(data.attendance.attendanceDate));
	                $('#attendanceEditBeforeState').val(data.attendance.attendanceState);
	                $('#attendanceEditBeforeTime').val(data.attendance.attendanceStart);
	             	$('#attendanceEditBeforeTimeEnd').val(data.attendance.attendanceEnd); 

	            },
	            error: function() {
	                alert('Failed to fetch data.');
	            }
	        });
	    });
	});
	
	
	 function fn_paging(pageNo) {
	 	    console.log('오긴왔냐?');
	 	    var searchType= document.getElementById("searchType").value;
	 	    var searchStartDate= document.getElementById("searchStartDate").value;
	 	    var searchEndDate= document.getElementById("searchEndDate").value;
		 	   $.ajax({
		            url: '${path}/attendance/searchAttendance', // 서버의 실제 엔드포인트로 대체
		            type: 'GET',
		            data: { cPage: pageNo ,searchType : searchType,searchStartDate : searchStartDate,searchEndDate : searchEndDate},
		            dataType: 'text', // 서버 응답을 JSON으로 처리
		            success: function(data) {

		                document.querySelector("div[class='table-responsive']").innerHTML = data;

		            },
		            error: function(xhr, status, error) {
		                console.error("AJAX Error: ", status, error);
		            }
		        });
		    }
	
	
	
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
		

	</script>


</body>
</html>