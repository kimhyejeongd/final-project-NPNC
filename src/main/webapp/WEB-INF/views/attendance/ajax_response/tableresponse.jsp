<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<table id="multi-filter-select"
	class="display table table-striped table-hover">
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
					<td>${fn:substring(a.attendanceEditBeforeTime, fn:length(a.attendanceEditBeforeTime) - 8, fn:length(a.attendanceEditBeforeTime))}</td>
          			<td>${fn:substring(a.attendanceEditAfterTime, fn:length(a.attendanceEditAfterTime) - 8, fn:length(a.attendanceEditAfterTime))}</td>
					<td>${a.attendanceEditState}</td>
					<td>
						<button type="button" class="btn btn-dark btn-round" data-toggle="modal" data-target="#editmemModal" data-member-key="${a.attendanceEditKey}">
							상세
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