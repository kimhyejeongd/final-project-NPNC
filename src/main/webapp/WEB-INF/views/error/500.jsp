<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Kaiadmin - Bootstrap 5 Admin Dashboard</title>
    <meta
      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
      name="viewport"
    />
    <link
      rel="icon"
      href="${path}/resources/assets/img/kaiadmin/favicon.ico"
      type="image/x-icon"
    />

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

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="${path}/resources/assets/css/demo.css" />
  </head>
  <body>
     <style>
	     .main-header {
		    background: #fff;
		    min-height: 60px;
		    width:100%;
		    position: static;
		    z-index: 1001
		}
		.container{
			height: 100%;
			/* background-color: aquamarine; */
       		max-width: 1800px;
			
		}
		.firstwidget{
			display: flex;
			flex-direction: row;
			flex-wrap: noWrap;
       	
		}
		.firstwidget>div{
			margin-right: 30px;
		}
		 .pagination-container {
            display: flex;
            justify-content: center; /* Flexbox를 사용하여 중앙으로 정렬 */
           /*  margin-top: 20px; /* 위쪽 여백 추가 (선택사항) */ */
        }
		.error500{
	display: flex;
	flex-direction:column;
	width: 100%;
	justify-content: center;
	align-items: center;
}
body{
	height: 80vh;
}
.btn {
	  position: relative;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  margin: 0px auto;
	  max-width: 100%;
	  color: black;
	  text-align: center;
	  background-color: #d1ade3;
	  border-radius: 8px;
	  padding: 8px 8px 8px 8px;
	}
	</style>	
               <%@ include file="/WEB-INF/views/common/header_bar.jsp" %>

	<div class="error500">
		<img alt="500 Error Image" src="/resources/assets/img/error/500에러.png" width=70%; height=700px; class="text-align-center">
		<button class="btn btn-outline-secondary mb-5" onclick="location.assign('${path}')">home</button>
	</div> 

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
       

    
    <!--   Core JS Files   -->
    <script src="${path}/resources/assets/js/core/jquery-3.7.1.min.js"></script>
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

    <!-- Google Maps Plugin -->
    <script src="${path}/resources/assets/js/plugin/gmaps/gmaps.js"></script>

    <!-- Sweet Alert -->
    <script src="${path}/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

    <!-- Kaiadmin JS -->
    <script src="${path}/resources/assets/js/kaiadmin.min.js"></script>
    
    <!-- 출퇴근버튼 js -->
    <%-- <script src="${path}/resources/assets/ws/attendance.js"></script>  --%>

  </body>
</html>
