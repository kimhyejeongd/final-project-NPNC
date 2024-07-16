<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="me" value="${pageContext.request.userPrincipal}"/>

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
  <style>
  	#approvalDiv{
	    font-size: .875rem !important;
	    line-height: 1.5;
        border-color: #ebedf2;
	    height: inherit !important;
	    border-width: 2px;
	    min-height: calc(1.5em + .5rem + calc(var(--bs-border-width)* 2));
	    border-radius: var(--bs-border-radius-sm);
	    border: var(--bs-border-width) solid var(--bs-border-color);
	    font-weight: 400;
  	}
  </style>
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
                <h3 class="fw-bold text-center">문서 작성</h3>
              </div>
            </div>
            <div class="row">
              <div class=""> <!-- 컨테이너박스 -->
                <div class="card card-round p-3">
                  <div class="card-body">
                <form method="post" action="${path}/document/writeend" id="docForm">
               	<div class="form-group d-flex">
			      <label for="smallInput"><span class="h5 me-5">문서명</span></label>
			      <input type="text" class="form-control form-control-sm" style="" id="smallInput" name="erDocTitle">
			    </div>
			    <div class="form-group">
			      <label class=""><span class="h5 me-1">긴급 여부</span></label>
			          <input class="ms-3" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
			          <label class="ms-1" for="flexRadioDefault1"><span class="h5">긴급</span> </label>
			          <input class="ms-3" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
			          <label class="ms-1" for="flexRadioDefault2">
			            <span class="h5">일반</span>
		          </label>
			    </div>
			    <div class="form-group d-flex">
			      <label for="smallInput"><span class="h5 me-5">결재자</span></label>
			      	<div class="col w-100 align-items-center">
					      <div class="border col" style="height: auto; min-height: 30px; width: 100%;" id="approvalDiv">
								<span class="m-0 w-100 d-flex" style="color: gray; font-size: 15px; justify-content: center; height: 50px; align-items: center">결재자를 선택하세요</span> 
								 <!-- <div class="border" id="approval1">
								  	<input name="approvers[0].orderby" value="1" style="border-radius: 15px; width: 20px;">
								  	<input name="approvers[0].orderby" value="1" disabled="disabled" class="badge rounded-pill text-bg-secondary me-2 ms-0" style="border-radius: 15px; width: 23px; display: inline; background-color: white;">
								  	<input name="approvers[0].memberKey" value="2" style="display:none">
								  	<input name="approvers[0].memberTeam" value="기술지원팀" style="">
								  	<input name="approvers[0].memberJob" value="사원" style="">
								  	<input name="approvers[0].memberName" value="김사원" style="">
								  	<input name="approvers[0].category" value="기안" style="">
								  </div>
								  <div class="border" id="approval1">
								  	<input name="approvers[1].orderby" value="2" style="border-radius: 15px; width: 20px;">
								  	<input name="approvers[1].memberKey" value="2" style="display:none">
								  	<input name="approvers[1].memberTeam" value="기술지원팀" style="">
								  	<input name="approvers[1].memberJob" value="팀장" style="">
								  	<input name="approvers[1].memberName" value="김팀장" style="">
								  	<input name="approvers[1].category" value="검토" style="">
								  </div>
								  <div class="border" id="approval2">
								  	<input name="approvers[2].orderby" value="3" style="border-radius: 15px; width: 20px;">
								  	<input name="approvers[2].memberKey" value="1" style="display:none">
								  	<input name="approvers[2].memberTeam" value="경영지원팀" style="">
								  	<input name="approvers[2].memberJob" value="대표이사" style="">
								  	<input name="approvers[2].memberName" value="김사장" style="">
								  	<input name="approvers[2].category" value="결재" style="">
								  </div> -->
					      </div>
					      <button class="btn btn-sm btn-info w-100 row m-0" type="button" id="approverBtn">선택</button>
					    </div>
					</div>
			    <div class="form-group d-flex align-items-center gap-3">
			      <label for="smallInput"><span class="h5" style="margin-right: 1.9rem !important;">참조인</span></label>
				      <div class="border" style="height: auto; min-height: 30px; width: 90%;" id="approvalDiv">
				      </div>
				      <button class="btn btn-sm btn-info btn-block" type="button" style="width: 70px; height: 30px" id="refererBtn">선택</button>
		        </div>
			    <div class="form-group d-flex align-items-center gap-3">
			      <label for="smallInput"><span class="h5" style="margin-right: 0.9rem !important;" >참조문서</span></label>
			      <div class="border d-block" style="height: auto; min-height: 30px; width: 90%;" id="">
			      </div>
			      <button class="btn btn-sm btn-info btn-block" style="width: 70px; height: 30px" type="button" id="referDocBtn">선택</button>
			    </div>
			    <div class="form-group d-flex align-items-center">
		          <label for="exampleFormControlFile1"><span class="h5" style="margin-right: 1.8rem !important;">첨부파일</span></label>
		          <!-- <div class="border" style="width:100%; height: auto;">
		          	<span class="center">드래그앤 드롭</span>
	          	  </div> -->
		          	<input type="file" class="form-control" id="exampleFormControlFile1">
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
      </div>
