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
			      <div class="border" style="width:100%; height: 150px;" id="approvalDiv">
						<!-- <span class="" style="color: gray;">결재자를 선택하세요</span> -->
						  <div class="border" id="approval1">
						  	<input name="approvers[0].orderby" value="1" style="border-radius: 15px; width: 20px;">
						  	<input name="approvers[0].memberKey" value="2" style="display:none">
						  	<input name="approvers[0].memberTeam" value="기술지원팀" style="">
						  	<input name="approvers[0].memberJob" value="사원" style="">
						  	<input name="approvers[0].memberName" value="김사원" style="">
						  	<input name="approvers[0].category" value="기안" style="">
						  </div>
						  <div class="border" id="approval1">
						  	<input name="approvers[0].orderby" value="2" style="border-radius: 15px; width: 20px;">
						  	<input name="approvers[0].memberKey" value="2" style="display:none">
						  	<input name="approvers[0].memberTeam" value="기술지원팀" style="">
						  	<input name="approvers[0].memberJob" value="팀장" style="">
						  	<input name="approvers[0].memberName" value="김팀장" style="">
						  	<input name="approvers[0].category" value="검토" style="">
						  </div>
						  <div class="border" id="approval2">
						  	<input name="approvers[1].orderby" value="3" style="border-radius: 15px; width: 20px;">
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
  <!-- 임시저장 -->
<div class="swal-overlay" tabindex="-1" id="leavealert">
  <div class="swal-modal" role="dialog" aria-modal="true">
  <div class="swal-title" style="">창을 닫으시겠습니까?</div>
  <div class="swal-text" style="">임시저장하지 않으면 작성 내용이 사라집니다!</div>
  <div class="swal-footer"><div class="swal-button-container">
    <button class="swal-button swal-button--confirm btn btn-success">임시저장</button>
    <div class="swal-button__loader">
      <div></div>
      <div></div>
      <div></div>
    </div>
  </div><div class="swal-button-container">
    <button class="swal-button swal-button--cancel btn btn-danger">닫기</button>
    <div class="swal-button__loader">
      <div></div>
      <div></div>
      <div></div>
    </div>

  </div></div></div></div>
<script>
$(document).ready();
//TODO 모달 띄우기
$("#submitbtn").click(e=>{
	$("div#submitalert").addClass('swal-overlay--show-modal');
});


const now = "${path}"; 
let iframe = document.getElementById("hwpctrl");
iframe.contentWindow.postMessage(${now}, '*');

//Initialize WEBHWP
var HwpCtrl = BuildWebHwpCtrl(
  "hwpctrl",
  "https://webhwpctrl.cloud.hancom.com/webhwpctrl/",
  function () {
    window.parent.postMessage("ok", "*");
  }
);
/* 	//var HwpCtrl = BuildWebHwpCtrl("hwpctrl", function() {});
	 var HwpCtrl = BuildWebHwpCtrl("hwpctrl", location.href, function() {
	    }, 2);
	
    var hwpctrl_frame = document.getElementById("hwpctrl_frame");
    if (hwpctrl_frame != null) {
      hwpctrl_frame.width = parseInt(hwpctrl_panel.style.width);
      hwpctrl_frame.style.width = hwpctrl_panel.style.width;
      hwpctrl_frame.height = parseInt(hwpctrl_panel.style.height);
      hwpctrl_frame.style.height = hwpctrl_panel.style.height;
    }
  };
  var openDiag = document.getElementById("open");
  openDiag.onchange = function (event) {
      var target = event.target || event.srcElement;
      if (target.value.length == 0) {
      } else {
          HwpCtrl.Open(target.files[0], "", "include-format:hwpx;hwpjson20;", function (res) {
              console.log(res);
          }, {"UserData" : "testData"});
      }
  };
 */
 
</script>
</body>
</html>
