<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 게시판 목록</title>
</head>
<body>
    <h1>관리자 게시판 목록</h1>
        
    <form action="${pageContext.request.contextPath}/admin/board/create" method="get">
        <button type="submit">공지사항 작성</button>
    </form>
    
    <h2>게시판</h2>
    <table border="1">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>카테고리</th>
          
            </tr>
        </thead>
        <tbody>
            <c:forEach var="board" items="${boardList}">
                <c:if test="${board.BOARD_CATEGORY_KEY == 1}">
                    <tr>
                        <td>${board.BOARD_KEY}</td>
                        <td>${board.BOARD_TITLE}</td>
                        <td>${board.MEMBER_KEY}</td>
                        <td>${board.BOARD_ENROLL_DATE}</td>
                        <td>게시판</td>
                        <td>
                            <a href="${path}/admin/board/edit/boardKey?boardKey=${board.BOARD_KEY}">수정</a>
                            <form action="${path}/admin/board/delete/${board.BOARD_KEY}" method="post" style="display:inline;">
                                <button type="submit">삭제</button>
                            </form>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>

    <h2>공지사항</h2>
    <table border="1">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>카테고리</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="board" items="${boardList}">
                <c:if test="${board.BOARD_CATEGORY_KEY == 2}">
                    <tr>
                        <td>${board.BOARD_KEY}</td>
                        <td>${board.BOARD_TITLE}</td>
                        <td>${board.MEMBER_KEY}</td>
                        <td>${board.BOARD_ENROLL_DATE}</td>
                        <td>공지사항</td>
                        <td>
                            <a href="${path}/admin/board/edit/${board.BOARD_KEY}">수정</a>
                            <form action="${path}/admin/board/delete/${board.BOARD_KEY}" method="post" style="display:inline;">
                                <button type="submit">삭제</button>
                            </form>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
