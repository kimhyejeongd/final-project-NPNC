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
		<form action="${path}/admin/member/updatememberend.do" method="post">
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
		           	
		           	<div class="form-group">
		                          <label>Gender</label><br />
		                          <div class="d-flex">
		                            <div class="form-check">
		                              <input
		                                class="form-check-input"
		                                type="radio"
		                                name="attendanceEditStartEnd"
		                                id="attendanceEditStartEnd"
		                                value="출근"
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

		                              />
		                              <label
		                                class="form-check-label"
		                                for="attendanceEditStartEnd2"
		                              >
		                                퇴근
		                              </label>
		                            </div>
		                          </div>
		                        </div>
		           	<div id="attendanceEditBefore">
		           		
		           	</div>
		           	
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="hidden"
		                              class="form-control input-full"
		                              id="attendanceEditBeforeTime"
		                              name="attendanceEditBeforeTime"
									  value='<c:if test=""></c:if>'
		                              readonly
		                            />
		                          </div>
		           	
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="hidden"
		                              class="form-control input-full"
		                              id="attendanceEditBeforeState"
		                              name="attendanceEditBeforeState"
		                              value="${attendance.attendanceState }"
		                              readonly
		                            />
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
									  value=""
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
		                          >
								  		<option value="출근" >출근</option>
								        <option value="지각" >지각</option>
								        <option value="조퇴" >조퇴</option>
								        <option value="결근" >결근</option>
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
		                            ></textarea>
		                          </div>
		           	</div>

			</div>
		
		
		
		</form>

</body>
</html>