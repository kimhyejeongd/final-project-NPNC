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
	
 	<%@ include file="/WEB-INF/views/admin/adminsidebar.jsp" %> 
 	<div class="main-panel">
 	<%@ include file="/WEB-INF/views/common/header_bar.jsp" %> 	

		<div>	
			<br><br><br><br>
		    <div>
		   		<h4 class="card-title">전체사원관리</h4>
			</div>
			<br>
		<div class="col-md-12">
		                <div class="card">
		                  <div class="card-body">
		                  <form action="${path }/admin/member/searchMember">
		                   <nav
					        class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
					       >
<!-- 					              <select class="form-select input-fixed" name="" >
					              	<option>1</option>
					              	<option>2</option>
					              	<option>3</option>
					              </select> -->
		                          <div class="input-group">
				                    <div class="input-group-prepend">
				                      <button type="submit" class="btn btn-search pe-1">
				                        <i class="fa fa-search search-icon"></i>
				                      </button>
				                    </div>
				                    <input
				                      type="text"
				                      id="searchKey"
				                      name="searchKey"
				                      placeholder="Search name..."
				                      class="form-control"
				                    />
				                  </div>          
				               </nav>
				              </form>
				              
		                    <div class="table-responsive">
		                      <table
		                        id="multi-filter-select"
		                        class="display table table-striped table-hover"
		                      >
		                        <thead>
		                          <tr>
		                            <th>아이디</th>
		                            <th>이름</th>
		                            <th>부서</th>
		                            <th>직급</th>
		                            <th>사내번호</th>
		                            <th>근속상태</th>
		                          </tr>
		                        </thead>
		                        <tbody>	
		                        <c:if test="${not empty members }">
		                        	<c:forEach var="m" items="${members }">		                 
				                          <tr>
				                            <td>${m.memberId }</td>
				                            <td>${m.memberName }</td>
				                            <td>${m.department.deptName }</td>
				                            <td>${m.job.jobName }</td>
				                            <td>${m.memberTell }</td>
				                            <td>${m.memberState }</td>
				                            <td>
				                            	<button onclick="updateMember('${m.memberKey}');" class="btn btn-dark btn-round">수정</button>
				                            	 &ensp;&ensp;&ensp;
				                            	<button onclick="deleteMember('${m.memberKey}');" class="btn btn-dark btn-round">삭제</button>
				                            </td>
				                          </tr>
			                        </c:forEach>
		                         </c:if>
		                         <c:if test="${empty members }">
		                         	<tr>
		                         		<td><h3>등록된 사원이 없습니다.</h3></td>
		                         	</tr>
		                         	
		                         </c:if>
		                         
		                        </tbody>
		                      </table>
		                    </div>
					  			<button onclick="location.assign('${path}/admin/member/insertmember.do')" class="btn btn-success btn-round" >등록</button>
		                  </div>
		              		<div>${pagebar}</div>
		                </div>
		              </div>
			</div>
				<%@ include file="/WEB-INF/views/common/footer.jsp" %> 	
			</div>
			<script>
				
				const updateMember=(key)=>{
				            let form = document.createElement("form");
				            form.setAttribute("method", "post");
				            form.setAttribute("action", "${path}/admin/member/updatemember.do");

				            let $key = document.createElement("input");
				            $key.setAttribute("type", "hidden");
				            $key.setAttribute("name", "memberKey");
				            $key.setAttribute("value", key);

				            form.appendChild($key);

				            document.body.appendChild(form);
				            form.submit();
						}
				
				
			
				const deleteMember=(key)=>{
					   if(confirm("정말 삭제 하시겠습니까?")){
				           let form = document.createElement("form");
				           form.setAttribute("method", "post");
				           form.setAttribute("action", "${path}/admin/member/deletemember.do");
				
				           let $key = document.createElement("input");
				           $key.setAttribute("type", "hidden");
				           $key.setAttribute("name", "memberKey");
				           $key.setAttribute("value", key);
				 
				           form.appendChild($key);
				
				
				           document.body.appendChild(form);
				           form.submit();
					   }else{
						   alert("삭제가 취소되었습니다.");
					   }
					   
					}

			
			</script>
			
			
</body>
</html>