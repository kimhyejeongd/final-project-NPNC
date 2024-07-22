<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 수정</title>
</head>
<body>
    <h1>게시물 수정</h1>
    <form action="${path}/admin/board/update" method="post">
        <input type="hidden" name="BOARD_KEY" value="${board.BOARD_KEY}"/>
        <label for="BOARD_TITLE">제목:</label>
        <input type="text" id="BOARD_TITLE" name="BOARD_TITLE" value="${board.BOARD_TITLE}"/>
        <br/>
        <label for="BOARD_DETAIL">내용:</label>
        <textarea id="BOARD_DETAIL" name="BOARD_DETAIL">${board.BOARD_DETAIL}</textarea>
        <br/>
        <input type="submit" value="수정 완료"/>
    </form>
    <a href="${path}/admin/board/list">목록으로 돌아가기</a>
</body>
</html>
