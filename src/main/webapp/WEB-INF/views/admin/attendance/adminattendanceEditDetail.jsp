<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>	    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/script_gather.jsp" %> 
				
				<form action="${path}/admin/attendance/updateattendanceEdit" method="post">
				<div class="form-group">
					<div class="form-group form-inline">
		                          <label
		                            for="attendanceEditMember"
		                            class="col-md-3 col-form-label"
		                            >작성자</label>
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="attendanceEditMember"
		                              name="attendanceEditMember"
									  value="${attendanceEdit.attendanceEditMember}"
		                              placeholder="작성자"
		                              readonly
		                            />
		                          </div>
		           	</div>
		           	
		           	<input type="hidden" id="attendanceEditKey" name="attendanceEditKey" value="${attendanceEdit.attendanceEditKey }">
		           	
		           	<div class="form-group form-inline">
		                          <label
		                            for="attendanceEditDate"
		                            class="col-md-3 col-form-label"
		                            >작성일</label>
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="date"
		                              class="form-control input-full"
		                              id="attendanceEditDate"
		                              name="attendanceEditDate"
									  value="${attendanceEdit.attendanceEditDate }"
		                              placeholder="작성일"
		                              readonly
		                            />
		                          </div>
		           	</div>
		           	
		           	<div class="form-group form-inline">
		                          <label
		                            for="attendanceEditRequestDate"
		                            class="col-md-3 col-form-label"
		                            >수정요청일</label>
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="date"
		                              class="form-control input-full"
		                              id="attendanceEditRequestDate"
		                              name="attendanceEditRequestDate"
									  value="${attendanceEdit.attendanceEditRequestDate }"
		                              placeholder="수정요청일"
		                              readonly
		                            />
		                          </div>
		           	</div>
		           	
		           		<div class="form-group form-inline">
		                          	<label
		                            for="attendanceEditBeforeState"
		                            class="col-md-3 col-form-label"
		                            >수정전상태</label>
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="attendanceEditBeforeState"
		                              name="attendanceEditBeforeState"
		                              value="${attendanceEdit.attendanceEditBeforeState }"
		                              readonly
		                            />
		                          </div>
						</div>
						
						<div class="form-group form-inline">
		                           	<label
		                            for="attendanceEditBeforeTime"
		                            class="col-md-3 col-form-label"
		                            >수정전시간</label>
		                 			<div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="attendanceEditBeforeTime"
		                              name="attendanceEditBeforeTime"
		                              value="${attendanceEdit.attendanceEditBeforeTime }"
		                              readonly
		                            />
		                          </div>
		                </div>
		              	<div class="form-group form-inline">
		                          	<label
		                            for="attendanceEditStartEnd"
		                            class="col-md-3 col-form-label"
		                            >출근/퇴근</label>
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="attendanceEditStartEnd"
		                              name="attendanceEditStartEnd"
		                              value="${attendanceEdit.attendanceEditStartEnd }"
		                              readonly
		                            />
		                          </div>
						</div>            
		                          
		           	<div class="form-group form-inline">
		                          <label
		                            for="attendanceEditAfterTime"
		                            class="col-md-3 col-form-label"
		                            >수정요청시간</label>
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="attendanceEditAfterTime"
		                              name="attendanceEditAfterTime"
		                              value="${attendanceEdit.attendanceEditAfterTime }"
		                              readonly
		                            />
		                          </div>
		           	</div>
		           
		         <div class="form-group form-inline">
		                          <label
		                            for="attendanceEditAfterState"
		                            class="col-md-3 col-form-label"
		                            >수정후상태</label>
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="attendanceEditAfterState"
		                              name="attendanceEditAfterState"
		                              value="${attendanceEdit.attendanceEditAfterState }"
		                              readonly
		                            />
		                          </div>
		           	</div>
		           
		           	<div class="form-group form-inline">
		                          <label
		                            for="attendanceEditRequest"
		                            class="col-md-3 col-form-label"
		                            >요청사유</label>
		                          <div class="col-md-9 p-0">
		                            <textarea
		                              class="form-control"
		                              id="attendanceEditRequest"
		                              name="attendanceEditRequest"
		                             readonly
		                            >${attendanceEdit.attendanceEditRequest }</textarea>
		                          </div>
		           	</div>
		           	
		           	 	<div class="form-group form-inline">
		                          <label
		                            for="attendanceEditOpinion"
		                            class="col-md-3 col-form-label"
		                            >수정의견</label>
		                          <div class="col-md-9 p-0">
		                            <textarea
		                              class="form-control"
		                              id="attendanceEditOpinion"
		                              name="attendanceEditOpinion"

		                            ></textarea>
		                          </div>
		           	</div>
		           	
		           		<input type="hidden" id="attendanceEditState" name="attendanceEditState" value="승인">
		           		
		           	<button
					  	type="submit"
					 	class="btn btn-success"
		 				data-color="dark"
					>승인</button>
					
					<button onclick="rejectionAttendanceEdit('${attendanceEdit.attendanceEditKey}');" class="btn btn-dark">
					반려</button>
			</div>

		</form>
	         
				
				<script>
				const rejectionAttendanceEdit=(key)=>{
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