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
	  <div class="main-panel">
        <div class="main-header">
          <div class="main-header-logo">
          </div>
          <!--  header Navbar 넣을 곳 -->
          <c:import url="${path}/WEB-INF/views/common/header_bar.jsp"/>
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
                  <!-- 문서정보 form 태그 -->
                <form method="post" action="${path}/document/writeend" id="docForm">
               	<div class="form-group">
			      <label for="smallInput"><span class="h5">문서명</span></label>
			      <input type="text" class="form-control form-control-sm" id="smallInput" value="문서제목" name="erDocTitle">
			    </div>
			    <div class="form-group">
			      <label class=""><span class="h5">긴급 여부</span></label>
			          <input class="ms-3" type="radio" name="erDocEmergencyYn" id="flexRadioDefault1" value="Y">
			          <label class="ms-1" for="flexRadioDefault1"><span class="h5">긴급</span> </label>
			          <input class="ms-3" type="radio" name="erDocEmergencyYn" id="flexRadioDefault2" value="N" checked>
			          <label class="ms-1" for="flexRadioDefault2">
			            <span class="h5">일반</span>
		          </label>
			    </div>
			    <div class="form-group">
			      <label for="smallInput"><span class="h5">결재자</span></label>
			      <div class="border" style="width:100%; height: 150px;" id="approvalDiv">
						<!-- <span class="" style="color: gray;">결재자를 선택하세요</span> -->
						  <div class="border" id="approval1">
						  	<input name="approvers[0].orderby" value="1" style="border-radius: 15px; width: 20px;">
						  	<input name="approvers[0].memberKey" value="2" style="display:none">
						  	<input name="approvers[0].memberTeam" value="기술지원팀" style="">
						  	<input name="approvers[0].memberJob" value="팀장" style="">
						  	<input name="approvers[0].memberName" value="김팀장" style="">
						  	<input name="approvers[0].category" value="검토" style="">
						  </div>
						  <div class="border" id="approval2">
						  	<input name="approvers[1].orderby" value="2" style="border-radius: 15px; width: 20px;">
						  	<input name="approvers[1].memberKey" value="1" style="display:none">
						  	<input name="approvers[1].memberTeam" value="경영지원팀" style="">
						  	<input name="approvers[1].memberJob" value="대표이사" style="">
						  	<input name="approvers[1].memberName" value="김사장" style="">
						  	<input name="approvers[1].category" value="결재" style="">
						  </div>
			      </div>
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
		          <div class="border" style="width:100%; height: 150px;"><span class="" style="color: gray;">드래그앤 드롭 추후 구현</span></div>
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
                  </form> <!-- 폼태그 종료 -->
                </div>
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
				console.log('결재하기');
				// iframe 데이터 확인
				let framedata = (document.querySelector("#hwpctrl_frame").contentWindow.document.querySelector("#summernote").nextSibling).children[2].children[2].innerHTML;
				console.log(framedata);
				
				let opinion = $('#input-field').val();
				$("<input>").val(framedata).css('display', 'none').attr('name', 'html').prependTo($("#docForm"));
				$("<input>").val(opinion).css('display', 'none').attr('name', 'msg').prependTo($("#docForm"));
				$("#docForm").submit();
			}
		});
	});

	// TODO: 임시저장 버튼 클릭 시 모달 띄우기 구현
	$("#formsearchbtn").click(function() {
		Swal.fire({
			title: '임시저장',
			text: '',
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

});
</script>

</body>
</html>
