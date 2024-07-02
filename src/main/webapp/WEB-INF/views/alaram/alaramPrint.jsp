<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="path" value="${pageContext.request.contextPath }"/>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BS Chatting</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script src="<c:url value='${path}/resources/js/jquery-3.7.0.min.js'/>" ></script>
<style>
	   #chattingcontent{
      width:100%;
      height:400px;
      overflow-y:scroll;
   }
   .msgcontainer{
      display:flex;
   }
   .left{
      justify-content:start;
   }
   .right{
      justify-content:end;
   }
   .listcontainer{
      list-style-type:none;
      max-height:100px;
      overflow-y:scroll
   }
   .listfont{
      font-size:20px;
      font-weight:bolder;
   }
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<h2 class="col-12">BS 채팅</h2>
		</div>
		<div class="row">
			<div id="chattingcontent" class="col-8"></div>
			<div id="attendContainer" class="col-4"></div>
		</div>
		<div class="row">
			<div class="col-9">
				<input type="text" class="form-control" id="msg">
			</div>
			<div class="col-3">
				<button id="sendBtn" class="btn btn-outline-dark" onclick="sendMessage();">전송</button>
			</div>
		</div>
	</div>
	<script>
		const loginId='admin';
		const path='${pageContext.request.contextPath}';
	</script>
	<script src="<c:url value='/resources/js/alarm.js'/>"></script>
</body>
</html>