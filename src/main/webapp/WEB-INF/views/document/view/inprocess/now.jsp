<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 내역</title>
 <style>
    .line-color {
        width: 5px;
        height: 100%;
    }
    .selected{
    	background-color: #deefff !important;
    }
    .message-bubble {
	    position: absolute;
	    right: 0; /* 오른쪽 끝에 위치 */
	    top: 50%; /* 수직 중앙 정렬 */
	    transform: translateY(-50%); /* 수직 중앙 정렬 */
	    background-color: #f8f9fa;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    padding: 5px 10px;
	    max-width: 200px; /* 최대 너비 설정 */
	    word-wrap: break-word; /* 긴 단어가 줄바꿈되도록 설정 */
	}
</style>
 <!-- Fonts and icons -->
<script src="${path}/resources/assets/js/plugin/webfont/webfont.min.js"></script>
<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!-- SweetAlert2 CSS -->
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.min.css" rel="stylesheet">
<!-- SweetAlert2 JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.all.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />


  <meta
      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
      name="viewport"
    />
    <link
      rel="icon"
      href="${path}/resources/assets/img/kaiadmin/favicon.ico"
      type="image/x-icon"
    />
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

 <!-- Bootstrap Notify 1 -->
 <script src="${path}/resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

 <!-- jQuery Vector Maps -->
 <script src="${path}/resources/assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
 <script src="${path}/resources/assets/js/plugin/jsvectormap/world.js"></script>

 <!-- Sweet Alert -->
 <script src="${path}/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

 <!-- Kaiadmin JS -->
 <script src="${path}/resources/assets/js/kaiadmin.min.js"></script>

 <!-- Kaiadmin DEMO methods, don't include it in your project! -->
 <script src="${path}/resources/assets/js/setting-demo.js"></script>
 <script src="${path}/resources/assets/js/demo.js"></script>
</head>
<script src="${path}/resources/jh/js/referer.js"></script>
<body>
<div class="container">
         <div class="page-inner d-flex justify-content-between mt-4">
           <div class="d-flex align-items-md-center flex-column pt-2 pb-4 w-100">
               <h2 class="fw-bold mb-4">문서 결재 내역</h2>
           	<div class="row w-100 mx-auto">
           	<div class="col-md-6"  style="width: 100%;">
                <div class="card" style="height: auto;">
                  <div class="card-header">
                    <div class="d-grid col">
                    	<span class="p-1">문서명 : ${doc.erDocTitle}</span>
                    	<span class="p-1">기안자 : ${doc.erDocWriter}</span>
                    </div>
                  </div>
                  <div class="card-body">
                    <ol class="activity-feed" style="margin-bottom: 0px;">
                    <c:forEach items="${doc.approvers }" var="p">
                   	<c:if test="${p.state ne '대기'}">
                      <li class="feed-item feed-item-secondary">
                        <time class="date" datetime="">${p.date }</time>
                        <div>
	                        <span class="badge badge-count me-2">${p.category }</span>
	                        <span class="text" style="top: 0px !important;">
	                        ${p.memberTeamName } ${p.memberJobName } ${p.memberName }
	                         </span>
	                         <c:if test="${p.opinion ne null}">
	                         	<div class="message-bubble" style="width: 80%; text-align: center;">
				                    ${p.opinion }
				                </div>
			                </c:if>
                         </div>
                      </c:if>
                      </li>
                      </c:forEach>
                    </ol>
                  </div>
                </div>
              </div>
			</div>
    	<div class="d-flex justify-content-end gap-2">
	        <button class="btn btn-primary" id="" onclick="window.close();">확인</button>
	    </div>
	</div>
	</div>
</div>
</body>
</html>