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
			<%@ include file="/WEB-INF/views/common/header_bar.jsp" %> 	
			
			<div id="attendanceEndResult" style="margin-top:20px;">
				<button id="endAttendanceBtn" style="display: ${not empty checkEndTime ? 'none' : 'inline'};">
					퇴근
				</button>

			</div>
			

			
			
			<%@ include file="/WEB-INF/views/common/footer.jsp" %> 	
	</div>
	
	
</body>
</html>