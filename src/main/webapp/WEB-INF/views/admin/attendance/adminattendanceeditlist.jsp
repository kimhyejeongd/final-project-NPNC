<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/admin/adminsidebar.jsp" %> 
 	<div class="main-panel">
<%-- 	<%@ include file="/WEB-INF/views/common/header_bar.jsp" %> 	 --%>
		<div class="col-md-12">
		                <div class="card">
		                  <div class="card-header">
		                  <br><br><br><br>
		                    <h4 class="card-title">관리자 수정요청목록</h4>
		                  </div>
		                  <div class="card-body">
		           	<form action="${path }/admin/attendance/searchAdminAttendanceEdit">       
					 <nav
						class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
					 >   
					              <select class="form-select input-fixed" id="searchType" name="searchType">
					              	<option></option>
					              	<option value="처리중" <c:if test="${searchT eq '처리중'}">selected</c:if>>처리중</option>
					              	<option value="승인" <c:if test="${searchT eq '승인'}">selected</c:if>>승인</option>
					              	<option value="반려" <c:if test="${searchT eq '반려'}">selected</c:if>>반려</option>
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
				                      placeholder="Search ID ..."
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
		                            <th>번호</th>
		                            <th>ID</th>
		                            <th>등록일</th>
		                            <th>수정요청날짜</th>
		                            <th>출근/퇴근</th>
		                            <th>수정전시간</th>
		                            <th>수정요청시간</th>
		                            <th>상태</th>
		                          </tr>
		                        </thead>
		                        <tbody>	
		                        <c:if test="${not empty attendanceEdit }">
		                        	<c:forEach var="a" items="${attendanceEdit }">
				                          <tr>
				                            <td>${a.attendanceEditKey}</td>
				                            <td>${a.attendanceEditMember}</td>
				                            <td>${a.attendanceEditDate}</td>
				                            <td>${a.attendanceEditRequestDate }</td>
				                            <td>${a.attendanceEditStartEnd }</td>
				                            <td>${a.attendanceEditBeforeTime.substring(11, 19)}</td>
          									<td>${a.attendanceEditAfterTime.substring(11, 19)}</td>
				                            <td>${a.attendanceEditState}</td>
				                            <td>
				                            	<button onclick="adminAttendanceEditDetail(${a.attendanceEditKey})" class="btn btn-success">상세</button>
				                            	<button type="button" class="btn btn-primary btn-round" data-toggle="modal" data-target="#formModal" data-attendanceEdit-key="${a.attendanceEditKey}">
											    	상세화면
											  	</button>
				                            </td>
				                          </tr>
			                        </c:forEach>
		                         </c:if>
		                         <c:if test="${empty attendanceEdit }">
		                         	<tr>
		                         		<td><h3>등록된 수정요청이 없습니다.</h3></td>
		                         	</tr>
		                         	
		                         </c:if>
		                        </tbody>
		                      </table>
		              		<div>${pagebar}</div>
		                </div>
		              </div>
			</div>
		</div>
		
			<!--상세 모달 정의 -->

			<%-- <%@ include file="/WEB-INF/views/admin/member/insertmodal.jsp" %> --%>
	  		<%-- <%@ include file="/WEB-INF/views/admin/attendance/adminattendanceEditDetail.jsp" %> --%>
	  		
	  		
	  		
	</div>
<!-- Bootstrap JS and dependencies -->
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
  

  
  
  
			<script>
			
			$(document).ready(function() {
			    $('#formModal').on('show.bs.modal', function (event) {
			        var button = $(event.relatedTarget); // 버튼을 클릭한 버튼을 참조합니다.
			        var attendanceEditKey = button.data('attendanceeditkey'); // data-attendanceeditkey 속성의 값을 가져옵니다.
			        
			        // AJAX를 사용하여 서버에서 데이터 가져오기
			        $.ajax({
			            url: '${path}/admin/attendance/adminAttendanceEditDetail',
			            type: 'POST',
			            data: { attendanceEditKey: attendanceEditKey },
			            success: function(data) {
			                // 모달에 데이터 설정
			                $('#attendanceEditKey').val(data.attendanceEditKey);
			                $('#attendanceEditMember').val(data.attendanceEditMember);
			                $('#attendanceEditDate').val(data.attendanceEditDate);
			                $('#attendanceEditRequestDate').val(data.attendanceEditRequestDate);
			                $('#attendanceEditBeforeState').val(data.attendanceEditBeforeState);
			                $('#attendanceEditBeforeTime').val(data.attendanceEditBeforeTime);
			                $('#attendanceEditStartEnd').val(data.attendanceEditStartEnd);
			                $('#attendanceEditAfterTime').val(data.attendanceEditAfterTime);
			                $('#attendanceEditAfterState').val(data.attendanceEditAfterState);
			                $('#attendanceEditRequest').val(data.attendanceEditRequest);
			                $('#attendanceEditOpinion').val(data.attendanceEditOpinion);
			                $('#attendanceKey').val(data.attendance.attendanceKey);
			            },
			            error: function() {
			                alert('Failed to fetch data.');
			            }
			        });
			    });
			});
			
			
			
			
				function fn_paging(pageNo) {
			 	    console.log('오긴왔냐?');
			 	    location.assign('${path}/admin/attendance/searchAdminAttendanceEdit?cPage=' + pageNo + '&searchKey=${searchK}&searchType=${searchT}');
			 	    /* location.assign('${path}/${url}?cPage=' + pageNo + '&numPerpage=${numPerpage}&searchKey=${searchK}&searchType=${searchType}&searchStartDate=${searchStartDate}&searchEndDate=${searchEndDate}'); */
			 	    
			 	}	
				
				const adminAttendanceEditDetail=(key)=> {
					 let form = document.createElement("form");
			            form.setAttribute("method", "post");
			            form.setAttribute("action", "${path}/admin/attendance/adminAttendanceEditDetail");

			            let $key = document.createElement("input");
			            $key.setAttribute("type", "hidden");
			            $key.setAttribute("name", "attendanceEditKey");
			            $key.setAttribute("value", key);

			            form.appendChild($key);

			            document.body.appendChild(form);
			            form.submit();
				}
		</script>	
		<%@ include file="/WEB-INF/views/common/footer.jsp" %> 	
		
</body>
</html>