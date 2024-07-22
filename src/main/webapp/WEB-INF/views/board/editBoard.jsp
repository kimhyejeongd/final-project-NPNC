<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 수정</title>
</head>
<body>
    <h1>게시물 수정</h1>
    <form action="/admin/board/update" method="post">
        <input type="hidden" name="BOARD_KEY" value="${board.BOARD_KEY}" />
        <p>
            <label for="BOARD_TITLE">제목:</label>
            <input type="text" name="BOARD_TITLE" value="${board.BOARD_TITLE}" />
        </p>
        <p>
            <label for="BOARD_DETAIL">내용:</label>
            <textarea name="BOARD_DETAIL">${board.BOARD_DETAIL}</textarea>
        </p>
        <p>
            <input type="submit" value="수정" />
            <a href="/admin/board/list">목록으로</a>
        </p>
    </form>
</body>
</html>
