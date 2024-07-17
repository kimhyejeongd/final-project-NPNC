<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
    <title>비밀번호 재설정</title>
</head>
<body>
    <h2>비밀번호 재설정</h2>
    <form action="/resetPassword" method="post">
        <input type="hidden" name="email" value="${param.email}">
        <p>새 비밀번호: <input type="password" name="newPassword"></p>
        <p><input type="submit" value="비밀번호 재설정"></p>
    </form>
</body>
</html>