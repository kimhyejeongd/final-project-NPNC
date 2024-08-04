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
	<link rel="stylesheet" href="https://unpkg.com/tippy.js@6/dist/tippy.css">
	<link rel="stylesheet" href="https://unpkg.com/tippy.js@6/themes/light-border.css">
<!-- 	<link rel="stylesheet" href="https://unpkg.com/tippy.js@6/themes/material.css">
	<link rel="stylesheet" href="https://unpkg.com/tippy.js@6/themes/translucent.css"> -->
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="${path}/resources/assets/css/demo.css" />
    <link rel="stylesheet" href="${path }/resources/bm/css/daterangepicker.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<style>
	/* 레이아웃 조정 */
	/* 각 이벤트 요소 */
/* #calendar .fc-event {
  cursor: pointer;
  padding: 5px 8px;
  margin-bottom: 5px;
  border-radius: 4px;
  font-weight: 500;
  font-size: 14px;
} */
	
  #content {
    position: absolute;
    display: none;
    z-index: 2;
  }
  #calendar {
    margin: 0 auto; /* 화면 중앙 정렬을 위한 가로 여백 설정 */
    width: 100%; /* 부모 요소의 너비를 모두 사용하도록 설정 */
    height: 750px;
  }
	.d-flex {
	  display: flex;
	  align-items: flex-start;
	}
	
	/* 체크박스 컨테이너 스타일 */
#checkbox {
  border: 1px solid #ddd; /* 박스 테두리 */
  border-radius: 4px; /* 박스 테두리 모서리 둥글게 */
  padding: 15px; /* 박스 내부 여백 */
  background-color: #f9f9f9; /* 박스 배경색 */
  margin-right: 20px; /* 캘린더와의 간격 */
}

.checkbox-container {
  display: flex;
  flex-direction: column; /* 세로 방향으로 항목을 나열 */
  flex-wrap: nowrap; /* 줄 바꿈을 하지 않도록 설정 */
}

.checkbox-category {
  margin-bottom: 20px;
}

.color-circle {
  width: 20px;
  height: 20px;
  border-radius: 50%;
  display: inline-block;
  margin-right: 10px;
}

.selectgroup-item {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
  width: 100%; /* 각 항목이 전체 너비를 차지하도록 설정 */
}

.selectgroup-item input[type="checkbox"] {
  margin-right: 10px;
}

.tippy-box[data-theme~='light-border'] {
    font-family: 'Roboto', sans-serif;
    background-color: #fff;
    color: #333;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    padding: 10px;
    max-width: 300px;
}

.tippy-box[data-theme~='light-border'] .tippy-arrow {
    color: #fff;
}

.tooltip-content {
    padding: 10px;
}

.popover-title {
    font-size: 1.2em;
    font-weight: 700;
    margin-bottom: 8px;
}

.popover-info {
    margin-bottom: 8px;
    font-size: 0.9em;
    color: #666;
}

.popover-description {
    font-size: 0.9em;
    color: #444;
}

.selected-member{
	background-color: DarkGray;

}
</style>
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;500;700&display=swap" rel="stylesheet">

<body>
  <div class="wrapper">
    <!-- Sidebar -->
    <div class="sidebar" data-background-color="dark">
      <div class="sidebar-logo">
        <!-- Logo Header -->
        <div class="logo-header" data-background-color="dark">
            <a href="index.html" class="logo">
              <img
                src="${path}/resources/assets/img/KakaoTalk_Photo_2024-07-08-14-27-11.png"
                alt="navbar brand"
                class="navbar-brand"
                height="90"
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
                <a
                  href="${path }/calendar"
                >
                  <i class="fas fa-home"></i><p>일정 Home</p>
                </a>
              </li>
              <!-- 토글리스트 -->
              <li class="nav-section">
                <span class="sidebar-mini-icon">
                  <i class="fa fa-ellipsis-h"></i>
                </span>
              </li>
              <li class="nav-item">
                <a data-bs-toggle="collapse" href="#docING">
                  <i class="fas fa-pen-square"></i>
                  <p>예약물</p>
                  <span class="caret"></span>
                </a>
                <div class="collapse" id="docING">
                  <ul class="nav nav-collapse">
                    <li>
                      <a href="${path }/reservation/reservationlist">
                        <span class="sub-item">예약하기</span>
                      </a>
                    </li>
                    <li>
                      <a href="${path }/reservation/myreservation">
                        <span class="sub-item">나의 예약</span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
            </ul>
          </div>
        </div>
    </div>
    <!-- End Sidebar -->

    <div class="main-panel">
      <!-- header_bar -->
      <%@ include file="/WEB-INF/views/common/header_bar.jsp" %>

		<div class="container">
		  <div class="page-inner">
		    <div class="d-flex">
		      <!-- Checkboxes Section -->
		
		       <div class="checkbox-container col-md-3" style="width: 15%; ">
	            <div class="checkbox-category">
	                <h5>일정</h5>
	                <div class="form-group">
	                    <div class="selectgroup selectgroup-pills">
	                        <label class="selectgroup-item">
	                            <div class="color-circle" style="background-color: #87CEFA;"></div>
	                            <input type="checkbox" class="selectgroup-input" id="myCalendar">
	                            <span class="selectgroup-button">내일정</span>
	                        </label>
	                        <label class="selectgroup-item">
	                            <div class="color-circle" style="background-color: #90EE90;"></div>
	                            <input type="checkbox" class="selectgroup-input" id="deptCalendar">
	                            <span class="selectgroup-button">부서일정</span>
	                        </label>
	                        <label class="selectgroup-item">
	                            <div class="color-circle" style="background-color: #F08080;"></div>
	                            <input type="checkbox" class="selectgroup-input" id="companyCalendar">
	                            <span class="selectgroup-button">전사일정</span>
	                        </label>
	                        <label class="selectgroup-item">
	                            <div class="color-circle" style="background-color: #F5DEB3;"></div>
	                            <input type="checkbox" class="selectgroup-input" id="reservationCalendar">
	                            <span class="selectgroup-button">예약일정</span>
	                        </label>
	                    </div>
	                </div>
	            </div>
	            <div class="checkbox-category">
	                <h5>휴가</h5>
	                <div class="form-group">
	                    <div class="selectgroup selectgroup-pills">
	                        <label class="selectgroup-item">
	                            <div class="color-circle" style="background-color: #F4A460;"></div>
	                            <input type="checkbox" class="selectgroup-input" id="myVacationCalendar">
	                            <span class="selectgroup-button">내 휴가일정</span>
	                        </label>
	                        <label class="selectgroup-item">
	                        	<div class="color-circle" style="background-color: #DDA0DD;"></div>
	                            <input type="checkbox" class="selectgroup-input" id="deptVacationCalendar">
	                            <span class="selectgroup-button">부서원 휴가일정</span>
	                        </label>
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
  
  <script>
 	const path = "${path}";
  </script>
  
  <script src="https://unpkg.com/@popperjs/core@2"></script>
  <script src="https://unpkg.com/tippy.js@6"></script>
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
