<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <title>문서 작성</title>
  <meta
    content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    name="viewport"
  />
  <link
    rel="icon"
    type="image/x-icon"
  />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- SweetAlert2 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.min.css" rel="stylesheet">
  <!-- SweetAlert2 JS -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.all.min.js"></script>
 </head>
<body>

	<div class="wrapper">
      <!-- Sidebar -->
      <c:import url="${path }/WEB-INF/views/document/documentSidebar.jsp"/>
      <!-- End Sidebar -->
	</div>
	  <div class="main-panel">
        <div class="main-header">
          <div class="main-header-logo">
          </div>
          <!--  header Navbar 넣을 곳 -->
        </div>
		<!-- 메인 내용 -->
		
		<div class="container">
          <div class="page-inner">
            <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4">
              <div>
                <h3 class="fw-bold">문서 작성</h3>
              </div>
            </div>
            <div class="row">
              <div class=""> <!-- 컨테이너박스 -->
                <div class="card card-round p-3">
                  <div class="card-body">
                <form method="post" action="${path}/document/writeend">
               	<div class="form-group">
			      <label for="smallInput"><span class="h5">문서명</span></label>
			      <input type="text" class="form-control form-control-sm" id="smallInput">
			    </div>
			    <div class="form-group">
			      <label class=""><span class="h5">긴급 여부</span></label>
			          <input class="ms-3" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
			          <label class="ms-1" for="flexRadioDefault1"><span class="h5">긴급</span> </label>
			          <input class="ms-3" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
			          <label class="ms-1" for="flexRadioDefault2">
			            <span class="h5">일반</span>
		          </label>
			    </div>
			    <div class="form-group">
			      <label for="smallInput"><span class="h5">결재자</span></label>
			      <div class="border" style="width:100%; height: 150px;"><span class="center">드래그앤 드롭</span></div>
			      <!-- <input type="text" class="form-control form-control-sm" id="smallInput"> -->
			      <button class="btn btn-sm btn-black btn-border" type="button">선택</button>
			    </div>
			    <div class="form-group">
			      <label for="smallInput"><span class="h5">참조인</span></label>
			      <input type="text" class="form-control form-control-sm" id="smallInput">
			      <button class="btn btn-sm btn-black btn-border" type="button">선택</button>
			    </div>
			    <div class="form-group">
			      <label for="smallInput"><span class="h5">참조문서</span></label>
			      <input type="text" class="form-control form-control-sm" id="smallInput">
			      <button class="btn btn-sm btn-black btn-border" type="button">선택</button>
			    </div>
			    <div class="form-group">
		          <label for="exampleFormControlFile1"><span class="h5">첨부파일</span></label><br>
		          <div class="border" style="width:100%; height: 150px;"><span class="center">드래그앤 드롭</span></div>
		          <input type="file" class="form-control-file" id="exampleFormControlFile1">
		          <div class="" id="upFileList"></div>
		        </div>
			    <div class="form-group">
		          	<label for="exampleFormControlFile1"><span class="h5">문서내용</span></label>
			        <div id="hwpctrl" class="border" style="width: 100%; height: 800px; margin: 0px auto">
			        	<!-- 문서 작성 창 -->
			        	<iframe id="hwpctrl_frame" src="${path }/document/doc4" marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0" scrolling="yes" style="width:100%; height:100%;"></iframe>
			        </div>
		        </div>
                  <div class="p-3 text-center">
                  		<button class="btn btn-primary" id="submitbtn" type="button">기안하기</button>
                  		<button class="btn btn-primary ms-2" id="formsearchbtn" type="button">임시저장</button>
                  </div>
                  </form>
                </div>
              </div>
            </div>
            </div>
          </div>
         </div>
       </div>
