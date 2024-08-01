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
			<%@ include file="/WEB-INF/views/admin/adminheader_bar.jsp" %> 	
			<br><br><br><br>
			<div class="col-md-12">
		    	<div class="card">
		        	<div class="card-body">
		
						<h1>관리자 페이지입니다...</h1>
					</div>
				</div>
			</div>

			
			
			<%@ include file="/WEB-INF/views/common/footer.jsp" %> 	
	</div>
	
	
</body>
</html>