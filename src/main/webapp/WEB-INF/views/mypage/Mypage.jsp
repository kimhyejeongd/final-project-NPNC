<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication var="loginMember" property="principal"/>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>게시판</title>
    <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport"/>
    <link rel="icon" href="${path}/resources/assets/img/kaiadmin/favicon.ico" type="image/x-icon"/>

    <!-- Fonts and icons -->
    <script src="${path}/resources/assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
      WebFont.load({
        google: { families: ["Public Sans:300,400,500,600,700"] },
        custom: {
          families: [
            "Font Awesome 5 Solid",
            "Font Awesome 5 Regular",
            "Font Awesome 5 Brands",
            "simple-line-icons",
          ],
          urls: ["${path}/resources/assets/css/fonts.min.css"],
        },
        active: function () {
          sessionStorage.fonts = true;
        },
      });
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/kaiadmin.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/demo.css" />
    <style>
        /* General Layout Styles */
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
        }
        
        .wrapper {
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        .sidebar {
            width: 250px; /* Sidebar width */
            background-color: #333; /* Sidebar background color */
            color: white;
            position: fixed;
            top: 60px; /* Positioned below the header */
            left: 0;
            height: calc(100vh - 60px); /* Full height minus header height */
            overflow-y: auto;
            z-index: 100; /* Sidebar below header */
        }

        .main-panel {
            margin-left: 250px; /* Sidebar width */
            margin-top: 60px; /* Header height */
            padding: 20px;
            width: calc(100% - 250px); /* Remaining width */
            background-color: #f8f9fa; /* Background color for main content */
            overflow: auto;
            flex: 1;
        }

        .header {
            width: calc(100% - 250px); /* Adjust width based on sidebar */
            background-color: #f8f9fa; /* Light background color for header */
            border-bottom: 1px solid #ddd;
            position: fixed;
            top: 0;
            left: 250px; /* Adjust to match sidebar width */
            height: 60px; /* Header height */
            line-height: 60px; /* Center content vertically */
            padding-left: 20px;
            z-index: 200; /* Ensure header is on top of sidebar */
        }

        .footer {
            background-color: #f1f1f1; /* Footer background color */
            border-top: 1px solid #ddd;
            padding: 10px;
            position: relative;
            bottom: 0;
            width: 100%;
            text-align: center;
        }

        .table-responsive {
            margin-top: 20px;
        }

        .table thead th {
            background-color: #f1f1f1;
        }

        .table tbody tr:hover {
            background-color: #f9f9f9;
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
                    <a href="${path}/home" class="logo">
                        <img src="${path}/resources/assets/img/KakaoTalk_Photo_2024-07-08-14-27-11.png" alt="navbar brand" class="navbar-brand" height="90"/>
                    </a>
                    <div class="nav-toggle">
                        <button class="btn btn-toggle toggle-sidebar">
                            <i class="gg-menu-right"></i>
                        </button>
                        <button class="btn btn-toggle sidenav-toggler">
                            <i class="gg-menu-left"></i>
                        </button>
                    </div>
                </div>
                <!-- End Logo Header -->
            </div>
            <div class="sidebar-wrapper scrollbar scrollbar-inner">
                <div class="sidebar-content">
                    <ul class="nav nav-secondary">
                        <li class="nav-item">
                            <a href="${path}/member/mypage">
                                <i class="fas fa-home"></i><p>Mypage</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${path}/board/list">
                                <i class="fas fa-list"></i><p>게시판</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- End Sidebar -->

        <!-- Main Panel -->
        <div class="main-panel">
            <!-- Header -->
            <div class="header">
                <%@ include file="/WEB-INF/views/common/header_bar.jsp" %>
            </div>
            
            <!-- Page Content -->
            <div class="container">
                <h4 class="mb-4">게시판</h4>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Loop through posts -->
                            <c:forEach var="post" items="${posts}">
                                <tr>
                                    <td>${post.id}</td>
                                    <td><a href="${path}/board/view/${post.id}">${post.title}</a></td>
                                    <td>${post.author}</td>
                                    <td>${post.createdDate}</td>
                                    <td>${post.viewCount}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="mt-4">
                    <a href="${path}/board/create" class="btn btn-primary">새 게시글 작성</a>
                </div>
        

            <!-- Footer -->
            <div class="footer">
                <%@ include file="/WEB-INF/views/common/footer.jsp" %>
            </div>
    
        <!-- End Main Panel -->
    </div>

    <!-- Core JS Files -->
    <script src="${path}/resources/assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="${path}/resources/assets/js/core/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <!-- Plugin JS Files -->
    <script src="${path}/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/chart.js/chart.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/chart-circle/circles.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/datatables/datatables.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/jsvectormap/world.js"></script>
    <script src="${path}/resources/assets/js/plugin/moment/moment.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/fullcalendar/fullcalendar.min.js"></script>

    <!-- Main JS Files -->
    <script src="${path}/resources/assets/js/kaiadmin.min.js"></script>
</body>
</html>
