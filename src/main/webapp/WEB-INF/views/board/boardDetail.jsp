<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>게시물 상세보기</title>
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
</head>
<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <div class="sidebar" data-background-color="dark">
            <div class="sidebar-logo">
                <div class="logo-header" data-background-color="dark">
                    <a href="${path}/index.html" class="logo">
                        <img src="${path}/resources/assets/img/kaiadmin/logo_light.svg" alt="navbar brand" class="navbar-brand" height="20"/>
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
                    <h1 class="mb-4">게시물 상세보기</h1>

                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">${board.BOARD_TITLE}</h4>
                        </div>
                        <div class="card-body">
                            <p><strong>작성자:</strong> ${board.MEMBER_KEY}</p>
                            <p><strong>작성일:</strong> <fmt:formatDate value="${board.BOARD_ENROLL_DATE}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                            <p>${board.BOARD_DETAIL}</p>
                            <c:forEach var="file" items="${fileList}">
                                <c:if test="${not empty file.BOARD_FILE_ORI}">
                                    <div class="image-container">
                                        <img src="${path}/resources/hj/${file.BOARD_FILE_ORI}" alt="게시물 이미지" class="img-fluid"/>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="card-footer">
                            <a href="${path}/board/list" class="btn btn-primary">목록으로 돌아가기</a>
                        </div>
                    </div>
                    
                    <!-- 댓글 목록 -->
                    <div class="comments mt-4">
                        <h3>댓글</h3>
                        <c:forEach var="comment" items="${comments}">
                            <div class="comment">
                                <p><strong>${comment.MEMBER_KEY}</strong> <fmt:formatDate value="${comment.BOARD_COMMENT_DATE}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                                <p>${comment.BOARD_COMMENT_DETAIL}</p>
                                
                                <!-- 수정 및 삭제 버튼 (작성자만 표시) -->
                                <c:if test="${comment.MEMBER_KEY == sessionScope.loggedInUser.MEMBER_KEY}">
                                    <form action="${path}/board/updateComment" method="post" class="d-inline">
                                        <input type="hidden" name="BOARD_COMMENT_KEY" value="${comment.BOARD_COMMENT_KEY}">
                                        <input type="hidden" name="BOARD_KEY" value="${board.BOARD_KEY}">
                                        <input type="text" name="BOARD_COMMENT_DETAIL" value="${comment.BOARD_COMMENT_DETAIL}">
                                        <button type="submit" class="btn btn-warning btn-sm">수정</button>
                                    </form>
                                    <form action="${path}/board/deleteComment" method="post" class="d-inline">
                                        <input type="hidden" name="commentKey" value="${comment.BOARD_COMMENT_KEY}">
                                        <input type="hidden" name="boardKey" value="${board.BOARD_KEY}">
                                        <button type="submit" class="btn btn-danger btn-sm">삭제</button>
                                    </form>
                                </c:if>
                                
                                <!-- 대댓글 작성 폼 -->
                                <form action="${path}/board/addComment" method="post" class="mt-2">
                                    <input type="hidden" name="BOARD_KEY" value="${board.BOARD_KEY}">
                                    <input type="hidden" name="BOARD_COMMENT_REF" value="${comment.BOARD_COMMENT_KEY}">
                                    <input type="hidden" name="BOARD_COMMENT_LEVEL" value="${comment.BOARD_COMMENT_LEVEL + 1}">
                                    <input type="text" name="BOARD_COMMENT_DETAIL" placeholder="대댓글을 입력하세요" required>
                                    <button type="submit" class="btn btn-secondary btn-sm">대댓글 작성</button>
                                </form>
                            </div>
                        </c:forEach>
                    </div>
                    
                    <!-- 댓글 작성 폼 -->
                    <div class="mt-4">
                        <h3>댓글 작성</h3>
                        <form action="${path}/board/addComment" method="post">
                            <input type="hidden" name="BOARD_KEY" value="${board.BOARD_KEY}">
                            <input type="hidden" name="BOARD_COMMENT_LEVEL" value="0">
                            <input type="text" name="BOARD_COMMENT_DETAIL" placeholder="댓글을 입력하세요" required>
                            <button type="submit" class="btn btn-primary">작성</button>
                        </form>
                    </div>

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
</body>
</html>
