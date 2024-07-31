<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<div class="modal fade" id="updateformModal" tabindex="-1" aria-labelledby="formModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="formModalLabel">사원 수정</h5>
	          <button type="button" class="close" data-dismiss="updatemodal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
        <div class="modal-body">
			<form action="${path}/admin/member/updatememberend.do" method="post">
				 <div class="container">
		          <div class="page-inner">
		            	<div class="form-group">
							<div class="form-group form-inline">
		                          <label
		                            for="memberIdup"
		                            class="col-md-3 col-form-label"
		                            >아이디</label
		                          >
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="memberIdup"
		                              name="memberId"
									  <%-- value="${member.memberId}" --%>
		                              placeholder="아이디"
									  readonly
		                            />
		                          </div>
		               		</div>	
		            		<div class="form-group form-inline">
		                          <label
		                            for="memberNameup"
		                            class="col-md-3 col-form-label"
		                            >이름</label
		                          >
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="memberNameup"
		                              name="memberName"
									  value="${member.memberName}"
		                              placeholder="이름"
		                            />
		                          </div>
		               		</div>
		               		<div class="form-group form-inline">
		                          <label
		                            for="memberAddressup"
		                            class="col-md-3 col-form-label"
		                            >주소</label
		                          >
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="memberAddressup"
		                              name="memberAddress"
									  value="${member.memberAddress}"
		                              placeholder="주소"
		                            />
		                          </div>
		               		</div>
		               		<div class="form-group form-inline">
		                          <label
		                            for="memberPhoneup"
		                            class="col-md-3 col-form-label"
		                            >핸드폰</label
		                          >
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="memberPhoneup"
		                              name="memberPhone"
									  value="${member.memberPhone}"
		                              placeholder="핸드폰번호"
		                            />
		                          </div>
		               		</div>
		               		<div class="form-group form-inline">
		                          <label
		                            for="memberTellup"
		                            class="col-md-3 col-form-label"
		                            >사내번호</label
		                          >
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="memberTellup"
		                              name="memberTell"
									  value="${member.memberTell}"
		                              placeholder="사내번호 예)845-0000"
		                            />
		                          </div>
		               		</div>
								<div class="form-group">
		                          <label for="memberEmailup">Email Address</label>
		                          <input
		                            type="email"
		                            class="form-control"
		                            id="memberEmailup"
		                            name="memberEmail"
									value="${member.memberEmail}"
		                            placeholder="Enter Email"
		                          />
		                        </div>
		                        
		               		<div class="form-group">
			            		<div class="form-group form-inline">
			                          <label
			                            for="memberEnrollDateup"
			                            class="col-md-3 col-form-label"
			                            >입사일</label
			                          >
			                          <div class="col-md-9 p-0">
			                            <input
			                              type="date"
			                              class="form-control input-full"
			                              id="memberEnrollDateup"
			                              name="memberEnrollDate"
										  value="${member.memberEnrollDate}"
			                            />
			                          </div>
		               			</div>
		               		</div>
		               		
							<%-- <c:if test="${member.memberState eq '퇴사'}"> --%>
			               		<div class="form-group">
				            		<div class="form-group form-inline">
				                          <label
				                            for="memberLeaveDateup"
				                            class="col-md-3 col-form-label"
				                            >퇴사일</label
				                          >
				                          <div class="col-md-9 p-0">
				                            <input
				                              type="date"
				                              class="form-control input-full"
				                              id="memberLeaveDateup"
				                              name="memberLeaveDate"
				                              value="0001-01-01"
											  readonly
				                            />
				                          </div>
			               			</div>
			               		</div>
		               		<%-- </c:if> --%>
		               		<div class="form-group">
			            		<div class="form-group form-inline">
			                          <label
			                            for="memberBirthdateup"
			                            class="col-md-3 col-form-label"
			                            >생년월일</label
			                          >
			                          <div class="col-md-9 p-0">
			                            <input
			                              type="date"
			                              class="form-control input-full"
			                              id="memberBirthdateup"
			                              name="memberBirthdate"
										  value="${member.memberBirthdate}"
			                            />
			                          </div>
		               			</div>
		               		</div>
		                        
		                         <div class="form-group">
		                          <label>Gender</label><br />
		                          <div class="d-flex">
		                            <div class="form-check">
		                              <label
		                                class="form-check-label"
		                                for="memberGenderup"
		                              >
		                                남
		                              </label>
		                              <input
		                                class="form-check-input"
		                                type="radio"
		                                name="memberGender"
		                                id="memberGenderup"
		                                value="M"
										<c:if test="${member.memberGender eq 'M'}">checked</c:if>
		                              />

		                            </div>
		                            <div class="form-check">
		                              <label
		                                class="form-check-label"
		                                for="memberGender2up"
		                              >
		                                여
		                              </label>
		                              <input
		                                class="form-check-input"
		                                type="radio"
		                                name="memberGender"
		                                id="memberGender2up"
		                                value="F"
										<c:if test="${member.memberGender eq 'F'}">checked</c:if>
		                              />

		                            </div>
		                          </div>
		                        </div>
		                        
		                         <div class="form-group">
		                          <label for="departmentup"
		                            >부서</label
		                          >
		                          <select
		                            class="form-select"
		                            id="departmentup"
		                            name="deptKey"
		                          >
			                          <c:if test="${not empty dept}">
			                          	<c:forEach var="d" items="${dept }">
			                            <option value="${d.deptKey}" <c:if test="${member.department.deptKey eq d.deptKey}">selected</c:if>>${d.deptName }</option>
			                            </c:forEach>
			                           </c:if>
			                           <c:if test="${empty dept}">
			                            <option value="">select</option>
			                           </c:if>
		                          </select>
		                          
		                          
		                        </div>
		                        <div class="form-group">
		                          <label for="jobup"
		                            >직급</label
		                          >
		                          <select
		                            class="form-select"
		                            id="jobup"
		                            name="jobKey"
		                          >
		                            <c:if test="${not empty job}">
			                          	<c:forEach var="j" items="${job }">
			                            <option value="${j.jobKey }" <c:if test="${member.job.jobKey eq j.jobKey}">selected</c:if>>${j.jobName }</option>
			                            </c:forEach>
			                           </c:if>
			                           <c:if test="${empty job}">
			                            <option value="">select</option>
			                           </c:if>
		                          </select>
		                        </div>
		                        <div class="form-group">
		                          <label for="memberStateup"
		                            >현황</label
		                          >
		                          <select
		                            class="form-select"
		                            id="memberStateup"
		                            name="memberState"
		                            onchange="toggleReadOnly(this)"
		                          >
								  		<option value="재직" <c:if test="${member.memberState eq '재직'}">selected</c:if>>재직</option>
								        <option value="휴직" <c:if test="${member.memberState eq '휴직'}">selected</c:if>>휴직</option>
								        <option value="퇴사" <c:if test="${member.memberState eq '퇴사'}">selected</c:if>>퇴사</option>
		                          </select>
		                        </div>
		 
		                       <div class="form-group">
		                          <label class="form-label">권한</label>
		                          <div class="selectgroup selectgroup-pills">
		                            <label class="selectgroup-item">
		                              <input
		                                type="checkbox"
		                                name="accessKey"
		                                value="1"
		                                class="selectgroup-input"
										<c:if test="${member.accessKey == 1}">checked</c:if>
		                              />
		                              <span class="selectgroup-button">관리자</span>
		                            </label>
		                            <label class="selectgroup-item">
		                              <input
		                                type="checkbox"
		                                name="accessKey"
		                                value="2"
		                                class="selectgroup-input"
										<c:if test="${member.accessKey == 2}">checked</c:if>
		                              />
		                              <span class="selectgroup-button">사원</span>
		                            </label>
		                            <label class="selectgroup-item">
		                              <input
		                                type="checkbox"
		                                name="accessKey"
		                                value="3"
		                                class="selectgroup-input"
										<c:if test="${member.accessKey == 3}">checked</c:if>
		                              />
		                              <span class="selectgroup-button">인사</span>
		                            </label>
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