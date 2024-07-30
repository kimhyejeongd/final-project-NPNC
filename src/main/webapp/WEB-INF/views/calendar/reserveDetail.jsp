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
        .selectgroup-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 1rem;
            position: relative;
        }
        .selectgroup-button {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .time-label {
            font-weight: bold;
            color: #333;
            margin-bottom: 0.5rem; /* 시간 텍스트와 체크박스 간의 간격 설정 */
        }
        .selectgroup-input {
            display: none;
        }
        .selectgroup-item input:checked + .selectgroup-button {
            background-color: #007bff;
            color: #fff;
        }
    </style>
    <!-- CSS Files -->
    <link rel="stylesheet" href="${path}/resources/bm/css/bootstrap-4.min.css">
    <link rel="stylesheet" href="${path}/resources/bm/css/fullcalendar.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/kaiadmin.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/demo.css" />
    <link rel="stylesheet" href="${path}/resources/bm/css/daterangepicker.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="${path}/resources/bm/js/moment.min.js"></script>
</head>
<body>
  <div class="wrapper">
    <!-- Sidebar -->
    <div class="sidebar" data-background-color="dark">
      <div class="sidebar-logo">
        <div class="logo-header" data-background-color="dark">
          <a href="index.html" class="logo">
            <img src="${path}/resources/assets/img/kaiadmin/logo_light.svg" alt="navbar brand" class="navbar-brand" height="20" />
          </a>
          <button class="topbar-toggler more">
            <i class="gg-more-vertical-alt"></i>
          </button>
        </div>
      </div>
      <div class="sidebar-wrapper scrollbar scrollbar-inner">
        <div class="sidebar-content"></div>
      </div>
    </div>

    <div class="main-panel">
      <!-- header_bar -->
      <%@ include file="/WEB-INF/views/common/header_bar.jsp" %>

      <div class="container">
        <div class="page-inner">
          <h1 class="my-4">시간 선택 체크박스</h1>
          <div class="form-group">
            <label class="form-label">시간 선택</label>
            <div class="selectgroup w-100" id="timeSelector">
                <!-- 시간 체크박스가 동적으로 생성될 영역 -->
            </div>
          </div>
          <!-- footer -->
          <%@ include file="/WEB-INF/views/common/footer.jsp" %>
        </div>
      </div>
    </div>
  </div>

  <!-- Core JS Files -->
  <script src="${path}/resources/assets/js/core/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <script src="${path}/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
  <script src="${path}/resources/assets/js/plugin/chart.js/chart.min.js"></script>
  <script src="${path}/resources/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>
  <script src="${path}/resources/assets/js/plugin/chart-circle/circles.min.js"></script>
  <script src="${path}/resources/assets/js/plugin/datatables/datatables.min.js"></script>
  <script src="${path}/resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
  <script src="${path}/resources/assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
  <script src="${path}/resources/assets/js/plugin/jsvectormap/world.js"></script>
  <script src="${path}/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>
  <script src="${path}/resources/assets/js/kaiadmin.js"></script>
  <script src="${path}/resources/bm/js/dropdown-bootstrap-extended.js"></script>
  <script src="${path}/resources/bm/js/color-picker-data.js"></script>
  <script src="${path}/resources/bm/js/fullcalendar.global.js"></script>
  <script src="${path}/resources/bm/js/index.global.min.js"></script>
  <script src="${path}/resources/bm/js/daterangepicker-data.js"></script>
  <script src="${path}/resources/bm/js/daterangepicker.js"></script>
  <script src="${path}/resources/bm/js/sweetalert2.min.js"></script>

  <!-- Custom Script -->
  <script>
    $(document).ready(function() {
        const timeSlots = [];
        const startTime = moment().startOf('day').add(9, 'hours'); // 오전 9시
        const endTime = moment().startOf('day').add(18, 'hours'); // 오후 6시
        const interval = 90; // 90분

        // 시간 슬롯을 1시간 30분 간격으로 생성
        for (let time = startTime; time.isBefore(endTime); time.add(interval, 'minutes')) {
            timeSlots.push(time.format('YYYY-MM-DD HH:mm'));
        }

        const $timeSelector = $('#timeSelector');
        timeSlots.forEach((slot) => {
            const [date, time] = slot.split(' ');
            const timeDisplayStart = `\${time.substring(0, 5)}`;
            const timeDisplayEnd = moment(slot).add(90, 'minutes').format('HH:mm');
            $timeSelector.append(`
                <label class="selectgroup-item">
                    <input type="checkbox" name="time" value="${slot}" class="selectgroup-input" />
                    <span class="selectgroup-button">
                        <span class="time-label">\${timeDisplayStart} - \${timeDisplayEnd}</span>
                    </span>
                </label>
            `);
        });
    });
  </script>
</body>
</html>

                 