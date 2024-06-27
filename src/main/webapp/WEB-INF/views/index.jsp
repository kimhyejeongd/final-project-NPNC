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
	<form action="${path}/chatRoom" method="GET">
	    <input type="text" name="inputValue">
	    <button type="submit">채팅</button>
	</form>
	<h2>나의 부트 페이지</h2>
</body>
</html>