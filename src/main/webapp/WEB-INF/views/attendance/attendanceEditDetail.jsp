<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정요청</title>
</head>
<body>
				<%@ include file="/WEB-INF/views/common/script_gather.jsp" %> 
				
				<div class="form-group">
					<div class="col-md-9 p-0">
		           		 작성자 <h4>${attendanceEdit.attendanceEditMember }</h4>
		            </div>
		            
		            <div class="col-md-9 p-0">
		           		 작성일 <h4>${attendanceEdit.attendanceEditDate}</h4>
		            </div>
		            
		            <div class="col-md-9 p-0">
		           		 수정요청일 <h4>${attendanceEdit.attendanceEditRequestDate }</h4>
		            </div>        
					
					<div class="col-md-9 p-0">
		           		 수정전상태 <h4>${attendanceEdit.attendanceEditBeforeState }</h4>
		            </div>
		            
		            <div class="col-md-9 p-0">
		           		 수정전시간 <h4>${attendanceEdit.attendanceEditBeforeTime }</h4>
		            </div>
		            
		            <div class="col-md-9 p-0">
		           		 출근/퇴근 <h4>${attendanceEdit.attendanceEditStartEnd }</h4>
		            </div>
		            
		            <div class="col-md-9 p-0">
		           		 수정요청상태 <h4>${attendanceEdit.attendanceEditAfterState }</h4>
		            </div>
		            
		            <div class="col-md-9 p-0">
		           		 수정요청시간 <h4>${attendanceEdit.attendanceEditAfterTime }</h4>
		            </div>
		            		            
		            <div class="col-md-9 p-0">
		           		 요청사유 <h4>${attendanceEdit.attendanceEditRequest }</h4>
		            </div>		
		           	
		           	<div class="col-md-9 p-0">
		           		 수정의견 <h4>${attendanceEdit.attendanceEditOpinion }</h4>
		            </div>			           	
		          	<div>
		          		<button onclick="deleteAttendanceEdit('${attendanceEdit.attendanceEditKey}');" class="btn btn-dark">삭제</button>
		          	</div>
				</div>
				
				<script>
				const deleteAttendanceEdit=(key)=>{
					   if(confirm("정말 삭제 하시겠습니까?")){
				           let form = document.createElement("form");
				           form.setAttribute("method", "post");
				           form.setAttribute("action", "${path}/attendance/deleteAttendanceEdit");
				
				           let $key = document.createElement("input");
				           $key.setAttribute("type", "hidden");
				           $key.setAttribute("name", "attendanceEditKey");
				           $key.setAttribute("value", key);
				 
				           form.appendChild($key);
				
				           document.body.appendChild(form);
				           form.submit();
					   }else{
						   alert("삭제가 취소되었습니다.");
					   }
					   
					}

				</script>

</body>
</html>