<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport"/>
    <title>게시판 수정</title>
    
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
        .form-control, .btn {
            margin-bottom: 1rem;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
        }
        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            color: #fff;
        }
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
            color: #fff;
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
                        <li class="mb-4 text-center">
                            <a href="${path}/admin/board/create" class="btn btn-primary btn-round w-75">게시판 작성하기</a>
                        </li>
                        <li class="nav-item">
                            <a href="${path}/admin/board/list" class="collapsed">
                                <i class="fas fa-th-list"></i>
                                <p>게시판 목록</p>
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
                <h1 class="mb-4">게시판 수정</h1>

                <!-- 수정 폼 -->
                <form action="${path}/admin/board/update/${board.BOARD_KEY}" method="post">
                    <input type="hidden" name="_method" value="put" />
                    <div class="form-group">
                        <label for="title">제목</label>
                        <input type="text" id="title" name="BOARD_TITLE" class="form-control" value="${board.BOARD_TITLE}" required>
                    </div>
                    <div class="form-group">
                        <label for="content">내용</label>
                        <textarea id="content" name="BOARD_CONTENT" class="form-control" rows="5" required>${board.BOARD_CONTENT}</textarea>
                    </div>
                    <div class="form-group">
                        <label for="category">카테고리</label>
                        <select id="category" name="BOARD_CATEGORY_KEY" class="form-control" required>
                            <option value="1" ${board.BOARD_CATEGORY_KEY == 1 ? 'selected' : ''}>게시판</option>
                            <option value="2" ${board.BOARD_CATEGORY_KEY == 2 ? 'selected' : ''}>공지사항</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">수정 완료</button>
                    <a href="${path}/admin/board/list" class="btn btn-secondary">취소</a>
                </form>
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
