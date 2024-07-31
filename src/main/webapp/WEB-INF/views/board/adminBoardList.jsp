<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport"/>
    <title>관리자 게시판 목록</title>
    
    <!-- Favicon -->
    <link rel="icon" href="${path}/resources/assets/img/kaiadmin/favicon.ico" type="image/x-icon"/>

    <!-- CSS Files -->
    <link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/kaiadmin.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/demo.css" />

    <!-- Custom Styles -->
    <style>
        body {
            font-family: 'Public Sans', sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 20px;
        }
        h1 {
            color: #333;
        }
        .table {
            margin-top: 20px;
        }
        .table th, .table td {
            text-align: center;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
        }
        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
            color: #212529;
        }
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
            color: #fff;
        }
        .btn, button {
            padding: 0.375rem 0.75rem;
            margin: 0;
            font-size: 0.875rem;
            line-height: 1.5;
            border-radius: 0.25rem;
            cursor: pointer;
        }
        .btn-round {
            border-radius: 50rem;
        }
        .btn-toggle {
            border: none;
            background: transparent;
            color: inherit;
        }
        .btn-toggle:hover {
            background-color: #e9ecef;
        }
        .btn-toggle i {
            font-size: 1.25rem;
        }
        table {
            width: 100%;
            margin-bottom: 1rem;
            border-collapse: collapse;
        }
        table thead th {
            background-color: #343a40;
            color: #fff;
        }
        table tbody tr:hover {
            background-color: #e9ecef;
        }
        form {
            display: inline;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <div class="sidebar" data-background-color="dark">
            <div class="sidebar-logo">
                <!-- Logo Header -->
                <div class="logo-header" data-background-color="dark">
                    <a href="${path}/index.html" class="logo">
                        <img
                            src="${path}/resources/assets/img/kaiadmin/logo_light.svg"
                            alt="navbar brand"
                            class="navbar-brand"
                            height="20"
                        />
                    </a>
                    <div class="nav-toggle">
                        <button class="btn btn-toggle toggle-sidebar">
                            <i class="gg-menu-right"></i>
                        </button>
                        <button class="btn btn-toggle sidenav-toggler">
                            <i class="gg-menu-left"></i>
                        </button>
                    </div>
                    <button class="topbar-toggler more">
                        <i class="gg-more-vertical-alt"></i>
                    </button>
                </div>
                <!-- End Logo Header -->
            </div>
            <div class="sidebar-wrapper scrollbar scrollbar-inner">
                <div class="sidebar-content">
                    <ul class="nav nav-secondary">
                        <li class="nav-item">
                            <a href="${path}/admin/board/list" class="collapsed">
                                <i class="fas fa-th-list"></i>
                                <p>게시판</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${path}/notice/admin" class="collapsed">
                                <i class="fas fa-bell"></i>
                                <p>공지사항</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- End Sidebar -->

        <div class="main-panel">
            <!-- Header Bar -->
            <c:import url="${path}/WEB-INF/views/common/header_bar.jsp"/>

            <div class="container">
                <h1 class="mb-4">관리자 게시판 목록</h1>
                
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>카테고리</th>
                            <th>작업</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="board" items="${boardList}">
                            <c:if test="${board.BOARD_CATEGORY_KEY == 1}">
                                <tr>
                                    <td>${board.BOARD_KEY}</td>
                                    <td>${board.BOARD_TITLE}</td>
                                    <td>${board.MEMBER_KEY}</td>
                                    <td><fmt:formatDate value="${board.BOARD_ENROLL_DATE}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td>게시판</td>
                                    <td>
                   

                                        <!-- 삭제 버튼 폼 -->
                                        <form action="${path}/admin/board/delete/${board.BOARD_KEY}" method="post" style="display:inline;">
                                            <button type="submit" class="btn btn-danger">삭제</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Footer -->
            <c:import url="${path}/WEB-INF/views/common/footer.jsp"/>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="${path}/resources/assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="${path}/resources/assets/js/core/popper.min.js"></script>
    <script src="${path}/resources/assets/js/core/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JS -->
    <script src="${path}/resources/assets/js/kaiadmin.js"></script>
</body>
</html>
