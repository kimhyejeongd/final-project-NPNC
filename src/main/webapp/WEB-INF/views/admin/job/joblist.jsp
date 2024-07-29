<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
		<br><br><br><br>
		<div>
		   	<h4 class="card-title">직급관리</h4>
		</div>
		<form action="${path }/admin/job/insertjob.do" method="post">
			<div class="form-group">
            		<div class="form-group form-inline">
                          <label
                            for="jobName"
                            class="col-md-3 col-form-label"
                            >직급등록</label
                          >
                          <div class="col-md-9 p-0" style="display:flex">
                            <input
                              type="text"
                              class="form-control input-full"
                              id="jobName"
                              name="jobName"
                              placeholder="직급명"
                            />
                             &ensp;&ensp;&ensp;
							<input type="submit" value="등록" class="btn btn-dark btn-round" data-color="dark">
                          </div>
               		</div>	 				
			</div>
		</form>
	<div class="col-md-12">
		<div class="card">
		    <div class="card-body">
		       <div class="table-responsive">
	<table
		id="multi-filter-select"
		class="display table table-striped table-hover"
	>
		<tr>
			<th>직급번호</th>
			<th>직급명</th>
			<th></th>
			<th></th>
		</tr>
		<c:if test="${not empty job}">
			<c:forEach var="j" items="${job}">
				<tr>
					<td>${j.jobKey }</td>
					<td>${j.jobName }</td>
					<td></td>
					<td>
						<button onclick="updateJob('${j.jobKey }','${j.jobName }');" class="btn btn-dark btn-round">수정</button>
						 &ensp;&ensp;&ensp;
						<button onclick="deleteJob('${j.jobKey}');" class="btn btn-dark btn-round">삭제</button>
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
		const updateJob=(key,name)=>{
            let form = document.createElement("form");
            form.setAttribute("method", "post");
            form.setAttribute("action", "${path}/admin/job/updatejob.do");

            let $key = document.createElement("input");
            $key.setAttribute("type", "hidden");
            $key.setAttribute("name", "key");
            $key.setAttribute("value", key);
            
            let names= document.createElement("input");
            names.setAttribute("type", "hidden");
            names.setAttribute("name", "jobName");
            names.setAttribute("value",name );

           
            form.appendChild($key);
            form.appendChild(names);

            document.body.appendChild(form);
            form.submit();
		}
		
		
		const deleteJob=(key)=>{
		   if(confirm("정말 삭제 하시겠습니까?")){
	           let form = document.createElement("form");
	           form.setAttribute("method", "post");
	           form.setAttribute("action", "${path}/admin/job/deletejob.do");
	
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