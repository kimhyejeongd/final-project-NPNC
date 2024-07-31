<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시물 작성</title>
    
    <!-- CSS Files -->
    <link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/kaiadmin.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/demo.css" />
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
                            <a href="${path}/notice/list" class="collapsed">
                                <i class="fas fa-bell"></i>
                                <p>공지사항</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${path}/board/list" class="collapsed">
                                <i class="fas fa-th-list"></i>
                                <p>게시판</p>
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
                <div class="page-inner">
                    <h1 class="mb-4">게시물 작성</h1>
                    <div class="card">
                        <div class="card-body">
                            <form action="${path}/board/new" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="boardTitle">제목</label>
                                    <input type="text" id="boardTitle" name="BOARD_TITLE" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="author">작성자</label>
                                    <input type="text" id="author" name="MEMBER_KEY" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="content">내용</label>
                                    <textarea id="content" name="BOARD_DETAIL" class="form-control" rows="5" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="fileUpload">파일 첨부</label>
                                    <input type="file" id="fileUpload" name="upFile" class="form-control">
                                </div>
                                <button type="submit" class="btn btn-primary">작성</button>
                            </form>
                            <br>
                            <form action="${path}/board/list" method="get">
                                <button type="submit" class="btn btn-secondary">목록으로</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <c:import url="${path}/WEB-INF/views/common/footer.jsp"/>
        </div>
    </div>

    <!-- JS Files -->
    <script src="${path}/resources/assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="${path}/resources/assets/js/core/popper.min.js"></script>
    <script src="${path}/resources/assets/js/core/bootstrap.bundle.min.js"></script>
    <script src="${path}/resources/assets/js/kaiadmin.js"></script>
</body>
</html>
