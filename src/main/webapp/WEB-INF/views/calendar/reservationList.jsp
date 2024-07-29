<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
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
    <link rel="stylesheet" href="${path}/resources/bm/css/bootstrap-4.min.css">
    <link rel="stylesheet" href="${path}/resources/bm/css/fullcalendar.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/kaiadmin.min.css" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="${path}/resources/assets/css/demo.css" />
    <link rel="stylesheet" href="${path}/resources/bm/css/daterangepicker.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
#calendarWrapper {
    display: flex;
    flex-direction: column;
}

#calendar {
    width: 100%;
    height: 450px;
    margin-bottom: 20px; /* 체크박스와 캘린더 사이의 간격 */
}

/* 체크박스의 각 항목 스타일 */
.selectgroup-item {
    margin-right: 5px; /* 체크박스 항목 사이의 간격 */
}

.selectgroup-button {
    padding: 10px;
    background-color: #ffffff; /* 흰색 배경 */
    color: #000000; /* 검정색 글자 */
    padding: 10px;
    border-radius: 5px;
    border: 2px solid #000000; /* 검정색 테두리 */
}
.fc-daygrid-day {
    position: relative;
}
.highlighted {
    background-color: #ffeb3b !important; /* !important로 우선 순위 지정 */
    border: 1px solid #fbc02d !important;
    color: #000 !important;
}
.select-box-container {
    display: flex;
    align-items: center;
    margin-bottom: 1rem;
}

