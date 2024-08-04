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
    <style>
    
.highlighted {
    background-color: #ffeb3b !important; /* !important로 우선 순위 지정 */
    border: 1px solid #fbc02d !important;
    color: #000 !important;
}
    </style>
     <style>
#calendar{
	height:75% !important;
}
#timeCheckBox {
    font-size: 16px; /* 체크박스 레이블 크기 조정 */
    margin-top : 7%;
}
#timeCheckBox .selectgroup-item {
    font-size: 23px; /* 체크박스 크기 조정 */
}
#timeCheckBox .selectgroup-input {
    width: 20px;
    height: 20px;
}
#timeCheckBox .selectgroup-button {
    padding: 10px;
}
            </style>
<!--     <style>
   .fc-disabled-day .fc-daygrid-day-number {
      color: #b0b0b0; /* 회색 텍스트 */
      background-color: #f0f0f0; /* 연한 회색 배경 */
      pointer-events: none; /* 클릭 비활성화 */
    }
    </style> -->
    <!-- sweetalert2 부트스트랩 -->
    <!-- CSS Files -->
    <link rel="stylesheet" href="${path }/resources/bm/css/bootstrap-4.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${path }/resources/bm/css/fullcalendar.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/kaiadmin.min.css" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="${path}/resources/assets/css/demo.css" />
    <link rel="stylesheet" href="${path }/resources/bm/css/daterangepicker.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<body>
  <div class="wrapper">
    <!-- Sidebar -->
    <div class="sidebar" data-background-color="dark">
      <div class="sidebar-logo">
        <!-- Logo Header -->
        <div class="logo-header" data-background-color="dark">
            <a href="${path }/" class="logo">
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
          <div class="blogapp-content">
            <div class="blogapp-detail-wrap">
              <header class="blog-header">
                <div class="d-flex align-items-center">
                  <a class="blogapp-title link-dark" href="#">
                    <h1>예약물 목록</h1>
                  </a>
                </div>
                <div class="blog-options-wrap">
                  <a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover no-caret flex-shrink-0 d-lg-inline-block d-none" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Refresh" id="refreshButton">
                    <span class="icon"><span class="feather-icon"><i data-feather="refresh-cw"></i></span></span>
                  </a>
                  <div class="v-separator  d-lg-inline-block d-none"></div>
                  <a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover hk-navbar-togglable flex-shrink-0  d-lg-inline-block d-none" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Collapse">
                    <span class="icon"> 
                      <span class="feather-icon"><i data-feather="chevron-up"></i></span> 
                      <span class="feather-icon d-none"><i data-feather="chevron-down"></i></span>
                    </span>
                  </a>
                </div>
                <div class="hk-sidebar-togglable"></div>
              </header>		

              <div class="blog-body">
                <div class="d-flex align-items-center">
               		<div class="select-box-container">
                   		<select class="select-box" id="reservationTypeSelect">
	                      	<option value="all">전체</option>
	                       	<option value="차량">차량</option>
	                       	<option value="회의실">회의실</option>
                 		</select>
               		</div>
           		</div>

                <div class="tab-content">
                  <div class="tab-pane fade show active" id="all_post">
                    <table id="datable_1" class="table nowrap w-100 mb-5">
                      <thead>
                        <tr>
                          <th>예약번호</th>
                          <th>예약물종류</th>
                          <th>예약물이름</th>
                          <th>수용인원</th>
                          <th>예약날짜</th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:if test="${not empty myreservations}">
                          <c:forEach var="r" items="${myreservations}">
                            <tr class="reservation-row" data-item-type="${r.itemType}">
                              <td>${r.reservationKey}</td>
                              <td class="mw-250p text-truncate text-high-em">
                                <span>${r.itemType}</span>
                              </td>
                              <td>
                                <div class="media align-items-center">
                                  <div class="media-head me-2"></div>
                                  <div class="media-body">
                                    <span class="d-block">${r.itemName}</span>
                                  </div>
                                </div>
                              </td>
                              <td>${r.itemMax}인</td>
                              <td class="formatted-date-time-range" data-start ="${r.start }" data-end="${r.end }"></td>
                              <td>
                              	<button class="btn btn-primary btn-sm editReservation" data-item-key=${r.itemKey } data-calendar-key="${r.calendarKey }" data-item-name="${r.itemName }" data-date= "${r.date }" data-start-time ="${r.start }" data-end-time="${r.end }">수정</button>
                              	<button class="btn btn-danger btn-sm cancelReservation" data-calendar-key="${r.calendarKey}">취소</button>
                              </td>
                            </tr>
                          </c:forEach>
                        </c:if>
                      </tbody>
                    </table>
                  </div>
                </div>
                

                <div class="row mt-3">
                  <div class="col-sm-12">
                    <div class="float-end text-end">
                      <ul class="pagination custom-pagination pagination-simple active-theme">
                        <li class="paginate_button page-item previous disabled">
                          <a href="#" class="page-link"><i class="ri-arrow-left-s-line"></i></a>
                        </li>
                        <li class="paginate_button page-item active">
                          <a href="#" class="page-link">1</a>
                        </li>
                        <li class="paginate_button page-item next">
                          <a href="#" class="page-link"><i class="ri-arrow-right-s-line"></i></a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
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
  <!-- Sweet Ale rt -->
  <script src="${path}/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>
  <!-- Kaiadmin JS -->
  <script src="${path}/resources/assets/js/kaiadmin.js"></script>
  <!-- fancy dropdown js -->
  
  <script>
  	var userKey = "${loginMember.memberKey}";
  	var userName = "${loginMember.memberName}";
  	var userDeptCode = "${loginMember.departmentKey}";
  </script>
  
  <script>
  	const path='${path}';
  </script>

  <script>
    $(document).ready(function() {
      $('#reservationTypeSelect').change(function() {
        var selectedType = $(this).val();
        if (selectedType === 'all') {
          $('.reservation-row').show();
        } else {
          $('.reservation-row').hide();
          $('.reservation-row[data-item-type="' + selectedType + '"]').show();
        }
      });
    
    });
  </script>
  <script>
   var reservationItems = [
    	<c:if test="${not empty reservationItems}">
    		<c:forEach var="reItem" items="${reservationItems}" varStatus="l">
    			{
    				itemK : '${reItem.itemKey}',
    				day : '${reItem.date}',
    				times : [
    					<c:if test="${not empty reItem.time}">
    						<c:forEach var = "t" items="${reItem.time}" varStatus="loop">
    							'${t}'<c:if test="${!loop.last}">,</c:if>
    						</c:forEach>
    					</c:if>
    				]
    			}<c:if test="${!l.last}">,</c:if>
    		</c:forEach>
    	</c:if>
    ]
    
  </script>
  <script>
  	function formatShortDateTimeRange(start, end) {
	    // 파라미터로 받은 시작과 종료 시간을 'YYYY-MM-DD HH:mm:ss' 형식으로 파싱
	    const parseDateTime = (dateTimeStr) => {
	      // Replace space between date and time with 'T' for ISO string parsing
	      return new Date(dateTimeStr.replace(' ', 'T'));
	    };

	    const dateOptions = { month: 'short', day: 'numeric' };
	    const timeOptions = { hour: '2-digit', minute: '2-digit', hour12: true };

	    const startDate = parseDateTime(start);
	    const endDate = parseDateTime(end);
		console.log(startDate);
	    const formattedDate = startDate.toLocaleDateString('ko-KR', dateOptions);
	    const formattedStartTime = startDate.toLocaleTimeString('ko-KR', timeOptions);
	    const formattedEndTime = endDate.toLocaleTimeString('ko-KR', timeOptions);

	    return `\${formattedDate} \${formattedStartTime} - \${formattedEndTime}`;
	  }

	  document.addEventListener('DOMContentLoaded', () => {
	    document.querySelectorAll('.formatted-date-time-range').forEach(td => {
	      const start = td.getAttribute('data-start');
	      const end = td.getAttribute('data-end');
	      td.innerText = formatShortDateTimeRange(start, end);
	      console.log(td);
	    });
	  });
  </script>
  
  
  
   <script>
        $(document).ready(function () {
            $('.cancelReservation').on('click', function () {
                var calendarKey = $(this).data('calendar-key');
				console.log(typeof calendarKey);
                // SweetAlert2 모달을 띄우기
                Swal.fire({
                    title: '예약을 취소하시겠습니까??',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '취소',
                    cancelButtonText: '닫기'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Ajax 요청 보내기
                        $.ajax({
                            url: '/calendar/deletecalendar',  // 실제 취소 요청을 처리할 URL로 변경해야 합니다.
                            method: 'POST',
                            dataType: 'json',
                            data:  JSON.stringify(calendarKey),
                            contentType: 'application/json; charset=utf-8',
                            success: function (response) {
                                // 요청이 성공하면 페이지 새로고침
                                Swal.fire('취소되었습니다!', '', 'success').then(() => {
                                    location.reload();
                                });
                            },
                            error: function (xhr, status, error) {
                                // 요청이 실패하면 에러 메시지 표시
                                Swal.fire('취소에 실패했습니다.', '', 'error');
                            }
                        });
                    }
                });
            });
        });
    
    </script>
  
  
  <script src="${path}/resources/bm/js/dropdown-bootstrap-extended.js"></script>
  <script src="${path}/resources/bm/js/color-picker-data.js"></script>
  <script src="${path}/resources/bm/js/moment.min.js"></script>
  <script src="${path}/resources/bm/js/fullcalendar.global.js"></script>
  <script src="${path}/resources/bm/js/index.global.min.js"></script>
  <script src="${path}/resources/bm/js/daterangepicker-data.js"></script>
  <script src="${path}/resources/bm/js/daterangepicker.js"></script>
  <script src="${path}/resources/bm/js/sweetalert2.min.js"></script>
  <script src="${path}/resources/bm/js/editReservation.js"></script>
  

  
 
  
</body>
</html>
