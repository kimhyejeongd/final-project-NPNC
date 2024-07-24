<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참조인 선택</title>
 <style>
    .line-color {
        width: 5px;
        height: 100%;
    }
    .selected{
    	background-color: #deefff !important;
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
               <h2 class="fw-bold mb-4">참조인 선택</h2>
           	<div class="row w-100 mx-auto">
            	<!-- 조직도 -->
              <div class="col w-45" style="">
                <div class="card card-round" style="height: 500px;" >
                <div class="card-header">
                   <div class="card-head-row card-tools-still-right">
                      <div class="card-title" id="formfoldername">조직도</div>
                      <div class="card-tools"></div>
                    </div>
                  </div>
                  <div class="p-4 overflow-hidden">
                    <div class="form-group d-flex gap-1 p-0 pb-4">
		                <input type="text" class="form-control" placeholder="이름으로 검색">
		                <button class="btn btn-outline-info btn-sm"><i class="fa fa-search search-icon"></i></button>
		            </div>
                    <div class="card-list p-0 overflow-x-auto m-0 rounded" style="height: 330px;">
	                    <div class="accordion" id="accordionPanelsStayOpenExample">
						<c:forEach var="d" items="${list}" varStatus="status">
							<div class="accordion-item">
							    <h2 class="accordion-header">
							      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse${status.index}" aria-expanded="true" aria-controls="panelsStayOpen-collapse${status.index}">
							        <i class="fas fa-bookmark me-2"></i>${d.departmentName} 
							      </button>
							    </h2>
				    			<div id="panelsStayOpen-collapse${status.index}" class="accordion-collapse collapse show">
							      <div class="accordion-body" style='padding: 0!important;'>
							         <div class="list-group" id="memberlist">
						 				<c:forEach var="memberlist" items="${d.memberlist}">
										  <a href="#" class="list-group-item list-group-item-action align-items-center" data-id="${memberlist.memberKey }" data-name="${memberlist.memberName }" data-job="${memberlist.jobName }" data-jobkey="${memberlist.jobKey }" data-team="${d.departmentName}" data-teamKey="${memberlist.departmentKey }">&emsp;<i class="fas fa-user me-2"></i><b>${memberlist.memberName}</b>&ensp;${memberlist.jobName}</a>
						  				</c:forEach>
									</div>
							      </div>
							    </div>
							</div>
						</c:forEach>	
					</div> 
                    </div>
                  </div>
                </div>
              </div>
              <div class="row d-flex mx-auto align-items-center justify-content-center align-content-center gap-1" style="max-width: 60px;">
              	<button class="btn btn-sm btn-outline-secondary" id="rightBtn"><i class="icon-arrow-right"></i></button>
              	<button class="btn btn-sm btn-outline-secondary" id="leftBtn"><i class="icon-arrow-left"></i></button>
              </div>
				<div class="col w-45" id="formlistdiv">
		               <div class="card card-round" style="height: 500px;" >
		                 <div class="card-header">
		                   <div class="card-head-row card-tools-still-right justify-content-between">
		                      <div class="d-flex gap-1">
			                      <div class="card-title me-2" id="formfoldername">선택된 참조인</div>
			                      </div>
		                    </div>
		                  </div>
		                 <div class="card-list p-4 " id="selectlist">
		                  <!-- 선택자 출력 -->
			                  <div class="card-list p-0 overflow-x-auto m-0 rounded" style="height: 330px;">
		                    	<div class="accordion" id="accordionPanelsStayOpenExample">
									<div class="accordion-item" style="border: none;">
						    			<div id="panelsStayOpen-collapse${status.index}" class="accordion-collapse collapse show">
									      <div class="accordion-body" style='padding: 0!important;'>
									         <div class="list-group d-flex" id="memberlist2">
									         <!-- 선택항목 들어가는 위치 -->
									         	<!-- <a href="#" class="border rounded list-group-item list-group-item-action align-items-center justify-content-between" data-id="2">
									         		<div>
									         			<span class="badge rounded-pill text-bg-secondary me-2 ms-0" >1</span><i class="fas fa-user me-2"></i><b>차은우</b>&ensp;팀장
							         				</div>
								         			<select class="form-select w-25">
							                            <option>검토</option>
							                            <option>결재</option>
							                            <option>전결</option>
							                            <option>후결</option>
							                          </select>
							         			</a> -->
											</div>
									      </div>
									    </div>
									</div>
								</div> 
	                   		</div>
		                 </div>
		               </div>
		          </div>	
			</div>
    	<div class="d-flex justify-content-end gap-2">
	        <button class="btn btn-primary" id="okBtn">적용</button>
	        <button class="btn btn-outline-primary" id="cancelBtn">취소</button>
	    </div>
	</div>
	</div>
</div>
</body>
</html>