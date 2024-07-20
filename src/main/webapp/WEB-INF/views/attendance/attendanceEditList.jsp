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

	<%@ include file="/WEB-INF/views/common/script_gather.jsp" %> 
	<div>
		<div class="col-md-12">
		                <div class="card">
		                  <div class="card-header">
		                    <h4 class="card-title">수정요청목록</h4>
		                  </div>
		                  <div class="card-body">
		                    <div class="table-responsive">
		                      <table
		                        id="multi-filter-select"
		                        class="display table table-striped table-hover"
		                      >
		                        <thead>
		                          <tr>
		                            <th>번호</th>
		                            <th>등록일</th>
		                            <th>수정요청날짜ㅣ</th>
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
				                            <td>${a.attendanceEditDate}</td>
				                            <td>${a.attendanceEditRequestDate }</td>
				                            <td>${a.attendanceEditStartEnd }</td>
				                            <td>${a.attendanceEditBeforeTime }</td>
				                            <td>${a.attendanceEditAfterTime}</td>
				                            <td>${a.attendanceEditState}</td>
				                            <td>
				                            	<button onclick="attendanceEditDetail(${a.attendanceEditKey})" class="btn btn-success">상세</button>
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
			
			<script>
				const attendanceEditDetail=(key)=> {
					 let form = document.createElement("form");
			            form.setAttribute("method", "post");
			            form.setAttribute("action", "${path}/attendance/attendanceEditDetail");

			            let $key = document.createElement("input");
			            $key.setAttribute("type", "hidden");
			            $key.setAttribute("name", "attendanceEditKey");
			            $key.setAttribute("value", key);

			            form.appendChild($key);

			            document.body.appendChild(form);
			            form.submit();
				}
		</script>

</body>
</html>