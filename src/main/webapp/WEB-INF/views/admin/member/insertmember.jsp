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
		<form action="${path}/admin/member/insertmemberend.do">
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
                              placeholder="핸드폰번호"
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
	                            />
	                          </div>
               			</div>
               		</div>
               		
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
                                checked
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
                            name="department"
                          >
                            <option value="">경영지원팀</option>
                            <option value="">인사/총무팀</option>
                            <option value="">고객지원팀</option>
                            <option value="">기술지원팀</option>
                            <option value="">영업팀</option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="job"
                            >직급</label
                          >
                          <select
                            class="form-select"
                            id="job"
                            name="job"
                          >
                            <option value="">대표이사</option>
                            <option value="">팀장</option>
                            <option value="">대리</option>
                            <option value="">사원</option>
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
                            <option value="">재직</option>
                            <option value="">휴직</option>
                            <option value="">퇴사</option>
                          </select>
                        </div>
 
                       <div class="form-group">
                          <label class="form-label">권한</label>
                          <div class="selectgroup selectgroup-pills">
                            <label class="selectgroup-item">
                              <input
                                type="checkbox"
                                name="value"
                                value=""
                                class="selectgroup-input"
                                checked=""
                              />
                              <span class="selectgroup-button">인사</span>
                            </label>
                            <label class="selectgroup-item">
                              <input
                                type="checkbox"
                                name="value"
                                value="CSS"
                                class="selectgroup-input"
                              />
                              <span class="selectgroup-button">결재</span>
                            </label>
                            <label class="selectgroup-item">
                              <input
                                type="checkbox"
                                name="value"
                                value="PHP"
                                class="selectgroup-input"
                              />
                              <span class="selectgroup-button">관리자</span>
                            </label>
                            <label class="selectgroup-item">
                              <input
                                type="checkbox"
                                name="value"
                                value="JavaScript"
                                class="selectgroup-input"
                              />
                              <span class="selectgroup-button">사원</span>
                            </label>
                          </div>
                        </div>
                          <button
			                  type="submit"
			                  class="btn btn-success"
			                  data-color="dark"
			                >등록</button>
                      </div>
            
           </div>
          </div>
 
		</form>
		
		
</body>
</html>