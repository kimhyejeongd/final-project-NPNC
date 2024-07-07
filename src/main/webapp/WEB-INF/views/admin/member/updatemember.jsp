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
				 <div class="container">
		          <div class="page-inner">
		            <div class="page-header">
		              <h3 class="fw-bold mb-3">Forms</h3>
		              <ul class="breadcrumbs mb-3">
		                <li class="nav-home">
		                  <a href="#">
		                    <i class="icon-home"></i>
		                  </a>
		                </li>
		                <li class="separator">
		                  <i class="icon-arrow-right"></i>
		                </li>
		                <li class="nav-item">
		                  <a href="#">Forms</a>
		                </li>
		                <li class="separator">
		                  <i class="icon-arrow-right"></i>
		                </li>
		                <li class="nav-item">
		                  <a href="#">Basic Form</a>
		                </li>
		              </ul>
		            </div>
		            	<div class="form-group">
							<div class="form-group form-inline">
									                          <label
									                            for="memberId"
									                            class="col-md-3 col-form-label"
									                            >아이디</label
									                          >
									                          <div class="col-md-9 p-0">
									                            <input
									                              type="text"
									                              class="form-control input-full"
									                              id="memberId"
									                              name="memberId"
																  value="${member.memberId}"
									                              placeholder="이름"
																  readonly
									                            />
									                          </div>
									               		</div>	
		            		<div class="form-group form-inline">
		                          <label
		                            for="memberName"
		                            class="col-md-3 col-form-label"
		                            >이름</label
		                          >
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="memberName"
		                              name="memberName"
									  value="${member.memberName}"
		                              placeholder="이름"
		                            />
		                          </div>
		               		</div>
		               		<div class="form-group form-inline">
		                          <label
		                            for="memberAddress"
		                            class="col-md-3 col-form-label"
		                            >주소</label
		                          >
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="memberAddress"
		                              name="memberAddress"
									  value="${member.memberAddress}"
		                              placeholder="주소"
		                            />
		                          </div>
		               		</div>
		               		<div class="form-group form-inline">
		                          <label
		                            for="memberPhone"
		                            class="col-md-3 col-form-label"
		                            >핸드폰</label
		                          >
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="memberPhone"
		                              name="memberPhone"
									  value="${member.memberPhone}"
		                              placeholder="핸드폰번호"
		                            />
		                          </div>
		               		</div>
		               		<div class="form-group form-inline">
		                          <label
		                            for="memberTell"
		                            class="col-md-3 col-form-label"
		                            >사내번호</label
		                          >
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="memberTell"
		                              name="memberTell"
									  value="${member.memberTell}"
		                              placeholder="사내번호 예)845-0000"
		                            />
		                          </div>
		               		</div>
								<div class="form-group">
		                          <label for="memberEmail">Email Address</label>
		                          <input
		                            type="email"
		                            class="form-control"
		                            id="memberEmail"
		                            name="memberEmail"
									value="${member.memberEmail}"
		                            placeholder="Enter Email"
		                          />
		                        </div>
		                        
		               		<div class="form-group">
			            		<div class="form-group form-inline">
			                          <label
			                            for="memberEnrollDate"
			                            class="col-md-3 col-form-label"
			                            >입사일</label
			                          >
			                          <div class="col-md-9 p-0">
			                            <input
			                              type="date"
			                              class="form-control input-full"
			                              id="memberEnrollDate"
			                              name="memberEnrollDate"
										  value="${member.memberEnrollDate}"
			                            />
			                          </div>
		               			</div>
		               		</div>
		               		
							<c:if test="${member.memberState eq '퇴사'}">
			               		<div class="form-group">
				            		<div class="form-group form-inline">
				                          <label
				                            for="memberLeaveDate"
				                            class="col-md-3 col-form-label"
				                            >퇴사일</label
				                          >
				                          <div class="col-md-9 p-0">
				                            <input
				                              type="date"
				                              class="form-control input-full"
				                              id="memberLeaveDate"
				                              name="memberLeaveDate"
											  value="0001-01-01"
				                            />
				                          </div>
			               			</div>
			               		</div>
		               		</c:if>
		               		<div class="form-group">
			            		<div class="form-group form-inline">
			                          <label
			                            for="memberBirthdate"
			                            class="col-md-3 col-form-label"
			                            >생년월일</label
			                          >
			                          <div class="col-md-9 p-0">
			                            <input
			                              type="date"
			                              class="form-control input-full"
			                              id="memberBirthdate"
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
		                              <input
		                                class="form-check-input"
		                                type="radio"
		                                name="memberGender"
		                                id="memberGender"
		                                value="M"
										<c:if test="${member.memberGender eq 'M'}">checked</c:if>
		                              />
		                              <label
		                                class="form-check-label"
		                                for="memberGender"
		                              >
		                                남
		                              </label>
		                            </div>
		                            <div class="form-check">
		                              <input
		                                class="form-check-input"
		                                type="radio"
		                                name="memberGender"
		                                id="memberGender2"
		                                value="F"
										<c:if test="${member.memberGender eq 'F'}">checked</c:if>
		                              />
		                              <label
		                                class="form-check-label"
		                                for="memberGender2"
		                              >
		                                여
		                              </label>
		                            </div>
		                          </div>
		                        </div>
		                        
		                         <div class="form-group">
		                          <label for="department"
		                            >부서</label
		                          >
		                          <select
		                            class="form-select"
		                            id="department"
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
		                          <label for="job"
		                            >직급</label
		                          >
		                          <select
		                            class="form-select"
		                            id="job"
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
		                          <label for="memberState"
		                            >현황</label
		                          >
		                          <select
		                            class="form-select"
		                            id="memberState"
		                            name="memberState"
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


</body>
</html>