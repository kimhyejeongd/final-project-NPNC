<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보관함 선택</title>
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
<body>
<div class="container">
         <div class="page-inner d-flex justify-content-between mt-4">
           <div class="d-flex align-items-md-center flex-column pt-2 pb-4 w-100">
               <h2 class="fw-bold mb-4">보관함 선택</h2>
           	<div class="row w-100 mx-auto">
            	<!-- 조직도 -->
              <div class="col w-45" style="">
                <div class="card card-round" style="height: 500px;" >
                 <div class="card-header">
                   <div class="card-head-row card-tools-still-right">
                      <div class="card-title" id="formfoldername" style="padding-right: 76px;">보관함 폴더 목록</div>
                      <div class="card-tools"></div>
                    </div>
                  </div>
                  <div class="p-4 overflow-hidden">
                    <div class="form-group d-flex gap-1 p-0 pb-4">
		                <input type="text" class="form-control" placeholder="이름으로 검색">
		                <button class="btn btn-outline-info btn-sm"><i class="fa fa-search search-icon"></i></button>
		            </div>
                    <div class="card-list p-0 overflow-x-auto m-0 rounded" style="height: 330px;">
	                    <div class="accordion" id="storagefolderlist">
					    	<c:forEach var="f" items="${folders }">
								<div class="accordion-item droppable parentfolder">
								       	 <c:if test="${f.folderLevel==1}">
								    <h2 class="accordion-header">
									      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse${f.folderKey}" aria-expanded="true" aria-controls="panelsStayOpen-collapse0">
									        <i class="fas fa-bookmark me-2"></i>
									        	${f.folderName } 
									      </button>
									    </h2>
									        </c:if>
						    			<div id="panelsStayOpen-collapse${f.folderKey}" class="accordion-collapse collapse show">
									      <div class="accordion-body" style="padding: 0!important;">
									         <div class="list-group" id="">
								 				<c:if test="${f.folderLevel==2 }">
												  <a href="#" class="list-group-item list-group-item-action align-items-center folder-item" data-folder-key="${f.folderKey}" data-folder-name="${f.folderName }"> 
													  <i class="icon-drawer me-2"></i>
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
				<div class="col w-45" id="formlistdiv">
		               <div class="card card-round" style="height: 500px;" >
		                 <div class="card-header">
		                   <div class="card-head-row card-tools-still-right justify-content-between">
		                      <div class="d-flex gap-1">
			                      <div class="card-title me-2" id="formfoldername">보관함 목록</div>
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
									         <div class="list-group d-flex" id="storagelist">
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
    	<div class="d-flex justify-content-end gap-2" id="strageBtnBox">
	        <button class="btn btn-primary" id="okBtn">적용</button>
	        <button class="btn btn-outline-primary" id="cancelBtn">취소</button>
	    </div>
	</div>
	</div>
</div>
<script>
$(document).ready(function() {
    // jQuery로 Bootstrap Collapse 토글 처리
    $('[data-bs-toggle="collapse"]').click(function() {
        var target = $(this).data('bs-target');
        $(target).collapse('toggle');
    });
    

    $('.folder-item').on('click', function(e) {
        e.preventDefault(); // 기본 클릭 동작을 막음

        var folderKey = $(this).data('folder-key'); // 클릭된 항목의 folderId 가져오기

        $.ajax({
            url: '${path}/admin/documentForm/selectDoc', // 서버 요청 URL
            type: 'GET',
            data: { folderKey: folderKey }, // 요청에 포함될 데이터
            success: function(response) {
                // 서버에서 받은 데이터를 사용하여 추가
                var list = $('#storagelist');
                list.empty(); // 기존 내용을 비움
                
                let count = 0;
				//순회하며 리스트에 추가
                response.forEach(function(doc, index) {
                    console.log(doc);
                    if(doc.storageFolder.useYn === 'Y'){
                    	count++;
	                    let $a = $("<a>").addClass('border rounded list-group-item list-group-item-action align-items-center justify-content-between')
						.attr({
							'href':'#',
							'data-key': doc.erStorageKey, 
							'data-name' : doc.erStorageName,
							'data-folder' : doc.storageFolder.folderName							
							});
						let $i = $("<i>").addClass('icon-drawer me-2');
						let $span=$("<span>").addClass('badge rounded-pill text-bg-secondary me-2 ms-0').text(`${count}`);
						let $div = $("<div>").append($($span));
						$div.append($i).append("<span>" + doc.erStorageName + "</span>");
						$a.append($($div)).appendTo(list);
                    }
                });
            }
        });
        
        //보관함 선택 효과
	    $("#storagelist").on('click', "a", function(e) {
	    	e.preventDefault(); // 기본 클릭 동작을 막음
	    	$('#storagelist a').removeClass('selected');
		    $(this).toggleClass('selected');
		    e.stopPropagation();
		});
    });
    
    //적용버튼 클릭
    $("#strageBtnBox>#okBtn").click(e=>{
		
		let $selectedItems = $("div#storagelist>a.selected");
		console.log($selectedItems);
		if($selectedItems.length == 0){
			e.preventDefault(); // 기본 동작 방지
			e.stopPropagation(); // 이벤트 전파 방지
			alert('보관함을 선택하세요.');
		}else{
			let $parentFolder = $selectedItems.closest('.parentfolder');
			let $app = {
				        erStorageKey: $selectedItems.data('key'),
				        erStorageName: $selectedItems.data('name'),
				        erStorageFolder : $selectedItems.data('folder') 
					    };
			console.dir($app);
	    	
			//부모창에 전달
			window.opener.sendStorageToParent($app);
			window.close();
		}
	});
    //취소
    $("#cancelBtn").click(e=>{
		window.close();
	});
});
</script>
</body>
</html>