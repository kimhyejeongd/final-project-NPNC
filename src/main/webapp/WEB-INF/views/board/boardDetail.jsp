<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 상세보기</title>
    <link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/style.css">
    <style>
        .wrapper {
            display: flex;
            height: 100vh;
            overflow: hidden;
            flex-direction: column;
        }

        .sidebar {
            width: 250px;
            background-color: #343a40;
            color: white;
            height: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 100;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .main-panel {
            margin-left: 250px;
            width: calc(100% - 250px);
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .header {
            display: flex;
            width: calc(100% - 250px);
            background-color: #ffffff;
            border-bottom: 1px solid #ddd;
            position: fixed;
            top: 0;
            left: 250px;
            height: 60px;
            line-height: 60px;
            padding-left: 20px;
            z-index: 200;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .container {
            margin-top: 80px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .info-panel {
            background-color: #ffffff;
            border-bottom: 1px solid #ddd;
            padding: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #e9ecef;
            color: #495057;
            font-weight: bold;
        }

        td {
            background-color: #ffffff;
            color: #495057;
            font-size: 1rem;
            line-height: 1.6;
        }

        tr:nth-child(even) td {
            background-color: #f8f9fa;
        }

        .content-area {
            flex: 0 0 auto; /* Contents will not stretch, but will respect set height */
            max-height: 300px; /* Adjust this value as needed */
            overflow-y: auto; /* Scroll if content overflows */
            margin-bottom: 20px;
        }

        .comment-section {
            border-top: 1px solid #ddd;
            padding-top: 20px;
            margin-top: 20px;
            flex: 1; /* Take the remaining space */
            display: flex;
            flex-direction: column;
        }

        .comment-form {
            margin-bottom: 20px;
        }

        .comment-form textarea {
            width: 100%;
            height: 60px;
            resize: none; /* Disable resizing */
        }

        .comment-list {
            max-height: 400px; /* Limit height for comments */
            overflow-y: auto; /* Scroll if comments overflow */
            padding-bottom: 20px; /* Space between comments and bottom of container */
        }

        .comment {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f8f9fa;
        }

        a.btn-primary {
            color: #fff;
            background-color: #007bff;
            border-color: #007bff;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.2s, border-color 0.2s;
            font-weight: 500;
            display: inline-block;
            margin-top: 20px;
        }

        a.btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <%@ include file="/WEB-INF/views/board/boardSidebar.jsp" %>

        <!-- Main Panel -->
        <div class="main-panel">
            <!-- Header -->
            <%@ include file="/WEB-INF/views/common/header_bar.jsp" %>

            <!-- Content -->
            <div class="container">
              
                <!-- Information Panel -->
                <div class="info-panel">
                    <table>
                        <tr>
                            <th>번호</th>
                            <td>${board.BOARD_KEY}</td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td>${board.BOARD_TITLE}</td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td>${board.MEMBER_KEY}</td>
                        </tr>
                        <tr>
                            <th>작성일</th>
                            <td><fmt:formatDate value="${board.BOARD_ENROLL_DATE}" pattern="yyyy년 MM월 dd일" /></td>
                        </tr>
                    </table>
                </div>

                <!-- Content Area -->
                <div class="content-area">
                    <p>${board.BOARD_DETAIL}</p>
                </div>
                
                <!-- Comment Section -->
                <div class="comment-section">
                    <!-- Comment Form -->
                   <div class="comment-form">
				    <form action="${path}/board/addComment" method="post">
				        <input type="hidden" name="BOARD_KEY" value="${board.BOARD_KEY}">
				        <textarea name="BOARD_COMMENT_DETAIL" placeholder="댓글을 입력하세요..." required></textarea>
				        <button type="submit" class="btn btn-primary">댓글 작성</button>
				    </form>
				</div>


                    <!-- Comment List -->
                    <div class="comment-list">
                        <c:forEach var="comment" items="${comments}">
                            <div class="comment">
                                <p><strong>${comment.MEMBER_KEY}</strong> (${comment.BOARD_COMMENT_DATE})</p>
                                <p>${comment.BOARD_COMMENT_DETAIL}</p>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <%@ include file="/WEB-INF/views/common/footer.jsp" %>
        </div>
    </div>
</body>
</html>
