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
			                            <th>번호</th>
			                            <th>신청일시</th>
			                            <th>추가근무날짜</th>
			                            <th>시작시각</th>
			                            <th>종료시각</th>
			                            <th>신청사유</th>
			                            <th>상태</th>
			                          </tr>
			                        </thead>
			                        <tbody>	
			                         <c:if test="${not empty overtimework}">
			                        	 <c:forEach var="otw" items="${overtimework }"> 
					                          <tr>
					                            <td>${otw.overtimeKey}</td>
					                            <td>${otw.overtimeApplyDate}</td>
					                            <td>${otw.overtimeDate }</td>
					                            <td>${fn:substring(otw.overtimeStartTime, 11, 19)}</td>
					                            <td>${fn:substring(otw.overtimeEndTime, 11, 19)}</td>        
					                            <td>${otw.overtimeReason}</td>
					                            <td>${otw.overtimeStatus}</td>
					                          </tr>
				                         </c:forEach> 
			                         </c:if> 
			                         <c:if test="${empty overtimework}">
			                         	<tr>
			                         		<td><h3>등록된 추가근무가 없습니다.</h3></td>
			                         	</tr>
			                         </c:if>
			                         
			                        </tbody>
			                      </table>
			              		 <div>${pagebar}</div> 