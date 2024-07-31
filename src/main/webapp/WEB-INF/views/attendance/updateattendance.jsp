<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>	    
<div class="modal fade" id="updateAttendanceModal" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="formModalLabel">사원 수정</h5>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
        <div class="modal-body">
		<form action="${path}/attendance/updateAttendanceEnd" method="post">
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
									  value="${attendance.member.memberId}"
		                              placeholder="작성자"
		                              readonly
		                            />
		                          </div>
		           	</div>
		           	
		           	<input type="hidden" id="attendanceKey" name="attendanceKey" value="${attendance.attendanceKey }">
		           	
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
									  value="${today }"
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
									  value="${attendance.attendanceDate }"
		                              placeholder="수정요청일"
		                              readonly
		                            />
		                          </div>
		           	</div>
		           	
		                          <div class="col-md-9 p-0">
		                          	<label
		                            for="attendanceEditBeforeState"
		                            class="col-md-3 col-form-label"
		                            >수정전상태</label>
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="attendanceEditBeforeState"
		                              name="attendanceEditBeforeState"
		                              value="${attendance.attendanceState }"
		                              readonly
		                            />

		                           	<label
		                            for="attendanceEditBeforeTime"
		                            class="col-md-3 col-form-label"
		                            >수정전시간</label>
		                 
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="attendanceEditBeforeTime"
		                              name="attendanceEditBeforeTime"
		                              value="${attendance.attendanceStart }"
		                              readonly
		                            />
		                            ~
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="attendanceEditBeforeTimeEnd"
		                              name="attendanceEditBeforeTimeEnd"
		                              value="${attendance.attendanceEnd }"
		                              readonly
		                            />
		                          </div>
		                          
		              	<div class="form-group">
		                          <label>출근/퇴근/휴가</label><br />
		                          <div class="d-flex">
		                            <div class="form-check">
		                              <input
		                                class="form-check-input"
		                                type="radio"
		                                name="attendanceEditStartEnd"
		                                id="attendanceEditStartEnd"
		                                value="출근"
		                                required
		                              />
		                              <label
		                                class="form-check-label"
		                                for="attendanceEditStartEnd"
		                              >
		                                출근
		                              </label>
		                            </div>
		                            <div class="form-check">
		                              <input
		                                class="form-check-input"
		                                type="radio"
		                                name="attendanceEditStartEnd"
		                                id="attendanceEditStartEnd2"
		                                value="퇴근"
		                                required
		                              />
		                              <label
		                                class="form-check-label"
		                                for="attendanceEditStartEnd2"
		                              >
		                                퇴근
		                              </label>
		                            </div>
		                            <div class="form-check">
		                              <input
		                                class="form-check-input"
		                                type="radio"
		                                name="attendanceEditStartEnd"
		                                id="attendanceEditStartEnd3"
		                                value="휴가"
		                                required
		                              />
		                              <label
		                                class="form-check-label"
		                                for="attendanceEditStartEnd3"
		                              >
		                                휴가
		                              </label>
		                            </div>
		                          </div>
		           	 </div>              
		                          
		           	<div class="form-group form-inline">
		                          <label
		                            for="attendanceEditAfterTime"
		                            class="col-md-3 col-form-label"
		                            >수정요청시간</label>
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="time"
		                              class="form-control input-full"
		                              id="attendanceEditAfterTime"
		                              name="attendanceEditAfterTime"
		                              placeholder="수정요청시간"
		                            />
		                          </div>
		           	</div>
		           
		           <div class="form-group">
		                          <label for="attendanceEditAfterState"
		                            >수정후상태</label
		                          >
		                          <select
		                            class="form-select"
		                            id="attendanceEditAfterState"
		                            name="attendanceEditAfterState"
		                            required
		                          >
								  		<option value="출근" >출근</option>
								        <option value="지각" >지각</option>
								        <option value="조퇴" >조퇴</option>
								        <option value="결근" >결근</option>
								        <option value="휴가" >휴가</option>
								        <option value="유급휴가">유급휴가</option>
		                          </select>
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
		                              placeholder="요청사유"
		                              required
		                            ></textarea>
		                          </div>
		           	</div>
		           	<button
					  	type="submit"
					 	class="btn btn-success"
		 				data-color="dark"
					>신청</button>
			</div>
		</form>
		</div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> 