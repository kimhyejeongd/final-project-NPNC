<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 목록</title>
    <!-- Include CSS files -->
    <link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/style.css">
    <!-- Include JS files -->
    <script src="${path}/resources/assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="${path}/resources/assets/js/core/bootstrap.bundle.min.js"></script>
    <script src="${path}/resources/assets/js/script.js"></script>
    <style>
        /* General Layout Styles */
        .wrapper {
            display: flex;
            height: 100vh;
            overflow: hidden;
            flex-direction: column;
        }

        .sidebar {
            width: 250px; /* Adjust width as needed */
            background-color: #333; /* Sidebar background color */
            color: white;
            height: 100%; /* Full height of the viewport */
            position: fixed;
            top: 0;
            left: 0;
     
            padding-top: 60px; /* Padding to account for the header */
            z-index: 100; /* Ensure sidebar is below header */
        }

        .main-panel {
            margin-left: 250px; /* Same as sidebar width */
            padding: 20px;
            width: calc(100% - 250px); /* Adjust width based on sidebar */
            background-color: #f8f9fa; /* Background color for main content */
        }

        .header {
           width: calc(100% - 250px); /* Adjust width based on sidebar */
            background-color: #f8f9fa; /* Light background color for header */
            border-bottom: 1px solid #ddd;
            position: fixed;
            top: -15px;
            left: 250px; /* Adjust to match sidebar width */
            height: 60px; /* Header height */
            line-height: 60px; /* Center content vertically */
            padding-left: 20px;
            z-index: 200; /* Ensure header is on top of sidebar */
        }

        /* Ensure no extra margins or padding cause issues */
        body, html {
            margin: 0;
            padding: 0;
            padding-left:10px;
        }

     
        .container {
            padding-top: 20px; /* Adjust top padding if needed */
        }
        
        h1 {
        padding-left:10px;
        }
        
    </style>
</head>
<body>
    <!-- Header -->


    <div class="wrapper">
        <!-- Sidebar -->
        <%@ include file="/WEB-INF/views/board/boardSidebar.jsp" %>

        <!-- Main Panel -->
        <div class="main-panel">
        	<div class="header">
        		    <%@ include file="/WEB-INF/views/common/header_bar.jsp" %>
        	</div>
            <div class="container">
                <h1>게시판 목록</h1>
                <div class="row mt-4">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="multi-filter-select" class="display table table-striped table-hover">
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
                                              		<td><a href="${path}/board/detail/boardKey?boardKey=${board.BOARD_KEY}">${board.BOARD_TITLE}</a></td>
                                                    <td>${board.MEMBER_KEY}</td>
                                                    <td>
                                                        <fmt:formatDate value="${board.BOARD_ENROLL_DATE}" pattern="yyyy년 MM월 dd일" />
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>
        </div>
    </div>
</body>
</html>
