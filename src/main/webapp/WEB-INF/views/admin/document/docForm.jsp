<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <!-- Fonts and icons -->
<script src="${path}/resources/assets/js/plugin/webfont/webfont.min.js"></script>
<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!-- SweetAlert2 CSS -->
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.min.css" rel="stylesheet">
<!-- SweetAlert2 JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.all.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
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
<body>
<%-- 	<%@ include file="/WEB-INF/views/admin/adminsidebar.jsp" %> 
 --%>
 
	 				<div class="card-list p-0 overflow-x-auto m-0 rounded" style="height: 330px;">
		                    <div class="accordion" id="accordionPanelsStayOpenExample">
							<c:forEach var="f" items="${folders}">
						
						           
						 
								<div class="accordion-item">
								    <h2 class="accordion-header">
								      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse0" aria-expanded="true" aria-controls="panelsStayOpen-collapse0">
								        <i class="fas fa-bookmark me-2"></i> ${f.folderName} 
								      </button>
								    </h2>
					    			<div id="panelsStayOpen-collapse0" class="accordion-collapse collapse show">
								      <div class="accordion-body" style="padding: 0!important;">
								         <div class="list-group" id="memberlist">
							  				
										</div>
								      </div>
								    </div>
								</div>
							
						</div> 
			        </c:forEach>
	              </div>

    <c:out value="${folders}"></c:out>
   
   
   <div class="col w-45" style="">
                <div class="card card-round" style="height: 500px;">
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
						
							    <c:forEach var="f" items="${folders }">
							<div class="accordion-item">
								        <c:if test="${f.folderLevel==1}">
							    <h2 class="accordion-header">
								      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse0" aria-expanded="true" aria-controls="panelsStayOpen-collapse0">
								        <i class="fas fa-bookmark me-2"></i>
								        	${f.folderName } 
								      </button>
								    </h2>
								        </c:if>
					    			<div id="panelsStayOpen-collapse0" class="accordion-collapse collapse show">
								      <div class="accordion-body" style="padding: 0!important;">
								         <div class="list-group" id="memberlist">
							 				<c:if test="${f.folderLevel==2 }">
											  <a href="#" class="list-group-item list-group-item-action align-items-center"> 
												  <i class="fas fa-user me-2"></i>
												  ${f.folderName }
											  </a>
							 				</c:if>
							  				
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
    
	
</body>
</html>

