<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 작성</title>
</head>
<body>
    <h1>게시물 작성</h1>
    
    <form action="writeBoard.do" method="post">
        <table>
            <tr>
                <td>제목</td>
                <td><input type="text" name="BOARD_DETAIL" required></td>
            </tr>
            <tr>
                <td>작성자</td>
                <td><input type="text" name="MEMBER_KEY" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="작성"></td>
            </tr>
        </table>
    </form>
    
    <br>
    <a href="boardList.jsp">목록으로</a>
</body>
</html>
