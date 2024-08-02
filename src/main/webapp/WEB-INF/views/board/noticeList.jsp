<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 목록</title>
</head>
<body>
    <h1>공지사항 목록</h1>
    
    <table border="1">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="notice" items="${noticeList}">
                <tr>
                    <td>${notice.BOARD_KEY}</td>
                    <td><a href="${pageContext.request.contextPath}/board/detail/${notice.BOARD_KEY}">${notice.BOARD_TITLE}</a></td>
                    <td>${notice.MEMBER_KEY}</td>
                    <td>${notice.BOARD_ENROLL_DATE}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <a href="${pageContext.request.contextPath}/board/list">게시판 목록으로</a>
</body>
</html>