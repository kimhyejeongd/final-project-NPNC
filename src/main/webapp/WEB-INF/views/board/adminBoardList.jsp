<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport"/>
    <title>관리자 게시판 목록</title>
    
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
	<div class="wrapper">
    <c:import url="${path}/WEB-INF/views/admin/adminsidebar.jsp"/> 
   
    <div class="main-panel">
        <!-- Header Bar -->
      <c:import url="${path}/WEB-INF/views/common/header_bar.jsp"/>
    	<div class="page-inner">
        <div class="container">
       <h1>관리자 게시판</h1>
         <form method="get" action="${path}admin/board/list">
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
                        <th>카테고리</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="board" items="${boardList}">
                        <tr>
                            <td>${board.BOARD_KEY}</td>
                            <td>
                                <!-- 제목 클릭 시 상세 페이지로 이동 -->
                                <a href="${path}/admin/board/detail/${board.BOARD_KEY}">${board.BOARD_TITLE}</a>
                            </td>
                            <td>${board.MEMBER_NAME}</td>
                            <td><fmt:formatDate value="${board.BOARD_ENROLL_DATE}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>게시판</td>
                            <td>
                                <!-- 삭제 버튼 폼 -->
                                <form action="${path}/admin/board/delete/${board.BOARD_KEY}" method="post" style="display:inline;">
                                    <button type="submit" class="btn btn-danger">삭제</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            </div>
           </div>
           </div>
             <c:import url="${path}/WEB-INF/views/common/footer.jsp" />
        </div>
    </div>
    
    
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS and dependencies -->

</body>
</html>
