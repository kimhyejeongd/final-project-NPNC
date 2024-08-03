<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<sec:authentication var="loginMember" property="principal"/>

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
    
    <!-- Custom CSS -->
    <style>
        .card-body {
            font-size: 16px;
        }
        .image-container img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
        }
        .comment, .reply {
            border: 1px solid #ddd;
            padding: 5px;
            margin-bottom: 10px;
            border-radius: 5px;
            background-color: #f9f9f9;
            position: relative;
        }
        .comment {
            margin-left: 0;
        }
        .reply {
            margin-left: 20px;
            border-left: 2px solid #007bff;
        }
        .comment .meta, .reply .meta {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
        }
        .comment .meta .author, .reply .meta .author {
            font-weight: bold;
        }
        .comment .meta .date, .reply .meta .date {
            color: #666;
            font-size: 0.9em;
        }
        .comment-actions, .reply-actions {
            display: flex;
            align-items: center;
            margin-top: 5px;
        }
        .comment-actions button, .reply-actions button {
            margin-right: 5px;
            background-color: #6c757d;
            color: white;
            border: none;
            padding: 2px 6px;
            border-radius: 3px;
        }
        .comment-form, .reply-form {
            margin-top: 20px;
        }
        .form-control {
            border-radius: 5px;
            box-shadow: none;
        }
        .btn {
            border-radius: 5px;
            background-color: #6c757d;
            color: white;
            border: none;
        }
        .btn:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <!-- Sidebar -->
          <c:import url="${path}/WEB-INF/views/admin/adminsidebar.jsp"/> 

        <div class="main-panel">
            <!-- Header Bar -->
            <c:import url="${path}/WEB-INF/views/common/header_bar.jsp"/>

            <div class="container">
                <div class="page-inner">
                    <h1 class="mb-4">관리자 게시물 상세보기</h1>

                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">${boardDto.BOARD_TITLE}</h4>
                        </div>
                        <div class="card-body">
                            <p><strong>작성자:</strong> ${boardDto.MEMBER_KEY}</p>
                            <p><strong>작성일:</strong> <fmt:formatDate value="${boardDto.BOARD_ENROLL_DATE}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                            <p>${boardDto.BOARD_DETAIL}</p>
                            <c:forEach var="file" items="${fileList}">
                                <c:if test="${not empty file.BOARD_FILE_ORI}">
                                    <div class="image-container">
                                        <img src="${path}/resources/hj/${file.BOARD_FILE_POST}" alt="게시물 이미지"/>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>

                    <!-- 댓글 목록 -->
                    <div class="comments mt-4">
                        <c:forEach var="comment" items="${comments}">
                            <div class="comment mt-3">
                                <div class="meta">
                                    <span class="author">${comment.MEMBER_KEY}</span>
                                    <span class="date"><fmt:formatDate value="${comment.BOARD_COMMENT_DATE}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                                </div>
                                <p>${comment.BOARD_COMMENT_DETAIL}</p>

                                <!-- 댓글 삭제 버튼 (관리자만 표시) -->
                                <div class="comment-actions">
                                    <form action="${path}/admin/board/deleteComment/${comment.BOARD_COMMENT_KEY}" method="post" class="d-inline">
                                        <input type="hidden" name="boardKey" value="${boardDto.BOARD_KEY}"/>
                                        <button type="submit">삭제</button>
                                    </form>
                                </div>

                                <!-- 대댓글 목록 -->
                                <c:forEach var="reply" items="${commentRepliesMap[comment.BOARD_COMMENT_KEY]}">
                                    <div class="reply mt-2">
                                        <div class="meta">
                                            <span class="author">${reply.MEMBER_KEY}</span>
                                            <span class="date"><fmt:formatDate value="${reply.BOARD_COMMENT_DATE}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                                        </div>
                                        <p>${reply.BOARD_COMMENT_DETAIL}</p>

                                        <!-- 대댓글 삭제 버튼 (관리자만 표시) -->
                                        <div class="reply-actions">
                                            <form action="${path}/admin/board/deleteReply/${reply.BOARD_COMMENT_KEY}" method="post" class="d-inline">
                                                <input type="hidden" name="boardKey" value="${boardDto.BOARD_KEY}"/>
                                                <button type="submit">삭제</button>
                                            </form>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </c:forEach>
                    </div>

            <!-- Footer -->
            <c:import url="${path}/WEB-INF/views/common/footer.jsp"/>
        </div>
    </div>

    <!-- JS Files -->
    <script src="${path}/resources/assets/js/core/jquery.3.2.1.min.js"></script>
    <script src="${path}/resources/assets/js/core/popper.min.js"></script>
    <script src="${path}/resources/assets/js/core/bootstrap.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>
    <script src="${path}/resources/assets/js/ready.min.js"></script>
</body>
</html>
