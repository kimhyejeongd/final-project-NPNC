<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/adminsidebar.jsp" %> 
 	<div class="main-panel">

	<%@ include file="/WEB-INF/views/admin/adminheader_bar.jsp" %> 	
		<div class="col-md-12">
		                <div class="card">
		                  <br><br><br><br>
		              	  <div class="card-header">
		                    <h4 class="card-title">전체사원근태관리</h4>
		                  </div>
		                  <div class="card-body">
		                  		<form action="${path }/admin/attendance/searchAdminAttendance">  
		                  			<div style="display: flex;">
		                  				<input type="date" class="form-control" name="searchStartDate" id="searchStartDate" value="${searchSD }">
		                  				<h3>~</h3>
		                  				<input type="date" class="form-control" name="searchEndDate" id="searchEndDate" value="${searchED }">
		                  			</div>
		                  		  <nav
					                 class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
					              >
					              
					              <select class="form-select input-fixed" name="searchType">					              	
					              	<option></option>
					              	<option value="조퇴" <c:if test="${searchT eq '조퇴'}">selected</c:if>>조퇴</option>
					              	<option value="지각" <c:if test="${searchT eq '지각'}">selected</c:if>>지각</option>
					              	<option value="결근" <c:if test="${searchT eq '결근'}">selected</c:if>>결근</option>
					              	<option value="출근" <c:if test="${searchT eq '출근'}">selected</c:if>>출근</option>
					              	<option value="휴가" <c:if test="${searchT eq '휴가'}">selected</c:if>>휴가</option>
					              	<option value="병가" <c:if test="${searchT eq '병가'}">selected</c:if>>병가</option>
					              	<option value="공가" <c:if test="${searchT eq '공가'}">selected</c:if>>공가</option>
					              	<option value="오전반차" <c:if test="${searchT eq '오전반차'}">selected</c:if>>오전반차</option>
					              	<option value="오후반차" <c:if test="${searchT eq '오후반차'}">selected</c:if>>오후반차</option>
					              </select>
		                          <div class="input-group">
				                    <div class="input-group-prepend">
				                      <button type="submit" class="btn btn-search pe-1">
				                        <i class="fa fa-search search-icon"></i>
				                      </button>
				                    </div>
				                    <input
				                      type="text"
				                      id="searchKey"
				                      name="searchKey"
				                      placeholder="Search name..."
				                      class="form-control"
				                      value="${searchK }"
				                    />
				                  </div>          
				               </nav>
				               </form>
		                    <div class="table-responsive">
		                      <table
		                        id="multi-filter-select"
		                        class="display table table-striped table-hover"
		                      >
		                        <thead>
		                          <tr>
		                            <th>근무날짜</th>
		                            <th>ID</th>
		                            <th>이름</th>
		                            <th>출근시간</th>
		                            <th>퇴근시간</th>
		                            <th>상태</th>
		                          </tr>
		                        </thead>
		                        <tbody>	
		                        <c:if test="${not empty attendance }">
		                        	<c:forEach var="a" items="${attendance }">
				                          <tr>
				                            <td>${fn:substring(a.attendanceDate, 0, 10)}</td>
				                            <td>${a.member.memberId}</td>
				                            <td>${a.member.memberName}</td>
				                            <td>${fn:substring(a.attendanceStart, fn:length(a.attendanceStart) - 8, fn:length(a.attendanceStart))}</td>
          									<td>${fn:substring(a.attendanceEnd, fn:length(a.attendanceEnd) - 8, fn:length(a.attendanceEnd))}</td>
				                            <td>${a.attendanceState}</td>
				                            <td>     	
				                            	<button type="button" class="btn btn-dark btn-round" data-toggle="modal" data-target="#adminAttendanceformModal" data-attendance-key="${a.attendanceKey}" data-member-key="${a.member.memberId}">
											    	수정
											  	</button>
				                            </td>
				                          </tr>
			                        </c:forEach>
		                         </c:if>
		                         <c:if test="${empty attendance }">
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
	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 	
	</div>
	 <%@ include file="/WEB-INF/views/admin/attendance/adminattendanceDetail.jsp" %>
</div>
	
	
	
 	<!-- Bootstrap JS and dependencies -->
 	 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 	 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
 	 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
	
 	<script>
 	
 	$(document).ready(function() {
	    $('#adminAttendanceformModal').on('show.bs.modal', function (event) {
	        var button = $(event.relatedTarget); // 버튼을 클릭한 버튼을 참조합니다.
	        var memberId = button.data('member-key'); // 
	        var attendanceKey = button.data('attendance-key'); // data-attendancekey 속성의 값을 가져옵니다.
	        // AJAX를 사용하여 서버에서 데이터 가져오기
	        $.ajax({
	            url: '${path}/admin/attendance/adminAttendanceDetail',
	            type: 'GET',
	            data: { attendanceKey: attendanceKey ,memberId: memberId},
	            /* dataType: 'json', // 서버 응답을 JSON으로 처리 */
	            success: function(data) {
	            	console.log(data);
	            	console.log(data.attendance.attendanceStart);
	            	
	            	 function formatDate(timestamp) {
		                    var date = new Date(timestamp);
		                    var year = date.getFullYear();
		                    var month = ('0' + (date.getMonth() + 1)).slice(-2);
		                    var day = ('0' + date.getDate()).slice(-2);
		                    return year + '-' + month + '-' + day;
		                }
	            	 
	            	 function formatTime(dateTimeString) {

	            		    if (!dateTimeString) return null;
	            		    var timePart = dateTimeString.split(' ')[1];
	            		    if (!timePart) return 'Invalid Time Format';
	            		    
	            		    var timeComponents = timePart.split(':');
	                        if (timeComponents.length < 2) return 'Invalid Time Format';

	                        var hours = timeComponents[0];
	                        var minutes = timeComponents[1];
	                        return hours + ':' + minutes;
	            		    /* return timePart; */
	            		}
	            	 console.log(formatTime(data.attendance.attendanceStart));
	                // 모달에 데이터 설정
	                $('#attendanceMember').val(data.attendance.member.memberId);
	                $('#attendanceDateUp').val(formatDate(data.attendance.attendanceDate)); 
	                $('#attendanceStartUp').val(formatTime(data.attendance.attendanceStart));
	                $('#attendanceEndUp').val(formatTime(data.attendance.attendanceEnd));
	                $('#attendanceStateUp').val(data.attendance.attendanceState);
	                $('#attendanceKeyUp').val(data.attendance.attendanceKey); 
	                
	          
	            },
	            error: function() {
	                alert('Failed to fetch data.');
	            }
	        });
	    });
	});
 	
 	
 	
 	
 	function fn_paging(pageNo) {
 	    console.log('오긴왔냐?');
 	    location.assign('${path}/admin/attendance/searchAdminAttendance?cPage=' + pageNo + '&numPerpage=${numPerpage}&searchKey=${searchK}&searchType=${searchT}&searchStartDate=${searchSD}&searchEndDate=${searchED}');
 	    
 	}	
	</script> 
	
</body>
</html>