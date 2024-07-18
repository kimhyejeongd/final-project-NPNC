<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 목록</title>
</head>
<body>
    <h1>게시판 목록</h1>
    
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
            <c:forEach var="board" items="${boardList}">
                <tr>
                    <td>${board.BOARD_KEY}</td>
                    <td><a href="boardDetail.jsp?boardKey=${board.BOARD_KEY}">${board.BOARD_DETAIL}</a></td>
                    <td>${board.MEMBER_KEY}</td>
                    <td>${board.BOARD_ENROLL_DATE}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <br>
    <a href="writeBoard.jsp">게시글 작성</a>
</body>
</html>
