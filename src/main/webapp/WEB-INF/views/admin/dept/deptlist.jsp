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
	<div>	
		<form action="${path }/admin/dept/insertdept.do" method="post">
			부서명<input type="text" name="deptName">
			<input type="submit" value="등록">
		</form>
	</div>
	<table>
		<tr>
			<th>부서코드</th>
			<th>부서명</th>
		</tr>
		<c:if test="${not empty dept}">
			<c:forEach var="d" items="${dept}">
				<tr>
					<td>${d.deptKey }</td>
					<td>${d.deptName }</td>
					<td>
						<button onclick="updateDept('${d.deptKey }','${d.deptName }');">수정</button>
					</td>
					<td>
						<button onclick="deleteDept('${d.deptKey}');">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</c:if>
		
	</table>
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