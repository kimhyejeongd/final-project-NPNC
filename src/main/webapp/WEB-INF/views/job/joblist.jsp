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
		<form action="${path }/job/insertjobend.do" method="post">
			직급코드<input type="text" name="jobKey">
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
						<button onclick="">수정</button>
					</td>
					<td>
						<button onclick="">삭제</button>
					</td>
					
				</tr>
			</c:forEach>
		</c:if>
		
	</table>
	<script>
		const updateJob=()=>{
			
		}
	</script>
</body>
</html>