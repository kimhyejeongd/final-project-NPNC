<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.drop-hover {
  border: 2px dashed #007bff;
}
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- JQuery UI CSS -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- JQuery UI JS -->
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js" integrity="sha256-J8ay84czFazJ9wcTuSDLpPmwpMXOm573OUtZHPQqpEU=" crossorigin="anonymous"></script>
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
<!-- Core JS Files -->
<script src="${path}/resources/assets/js/core/popper.min.js"></script>
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
<!-- Modal CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<body>
				 <%@ include file="/WEB-INF/views/admin/adminsidebar.jsp" %>
<div class="main-panel">
  <div class="container">
   <div class="page-inner" style="display: flex">
	   <div class="col w-45"  style="width:20%">
	                <div class="card card-round" style="height: 500px;">
	                <div class="card-header">
	                   <div class="card-head-row card-tools-still-right">
	                      <div class="card-title" id="formfoldername" style="padding-right: 76px;">전자문서 보관함 폴더 목록</div>
							<button class="btn btn-primary btn-xs" data-bs-toggle="modal" data-bs-target="#folderModal">관리</button>
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
												  <a href="#" class="list-group-item list-group-item-action align-items-center folder-item" data-folder-key="${f.folderKey}"> 
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
          <div style="width:67%">
          		 <!-- Projects table -->
                      <table class="table table-hover align-items-center mb-0" id="docTable">
                        <thead class="thead-light">
                          <tr class="text-center">
                          	<!-- <th><input type="checkbox"></th> -->
                       	    <th scope="col" class="">
						      <input type="checkbox" id="checkAll">
						    </th>
                            <th scope="col" class="">보관함명</th>
                            <th scope="col" class="">보관함 관리자</th>
                            <th scope="col" class="">보관 기한</th>
                            <th scope="col" class="">사용여부</th>
                          </tr>
                        </thead>
                        <tbody id="docTableBody">
                        </tbody>
                      </table>
          </div>
	              
	              
   </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="folderModal" tabindex="-1" aria-labelledby="folderModalLabel" aria-hidden="true" >
  <div class="modal-dialog modal-lg" style="margin-left: 570px;">
    <div class="modal-content" style="width: 46%;">
      <div class="modal-header">
        <h5 class="modal-title" id="folderModalLabel">전자문서 보관함 폴더 목록</h5>
      </div>
      <div class="modal-body">

        <div class="card-list p-0 overflow-x-auto m-0 rounded" style="height: 330px;">
          <div class="accordion" id="accordionPanelsStayOpenExampleModal">
            <c:forEach var="f" items="${folders }">
              <div class="accordion-item droppable">
                <c:if test="${f.folderLevel==1}">
                  <h2 class="accordion-header">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse0Modal" aria-expanded="true" aria-controls="panelsStayOpen-collapse0Modal" >
                      <i class="fas fa-bookmark me-2"></i>
                      ${f.folderName } 
                    </button>
                  </h2>
                </c:if>
                <div id="panelsStayOpen-collapse0Modal" class="accordion-collapse collapse show">
                  <div class="accordion-body" style="padding: 0!important;">
                    <div class="list-group" id="memberlistModal">
                      <c:if test="${f.folderLevel==2 }">
                        <a href="#" class="list-group-item list-group-item-action align-items-center folder-item" data-folder-key="${f.folderKey}"draggable="true" >
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
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
   
    <script>
    $(document).ready(function() {
    	
    	$('#checkAll').click(function() {
    	      if ($(this).is(':checked')) {
    	        $('.checkItem').prop('checked', true);
    	      } else {
    	        $('.checkItem').prop('checked', false);
    	      }
    	    });
        $('.folder-item').on('click', function(e) {
            e.preventDefault(); // 기본 클릭 동작을 막음

            var folderKey = $(this).data('folder-key'); // 클릭된 항목의 folderId 가져오기

            $.ajax({
                url: '${path}/admin/documentForm/selectDoc', // 서버 요청 URL
                type: 'GET',
                data: { folderKey: folderKey }, // 요청에 포함될 데이터
                success: function(response) {
                    // 서버에서 받은 데이터를 사용하여 테이블을 동적으로 생성
                    var tableBody = $('#docTableBody');
                    tableBody.empty(); // 기존 내용을 비움

                    response.forEach(function(doc, index) {
                    	console.log(doc);
                    	var row = 
                    	    '<tr class="text-center">' +
                    	      '<td class="approverNow p-3"><input type="checkbox" class="checkItem"></td>' +

                    	        '<td class="approverNow p-3">' + doc.erStorageName + '</td>' +
                    	        '<td class="approverNow p-3">' +doc.department.deptName+ " "+ doc.member.memberName+" " +doc.job.jobName+ '</td>' +
                    	        '<td class="approverNow p-3">' + doc.erStorageTerm + '년</td>' +
                    	        '<td class="approverNow p-3">' +doc.storageFolder.useYn+ '</td>' +
                    	    '</tr>';
                        tableBody.append(row);
                    });
                }
            });
        });
        // 드래그 이벤트 설정
        $(document).on('dragstart', '.folder-item', function(event) {
          event.stopPropagation();

          var item = $(this);
          event.originalEvent.dataTransfer.setData('text/plain', item.data('folder-key'));
          item.css('opacity', '0.5');
          window.draggedItem = item;  // 드래그된 요소를 전역 변수로 저장
        });

        $(document).on('dragend', '.folder-item', function(event) {
          event.stopPropagation();

          window.draggedItem.css('opacity', '1');
        });

        // 드롭 가능한 영역 설정
        $(document).on('dragover', '.accordion-item.droppable', function(event) {
          event.stopPropagation();

          event.preventDefault();
          $(this).addClass('drop-hover');
        });

        $(document).on('dragleave', '.accordion-item.droppable', function(event) {
          $(this).removeClass('drop-hover');
        });

        $(document).on('drop', '.accordion-item.droppable', function(event) {
          event.stopPropagation();
          
          event.preventDefault();
          $(this).removeClass('drop-hover');
          var draggable = window.draggedItem;  // 드래그된 요소를 가져옴
          var targetAccordionItem = $(this).closest('.accordion-item');
          targetAccordionItem.find('.accordion-body .list-group').append(draggable);  // 새로운 위치에 추가
        });
    });
</script>
    
	
</body>
</html>

