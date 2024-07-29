<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%
	String contextPath = request.getContextPath();
	// 세션에 현재 페이지를 저장
	session.setAttribute("lastPage", request.getRequestURL().toString());
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>결재 승인 문서</title>
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
  <script src="${path}/resources/jh/js/draft.js"></script>
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
                <h3 class="fw-bold mb-3">결재 수신함</h3>
              </div>
              <div class="ms-md-auto py-2 py-md-0">
                <!-- <a href="#" class="btn btn-label-info btn-round me-2">Manage</a> -->
              </div>
            </div>
			<div class="row">
			 <div class="">
			   <div class="card card-round">
			     <div class="card-header">
			       <div class="card-head-row card-tools-still-right">
			         <div class="card-title">승인 문서</div>
			         <div class="card-tools">
			         </div>
			       </div>
			     </div>
			     <div class="card-body p-0">
			       <div class="table-responsive">
			         <!-- Projects table -->
			         <table class="table table-hover align-items-center mb-0" id="completeTable">
			           <thead class="thead-light">
			             <tr class="text-center">
			             	<!-- <th><input type="checkbox"></th> -->
			               <th scope="col" class="">#</th>
			               <th scope="col" class="">등록 번호</th>
			               <th scope="col" class="">문서 제목</th>
			               <th scope="col" class="">상신인</th>
			               <th scope="col" class="">상신 일자</th>
			               <th scope="col" class="">결재 라인</th>
			             </tr>
			           </thead>
			           <tbody>
			             <c:if test="${empty completelist}">
			              <tr class="text-center">
			              	<td colspan="6">결재 완료된 문서가 없습니다</td>
			             	</tr>
			             </c:if>
			             <c:if test="${completelist ne null}">
			             	<c:forEach items="${completelist }" var="l" varStatus="vs">
			              <tr class="text-center" id="tablerow" data-doc-id="${l.erDocKey }">
			              	<td>${vs.index+1 }</td>
			                 <td class="text-muted">${l.erDocSerialKey }</td>
			                 <td class=""><c:if test="${l.erDocEmergencyYn eq 'Y'}"><span style="color: red;">[긴급] </span></c:if>${l.erDocTitle }</td>
			                	<td>
			                		<c:forEach items="${l.approvers }" var="ap">
			                			<c:if test="${ap.orderby eq 0 }">
			                				<div class="badge badge-count" style="min-width: 60px;">
			                   				<small class="">${ap.memberTeamName }</small><br>
			                   				<small class="">${ap.memberJobName} ${ap.memberName}</small>
			                   			</div>
			                			</c:if>
			                		</c:forEach>
			                	</td>
			                 <td class="">
			                 	<fmt:formatDate value="${l.erDocCreateDate}" type="date" pattern="yyyy/MM/dd HH:mm:ss"/>
			                 </td>
			                 <td class="approverNow p-3">
			                 	<c:forEach items="${l.approvers }" var="ap">
			                 		<c:if test="${ap.state eq '승인' }">
				                   			<div class="badge badge-success" style="min-width: 60px;">
				                   				<small class="">${ap.memberTeamName }</small><br>
				                   				<small class="">${ap.memberJobName} ${ap.memberName}</small>
				                   			</div>
				                   		</c:if>
				                 		<c:if test="${ap.state eq '대기' }">
				                   			<div class="badge badge-count" style="min-width: 60px;">
				                   				<small class="">${ap.memberTeamName }</small><br>
				                   				<small class="">${ap.memberJobName} ${ap.memberName}</small>
				                   			</div>
				                   		</c:if>
				                 		<c:if test="${ap.state eq '읽음' }">
				                   			<div class="badge badge-info" style="min-width: 60px;">
				                   				<small class="">${ap.memberTeamName }</small><br>
				                   				<small class="">${ap.memberJobName} ${ap.memberName}</small>
				                   			</div>
				                   		</c:if>
				                 		<c:if test="${ap.state eq '보류' }">
				                   			<div class="badge badge-danger" style="min-width: 60px;">
				                   				<small class="">${ap.memberTeamName }</small><br>
				                   				<small class="">${ap.memberJobName} ${ap.memberName}</small>
				                   			</div>
				                   		</c:if>
				                   		<c:if test="${ap.state eq '반려' }">
				                   			<div class="badge badge-danger" style="min-width: 60px;">
				                   				<small class="">${ap.memberTeamName }</small><br>
				                   				<small class="">${ap.memberJobName} ${ap.memberName}</small>
				                   			</div>
			                   			</c:if>
			                   </c:forEach>
			                 </td>
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
	sessionStorage.setItem("path", "${pageContext.request.contextPath}");
</script>
  </body>
</html>
