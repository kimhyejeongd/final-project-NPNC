<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 게시판 목록</title>
</head>
<body>
    <h1>관리자 게시판 목록</h1>
    <table border="1">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="board" items="${boardList}">
                <tr>
                    <td>${board.BOARD_KEY}</td>
                    <td>${board.BOARD_TITLE}</td>
                    <td>${board.MEMBER_KEY}</td>
                    <td>${board.BOARD_ENROLL_DATE}</td>
                    <td><a href="${path}/admin/board/edit/${board.BOARD_KEY}">수정</a></td>
                    <td><a href="${path}/admin/board/delete/${board.BOARD_KEY}" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br>
    <a href="${path}/admin/board/create">새 게시물 작성</a>
</body>
</html>
