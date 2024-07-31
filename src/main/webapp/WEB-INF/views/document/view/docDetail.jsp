<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="org.springframework.ui.Model" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication var="loginMember" property="principal"/>
<c:set var="aptarget" value="'memberKey=' + ${loginMember.memberKey}"/>
<%
	String lastPage = (String) session.getAttribute("lastPage");
%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <title>문서 상세보기</title>
  <meta
    content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    name="viewport"
  />
  <!-- SweetAlert2 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.min.css" rel="stylesheet">
  <!-- SweetAlert2 JS -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.all.min.js"></script>
  <link
    rel="icon"
    type="image/x-icon"
  />
 </head>
 <style>
 	.scrollable-content {
        width: 100%;
        height: 800px;
        margin: 0 auto;
        border: 1px solid #ccc;
        overflow-y: scroll; /* 세로 스크롤만 */
        overflow-x: auto;  /* 가로 스크롤도 필요할 경우 */
     }
     /* a:hover{
     	cursor: pointer;
     	text-decoration: underline !important;
     } */
 </style>
 <script src="${path}/resources/jh/js/docDetail.js"></script>
 <script src="${path}/resources/jh/js/draft.js"></script>
 <script src="${path}/resources/jh/js/inprocess.js"></script>
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
              	<c:choose>
              		<c:when test="${fn:contains(lastPage, 'inprocess') or (fn:contains(lastPage, 'home') and fn:contains(history, 'inprocess'))}">
		              	<h3 class="fw-bold text-center">진행 중 문서</h3>
		            </c:when>
              		<c:when test="${fn:contains(lastPage, 'retrieve') or (fn:contains(lastPage, 'home') and fn:contains(history, 'retrieve'))}">
		              	<h3 class="fw-bold text-center">회수 문서</h3>
		            </c:when>
		            <c:when test="${fn:contains(lastPage, 'waiting') or (fn:contains(lastPage, 'home') and fn:contains(history, 'waiting'))}">
		              	<h3 class="fw-bold text-center">결재 대기 문서</h3>
		            </c:when>
              	</c:choose>
              </div>
            </div>
            <div class="row">
              <div class=""> <!-- 컨테이너박스 -->
                <div class="card card-round p-3">
                <div class="card-header">
					<div class="card-head-row justify-content-between">
						<div class="card-title">
							상세보기
						</div>
						<div class="card-tools">
							<!-- 기안자 -->
							<!-- 재기안, 삭제 -->
							<div class="d-flex">
							<c:choose>
								<c:when test="${loginMember.memberKey eq l.erDocWriter and fn:contains(lastPage, 'inprocess')}">
									<button class="btn btn-label-success btn-round btn-sm me-2">
										<span class="btn-label">
											<i class="fas fa-edit"></i>
										</span>
										내용 수정
									</button>
									<button class="btn btn-label-info btn-round btn-sm" onclick="modal('${l.erDocSerialKey}');">
										<span class="btn-label">
											<i class="fas fa-redo-alt"></i>
										</span>
										회수
									</button>
								</c:when>
								<c:when test="${fn:contains(lastPage, 'draft') or fn:contains(lastPage, 'retrieve') or (fn:contains(lastPage, 'home') and fn:contains(history, 'retrieve'))}">
									<button class="btn btn-label-success btn-round me-2" onclick="rewriteModal('${l.erDocKey}')">
										<span class="btn-label">
											<i class="fa fa-pencil"></i>
										</span>
										다시 쓰기
									</button>
									<button class="btn btn-label-warning btn-round" onclick="deleteModal('${l.erDocKey}')">
										<span class="btn-label">
											<i class="fas fa-trash-alt"></i>
										</span>
										삭제
									</button>
								</c:when>
								<c:when test="${fn:contains(lastPage, 'waiting') or 
							                  (fn:contains(lastPage, 'home') and fn:contains(history, 'waiting')) or 
							                  fn:contains(approverStr, aptarget)}">
									<a href="#" class="btn btn-label-info btn-round" onclick="approveModal('${loginMember.memberKey }', '${l.erDocSerialKey}')">
										<span class="btn-label">
											<i class="fa fa-pencil"></i>
										</span>
										결재
									</a>
								</c:when>
							</c:choose>
									<div class="d-flex align-items-center">
										<button class="btn btn-sm btn-outline-secondary justify-content-center d-flex" id="topBtn" style="width: 30px; align-items: center; height:30px;"><i class="icon-arrow-up"></i></button>
		           						<button class="btn btn-sm btn-outline-secondary justify-content-center d-flex" id="downBtn" style="width: 30px; align-items: center; height:30px;"><i class="icon-arrow-down"></i></button>
	           						</div>
							</div>
						</div>
					</div>
				</div>
                  <div class="card-body">
               	<div class="form-group d-flex">
			      <label for="smallInput"><span class="h5 me-5">문서명</span></label>
			      <div class="border d-block form-control form-control-sm d-flex align-items-center" style="height: auto; min-height: 30px; width: 100%;" id="">
			      	<span style="font-size: larger;">${l.erDocTitle }</span>
			      </div>
			    </div>
			    <div class="form-group">
			      <label class=""><span class="h5">긴급 여부</span></label>
			      		<c:if test="${l.erDocEmergencyYn eq 'Y'}">
				          <span class="h5 ms-4">긴급</span>
			      		</c:if>
			      		<c:if test="${l.erDocEmergencyYn eq 'N'}">
				            <span class="h5 ms-4">일반</span>
			      		</c:if>
			    </div>
		    	 <div class="form-group d-flex">
			      <label for="smallInput" class=""><span class="h5 me-5">보관함 </span></label>
			      <div class="border d-block form-control form-control-sm d-flex align-items-center" style="height: auto; min-height: 30px; width: 100%;" id="">
			      	<span style="font-size: larger;">${l.erDocStorageFolderName} > ${l.erDocStorageName} (${l.erDocStorageTerm }년)</span>
			      </div>
			    </div>
			    <div class="form-group d-flex">
		      <span class="h5 me-5">결재자</span>
				<div class="col w-100 align-items-center p-0">
			      <div class="border col" style="height: auto; min-height: 30px; width:100%;" id="approvalDiv">
						<!-- <span class="" style="color: gray;">결재자를 선택하세요</span> -->
						<c:forEach items="${l.approvers }" var="ap" varStatus="vs">
						<c:if test="${ap.orderby ne 0}">
						  <div class="col m-0 p-2" id="approval1" style="width: 100%; font-size: larger; text-align: lef; border-radius: 15px;">
						  	<input class="badge rounded-pill text-bg-secondary me-2 ms-0" name="approvers[${vs.index }].orderby" value="${ap.orderby }" style="border-radius: 15px; width: 23px; display: inline; background-color: white;">
						  	<input name="approvers[${vs.index }].memberKey" value="${ap.memberKey }" style="display:none">
						  	<input name="approvers[${vs.index }].memberTeam" value="${ap.memberTeamName }" style="border: none; width: auto; background-color: none; max-width: 80px; background-color: white;" disabled>
						  	<input name="approvers[${vs.index }].memberJob" value="${ap.memberJobName }" style="border: none; width: auto; background-color: none; max-width: 80px; background-color: white;" disabled>
						  	<input name="approvers[${vs.index }].memberName" value="${ap.memberName }" style="border: none; width: auto; background-color: none; max-width: 80px; background-color: white;" disabled>
						  	<input name="approvers[${vs.index }].category" value="${ap.category }" style="border: none; width: auto; background-color: none; max-width: 80px; background-color: white;" disabled>
						  </div>
						 </c:if>
					  </c:forEach>
			      </div>
			      </div>
			    </div>
			    <div class="form-group d-flex">
			      <label for="smallInput" class="me-3"><span class="h5 me-5" style="margin-right: 1.9rem !important;">참조인 </span></label>
			      <div class="col w-100 align-items-center p-0">
		      		<div class="border d-block form-control form-control-sm d-flex align-items-center d-flex gap-2" style="height: auto; min-height: 30px; width: 100%;" id="">
				      <!-- <div class="col m-0 p-2" style="height: auto; min-height: 30px; width: 100%; text-align: left; fontSize: larger; border-radius: 15px;" id=""> -->
					      <c:if test="${not empty l.referers}">
						      <c:forEach items="${l.referers }" var="ap" varStatus="vs">
						      	<c:if test="${ap.erRefererKey ne 0}">
						      	<div class="row m-0 p-2 border text-align-center justify-content-center " style="width: 140px; font-size: larger; border-radius: 10px; background-color: var(--bs-border-color);">${ap.memberTeamName } ${ap.memberJobName } ${ap.memberName }</div>
						      	</c:if>
						      </c:forEach>
					      </c:if>
				      </div>
				     </div>
			    </div>
			    <div class="form-group d-flex align-items-center gap-3">
			      <label for="smallInput"><span class="h5" style="margin-right: 0.9rem !important;">참조문서</span></label>
			      <div class="border d-block" style="height: auto; min-height: 30px; width: 100%;" id="">
			      </div>
			    </div>
	          	<c:if test="${l.files[0].fileKey ne 0}">
			    <div class="form-group d-flex align-items-center">
		          <label for="exampleFormControlFile1"><span class="h5 align-items-top" style="margin-right: 1.8rem !important;">첨부파일</span></label><br>
		          <div class="border" style="width:100%; height: auto;">
	          		<c:forEach items="${l.files }" var="f" varStatus="vs">
					  <div class="m-0 p-2 d-flex align-items-center justify-content-between" id="approval1" style="width: 100%; font-size: larger; text-align: left; border-radius: 15px;">
					  	<div class="d-flex align-items-center">
						  	<input class="badge rounded-pill text-bg-secondary me-2 ms-0" name="approvers[${vs.index }].orderby" value="${f.fileOrderby }" style="border-radius: 15px; width: 23px; display: inline; background-color: white;">
						  	<span href="#" id="approvers[${vs.index }].fileOriName" style="color: black;">${f.fileOriName }</span>
					  	</div>
					  	<div class="d-flex">
						  	<button class="btn btn-sm btn-outline-secondary ml-2 bringBtn ms-2" id="fileViewBtn" type="button">자세히보기</button>
						  	<button class="btn btn-sm btn-outline-secondary ml-2 bringBtn ms-2" id="fileDownBtn" type="button" data-filename="${f.fileOriName }">다운로드</button>
					  	</div>
					  </div>
					</c:forEach>
		          </div>
		        </div>
	          	</c:if>
			    <div class="form-group">
		          	<label for="exampleFormControlFile1"><span class="h5">문서내용</span></label>
			        <div id="" class="scrollable-content" style="margin: 0px auto; width: 100%; height: 800px;">
			        	<div id="content" class="" style="width: fit-content; height: 800px; margin: 0px auto; padding: 50px;">
				        	<c:out value="${html }" escapeXml="false"/>
			        	</div>
			        </div>
		        </div>
                  <div class="p-3 text-center">
                  		<button class="btn btn-primary" id="closeBtn" type="button">이전으로</button>
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
	sessionStorage.setItem("formNo", "${l.docFormKey}");
</script>
</body>
</html>