<!-- 모달 -->
<!-- 기안하기 -->
<div class="swal-overlay" tabindex="-1" id="submitalert">
  <div class="swal-modal" role="dialog" aria-modal="true"><div class="swal-title" style="">Input Something</div><div class="swal-content">
  	<input class="form-control" placeholder="결재 의견을 작성하세요" type="text" id="input-field"></div>
  	<div class="swal-footer">
  		<div class="swal-button-container">
    		<button class="swal-button swal-button--cancel btn btn-danger">취소</button>
  		</div>
	<div class="swal-button-container">
    	<button class="swal-button swal-button--confirm btn btn-success">결재</button>
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
				//console.log(framedata);
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
$("#approverBtn").click(function() {
	window.open('${pageContext.request.contextPath}/document/write/approver', 'approver', 'width=900, height=700, left=500, top=100');
});
function sendDataToParent(data) {
    console.dir(data);
    $("#approvalDiv").html(''); // approvalDiv 초기화
    
	//선택 결재자
    data.forEach(function(item, index) {
        let $div = $("<div>").attr('id', "approval" + index)
        			.css({'width': '100%','font-size': 'larger', 'text-align': 'left', 'border-radius': '15px'})
        			.addClass('col m-0 p-2');
        
        $("<input>").attr({'name': 'approvers[' + index + '].orderby', 'value': item.orderby})
                    .css({'border-radius': '15px', 'width': '23px', 'display': 'inline', 'background-color': 'white'})
                    .addClass('badge rounded-pill text-bg-secondary me-2 ms-0')
                    .appendTo($div);
        $("<input>").attr({'name': 'approvers[' + index + '].memberKey', 'value': item.no})
                    .css({'display': 'none', 'border': 'none', 'width': 'auto', 'max-width': '80px'})
                    .appendTo($div);
        $("<input>").attr({'name': 'approvers[' + index + '].memberTeam', 'value': item.team})
        			.css({'border': 'none', 'width': 'auto', 'background-color': 'none', 'max-width': '80px', 'background-color': 'white'})
                    .appendTo($div);
        $("<input>").attr({'name': 'approvers[' + index + '].memberJob', 'value': item.job})
        			.css({'border': 'none', 'width': 'auto', 'background-color': 'none', 'max-width': '80px', 'background-color': 'white'})
                    .appendTo($div);
        $("<input>").attr({'name': 'approvers[' + index + '].memberName', 'value': item.name})
        			.css({'border': 'none', 'width': 'auto', 'background-color': 'none', 'max-width': '80px', 'background-color': 'white'})
                    .appendTo($div);
        $("<input>").attr({'name': 'approvers[' + index + '].category', 'value': item.category})
        			.css({'border': 'none', 'width': 'auto', 'background-color': 'none', 'max-width': '80px', 'background-color': 'white'})
                    .appendTo($div);
        $div.appendTo($("#approvalDiv"));
        $("#approverBtn").text('재선택');
    });
}
</script>
</body>
</html>