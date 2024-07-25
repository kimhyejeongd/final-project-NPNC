<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 작성</title>
</head>
<body>
    <h1>공지사항 작성</h1>
    
    <form action="${pageContext.request.contextPath}/admin/board/create" method="post">
        <label for="BOARD_TITLE">제목:</label>
        <input type="text" id="BOARD_TITLE" name="BOARD_TITLE" required />
        <br/>
        <label for="BOARD_DETAIL">내용:</label>
        <textarea id="BOARD_DETAIL" name="BOARD_DETAIL" required></textarea>
        <br/>
        <input type="hidden" name="BOARD_CATEGORY_KEY" value="2" />
        <button type="submit">작성</button>
    </form>
    <br/>
    <a href="${pageContext.request.contextPath}/admin/board/list">목록으로 돌아가기</a>
</body>
</html>
