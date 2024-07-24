<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html lang='ko'>
  <head>
    <meta charset='utf-8' />
 <%--    <link rel="stylesheet" href="${path }/resources/bm/css/fullcalendar.min.css" />
    <link rel="stylesheet" href='${path }/resources/bm/css/bootstrap.min.css'/>
    <link rel="stylesheet" href='${path }/resources/bm/css/bootstrap-datetimepicker.min.css' />
    <link rel="stylesheet" href='${path }/resources/bm/css/select2.min.css' /> --%>
    
    <!--  sweetalert2 -->
	<link href="${path }/resources/bm/css/bootstrap-4.min.css" rel="stylesheet" type="text/css"/>
	<link href="${path }/resources/bm/css/fullcalendar.css" rel="stylesheet" type="text/css"/>
	<link href="${path }/resources/bm/css/daterangepicker.css" rel="stylesheet" type="text/css"/>
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<!-- 헤더 css  -->
	
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
    <link rel="stylesheet" href="${path}/resources/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/kaiadmin.min.css" />
    
	
    
  <!--   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> -->
 	
   <style>
   	#content {
   		position : absolute;
   		display: none;
   		z-index: 2;
   	
   	}
   	#content .dropdown-menu {
   		border: none;
   	}
   	.material-icons {
	  font-family: 'Material Icons';
	  font-weight: normal;
	  font-style: normal;
	  font-size: 24px;
	  /* Preferred icon size */
	  display: inline-block;
	  line-height: 1;
	  text-transform: none;
	  letter-spacing: normal;
	  word-wrap: normal;
	  white-space: nowrap;
	  direction: ltr;
	
	  /* Support for all WebKit browsers. */
	  -webkit-font-smoothing: antialiased;
	  /* Support for Safari and Chrome. */
	  text-rendering: optimizeLegibility;
	
	  /* Support for Firefox. */
	  -moz-osx-font-smoothing: grayscale;
	
	  /* Support for IE. */
	  -webkit-font-feature-settings: 'liga';
	          font-feature-settings: 'liga';
	         
	}
	#calendar {
		width:100%;
		height: 700px;
		margin-left:300px;
		margin-top :100px;
		transform: scale(0.8);
		transform-origin: 0 0;
	}
   </style>
    
  </head>
  <body>
  <div id="wrapper">
  	<div class="main-panel">
        <div class="main-header">
          <div class="main-header-logo">
          	</div>
          <!--  header Navbar 넣을 곳 -->
          <%@ include file="/WEB-INF/views/common/header_bar.jsp" %>
        	</div>
        </div>   
  <div class="container">
  	<div class="page-inner">
  	<div id="content" class="dropdown clearfix">
  		<ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
  			style="display:block;position:static; margin-bottom:5px;">
  			<li><a tabindex="-1" href="#">내일정</a></li>	
  			<li><a tabindex="-1" href="#">부서일정</a></li>
  <%-- 			<c:if test="${loginid == 'admin' }">  			
  			<li><a tabindex="-1" href="#">카테고리3</a></li>		
  			</c:if>	 --%>
  			<li class="divider"></li>
  			<li><a tabindex="-1" href="#" data-role="close">Close</a></li>
  		</ul>
  	</div>
  
  	<div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
  		<div class="modal-dialog" role="document">
  			<div class="modal-content">
  				<div class="modal-header">
  					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
  						<span aria-hidden="true">&times;</span>
  					</button>
  					<h4 class="modal-title"></h4>
  				</div>
  				<div class="modal-body">
  					
  					<div class="row">
  						<div class="col-xs-12">
  							<label class="col-xs-4" for="cal-allday">종일</label>
  							<input class="allDayNewEvent" id="cal-allday" type="checkbox">
  						</div>
  						<div class="col-xs-12">
  							<label class="col-xs-4" for="cal-title">제목</label>
  							<input class="inputM" type="text" name="cal-title" id="cal-title" required/>
  						</div>
  					</div>
  					<div class="row">
  						<div class="col-xs-12">
  							<label class="col-xs-4" for="cal-start">시작</label>
  							<input class="inputM datetimepicker" type="text" name="cal-start" id="cal-start"/> 							
  						</div>
  					</div>
  					<div>
  						<div class="col-xs-12">
  							<label class="col-xs-4" for="cal-end">끝</label>
  							<input class="inputM datetimepicker" type="text" name="cal-end" id="cal-end"/>
  						</div>					
  					</div>
  					<div class="row">
  						<div class="col-xs-12">
  							<label class="col-xs-4" for="cal-type">구분</label>
  							<select class="inputM" type="text" name="cal-type" id="cal-type">
  								<option value="카테고리1">카테고리1</option>
  								<option value="카테고리2">카테고리2</option>
  								<option value="카테고리3">카테고리3</option>
  								<option value="카테고리4">카테고리4</option>
  								<option value="카테고리5">카테고리5</option>
  							</select>	
  						</div>		
  					</div>
  					<div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="cal-color">색상</label>
                                <select class="inputM" name="color" id="cal-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                     </div>
                     <div class="row">
                     	<div class="col-xs-12">
                     		<label class="col-xs-4" for="cal-desc">설명</label>
                     		<textarea rows="4" cols="50" class="inputM" name="cal-desc" id="cal-desc"></textarea>
                     	</div>
                     </div>		
  				</div>
  				<div class="modal-footer modalBtn-addEvent">
  					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
  					<button type="button" class="btn btn-primary" id="eventSave">저장</button>
  				</div>
  				<div class="modal-footer modalBtn-modifyEvent">
  					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
  					<button type="button" class="btn btn-danger" id="eventDelete">삭제</button>
  					<button type="button" class="btn btn-primary" id="eventUpdate">저장</button>
  				</div>
  			</div>
  		</div>
  	</div>
  </div>
  
  	<div>
  		
  	</div>
  
  	
    <div class="calendarapp-content">
    	<div id="calendar" class="w-100"></div>
    </div>
  	</div>
  </div>
    
   <%--  <script src="${path }/resources/bm/js/jquery.min.js"></script>
    <script src="${path }/resources/bm/js/bootstrap.min.js"></script> --%>
<%--     <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="${path }/resources/bm/js/moment.min.js"></script>
    <script src="${path }/resources/bm/js/fullcalendar.js"></script>
    <script src="${path }/resources/bm/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${path }/resources/bm/js/ko.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.14/index.global.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.14/index.global.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/timegrid@6.1.14/index.global.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/list@6.1.14/index.global.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/interaction@6.1.14/index.global.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/bootstrap@6.1.14/index.global.min.js"></script> --%>
     <script src="${path}/resources/assets/js/core/popper.min.js"></script>
      <!-- jQuery Scrollbar -->
    <script src="${path}/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

  <%--   <!-- Chart JS -->
    <script src="${path}/resources/assets/js/plugin/chart.js/chart.min.js"></script> --%>

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
     
    <script src="${path }/resources/bm/js/moment.min.js"></script>
    <script src="${path }/resources/bm/js/fullcalendar.global.js"></script>
    <script src="${path }/resources/bm/js/index.global.min.js"></script>
 	<script src="${path }/resources/bm/js/daterangepicker.js"></script>
 	<script src="${path }/resources/bm/js/sweetalert2.min.js"></script>
 	<script src="${path }/resources/bm/js/fullcalendar-init.js"></script>
    <script src="${path }/resources/bm/js/calendar.js"></script>
    <script src="${path }/resources/bm/js/addEvent.js"></script>
    <script src="${path }/resources/bm/js/editEvent.js"></script>
    
    <script>
    
    </script>
    
    
  </body>
</html>