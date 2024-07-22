<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%
  String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>진행 중 문서</title>
    <meta
      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
      name="viewport"
    />
    <link
      rel="icon"
      type="image/x-icon"
    />
  <!-- SweetAlert2 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.min.css" rel="stylesheet">
  <!-- SweetAlert2 JS -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.all.min.js"></script>
    <style>
    	#tablerow:hover{
    		cursor: pointer; 
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
            <div
              class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
            >
              <div>
                <h3 class="fw-bold mb-3">결재 상신함</h3>
              </div>
            </div>
            <c:import url="${path}/WEB-INF/views/document/list/inprocessDoc.jsp"/>
           </div>
          </div>
        </div>
      </div>
<script>
$(document).ready(function(){
	const modal = (no)=>{
		// SweetAlert2 모달 띄우기
		console.log(no);
		Swal.fire({
			title: '회수 확인',
			html: '<h4>정말 회수하시겠습니까? <br>진행 중인 결재가 취소됩니다</h4>',
			showCancelButton: true,
			confirmButtonClass: 'btn btn-success',
			cancelButtonClass: 'btn btn-danger ms-2',
			confirmButtonText: '회수',
			cancelButtonText: '취소',
			buttonsStyling: false,
			reverseButtons: false
		}).then(result => {
			if (result.isConfirmed) {
				// 결재 버튼이 클릭되었을 때 처리할 로직
				console.log('회수하기');
				$.ajax({
					url: `${path}/document/retrieve`,
					data: {no : no},
					dataType: "text",
					method: "post",
					success: data=>{
						if(data==1){
							Swal.fire({
								title: '회수 완료',
								html: '<h4>정상적으로 회수되었습니다.<br>회수 문서함으로 이동하시겠습니까?</h4>',
								showCancelButton: true,
								confirmButtonClass: 'btn btn-success',
								cancelButtonClass: 'btn btn-danger ms-2',
								confirmButtonText: '회수',
								cancelButtonText: '취소',
								buttonsStyling: false,
								reverseButtons: false
							}).then((result) => {
								if (result.isConfirmed) {
									location.assign(`${pageContext.request.contextPath}/document/list/retrieve`)
								}else{
									location.reload();
								}
							});
						}
					}
				});
			}
		});
	};
});
document.addEventListener('DOMContentLoaded', function() {
    const table = document.getElementById('docTable');

    $("table").on('click', "button", function(e) {
        e.stopPropagation();
    });
    
    $("table").on('click', function(event) {
        const target = event.target;
     // 버튼이 클릭된 경우 이벤트 전파를 막고 함수를 종료
        if (target.tagName.toLowerCase() === 'button'|| (target.tagName.toLowerCase() === 'input' && target.type === 'button')) {
            event.stopPropagation();
            return;
        }

        const row = target.closest('tr');
        if (row && row.dataset.docId) {
            const docId = row.dataset.docId;
            console.log(docId);
            selectDoc(docId);
        }
    });
    
    
	//상세보기
	function selectDoc(docId){
		const $form = $("<form>").attr({'action': '${pageContext.request.contextPath}/document/view/docDetail', 'method': 'post'});
		$("<input>").attr({'value': docId, 'name': 'docId','type': 'hidden'}).appendTo($form);
		$form.appendTo("body").submit();
	}
});
</script>
  </body>
</html>
