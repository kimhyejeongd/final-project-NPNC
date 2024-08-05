<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<div class="modal fade" id="adminAttendanceformModal" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="formModalLabel">근태 수정</h5>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
        <div class="modal-body">
			<form  id="attendanceForm" action="${path}/admin/attendance/updateAdminAttendance" method="post">
				<div class="container">
         		 <div class="page-inner">
				<div class="form-group">
					<div class="form-group form-inline">
		                          <label
		                            for="attendanceMember"
		                            class="col-md-3 col-form-label"
		                            >ID</label>
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="attendanceMember"		                             
									<%--   value="${attendanceEdit.attendanceEditMember}" --%>
		                              placeholder="작성자"
		                              readonly
		                            />
		                          </div>
		           	</div>
		           	
		           	<input type="hidden" id="attendanceKeyUp" name="attendanceKey">
		           	
		           	<div class="form-group form-inline">
		                          <label
		                            for="attendanceDateUp"
		                            class="col-md-3 col-form-label"
		                            >근무날짜</label>
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="date"
		                              class="form-control input-full"
		                              id="attendanceDateUp"
		                              name="attendanceDate"
									 <%--  value="${attendanceEdit.attendanceEditDate }" --%>
		                              placeholder="근무날짜"
		                              readonly
		                            />
		                          </div>
		           	</div>
		           	
		           	<div class="form-group form-inline">
		                          <label
		                            for="attendanceStartUp"
		                            class="col-md-3 col-form-label"
		                            >출근시간</label>
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="time"
		                              class="form-control input-full"
		                              id="attendanceStartUp"
		                              name="attendanceStart"
									 <%--  value="${attendanceEdit.attendanceEditRequestDate }" --%>
		                              placeholder="출근시간"
		                              
		                            />
		                          </div>
		           	</div>
		           	
		           		<div class="form-group form-inline">
		                          	<label
		                            for="attendanceEndUp"
		                            class="col-md-3 col-form-label"
		                            >퇴근시간</label>
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="time"
		                              class="form-control input-full"
		                              id="attendanceEndUp"
		                              name="attendanceEnd"
		                              <%-- value="${attendanceEdit.attendanceEditBeforeState }" --%>
		                              
		                            />
		                          </div>
						</div>
						
						<div class="form-group form-inline">
		                           	<label
		                            for="attendanceStateUp"
		                            class="col-md-3 col-form-label"
		                            >상태</label>
		                 			<div class="col-md-9 p-0">
		  <%--                           <input
		                              type="text"
		                              class="form-control input-full"
		                              id="attendanceStateUp"
		                              name="attendanceState"
		                              value="${attendanceEdit.attendanceEditBeforeTime }"
		                              
		                            /> --%>
		                             <select
		                            class="form-select"
		                            id="attendanceStateUp"
		                            name="attendanceState"
		                          	>
								  		<option value="출근" >출근</option>
								        <option value="지각" >지각</option>
								        <option value="조퇴" >조퇴</option>
								        <option value="결근" >결근</option>
								        <option value="휴가" >휴가</option>
								        <option value="병가" >병가</option>
						              	<option value="공가" >공가</option>
						              	<option value="오전반차" >오전반차</option>
						              	<option value="오후반차">오후반차</option>
		                          </select>
		                          </div>
		                </div> 		
		          	
			           	<button
						  	type="submit"
						 	class="btn btn-success"
			 				data-color="dark"
						>수정</button> 
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

