<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${path }/admin/dept/updatedeptend.do" method="post">
		부서코드<input type="text" name="deptKey" value="${key}" readonly>
		부서명<input type="text" name="deptName" value="${deptName}">
		<input type="submit" value="수정">
	</form>
</body>
</html>