<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
 </style>
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
                <h3 class="fw-bold">문서 보기</h3>
              </div>
            </div>
            <div class="row">
              <div class=""> <!-- 컨테이너박스 -->
                <div class="card card-round p-3">
                  <div class="card-body">
               	<div class="form-group d-flex">
			      <label for="smallInput"><span class="h5 me-5">문서명</span></label>
			      <div class="border d-block form-control form-control-sm d-flex align-items-center" style="height: auto; min-height: 30px; width: 90%;" id="">
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
		          </label>
			    </div>
		    	 <div class="form-group d-flex">
			      <label for="smallInput" class="me-3"><span class="h5 me-5">보관 </span></label>
			      <div class="border d-block form-control form-control-sm d-flex align-items-center" style="height: auto; min-height: 30px; width: 90%;" id="">
			      	<span style="font-size: larger;">${l.erDocStorage}</span>
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
						  	<input name="approvers[${vs.index }].memberTeam" value="${ap.memberTeam }" style="border: none; width: auto; background-color: none; max-width: 80px; background-color: white;" disabled>
						  	<input name="approvers[${vs.index }].memberJob" value="${ap.memberJob }" style="border: none; width: auto; background-color: none; max-width: 80px; background-color: white;" disabled>
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
						      	<div class="row m-0 p-2 border text-align-center justify-content-center " style="width: 140px; font-size: larger; border-radius: 10px; background-color: var(--bs-border-color);">${ap.erReferermemberTeam } ${ap.erReferermemberJob } ${ap.erReferermemberName }</div>
						      	</c:if>
						      </c:forEach>
					      </c:if>
				      </div>
				     </div>
			    </div>
			    <div class="form-group d-flex align-items-center gap-3">
			      <label for="smallInput"><span class="h5" style="margin-right: 0.9rem !important;">참조문서</span></label>
			      <div class="border d-block" style="height: auto; min-height: 30px; width: 90%;" id="">
			      </div>
			    </div>
	          	<c:if test="${l.files[0].fileKey ne 0}">
			    <div class="form-group d-flex align-items-center">
		          <label for="exampleFormControlFile1"><span class="h5" style="margin-right: 1.8rem !important;">첨부파일</span></label><br>
		          <div class="border" style="width:100%; height: auto;">
		          	<span style="font-size: larger;">첨부파일 있음</span>
		          </div>
		        </div>
	          	</c:if>
			    <div class="form-group">
		          	<label for="exampleFormControlFile1"><span class="h5">문서내용</span></label>
			        <div id="" class="scrollable-content" style="margin: 0px auto; width: 100%; height: 800px;">
			        	<div id="content" class="" style="width: fit-content; height: 800px; margin: 0px auto;">
				        	<c:out value="${html }" escapeXml="false"/>
			        	</div>
			        </div>
		        </div>
                  <div class="p-3 text-center">
                  		<button class="btn btn-primary" id="closeBtn" type="button">닫기</button>
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
$(document).ready();
//TODO 재기안
</script>
</body>
</html>
