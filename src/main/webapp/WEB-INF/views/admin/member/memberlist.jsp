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
	<table
	                      class="table table-bordered table-head-bg-info table-bordered-bd-info mt-4"
	                    >
	                      <thead>
	                        <tr>
	                          <th scope="col">#</th>
	                          <th scope="col">First</th>
	                          <th scope="col">Last</th>
	                          <th scope="col">Handle</th>
	                        </tr>
	                      </thead>
	                      <tbody>
	                        <tr>
	                          <td>1</td>
	                          <td>Mark</td>
	                          <td>Otto</td>
	                          <td>@mdo</td>
	                        </tr>
	                        <tr>
	                          <td>2</td>
	                          <td>Jacob</td>
	                          <td>Thornton</td>
	                          <td>@fat</td>
	                        </tr>
	                        <tr>
	                          <td>3</td>
	                          <td colspan="2">Larry the Bird</td>
	                          <td>@twitter</td>
	                        </tr>
	                      </tbody>
	                    </table>
</body>
</html>