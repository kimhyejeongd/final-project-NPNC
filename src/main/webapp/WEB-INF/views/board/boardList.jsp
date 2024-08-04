<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>게시판 목록</title>
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
        #loader {
            display: none;
            text-align: center;
            margin: 20px;
        }
    </style>
</head>
<body>
    <!-- Header -->

    <div class="wrapper">
        <!-- Sidebar -->
        <c:import url="${path}/WEB-INF/views/board/boardSidebar.jsp" />

        <!-- Main Panel -->
        <div class="main-panel">
          <c:import url="${path}/WEB-INF/views/common/header_bar.jsp"/>
          <div class="page-inner">
            
            <div class="container">
                <h1>게시판 목록</h1>
                <!-- Search Form -->
                <form method="get" action="${path}/board/list">
                    <div class="row mt-4">
                        <div class="col-md-8">
                            <input type="text" name="searchKeyword" class="form-control" placeholder="제목 검색" value="${param.searchKeyword}">
                        </div>
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-primary">검색</button>
                        </div>
                    </div>
                </form>
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
                                                    <td>${board.MEMBER_NAME}</td>
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
                <!-- Loader -->
                <div id="loader">
                    <img src="https://www.example.com/loading.gif" alt="Loading..." />
                </div>
            </div>
          </div>
          <c:import url="${path}/WEB-INF/views/common/footer.jsp" />
        </div>
    </div>
    
    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
        let page = 1;
        let loading = false;
        let hasMoreData = true; // 데이터가 더 있는지 여부를 추적

        function loadMoreData() {
            if (loading || !hasMoreData) return; // 이미 로딩 중이거나 더 이상 데이터가 없으면 종료

            loading = true;
            $("#loader").show();

            $.ajax({
                url: `${path}/board/loadMore`,
                type: 'GET',
                data: { page: page },
                success: function(response) {
                    $("#loader").hide();
                    loading = false;

                    // 서버에서 반환된 데이터가 있으면 추가
                    if (response.data.length > 0) {
                        let rows = '';
                        response.data.forEach(function(board) {
                            rows += `
                                <tr>
                                    <td>${board.BOARD_KEY}</td>
                                    <td><a href="${path}/board/detail/boardKey?boardKey=${board.BOARD_KEY}">${board.BOARD_TITLE}</a></td>
                                    <td>${board.MEMBER_KEY}</td>
                                    <td>${board.BOARD_UPDATE_DATE}</td>
                                </tr>
                                
                            `;
                        });
                        $('#multi-filter-select tbody').append(rows);
                        page++;
                    } else {
                        hasMoreData = false; // 더 이상 데이터가 없으면 플래그를 업데이트
                    }
                },
                error: function() {
                    $("#loader").hide();
                    loading = false;
                }
            });
        }

        $(window).scroll(function() {
            // 스크롤이 페이지 하단에 가까워지면 데이터 로드
            if ($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
                loadMoreData();
            }
            
        });
    });
    </script>
</body>
</html>
