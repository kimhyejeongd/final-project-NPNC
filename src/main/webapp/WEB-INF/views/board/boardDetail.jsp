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
        .hidden {
            display: none;
        }
    </style>
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
                                        <img src="${path}/resources/hj/${file.BOARD_FILE_POST}" alt="게시물 이미지"/>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                    
                    <!-- 댓글 작성 폼 -->
                    <div class="comment-form mt-4">
                        <h3>댓글 작성</h3>
                        <form action="${path}/board/addComment" method="post">
                            <input type="hidden" name="BOARD_KEY" value="${board.BOARD_KEY}">
                            <textarea class="form-control" name="BOARD_COMMENT_DETAIL" rows="3" placeholder="댓글을 입력하세요" required></textarea>
                            <button type="submit" class="btn btn-secondary btn-sm mt-2">댓글 작성</button>
                        </form>
                    </div>

                    <!-- 댓글 목록 -->
                    <div class="comments mt-4">
                        <h3>댓글</h3>
                        <c:forEach var="comment" items="${comments}">
                            <div class="comment" id="comment-${comment.BOARD_COMMENT_KEY}">
                                <div class="meta">
                                    <span class="author">${comment.MEMBER_KEY}</span>
                                    <span class="date"><fmt:formatDate value="${comment.BOARD_COMMENT_DATE}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                                </div>
                                <p class="comment-detail">${comment.BOARD_COMMENT_DETAIL}</p>
                                
                                <!-- 수정 및 삭제 버튼 (작성자만 표시) -->
                                <c:if test="${comment.MEMBER_KEY == loginMember.memberKey}">
                                    <div class="comment-actions">
                                        <button class="btn btn-sm" onclick="editComment(${comment.BOARD_COMMENT_KEY})">수정</button>
                                        <form action="${path}/board/deleteComment" method="post" class="d-inline">
                                            <input type="hidden" name="commentKey" value="${comment.BOARD_COMMENT_KEY}">
                                            <input type="hidden" name="boardKey" value="${board.BOARD_KEY}">
                                            <button type="submit" class="btn btn-sm">삭제</button>
                                        </form>
                                    </div>
                                </c:if>
                                
                                <!-- 댓글 수정 폼 (기본적으로 숨김 처리) -->
                                <div id="edit-comment-${comment.BOARD_COMMENT_KEY}" class="comment-form mt-2 hidden">
                                    <form onsubmit="updateComment(event, ${comment.BOARD_COMMENT_KEY})">
                                        <input type="hidden" name="commentKey" value="${comment.BOARD_COMMENT_KEY}">
                                        <input type="hidden" name="boardKey" value="${board.BOARD_KEY}">
                                        <textarea class="form-control" name="BOARD_COMMENT_DETAIL" rows="3" required>${comment.BOARD_COMMENT_DETAIL}</textarea>
                                        <button type="submit" class="btn btn-secondary btn-sm mt-2">수정 완료</button>
                                        <button type="button" class="btn btn-secondary btn-sm mt-2" onclick="cancelEditComment(${comment.BOARD_COMMENT_KEY})">취소</button>
                                    </form>
                                </div>

                                <!-- 대댓글 작성 폼 -->
                                <div class="reply-form mt-2">
                                    <form action="${path}/board/addReply" method="post">
                                        <input type="hidden" name="BOARD_KEY" value="${board.BOARD_KEY}">
                                        <input type="hidden" name="BOARD_COMMENT_REF" value="${comment.BOARD_COMMENT_KEY}">
                                        <input type="hidden" name="BOARD_COMMENT_LEVEL" value="${comment.BOARD_COMMENT_LEVEL + 1}">
                                        <input type="text" class="form-control" name="BOARD_COMMENT_DETAIL" placeholder="대댓글을 입력하세요" required>
                                        <button type="submit" class="btn btn-secondary btn-sm mt-2">대댓글 작성</button>
                                    </form>
                                </div>

                                <!-- 대댓글 목록 -->
                                <c:forEach var="reply" items="${commentRepliesMap[comment.BOARD_COMMENT_KEY]}">
                                    <div class="reply" id="reply-${reply.BOARD_COMMENT_KEY}">
                                        <div class="meta">
                                            <span class="author">${reply.MEMBER_KEY}</span>
                                            <span class="date"><fmt:formatDate value="${reply.BOARD_COMMENT_DATE}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                                        </div>
                                        <p class="reply-detail">${reply.BOARD_COMMENT_DETAIL}</p>

                                        <!-- 수정 및 삭제 버튼 (작성자만 표시) -->
                                        <c:if test="${reply.MEMBER_KEY == loginMember.memberKey}">
                                            <div class="reply-actions">
                                                <button class="btn btn-sm" onclick="editReply(${reply.BOARD_COMMENT_KEY})">수정</button>
                                                <form action="${path}/board/deleteComment" method="post" class="d-inline">
                                                    <input type="hidden" name="commentKey" value="${reply.BOARD_COMMENT_KEY}">
                                                    <input type="hidden" name="boardKey" value="${board.BOARD_KEY}">
                                                    <button type="submit" class="btn btn-sm">삭제</button>
                                                </form>
                                            </div>
                                        </c:if>

                                        <!-- 대댓글 수정 폼 (기본적으로 숨김 처리) -->
                                        <div id="edit-reply-${reply.BOARD_COMMENT_KEY}" class="reply-form mt-2 hidden">
                                            <form onsubmit="updateReply(event, ${reply.BOARD_COMMENT_KEY})">
                                                <input type="hidden" name="commentKey" value="${reply.BOARD_COMMENT_KEY}">
                                                <input type="hidden" name="boardKey" value="${board.BOARD_KEY}">
                                                <input type="hidden" name="BOARD_COMMENT_REF" value="${reply.BOARD_COMMENT_REF}">
                                                <input type="hidden" name="BOARD_COMMENT_LEVEL" value="${reply.BOARD_COMMENT_LEVEL}">
                                                <input type="text" class="form-control" name="BOARD_COMMENT_DETAIL" value="${reply.BOARD_COMMENT_DETAIL}" required>
                                                <button type="submit" class="btn btn-secondary btn-sm mt-2">수정 완료</button>
                                                <button type="button" class="btn btn-secondary btn-sm mt-2" onclick="cancelEditReply(${reply.BOARD_COMMENT_KEY})">취소</button>
                                            </form>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <c:import url="${path}/WEB-INF/views/common/footer.jsp"/>
        </div>
    </div>

    <!-- JavaScript Files -->
    <script src="${path}/resources/assets/js/core/jquery.3.2.1.min.js"></script>
    <script src="${path}/resources/assets/js/core/bootstrap.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/sweetalert2/sweetalert2.all.min.js"></script>
    <script src="${path}/resources/assets/js/atlantis.min.js"></script>

    <!-- Custom JavaScript -->
    <script>
        function editComment(commentKey) {
            var commentElement = document.getElementById('comment-' + commentKey);
            var editForm = document.getElementById('edit-comment-' + commentKey);
            var commentDetail = commentElement.querySelector('.comment-detail');

            commentDetail.classList.add('hidden');
            editForm.classList.remove('hidden');
        }

        function cancelEditComment(commentKey) {
            var commentElement = document.getElementById('comment-' + commentKey);
            var editForm = document.getElementById('edit-comment-' + commentKey);
            var commentDetail = commentElement.querySelector('.comment-detail');

            commentDetail.classList.remove('hidden');
            editForm.classList.add('hidden');
        }

        function updateComment(event, commentKey) {
            event.preventDefault();

            var form = event.target;
            var formData = new FormData(form);

            $.ajax({
                url: '${path}/board/updateComment',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    var commentElement = document.getElementById('comment-' + commentKey);
                    var editForm = document.getElementById('edit-comment-' + commentKey);
                    var commentDetail = commentElement.querySelector('.comment-detail');
                    
                    commentDetail.innerText = formData.get('BOARD_COMMENT_DETAIL');
                    commentDetail.classList.remove('hidden');
                    editForm.classList.add('hidden');
                    
                    Swal.fire('성공!', '댓글이 수정되었습니다.', 'success');
                },
                error: function() {
                    Swal.fire('실패!', '댓글 수정에 실패했습니다.', 'error');
                }
            });
        }

        function editReply(replyKey) {
            var replyElement = document.getElementById('reply-' + replyKey);
            var editForm = document.getElementById('edit-reply-' + replyKey);
            var replyDetail = replyElement.querySelector('.reply-detail');

            replyDetail.classList.add('hidden');
            editForm.classList.remove('hidden');
        }

        function cancelEditReply(replyKey) {
            var replyElement = document.getElementById('reply-' + replyKey);
            var editForm = document.getElementById('edit-reply-' + replyKey);
            var replyDetail = replyElement.querySelector('.reply-detail');

            replyDetail.classList.remove('hidden');
            editForm.classList.add('hidden');
        }

        function updateReply(event, replyKey) {
            event.preventDefault();

            var form = event.target;
            var formData = new FormData(form);

            $.ajax({
                url: '${path}/board/updateComment',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    var replyElement = document.getElementById('reply-' + replyKey);
                    var editForm = document.getElementById('edit-reply-' + replyKey);
                    var replyDetail = replyElement.querySelector('.reply-detail');

                    replyDetail.innerText = formData.get('BOARD_COMMENT_DETAIL');
                    replyDetail.classList.remove('hidden');
                    editForm.classList.add('hidden');
                    
                    Swal.fire('성공!', '대댓글이 수정되었습니다.', 'success');
                },
                error: function() {
                    Swal.fire('실패!', '대댓글 수정에 실패했습니다.', 'error');
                }
            });
        }
    </script>
</body>
</html>
