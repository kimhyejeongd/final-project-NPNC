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
	<form action="${path }/job/insertjobend.do" method="post">
		직급코드<input type="text" name="jobKey">
		직급명<input type="text" name="jobName">
		<input type="submit" value="등록">
	</form>
</body>
</html>