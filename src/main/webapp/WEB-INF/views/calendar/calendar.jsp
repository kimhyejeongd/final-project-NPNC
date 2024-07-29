<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication var="loginMember" property="principal"/>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Kaiadmin - Bootstrap 5 Admin Dashboard</title>
    <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport" />
    <link rel="icon" href="${path}/resources/assets/img/kaiadmin/favicon.ico" type="image/x-icon" />
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
    <!-- sweetalert2 부트스트랩 -->
    <!-- CSS Files -->
    <link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${path }/resources/bm/css/bootstrap-4.min.css">
    <link rel="stylesheet" href="${path }/resources/bm/css/fullcalendar.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/kaiadmin.min.css" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="${path}/resources/assets/css/demo.css" />
    <link rel="stylesheet" href="${path }/resources/bm/css/daterangepicker.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<style>
  #content {
    position: absolute;
    display: none;
    z-index: 2;
  }
  #calendar {
    margin: 0 auto; /* 화면 중앙 정렬을 위한 가로 여백 설정 */
    width: 80%; /* 부모 요소의 너비를 모두 사용하도록 설정 */
    height: 700px;
  }
  .card {
    margin-bottom: 20px;
    padding: 10px;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
  }
  .card-header {
    font-weight: bold;
    margin-bottom: 10px;
  }
  .form-check {
    margin-bottom: 10px;
  }
  .selected-member {
        background-color: #d3f9d8; /* 선택된 멤버의 배경색을 변경 */
  }
</style>
<body>
  <div class="wrapper">
    <!-- Sidebar -->
    <div class="sidebar" data-background-color="dark">
      <div class="sidebar-logo">
        <!-- Logo Header -->
        <div class="logo-header" data-background-color="dark">
          <a href="index.html" class="logo">
            <img src="${path}/resources/assets/img/kaiadmin/logo_light.svg" alt="navbar brand" class="navbar-brand" height="20" />
          </a>
          <button class="topbar-toggler more">
            <i class="gg-more-vertical-alt"></i>
          </button>
        </div>
        <!-- End Logo Header -->
      </div>
      <div class="sidebar-wrapper scrollbar scrollbar-inner">
        <div class="sidebar-content"></div>
      </div>
    </div>
    <!-- End Sidebar -->

    <div class="main-panel">
      <!-- header_bar -->
      <%@ include file="/WEB-INF/views/common/header_bar.jsp" %>

      <div class="container">
        <div class="page-inner">
          <div class="row">
            <!-- Checkboxes Section -->
            <div class="col-md-3">
              <div class="card">
                <div class="card-header">
                  <h4>일정 유형</h4>
                </div>
                <div class="card-body">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="myCalendar">
                    <label class="form-check-label" for="myCalendar">내일정</label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="deptCalendar">
                    <label class="form-check-label" for="deptCalendar">부서일정</label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="companyCalendar">
                    <label class="form-check-label" for="companyCalendar">전사일정</label>
                  </div>
                  <div class="form-check">
                  	<input class="form-check-input" type="checkbox" id="reservationCalendar">
                  	<label class="form-check-label" for="reservationCalendar">예약일정</label>
                  </div>
                </div>
              </div>
            </div>
            <!-- Calendar Section -->
            <div class="col-md-9">
              <div class="calendarapp-content">
                <div id="calendar"></div>
              </div>
            </div>
          </div>
          <div id="content" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu" style="display:block; position:static; margin-bottom:5px;">
              <li><a tabindex="-1" href="#">내일정</a></li>
              <li><a tabindex="-1" href="#">부서일정</a></li>
              <li><a tabindex="-1" href="#">전사일정</a></li>
            </ul>
          </div>
        </div>
      </div>

      <!-- footer -->
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>
  </div>
  <!-- Core JS Files -->
  <%-- <script src="${path}/resources/assets/js/core/jquery-3.7.1.min.js"></script> --%>
  <script src="${path}/resources/assets/js/core/popper.min.js"></script>
  <%-- <script src="${path}/resources/assets/js/core/bootstrap.min.js"></script> --%>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <!-- jQuery Scrollbar -->
  <script src="${path}/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
  <!-- Chart JS -->
  <script src="${path}/resources/assets/js/plugin/chart.js/chart.min.js"></script>
  <!-- jQuery Sparkline -->
  <script src="${path}/resources/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>
  <!-- Chart Circle -->
  <script src="${path}/resources/assets/js/plugin/chart-circle/circles.min.js"></script>
  <!-- Datatables -->
  <script src="${path}/resources/assets/js/plugin/datatables/datatables.min.js"></script>
  <!-- Bootstrap Notify -->
  <script src="${path}/resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
  <!-- jQuery Vector Maps -->
  <script src="${path}/resources/assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
  <script src="${path}/resources/assets/js/plugin/jsvectormap/world.js"></script>
  <!-- Sweet Alert -->
  <script src="${path}/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>
  <!-- Kaiadmin JS -->
  <script src="${path}/resources/assets/js/kaiadmin.js"></script>
  <!-- fancy dropdown js -->
  
   <script>
    // JavaScript 내에서 서버에서 전달받은 organlist 데이터를 할당
    var organlist = [
        <c:forEach var="d" items="${organlist}" varStatus="status">
            {
                departmentName: '${d.departmentName}',
                memberlist: [
                    <c:forEach var="memberlist" items="${d.memberlist}" varStatus="memStatus">
                        <c:if test="${memberlist.memberName != loginMember.memberName}">
                        {
                            memberKey: '${memberlist.memberKey}',
                            memberName: '${memberlist.memberName}',
                            jobName: '${memberlist.jobName}'
                        }<c:if test="${!memStatus.last}">,</c:if>
                        </c:if>
                    </c:forEach>
                ]
            }<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];
  </script>
  <script>
  	var userKey = "${loginMember.memberKey}";
  	var userName = "${loginMember.memberName}";
  	var userDeptCode = "${loginMember.departmentKey}";
  </script>
  
  
  
  <script src="${path}/resources/bm/js/dropdown-bootstrap-extended.js"></script>
  <script src="${path}/resources/bm/js/color-picker-data.js"></script>
  <script src="${path}/resources/bm/js/moment.min.js"></script>
  <script src="${path}/resources/bm/js/fullcalendar.global.js"></script>
  <script src="${path}/resources/bm/js/index.global.min.js"></script>
  <script src="${path}/resources/bm/js/daterangepicker-data.js"></script>
  <script src="${path}/resources/bm/js/daterangepicker.js"></script>
  <script src="${path}/resources/bm/js/sweetalert2.min.js"></script>
  <script src="${path}/resources/bm/js/calendar.js"></script>
  <script src="${path}/resources/bm/js/addEvent.js"></script>
  <script src="${path}/resources/bm/js/editEvent.js"></script>
  
 
  
</body>
</html>
