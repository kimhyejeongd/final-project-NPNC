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
    <title>게시판 목록</title>
    
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
            <!-- ... Sidebar 내용 ... -->
        </div>
        <!-- End Sidebar -->

        <div class="main-panel">
            <!-- Header Bar -->

            <c:import url="/WEB-INF/views/common/header_bar.jsp"/>


            <div class="container">
                <h1 class="mb-4">게시판 목록</h1>

                <!-- 게시판 목록 테이블 -->
                <table class="table">
                    <thead>
                        <tr>
                            <th>제목</th>
                            <th>내용</th>
                            <th>카테고리</th>
                            <th>조치</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="board" items="${boards}">
                            <tr>
                                <td>${board.BOARD_TITLE}</td>
                                <td>${board.BOARD_CONTENT}</td>
                                <td>${board.BOARD_CATEGORY_KEY == 1 ? '게시판' : '공지사항'}</td>
                                <td>
                                    <button type="button" class="btn btn-primary" onclick="openEditModal(${board.BOARD_KEY}, '${board.BOARD_TITLE}', '${board.BOARD_CONTENT}', ${board.BOARD_CATEGORY_KEY})">수정</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Footer -->
            <c:import url="/WEB-INF/views/common/footer.jsp"/>
        </div>
    </div>

    <!-- 수정 모달 -->
    <div class="modal fade" id="editBoardModal" tabindex="-1" aria-labelledby="editBoardModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editBoardModalLabel">게시판 수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="editBoardForm" action="${path}/admin/board/update" method="post">
                    <input type="hidden" name="_method" value="put" />
                    <input type="hidden" id="boardKey" name="BOARD_KEY" />
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="title">제목</label>
                            <input type="text" id="title" name="BOARD_TITLE" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="content">내용</label>
                            <textarea id="content" name="BOARD_CONTENT" class="form-control" rows="5" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="category">카테고리</label>
                            <select id="category" name="BOARD_CATEGORY_KEY" class="form-control" required>
                                <option value="1">게시판</option>
                                <option value="2">공지사항</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        <button type="submit" class="btn btn-primary">수정 완료</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="${path}/resources/assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="${path}/resources/assets/js/core/popper.min.js"></script>
    <script src="${path}/resources/assets/js/core/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JS -->
    <script src="${path}/resources/assets/js/kaiadmin.js"></script>

    <!-- 모달 스크립트 -->
    <script>
    function openEditModal(key, title, content, category) {
        // 모달 폼의 필드에 데이터 설정
        document.getElementById('boardKey').value = key;
        document.getElementById('title').value = title;
        document.getElementById('content').value = content;
        document.getElementById('category').value = category;

        // 모달 열기
        var myModal = new bootstrap.Modal(document.getElementById('editBoardModal'));
        myModal.show();
    }
    </script>
</body>
</html>
