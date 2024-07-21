<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 	<%@ include file="/WEB-INF/views/admin/adminsidebar.jsp" %> 
    	<div class="main-panel">
    	<%@ include file="/WEB-INF/views/common/header_bar.jsp" %> 	

		<div >	
			<br><br><br><br>
		    <div>
		   		<h4 class="card-title">부서관리</h4>
			</div>
			<form action="${path }/admin/dept/insertdept.do" method="post">
				<div class="form-group">
            		<div class="form-group form-inline">
                          <label
                            for="deptName"
                            class="col-md-3 col-form-label"
                            >부서등록</label
                          >
                          <div class="col-md-9 p-0" style="display:flex">
                            <input
                              type="text"
                              class="form-control input-full"
                              id="deptName"
                              name="deptName"
                              placeholder="부서명"
                            />
                            &ensp;&ensp;&ensp;
							<input type="submit" value="등록" class="btn btn-dark btn-round" data-color="dark">
                          </div>
               		</div>			
			</form>
		</div>
		<div class="col-md-12">
			<div class="card">
		    <div class="card-body">
		     <div class="table-responsive">
			<table
				id="multi-filter-select"
			    class="display table table-striped table-hover"
			>
				<tr>
					<th>부서코드</th>
					<th>부서명</th>
					<th>비고</th>
				</tr>
				<c:if test="${not empty dept}">
					<c:forEach var="d" items="${dept}">
						<tr>
							<td>${d.deptKey }</td>
							<td>${d.deptName }</td>
							<td>
								<button onclick="updateDept('${d.deptKey }','${d.deptName }');" class="btn btn-dark btn-round">수정</button>
								 &ensp;&ensp;&ensp;
								<button onclick="deleteDept('${d.deptKey}');" class="btn btn-dark btn-round">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				
			</table>
		</div>
	   </div>
	  </div>
	 </div>
	 	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 	
	</div>
	
	<script>
		const updateDept=(key,name)=>{
            let form = document.createElement("form");
            form.setAttribute("method", "post");
            form.setAttribute("action", "${path}/admin/dept/updatedept.do");

            let $key = document.createElement("input");
            $key.setAttribute("type", "hidden");
            $key.setAttribute("name", "key");
            $key.setAttribute("value", key);
            
            let names= document.createElement("input");
            names.setAttribute("type", "hidden");
            names.setAttribute("name", "deptName");
            names.setAttribute("value",name );

           
            form.appendChild($key);
            form.appendChild(names);

            document.body.appendChild(form);
            form.submit();
		}
		
		
		const deleteDept=(key)=>{
		   if(confirm("정말 삭제 하시겠습니까?")){
	           let form = document.createElement("form");
	           form.setAttribute("method", "post");
	           form.setAttribute("action", "${path}/admin/dept/deletedept.do");
	
	           let $key = document.createElement("input");
	           $key.setAttribute("type", "hidden");
	           $key.setAttribute("name", "key");
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