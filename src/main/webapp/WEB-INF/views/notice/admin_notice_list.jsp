<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>공지사항 - 관리자</title>
    <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport"/>

    <!-- Favicon -->
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

    <!-- SweetAlert2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.min.css" rel="stylesheet">

    <!-- Custom Styles -->
    <style>
        #tablerow:hover {
            cursor: pointer; 
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
                  <a href="${path }/notice/create" class="btn btn-primary btn-round w-75">공지사항 작성하기</a>
          		     </li>
                        <li class="nav-item">
                            <a href="${path}/notice/admin" class="collapsed">
                                <i class="fas fa-bell"></i>
                                <p>공지사항</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${path}/admin/board/list" class="collapsed">
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
                    <h1 class="mb-4">공지사항 목록(관리자)</h1>
                    

                    <table class="table table-bordered">
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
                            <c:forEach var="notice" items="${noticeList}">
                                <tr>
                                    <td>${notice.noticeKey}</td>
                                    <td><a href="${path}/notice/detail?noticeKey=${notice.noticeKey}">${notice.noticeTitle}</a></td>
                                    <td>${notice.memberKey}</td>
                                    <td><fmt:formatDate value="${notice.noticeEnrollDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td><a href="${path}/notice/edit/${notice.noticeKey}" class="btn btn-warning">수정</a></td>
                                    <td><a href="${path}/notice/delete/${notice.noticeKey}" class="btn btn-danger">삭제</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.all.min.js"></script>
    
    <!-- Script for setting path in session storage -->
    <script>
        sessionStorage.setItem("path", "${pageContext.request.contextPath}");
    </script>
</body>
</html>
