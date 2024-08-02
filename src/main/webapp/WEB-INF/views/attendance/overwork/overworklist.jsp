<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%@ include file="/WEB-INF/views/attendance/attendanceSidebar.jsp" %> 
 	<div class="main-panel">
		<div>
		<%@ include file="/WEB-INF/views/common/header_bar.jsp" %> 	
			<div class="col-md-12">
			                <div class="card">
			                  <div class="card-header">
			                  <br><br><br><br>
			                    <h4 class="card-title">초과근무신청목록</h4>
			                  </div>
			                  <div class="card-body">
			                  	    
							 <nav
								class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
							 >   
					              <select class="form-select input-fixed" id="searchType" name="searchType">
					              	<option></option>
					              	<option value="대기">대기</option>
					              	<option value="승인">승인</option>
					              </select>     
				               </nav>		
                  
			                  
			                    <div class="table-responsive">
			                      <table
			                        id="multi-filter-select"
			                        class="display table table-striped table-hover"
			                      >
			                        <thead>
			                          <tr>
			                            <th>번호</th>
			                            <th>신청일시</th>
			                            <th>추가근무날짜</th>
			                            <th>시작시각</th>
			                            <th>종료시각</th>
			                            <th>신청사유</th>
			                            <th>상태</th>
			                          </tr>
			                        </thead>
			                        <tbody>	
			                         <c:if test="${not empty overtimework}">
			                        	 <c:forEach var="otw" items="${overtimework }"> 
					                          <tr>
					                            <td>${otw.overtimeKey}</td>
					                            <td>${otw.overtimeApplyDate}</td>
					                            <td>${otw.overtimeDate }</td>
					                            <td>${fn:substring(otw.overtimeStartTime, 11, 19)}</td>
					                            <td>${fn:substring(otw.overtimeEndTime, 11, 19)}</td>        
					                            <td>${otw.overtimeReason}</td>
					                            <td>${otw.overtimeStatus}</td>
					                          </tr>
				                         </c:forEach> 
			                         </c:if> 
			                         <c:if test="${empty overtimework}">
			                         	<tr>
			                         		<td><h3>등록된 추가근무가 없습니다.</h3></td>
			                         	</tr>
			                         </c:if>
			                         
			                        </tbody>
			                      </table>
			              		 <div>${pagebar}</div> 
			                </div>
			              </div>
				</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/common/footer.jsp" %> 	
			
	</div>
	

	
			
		<script>
			
			
 			document.getElementById("searchType").addEventListener("change",e=>{
				console.log("맞냐");
				const searchType = e.currentTarget.value;
				fetch("${path}/overwork/searchoverworkByMemberKey?searchType=" + searchType)
				.then(response => response.text())
				.then(data => {
					document.querySelector("div[class='table-responsive']").innerHTML = data;
				})
				
			});		 
			
		 	   /*  location.assign('${path}/attendance/searchAttendanceEdit?cPage=' + pageNo + '&searchType=${searchT}'); */
		 	   
			  function fn_paging(pageNo) {
		 	    console.log('오긴왔냐?');
		 	    var searchType= document.getElementById("searchType").value;
			 	   $.ajax({
			            url: '${path}/overwork/searchoverworkByMemberKey', // 서버의 실제 엔드포인트로 대체
			            type: 'GET',
			            data: { cPage: pageNo ,searchType : searchType},
			            dataType: 'text', // 서버 응답을 JSON으로 처리
			            success: function(data) {
	
			                document.querySelector("div[class='table-responsive']").innerHTML = data;
	
			            },
			            error: function(xhr, status, error) {
			                console.error("AJAX Error: ", status, error);
			            }
			        });
			    }
 
		 	 

 				const attendanceEditDetail=(key)=> {
					 let form = document.createElement("form");
			            form.setAttribute("method", "post");
			            form.setAttribute("action", "${path}/attendance/attendanceEditDetail");

			            let $key = document.createElement("input");
			            $key.setAttribute("type", "hidden");
			            $key.setAttribute("name", "attendanceEditKey");
			            $key.setAttribute("value", key);

			            form.appendChild($key);

			            document.body.appendChild(form);
			            form.submit();
				} 
 				</script>

</body>
</html>