<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${path }/job/updatejobend.do" method="post">
		직급코드<input type="text" name="jobKey" value="${key}">
		직급명<input type="text" name="jobName" value="${jobName}">
		<input type="submit" value="등록">
	</form>
</body>
</html>