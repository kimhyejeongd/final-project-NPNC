<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<div class="modal fade" id="editformModal" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="formModalLabel">사원 수정</h5>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
        <div class="modal-body">
			<form action="${path}/admin/attendance/updateAttendance" method="post">
				<div class="container">
         		 <div class="page-inner">
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
									<%--   value="${attendanceEdit.attendanceEditMember}" --%>
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
									 <%--  value="${attendanceEdit.attendanceEditDate }" --%>
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
									 <%--  value="${attendanceEdit.attendanceEditRequestDate }" --%>
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
		                              <%-- value="${attendanceEdit.attendanceEditBeforeState }" --%>
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
		                             <%--  value="${attendanceEdit.attendanceEditBeforeTime }" --%>
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
		                            <%--   value="${attendanceEdit.attendanceEditStartEnd }" --%>
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
		                             <%--  value="${attendanceEdit.attendanceEditAfterTime }" --%>
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
		                           <%--  <input
		                              type="text"
		                              class="form-control input-full"
		                              id="attendanceEditAfterState"
		                              name="attendanceEditAfterState"
		                              value="${attendanceEdit.attendanceEditAfterState }"
		                              required
		                            /> --%>
		                            <select
		                            class="form-select"
		                            id="attendanceEditAfterState"
		                            name="attendanceEditAfterState"
		                          	>
								  		<option value="출근" >출근</option>
								        <option value="지각" >지각</option>
								        <option value="조퇴" >조퇴</option>
								        <option value="결근" >결근</option>
								        <option value="휴가" >휴가</option>
								        <option value="유급휴가">유급휴가</option>
		                          </select>
		                            
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
		                            ><%-- ${attendanceEdit.attendanceEditRequest } --%></textarea>
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
		                              required
<%-- 		                             <c:if test="${not empty attendanceEditOpinion}">
		                              	readonly
		                             </c:if> --%>
		                            ></textarea>
		                          </div>
		           	</div>
		           		
		           		<input type="hidden" id="attendanceEditState" name="attendanceEditState" value="승인">
		           		<input type="hidden" id="attendanceKey" name="attendanceKey">
		           		
		          	
			           	<button
			           		id="approveButton"
						  	type="submit"
						 	class="btn btn-success"
			 				data-color="dark"
						>승인</button>
			</div>
			</div>
		   </div>
		</form>
	         		<button id="rejectButton"  onclick="rejectionAttendanceEdit();" class="btn btn-dark">
					반려</button>

		</div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> 

		
					
					
 				<script>
				const rejectionAttendanceEdit=()=>{
					   if(confirm("반려 하시겠습니까?")){

				           let form = document.createElement("form");
				           form.setAttribute("method", "post");
				           form.setAttribute("action", "${path}/admin/attendance/updateAttendanceEdit");
				
				           let key = document.getElementById("attendanceEditKey").value;
				           let $key = document.createElement("input");
				           $key.setAttribute("type", "hidden");
				           $key.setAttribute("name", "attendanceEditKey");
				           $key.setAttribute("value", key);
				 
				           form.appendChild($key);
							
				           let opinion = document.getElementById("attendanceEditOpinion").value;
				           let $opinion = document.createElement("input");
				           $opinion.setAttribute("type", "hidden");
				           $opinion.setAttribute("name", "attendanceEditOpinion");
				           $opinion.setAttribute("value", opinion);
				           form.appendChild($opinion);
				           
				           document.body.appendChild(form);
				           form.submit();
					   }else{
						   alert("반려가 취소되었습니다.");
						   location.replace("${path}/admin/attendance/selectAdminAttendanceEditAll");
					   }
					   
					}

				</script> 
