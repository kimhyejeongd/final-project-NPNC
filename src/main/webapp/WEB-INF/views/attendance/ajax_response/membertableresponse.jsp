<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 

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