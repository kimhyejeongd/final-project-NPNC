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

	<%@ include file="/WEB-INF/views/admin/personadminsidebar.jsp" %> 
 	<div class="main-panel">	
			<%@ include file="/WEB-INF/views/common/header_bar.jsp" %> 	
			<br><br><br><br><br>
			
			<div class="col-md-12">
		    	<div class="card">
		        	<div class="card-body">
						<div class="card-title">
							인사 권한 페이지
						</div>	
					</div>
			</div>
		</div> 
		
			<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="card-title">전체 사원 수</div>
								</div>
								<div class="card-body">
									<h5 style="font-weight:bold; " >${memberCount }명</h5>
									<div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="${memberCount }" aria-valuemin="0" aria-valuemax="${memberCount }">
									<div class="progress-bar" style="width: ${memberCount }%">${memberCount }</div>
									</div>
									<br>
									
								</div>
							</div>
						</div>
			
			<div class="row">
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">직급별</div>
								</div>
								<div class="card-body">
									<c:forEach var="j" items="${job}" >
										<h5 style="font-weight: bold;" >${j.jobName } : ${j.memberJobCount }명</h5>
										<div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="${j.memberJobCount }" aria-valuemin="0" aria-valuemax="${memberCount }">
										  <div class="progress-bar" style="width: ${j.memberJobCount }%">${j.memberJobCount }</div>
										</div>
										<br>
									</c:forEach>
								</div>
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">부서별</div>
								</div>
								<div class="card-body">
									<c:forEach var="d" items="${dept}" >
										<h5 style="font-weight: bold;" >${d.deptName } : ${d.memberDeptCount }명</h5>
										<div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="${d.memberDeptCount }" aria-valuemin="0" aria-valuemax="${memberCount }">
										  <div class="progress-bar" style="width: ${d.memberDeptCount }%">${d.memberDeptCount }</div>
										</div>
										<br>
									</c:forEach>
								</div>
							</div>
						</div>

					</div>
	</div>
	
	
</body>
</html>