.select-box {
    width: 150px;
    height: 30px;
    font-size: 14px;
    margin-right: 1rem;
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
                          <th>예약물번호</th>
                          <th>예약물종류</th>
                          <th>예약물이름</th>
                          <th>수용인원</th>
                          <th>사용가능여부</th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:if test="${not empty reservations}">
                          <c:forEach var="r" items="${reservations}">
                            <tr class="reservation-row" data-item-type="${r.itemType}">
                              <td>${r.itemKey}</td>
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
                              <td>${r.itemUse}</td>
                              <td>
                              	<button class="btn btn-primary btn-sm reserveStart"  data-item-name="${r.itemName}" data-item-key="${r.itemKey }">예약하기</button>
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
  <script src="${path}/resources/assets/js/core/popper.min.js"></script>
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

  <script>
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

  <script src="${path}/resources/bm/js/dropdown-bootstrap-extended.js"></script>
  <script src="${path}/resources/bm/js/color-picker-data.js"></script>
  <script src="${path}/resources/bm/js/moment.min.js"></script>
  <script src="${path}/resources/bm/js/fullcalendar.global.js"></script>
  <script src="${path}/resources/bm/js/index.global.min.js"></script>
  <script src="${path}/resources/bm/js/daterangepicker-data.js"></script>
  <script src="${path}/resources/bm/js/daterangepicker.js"></script>
  <script src="${path}/resources/bm/js/sweetalert2.min.js"></script>

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
    $(document).ready(function() {
        $('.reserveStart').on('click', function () {
            // itemName 값을 데이터 속성에서 가져옴
            var itemName = $(this).data('item-name');
            var itemKey = $(this).data('item-key');
            var selectedDate = null;
            const selectedTimes = [];
            var reservationItem = null;
            var reservedTimes = null;
         
          
            // SweetAlert2 모달을 띄우기
            Swal.fire({
                title: '예약하기',
                html: `
                    <h4>\${itemName}</h4>
                    <div id="calendar"></div>
                    <div id="timeCheckBox"></div>
                `,
                showCancelButton: true,
                cancelButtonText: '취소',
                confirmButtonText: '예약',
                width: '50%',
                heightAuto: true,
                didOpen: () => {
                    // 모달이 열린 후 실행할 코드
                    var currentDate = moment().format('YYYY-MM-DD');
                    var calendarEl = document.getElementById('calendar');
                    var previousDate = null;

                    var calendars = new FullCalendar.Calendar(calendarEl, {
                        initialView: 'dayGridMonth',
                        initialDate: currentDate, // 유효한 날짜로 초기화
                        themeSystem: 'bootstrap5',
                        selectable: true,
                        locale: 'ko',
                        timeZone: 'local',
                        slotMinTime: '09:00:00',
                        slotMaxTime: '18:00:00',
                        weekends: false,
                        views: {
                            timeGridWeek: {
                                slotMinTime: '09:00:00',
                                slotMaxTime: '18:00:00'
                            },
                            timeGridDay: {
                                slotMinTime: '09:00:00',
                                slotMaxTime: '18:00:00'
                            }
                        },
                        headerToolbar: {
                            left: 'prev',
                            center: 'title',
                            right: 'next'
                        },
                        datesSet: function(info) {
                            // 모든 날짜의 배경색을 기본 색으로 설정
                            $(calendarEl).find('.fc-daygrid-day').css('background-color', '#ffffff'); // 기본 색상

                            // 오늘 날짜의 배경색을 기본 색상으로 설정
                            $(calendarEl).find('.fc-day-today').css('background-color', '#ffffff'); // 기본 색상
                        },
                        displayEventTime: false,
                        dateClick: function(info) {
                        	
                            if (previousDate) {
                                // 이전에 하이라이트된 날짜를 원래대로 되돌리기
                                $(previousDate).removeClass('highlighted');
                            }
                            // 현재 클릭한 날짜에 하이라이트 추가
                            previousDate = info.dayEl;
                            $(previousDate).addClass('highlighted');
                            selectedDate = info.dateStr;
                            reservationItem = reservationItems.find(item => item.itemK == itemKey && item.day == selectedDate);
                            reservedTimes = reservationItem ? reservationItem.times : [];
                            
                            console.log(reservedTimes);
                    

                            const timeSlots = [];
                            const startTime = moment().startOf('day').add(9, 'hours'); // 오전 9시
                            const endTime = moment().startOf('day').add(18, 'hours'); // 오후 6시
                            const interval = 90; // 90분

                            // 시간 슬롯을 1시간 30분 간격으로 생성
                            for (let time = startTime; time.isBefore(endTime); time.add(interval, 'minutes')) {
                                timeSlots.push(time.format('YYYY-MM-DD HH:mm'));
                            }

                            const $timeSelector = $('#timeCheckBox');
                            $timeSelector.empty();
                            timeSlots.forEach((slot, index) => {
                                const timeDisplayStart = `\${slot.substring(11, 16)}`;
                                const timeDisplayEnd = moment(slot).add(90, 'minutes').format('HH:mm');
                                //현재 날짜/ 시간에 예약되어있으면, 선택하지못하게 분기처리
                                var isReserved = false;
                                if(index>=reservedTimes[0] && index<=reservedTimes[1]){
                                	isReserved = true;
                                }/* else{
                                	isReserved = false;
                                } */
                                console.log(index,isReserved);
                                $timeSelector.append(`
                                    <label class="selectgroup-item" style= "\${isReserved ? 'display: none;' : ''}">
                                        <input type="checkbox" name="time" value="\${index}" class="selectgroup-input"/>
                                        <span class="selectgroup-button">
                                            <span class="time-label">\${timeDisplayStart} - \${timeDisplayEnd}</span>
                                        </span>
                                    </label>
                                `);
                            });

                            $('input[name="time"]').on('click', function() {
                                if (selectedTimes.length === 0) {
                                    selectedTimes.push($(this).val());
                                } else if (selectedTimes.length === 1) {
                                    // 체크박스가 1개일 때
                                    // 추가로 누른 값이 원래 값보다 작으면, 원래 값 지우고 추가로 누른 값 배열에 넣고 체크.
                                    if (selectedTimes[0] > $(this).val()) {
                                        selectedTimes.pop();
                                        selectedTimes.push($(this).val());
                                        $('input[name="time"]').each(function() {
                                            this.checked = false;
                                            if (this.value === selectedTimes[0]) {
                                                this.checked = true;
                                            }
                                        });
                                    } else if (selectedTimes[0] < $(this).val()) {
                                        // 추가로 누른 값이 원래 값보다 크면, 추가로 누른 값 배열에 넣고 사이 값 모두 체크.
                                        selectedTimes.push($(this).val());
                                        $('input[name="time"]').each(function() {
                                            if (this.value >= selectedTimes[0] && this.value <= selectedTimes[1]) {
                                                this.checked = true;
                                            }
                                        });
                                    } else if (selectedTimes[0] === $(this).val()) {
                                        // 추가로 누른 값이 원래 값과 같으면, 배열 삭제
                                        selectedTimes.pop();
                                    }
                                } else if (selectedTimes.length === 2) {
                                    // 배열 길이가 2면, 모든 값 제거 후 체크박스 초기화 및 새로 누른 값만 체크
                                    selectedTimes.pop();
                                    selectedTimes.pop();
                                    selectedTimes.push($(this).val());
                                    $('input[name="time"]').each(function() {
                                        this.checked = false;
                                        if (this.value === selectedTimes[0]) {
                                            this.checked = true;
                                        }
                                    });
                                }
                            });
                        }
                    });

                    calendars.render();
                    document.querySelector('.fc-toolbar-title').style.fontSize = '18px';
                },
                preConfirm: () => {
                    if (!selectedDate || selectedTimes.length === 0) {
                        Swal.showValidationMessage('날짜와 시간을 선택하세요.');
                        return false;
                    }
                    return new Promise((resolve) => {
                        $.ajax({
                            url: '/reservation/insertre',
                            method: 'POST',
                            dataType: 'json',
                            data: JSON.stringify({
                                memberKey: userKey,
                                itemKey: itemKey,
                                itemName: itemName,
                                date: selectedDate,
                                time: selectedTimes
                            }),
                            contentType: "application/json; charset=utf-8",
                            success: (response) => {
                                resolve(response);
                            },
                            error: (xhr, status, error) => {
                                Swal.showValidationMessage('예약에 실패했습니다.');
                                resolve(false);
                            }
                        });
                    });
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    // 사용자가 '예약' 버튼을 클릭한 경우
                    Swal.fire('예약 완료!', '', 'success');
                }
            });
        });
    });

    </script>
</body>
</html>