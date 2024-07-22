<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%
  String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>결재 Home</title>
    <meta
      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
      name="viewport"
    />
    <link
      rel="icon"
      type="image/x-icon"
    />
    <style>
    	#tablerow:hover{
    		cursor: pointer; 
    	}
    </style>
  </head>
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
            <div
              class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
            >
              <div>
                <h3 class="fw-bold mb-3">결재 Home</h3>
              </div>
              <div class="ms-md-auto py-2 py-md-0">
                <!-- <a href="#" class="btn btn-label-info btn-round me-2">Manage</a> -->
              </div>
            </div>
            <c:import url="${path }/WEB-INF/views/document/list/inprocessDoc.jsp"/>
            <c:import url="${path }/WEB-INF/views/document/list/waitingDocs.jsp"/>
            </div>
          </div>
          </div>
        </div>
  </body>
</html>
