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
			      <input type="text" class="form-control form-control-sm" id="smallInput" value="${l.erDocTitle }">
			    </div>
			    <div class="form-group">
			      <label class=""><span class="h5">긴급 여부</span></label>
			          <input class="ms-3" type="radio" name="flexRadioDefault" id="flexRadioDefault1" <c:if test="${l.erDocEmergencyYn eq 'Y'}">checked</c:if>>
			          <label class="ms-1" for="flexRadioDefault1"><span class="h5">긴급</span> </label>
			          <input class="ms-3" type="radio" name="flexRadioDefault" id="flexRadioDefault2" <c:if test="${l.erDocEmergencyYn eq 'N'}">checked</c:if>>
			          <label class="ms-1" for="flexRadioDefault2">
			            <span class="h5">일반</span>
		          </label>
			    </div>
			    <div class="form-group d-flex">
		      <label for="smallInput"><span class="h5 me-5">결재자</span></label>
				<div class="col w-100 align-items-center">
			      <div class="border" style="width:100%; height: 150px;" id="approvalDiv">
						<!-- <span class="" style="color: gray;">결재자를 선택하세요</span> -->
						<c:forEach items="${l.approvers }" var="ap" varStatus="vs">
						  <div class="border" id="approval1">
						  	<input name="approvers[${vs.index }].orderby" value="${ap.orderby }" style="border-radius: 15px; width: 20px;">
						  	<input name="approvers[${vs.index }].memberKey" value="${ap.memberKey }" style="display:none">
						  	<input name="approvers[${vs.index }].memberTeam" value="${ap.memberTeam }" style="">
						  	<input name="approvers[${vs.index }].memberJob" value="${ap.memberJob }" style="">
						  	<input name="approvers[${vs.index }].memberName" value="${ap.memberName }" style="">
						  	<input name="approvers[${vs.index }].category" value="${ap.category }" style="">
						  </div>
					  </c:forEach>
			      </div>
			      </div>
			    </div>
			    <div class="form-group d-flex align-items-center gap-3">
			      <label for="smallInput"><span class="h5" style="margin-right: 1.9rem !important;">참조인</span></label>
			      <div class="border" style="height: auto; min-height: 30px; width: 90%;" id="approvalDiv">
			      </div>
			    </div>
			    <div class="form-group d-flex align-items-center gap-3">
			      <label for="smallInput"><span class="h5" style="margin-right: 0.9rem !important;">참조문서</span></label>
			      <div class="border d-block" style="height: auto; min-height: 30px; width: 90%;" id="">
			      </div>
			    </div>
	          	<c:if test="${l.files.size() > 1 }">
			    <div class="form-group d-flex align-items-center">
		          <label for="exampleFormControlFile1"><span class="h5" style="margin-right: 1.8rem !important;">첨부파일</span></label><br>
		          <div class="border" style="width:100%; height: auto;">
		          </div>
		        </div>
	          	</c:if>
			    <div class="form-group">
		          	<label for="exampleFormControlFile1"><span class="h5">문서내용</span></label>
			        <div id="" class="border scrollable-content" style="margin: 0px auto; width: 100%; height: 800px;">
			        	<div id="content" class="border" style="width: fit-content; height: 800px; margin: 0px auto;">
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
