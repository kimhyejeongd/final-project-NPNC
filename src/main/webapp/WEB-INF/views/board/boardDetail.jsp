<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 상세보기</title>
</head>
<body>
    <h1>게시물 상세보기</h1>
    
    <table border="1">
        <tr>
            <th>번호</th>
            <td>${board.BOARD_KEY}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td>${board.BOARD_TITLE}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${board.BOARD_DETAIL}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${board.MEMBER_KEY}</td>
        </tr>
        <tr>
            <th>작성일</th>
            <td>${board.BOARD_ENROLL_DATE}</td>
        </tr>
    </table>
    
    <br>
    <a href="${path}/board/list">목록으로</a>
</body>
</html>
