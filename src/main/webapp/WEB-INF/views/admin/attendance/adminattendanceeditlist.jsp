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
	<div>
	<%@ include file="/WEB-INF/views/common/header_bar.jsp" %> 	
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
					              	<option value="처리중">처리중</option>
					              	<option value="승인">승인</option>
					              	<option value="반려">반려</option>
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
				                            <td>${a.attendanceEditBeforeTime }</td>
				                            <td>${a.attendanceEditAfterTime}</td>
				                            <td>${a.attendanceEditState}</td>
				                            <td>
				                            	<button onclick="adminAttendanceEditDetail(${a.attendanceEditKey})" class="btn btn-success">상세</button>
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
			<script>
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