<!-- SweetAlert2 초기화 및 모달 관련 스크립트 -->
<script>
$(document).ready(function() {
	// 기안하기 버튼 클릭 시
	$("#submitbtn").click(function() {
		// SweetAlert2 모달 띄우기
		Swal.fire({
			title: '결재',
			html: '<textarea class="form-control" id="input-field" placeholder="결재 의견을 작성하세요" style="resize:none"></textarea>',
			showCancelButton: true,
			confirmButtonClass: 'btn btn-success',
			cancelButtonClass: 'btn btn-danger ms-2',
			confirmButtonText: '결재',
			cancelButtonText: '취소',
			buttonsStyling: false,
			reverseButtons: false
		}).then((result) => {
			if (result.isConfirmed) {
				// 결재 버튼이 클릭되었을 때 처리할 로직
				let opinion = $('#input-field').val();
				//결제완료 폼제출 구현
				Swal.fire("", ": " + inputValue, "success");
			}
		});
	});

	// TODO: 임시저장 버튼 클릭 시 모달 띄우기 구현
	$("#formsearchbtn").click(function() {
		Swal.fire({
			title: '임시저장',
			text: '<%@ page language="java" contentType="text/html; charset=UTF-8"
			    pageEncoding="UTF-8"%>
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
			<c:set var="path" value="${pageContext.request.contextPath}"/>
			<!DOCTYPE html>
			<html lang="ko">
			<head>
			  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
			  <title>문서 작성</title>
			  <meta
			    content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
			    name="viewport"
			  />
			  <link
			    rel="icon"
			    type="image/x-icon"
			  />
			  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			  <!-- SweetAlert2 CSS -->
			  <link href="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.min.css" rel="stylesheet">
			  <!-- SweetAlert2 JS -->
			  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.all.min.js"></script>
			 </head>
			<body>

				<div class="wrapper">
			      <!-- Sidebar -->
			      <c:import url="${path }/WEB-INF/views/document/documentSidebar.jsp"/>
			      <!-- End Sidebar -->
				</div>
				  <div class="main-panel">
			        <div class="main-header">
			          <div class="main-header-logo">
			          </div>
			          <!--  header Navbar 넣을 곳 -->
			        </div>
					<!-- 메인 내용 -->
					
					<div class="container">
			          <div class="page-inner">
			            <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4">
			              <div>
			                <h3 class="fw-bold">문서 작성</h3>
			              </div>
			            </div>
			            <div class="row">
			              <div class=""> <!-- 컨테이너박스 -->
			                <div class="card card-round p-3">
			                  <div class="card-body">
			                <form method="post" action="${path}/document/writeend">
			               	<div class="form-group">
						      <label for="smallInput"><span class="h5">문서명</span></label>
						      <input type="text" class="form-control form-control-sm" id="smallInput">
						    </div>
						    <div class="form-group">
						      <label class=""><span class="h5">긴급 여부</span></label>
						          <input class="ms-3" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
						          <label class="ms-1" for="flexRadioDefault1"><span class="h5">긴급</span> </label>
						          <input class="ms-3" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
						          <label class="ms-1" for="flexRadioDefault2">
						            <span class="h5">일반</span>
					          </label>
						    </div>
						    <div class="form-group">
						      <label for="smallInput"><span class="h5">결재자</span></label>
						      <div class="border" style="width:100%; height: 150px;"><span class="center">드래그앤 드롭</span></div>
						      <!-- <input type="text" class="form-control form-control-sm" id="smallInput"> -->
						      <button class="btn btn-sm btn-black btn-border" type="button">선택</button>
						    </div>
						    <div class="form-group">
						      <label for="smallInput"><span class="h5">참조인</span></label>
						      <input type="text" class="form-control form-control-sm" id="smallInput">
						      <button class="btn btn-sm btn-black btn-border" type="button">선택</button>
						    </div>
						    <div class="form-group">
						      <label for="smallInput"><span class="h5">참조문서</span></label>
						      <input type="text" class="form-control form-control-sm" id="smallInput">
						      <button class="btn btn-sm btn-black btn-border" type="button">선택</button>
						    </div>
						    <div class="form-group">
					          <label for="exampleFormControlFile1"><span class="h5">첨부파일</span></label><br>
					          <div class="border" style="width:100%; height: 150px;"><span class="center">드래그앤 드롭</span></div>
					          <input type="file" class="form-control-file" id="exampleFormControlFile1">
					          <div class="" id="upFileList"></div>
					        </div>
						    <div class="form-group">
					          	<label for="exampleFormControlFile1"><span class="h5">문서내용</span></label>
						        <div id="hwpctrl" class="border" style="width: 100%; height: 800px; margin: 0px auto">
						        	<!-- 문서 작성 창 -->
						        	<iframe id="hwpctrl_frame" src="${path }/document/doc4" marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0" scrolling="yes" style="width:100%; height:100%;"></iframe>
						        </div>
					        </div>
			                  <div class="p-3 text-center">
			                  		<button class="btn btn-primary" id="submitbtn" type="button">기안하기</button>
			                  		<button class="btn btn-primary ms-2" id="formsearchbtn" type="button">임시저장</button>
			                  </div>
			                  </form>
			                </div>
			              </div>
			            </div>
			            </div>
			          </div>
			         </div>
			       </div>
			<!-- SweetAlert2 초기화 및 모달 관련 스크립트 -->
			<script>
			$(document).ready(function() {
				// 기안하기 버튼 클릭 시
				$("#submitbtn").click(function() {
					// SweetAlert2 모달 띄우기
					Swal.fire({
						title: 'Input Something',
						html: '<textarea class="form-control" id="input-field" placeholder="결재 의견을 작성하세요" style="resize:none"></textarea>',
						showCancelButton: true,
						confirmButtonClass: 'btn btn-success',
						cancelButtonClass: 'btn btn-danger',
						confirmButtonText: '결재',
						cancelButtonText: '취소',
						buttonsStyling: false,
						reverseButtons: true
					}).then((result) => {
						if (result.isConfirmed) {
							// 결재 버튼이 클릭되었을 때 처리할 로직
							let inputValue = $('#input-field').val();
							console.log(inputValue);
							Swal.fire("결재 완료", , "success");
							Swal.fire("결재 실패", "관리자에게 문의하세요.", "cancel");
						}
					});
				});

				// TODO: 임시저장 버튼 클릭 시 모달 띄우기 구현
				$("#formsearchbtn").click(function() {
					Swal.fire({
						title: '창을 닫으시겠습니까?',
						text: '임시저장하지 않으면 작성 내용이 사라집니다!',
						showCancelButton: true,
						confirmButtonClass: 'btn btn-success',
						cancelButtonClass: 'btn btn-danger',
						confirmButtonText: '임시저장',
						cancelButtonText: '취소',
						buttonsStyling: false,
						reverseButtons: true
					}).then((result) => {
						if (result.isConfirmed) {
							// 임시저장 버튼이 클릭되었을 때 처리할 로직
							Swal.fire("", "임시저장되었습니다.", "success");
						}
					});
				});

				// iframe 초기화 관련 스크립트 추가 필요 (생략됨)

			});
			</script>

			</body>
			</html>
',
			showCancelButton: true,
			confirmButtonClass: 'btn btn-success',
			cancelButtonClass: 'btn btn-danger ms-2',
			confirmButtonText: '임시저장',
			cancelButtonText: '닫기',
			buttonsStyling: false,
			reverseButtons: false
		}).then((result) => {
			if (result.isConfirmed) {
				// 임시저장 버튼이 클릭되었을 때 처리할 로직
				Swal.fire("", "임시저장되었습니다.", "success");
			}
		});
	});

	// iframe 초기화 관련 스크립트 추가 필요 (생략됨)

});
</script>

</body>
</html>
