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
	<div>	
		<form action="${path }/admin/job/insertjob.do" method="post">
			직급명<input type="text" name="jobName">
			<input type="submit" value="등록">
		</form>
	</div>
	<table>
		<tr>
			<th>직급번호</th>
			<th>직급명</th>
		</tr>
		<c:if test="${not empty job}">
			<c:forEach var="j" items="${job}">
				<tr>
					<td>${j.jobKey }</td>
					<td>${j.jobName }</td>
					<td>
						<button onclick="updateJob('${j.jobKey }','${j.jobName }');">수정</button>
					</td>
					<td>
						<button onclick="deleteJob('${j.jobKey}');">삭제</button>
					</td>
					
				</tr>
			</c:forEach>
		</c:if>
		
	</table>
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