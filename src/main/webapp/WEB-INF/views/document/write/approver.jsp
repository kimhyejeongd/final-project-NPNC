<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재자 선택</title>
 <style>
    .line-color {
        width: 5px;
        height: 100%;
    }
</style>
</head>
<body>
<c:import url="${path}/WEB-INF/views/common/script_gather.jsp" />
<div class="container">
         <div class="page-inner d-flex justify-content-between mt-4">
           <div class="d-flex align-items-md-center flex-column pt-2 pb-4 w-100">
               <h2 class="fw-bold mb-4">결재자 선택</h2>
           	<div class="row w-100 mx-auto">
            	<!-- 조직도 -->
              <div class="col w-45" style="">
                <div class="card card-round" style="height: 500px;" >
                <div class="card-header">
                   <div class="card-head-row card-tools-still-right">
                      <div class="card-title" id="formfoldername">조직도</div>
                      <div class="card-tools"></div>
                    </div>
                  </div>
                  <div class="p-4 overflow-hidden">
                    <div class="form-group d-flex gap-1 p-0 pb-4">
		                <input type="text" class="form-control" placeholder="이름으로 검색">
		                <button class="btn btn-outline-info btn-sm"><i class="fa fa-search search-icon"></i></button>
		            </div>
                    <div class="card-list p-0 overflow-x-auto m-0 rounded" style="height: 330px;">
	                    <div class="accordion" id="accordionPanelsStayOpenExample">
						<c:forEach var="d" items="${list}" varStatus="status">
							<div class="accordion-item">
							    <h2 class="accordion-header">
							      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse${status.index}" aria-expanded="true" aria-controls="panelsStayOpen-collapse${status.index}">
							        <i class="fas fa-bookmark me-2"></i>${d.departmentName} 
							      </button>
							    </h2>
				    			<div id="panelsStayOpen-collapse${status.index}" class="accordion-collapse collapse show">
							      <div class="accordion-body" style='padding: 0!important;'>
							         <div class="list-group" >
						 				<c:forEach var="memberlist" items="${d.memberlist}">
										  <a href="#" class="list-group-item list-group-item-action align-items-center">&emsp;<i class="fas fa-user me-2"></i><b>${memberlist.memberName}</b>&ensp;${memberlist.jobName}</a>
										  
						  				</c:forEach>
									</div>
							      </div>
							    </div>
							</div>
						</c:forEach>	
					</div> 
                    </div>
                  </div>
                </div>
              </div>
              <div class="row d-flex mx-auto align-items-center justify-content-center align-content-center gap-1" style="max-width: 60px;">
              	<button class="btn btn-sm btn-outline-secondary"><i class="icon-arrow-right"></i></button>
              	<button class="btn btn-sm btn-outline-secondary"><i class="icon-arrow-left"></i></button>
              </div>
				<div class="col w-45" id="formlistdiv">
		               <div class="card card-round" style="height: 500px;" >
		                 <div class="card-header">
		                   <div class="card-head-row card-tools-still-right justify-content-between">
		                      <div class="d-flex gap-1">
			                      <div class="card-title me-2" id="formfoldername">결재 라인</div>
			                      	<button class="btn btn-sm btn-outline-secondary justify-content-center d-flex" style="width: 30px; align-items: center;"><i class="icon-arrow-up"></i></button>
	           						<button class="btn btn-sm btn-outline-secondary justify-content-center d-flex" style="width: 30px; align-items: center;"><i class="icon-arrow-down"></i></button>
			                      </div>
        					  <button class="btn btn-sm btn-info">저장</button>
		                    </div>
		                  </div>
		                 <div class="card-list p-4 " id="selectlist">
		                  <!-- 선택자 출력 -->
			                  <div class="card-list p-0 overflow-x-auto m-0 rounded" style="height: 330px;">
		                    	<div class="accordion" id="accordionPanelsStayOpenExample">
									<div class="accordion-item" style="border: none;">
						    			<div id="panelsStayOpen-collapse${status.index}" class="accordion-collapse collapse show">
									      <div class="accordion-body" style='padding: 0!important;'>
									         <div class="list-group d-flex" >
									         <!-- 선택항목 들어가는 위치 -->
									         	<a href="#" class="border rounded list-group-item list-group-item-action align-items-center justify-content-between">
									         		<div>
									         			<span class="badge rounded-pill text-bg-secondary me-2 ms-0">1</span><i class="fas fa-user me-2 "></i><b>차은우</b>&ensp;팀장
							         				</div>
								         			<select class="form-select w-25" id="exampleFormControlSelect1">
							                            <option>검토</option>
							                            <option>결재</option>
							                            <option>전결</option>
							                            <option>후결</option>
							                          </select>
							         			</a>
									         	<a href="#" class="border rounded list-group-item list-group-item-action align-items-center justify-content-between">
									         		<div>
									         			<span class="badge rounded-pill text-bg-secondary me-2 ms-0">2</span><i class="fas fa-user me-2 "></i><b>박진형</b>&ensp;대표 이사
							         				</div>
								         			<select class="form-select w-25" id="exampleFormControlSelect1">
							                            <option>검토</option>
							                            <option>결재</option>
							                            <option>전결</option>
							                            <option>후결</option>
							                          </select>
							         			</a>
											</div>
									      </div>
									    </div>
									</div>
								</div> 
	                   		</div>
		                 </div>
		               </div>
		          </div>	
			</div>
		<div class="card card-round w-100">
			<div class="card-header">
                   <div class="card-head-row card-tools-still-right">
                      <div class="card-title" id="formfoldername">저장된 결재라인</div>
                      <div class="card-tools"></div>
			            <button class="btn btn-sm btn-info">새로고침</button>
                   </div>
            </div>
	        <div class="d-flex flex-wrap card-body row row-cols-auto gap-1 w-100 mx-auto">
			    <c:forEach var="i" begin="1" end="9" step="1">
			        <div class="d-flex align-items-center justify-content-between col p-2" style="min-width: 400px;">
			            <div class="d-flex border card-body justify-content-between flex-fill rounded">
			                <div class="d-flex gap-1 align-items-center">
			                    <div class="line-color me-2"></div>
			                    결재라인 ${i}
			                </div>
			                <button class="btn btn-sm btn-outline-secondary ml-2">불러오기</button>
			            </div>
			        </div>
			    </c:forEach>
			</div>
		</div>
    	<div class="d-flex justify-content-end gap-2">
	        <button class="btn btn-primary">적용</button>
	        <button class="btn btn-outline-primary">취소</button>
	    </div>
	</div>
	</div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const colors = ['#ea1010', '#FF8C00', '#ffec21', '#619931', '#3a80db', '#4B0082', '#8B008B'];
        const lines = document.querySelectorAll('.line-color');
        lines.forEach((line, index) => {
            line.style.backgroundColor = colors[index % colors.length];
        });
    });
</script>
</body>
</html>