<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>회수 문서</title>
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
            <div class="row">
              <div class="">
                <div class="card card-round">
                  <div class="card-header">
                    <div class="card-head-row card-tools-still-right">
                      <div class="card-title">회수 문서</div>
                      <div class="card-tools">
                      </div>
                    </div>
                  </div>
                  <div class="card-body p-0">
                    <div class="table-responsive">
                      <!-- Projects table -->
                      <table class="table table-hover align-items-center mb-0">
                        <thead class="thead-light">
                          <tr class="text-center">
                          	<!-- <th><input type="checkbox"></th> -->
                            <th scope="col" class="">#</th>
                            <th scope="col" class="">문서 제목</th>
                            <th scope="col" class="">상신 일자</th>
                            <th scope="col" class="">회수 일자</th>
                            <th scope="col" class=""></th>
                          </tr>
                        </thead>
                        <tbody>
	                         <c:if test="${doclist eq null}">
		                         <tr class="text-center">
		                         	<td colspan="5">회수된 문서가 없습니다</td>
	                         	</tr>
	                         </c:if>
	                         <c:if test="${doclist ne null}">
	                         	<c:forEach items="${doclist }" var="l">
		                         <tr class="text-center" id="tablerow">
		                            <td class="text-muted" data-doc-id="${l.erDocKey }">${vs.index+1 }</td>
		                            <td class=""><c:if test="${l.erDocEmergencyYn eq 'Y'}"><span style="color: red;">[긴급] </span></c:if>${l.erDocTitle }</td>
		                            <td class="">
		                            	<fmt:formatDate value="${l.erDocCreateDate}" type="date" pattern="yy/MM/dd HH:mm"/>
		                            </td>
		                            <td class="">
		                            	<fmt:formatDate value="${l.erDocStateUpdateDate}" type="date" pattern="yy/MM/dd HH:mm"/>
		                            </td>
		                         	<td colspan="5"><input type="button" value="재기안" class="btn btn-outline-secondary" id="retrieveBtn" onclick="modal('${l.erDocKey}, '${path }'');"></td>
		                          </tr>
		                          </c:forEach>
	                          </c:if>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
           </div>
          </div>
        </div>
      </div>
<script>
	const modal = (no, path)=>{
		// SweetAlert2 모달 띄우기
		console.log(no);
		Swal.fire({
			title: '재기안',
			html: '<h4>해당 문서 내용으로 재기안하시겠습니까?</h4>',
			showCancelButton: true,
			confirmButtonClass: 'btn btn-success',
			cancelButtonClass: 'btn btn-danger ms-2',
			confirmButtonText: '재기안',
			cancelButtonText: '취소',
			buttonsStyling: false,
			reverseButtons: false
		}).then((result) => {
			if (result.isConfirmed) {
				console.log('재기안하기');
				$.ajax({
					url: `${path}/document/retrieve`,
					data: no,
					success: data=>{
						//문서 정보 전달, 문서 작성으로 이동
						
					}
				});
			}
		});
	};
	//상세보기
	function selectDoc(docid, path){
		$.ajax(`${path}/document/rewrite`, {
			method: "post",
			headers: {
				'Content-Type' : 'application/json'
			},
			body: JSON.stringify({documentId: docid})
		}).response => {
			if(response.ok){
				location.assign(`${path}/document/view/`)
			}
		})
	}
</script>
  </body>
</html>