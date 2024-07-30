<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<div class="modal fade" id="editmemModal" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="formModalLabel">사원 수정</h5>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
        <div class="modal-body">
			<form action="${path}/attendance/deleteAttendanceEdit" method="post">
				<div class="container">
         		 <div class="page-inner">
				<div class="form-group">
					<div class="form-group form-inline">
		                          <label
		                            for="attendanceEditMemberMo"
		                            class="col-md-3 col-form-label"
		                            >작성자</label>
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="attendanceEditMemberMo"
		                              name="attendanceEditMember"
									<%--   value="${attendanceEdit.attendanceEditMember}" --%>
		                              placeholder="작성자"
		                              readonly
		                            />
		                          </div>
		           	</div>
		           	
		           	<input type="hidden" id="attendanceEditKeyMo" name="attendanceEditKey" >
		           	
		           	<div class="form-group form-inline">
		                          <label
		                            for="attendanceEditDateMo"
		                            class="col-md-3 col-form-label"
		                            >작성일</label>
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="date"
		                              class="form-control input-full"
		                              id="attendanceEditDateMo"
		                              name="attendanceEditDate"
									 <%--  value="${attendanceEdit.attendanceEditDate }" --%>
		                              placeholder="작성일"
		                              readonly
		                            />
		                          </div>
		           	</div>
		           	
		           	<div class="form-group form-inline">
		                          <label
		                            for="attendanceEditRequestDateMo"
		                            class="col-md-3 col-form-label"
		                            >수정요청일</label>
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="date"
		                              class="form-control input-full"
		                              id="attendanceEditRequestDateMo"
		                              name="attendanceEditRequestDate"
									 <%--  value="${attendanceEdit.attendanceEditRequestDate }" --%>
		                              placeholder="수정요청일"
		                              readonly
		                            />
		                          </div>
		           	</div>
		           	
		           		<div class="form-group form-inline">
		                          	<label
		                            for="attendanceEditBeforeStateMo"
		                            class="col-md-3 col-form-label"
		                            >수정전상태</label>
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="attendanceEditBeforeStateMo"
		                              name="attendanceEditBeforeState"
		                              <%-- value="${attendanceEdit.attendanceEditBeforeState }" --%>
		                              readonly
		                            />
		                          </div>
						</div>
						
						<div class="form-group form-inline">
		                           	<label
		                            for="attendanceEditBeforeTimeMo"
		                            class="col-md-3 col-form-label"
		                            >수정전시간</label>
		                 			<div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="attendanceEditBeforeTimeMo"
		                              name="attendanceEditBeforeTime"
		                             <%--  value="${attendanceEdit.attendanceEditBeforeTime }" --%>
		                              readonly
		                            />
		                          </div>
		                </div>
		              	<div class="form-group form-inline">
		                          	<label
		                            for="attendanceEditStartEndMo"
		                            class="col-md-3 col-form-label"
		                            >출근/퇴근</label>
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="attendanceEditStartEndMo"
		                              name="attendanceEditStartEnd"
		                            <%--   value="${attendanceEdit.attendanceEditStartEnd }" --%>
		                              readonly
		                            />
		                          </div>
						</div>            
		                          
		           	<div class="form-group form-inline">
		                          <label
		                            for="attendanceEditAfterTimeMo"
		                            class="col-md-3 col-form-label"
		                            >수정요청시간</label>
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="attendanceEditAfterTimeMo"
		                              name="attendanceEditAfterTime"
		                             <%--  value="${attendanceEdit.attendanceEditAfterTime }" --%>
		                              readonly
		                            />
		                          </div>
		           	</div>
		           
		         <div class="form-group form-inline">
		                          <label
		                            for="attendanceEditAfterStateMo"
		                            class="col-md-3 col-form-label"
		                            >수정후상태</label>
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="attendanceEditAfterStateMo"
		                              name="attendanceEditAfterState"
		                           <%--    value="${attendanceEdit.attendanceEditAfterState }" --%>
		                              readonly
		                            />
		                          </div>
		           	</div>
		           
		           	<div class="form-group form-inline">
		                          <label
		                            for="attendanceEditRequestMo"
		                            class="col-md-3 col-form-label"
		                            >요청사유</label>
		                          <div class="col-md-9 p-0">
		                            <textarea
		                              class="form-control"
		                              id="attendanceEditRequestMo"
		                              name="attendanceEditRequest"
		                             readonly
		                            ><%-- ${attendanceEdit.attendanceEditRequest } --%></textarea>
		                          </div>
		           	</div>
		           	
		           	 	<div class="form-group form-inline">
		                          <label
		                            for="attendanceEditOpinionMo"
		                            class="col-md-3 col-form-label"
		                            >수정의견</label>
		                          <div class="col-md-9 p-0">
		                            <textarea
		                              class="form-control"
		                              id="attendanceEditOpinionMo"
		                              name="attendanceEditOpinion"
		                              readonly
		                            ></textarea>
		                          </div>
		           	</div>

			           	<button
			           		id="approveButton"
						  	type="submit"
						 	class="btn btn-success"
			 				data-color="dark"
						>삭제</button>
			</div>
			</div>
		   </div>
		</form>

		</div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> 

