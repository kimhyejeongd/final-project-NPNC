<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
       </div>
       <!-- End Logo Header -->
     </div>
  	<div class="sidebar-wrapper scrollbar scrollbar-inner">
          <div class="sidebar-content">
            <ul class="nav nav-secondary">
              <li class="nav-item">
                <a
                  href="${path }/"
                >
                  <i class="fas fa-home"></i><p>관리자페이지 Home</p>
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
                  <p>인사관리</p>
                  <span class="caret"></span>
                </a>
                <div class="collapse" id="docING">
                  <ul class="nav nav-collapse">
                    <li>
                      <a href="${path }/admin/member/selectmemberall.do">
                        <span class="sub-item">전체사원관리</span>
                      </a>
                    </li>
                    <li>
                      <a href="${path }/admin/member/insertmember.do">
                        <span class="sub-item">사원등록</span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <li class="nav-item">
                <a data-bs-toggle="collapse" href="#sidebarLayouts">
                  <i class="fas fa-th-list"></i>
                  <p>근태관리</p>
                  <span class="caret"></span>
                </a>
                <div class="collapse" id="sidebarLayouts">
                  <ul class="nav nav-collapse">
                    <li>
                      <a href="${path }/admin/attendance/selectAdminAttendanceAll">
                        <span class="sub-item">전체 사원 근태</span>
                      </a>
                    </li>
                    <li>
                      <a href="${path }/admin/attendance/selectAdminAttendanceEditAll">
                        <span class="sub-item">수정요청관리</span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <li class="nav-item">
                <a data-bs-toggle="collapse" href="#forms">
                  <i class="fas fa-pen-square"></i>
                  <p>부서/직급</p>
                  <span class="caret"></span>
                </a>
                <div class="collapse" id="forms">
                  <ul class="nav nav-collapse">
                    <li>
                      <a href="${path }/admin/dept/selectdeptall.do">
                        <span class="sub-item">부서 관리</span>
                      </a>
                    </li>
                    <li>
                      <a href="${path }/admin/job/selectjoball.do">
                        <span class="sub-item">직급 관리</span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <li class="nav-item">
                <a data-bs-toggle="collapse" href="#vaca">
                  <i class="fas fa-pen-square"></i>
                  <p>휴가관리</p>
                  <span class="caret"></span>
                </a>
                <div class="collapse" id="vaca">
                  <ul class="nav nav-collapse">
                    <li>
                      <a href="${path }/admin/vacation/selectVacationAll">
                        <span class="sub-item">휴가 관리</span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <li class="nav-item">
                <a data-bs-toggle="collapse" href="#123">
                  <i class="fas fa-pen-square"></i>
                  <p>전자결재 관리</p>
                  <span class="caret"></span>
                </a>
                <div class="collapse" id="123">
                  <ul class="nav nav-collapse">
                    <li>
                      <a href="${path}/admin/documentForm/selectAdminDocumentFormAll">
                        <span class="sub-item">결재 양식</span>
                      </a>
                    </li>
                    <li>
                      <a href="${path }/admin/job/selectjoball.do">
                        <span class="sub-item">결재 보관함</span>
                      </a>
                    </li>
                    <li>
                      <a href="${path }/admin/job/selectjoball.do">
                        <span class="sub-item">전체 문서 목록</span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
               <li class="nav-item">
                <a data-bs-toggle="collapse" href="#reserve">
                  <i class="fas fa-pen-square"></i>
                  <p>예약물</p>
                  <span class="caret"></span>
                </a>
                <div class="collapse" id="reserve">
                  <ul class="nav nav-collapse">
                    <li>
                      <a href="${path }/admin/reservation/reservationlist">
                        <span class="sub-item">예약물 관리</span>
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
      <!-- End Custom template -->
    <!--   Core JS Files   -->
    <script src="${path}/resources/assets/js/core/jquery-3.7.1.min.js"></script>
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
    <script src="${path}/resources/assets/js/kaiadmin.min.js"></script>

    <script>
      $("#lineChart").sparkline([102, 109, 120, 99, 110, 105, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#177dff",
        fillColor: "rgba(23, 125, 255, 0.14)",
      });

      $("#lineChart2").sparkline([99, 125, 122, 105, 110, 124, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#f3545d",
        fillColor: "rgba(243, 84, 93, .14)",
      });

      $("#lineChart3").sparkline([105, 103, 123, 100, 95, 105, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#ffa534",
        fillColor: "rgba(255, 165, 52, .14)",
      });
    </script>