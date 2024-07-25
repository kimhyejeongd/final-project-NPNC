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
	<%@ include file="/WEB-INF/views/common/script_gather.jsp" %>

	<div class="accordion">
			<c:forEach var="d" items="${list}" varStatus="status">
			
				<div class="accordion-item">
				    <h2 class="accordion-header">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse${status.index}" aria-expanded="true" aria-controls="panelsStayOpen-collapse${status.index}">
				     
				      
				        ${d.departmentName} 
				      </button>
				    </h2>
	    			<div id="panelsStayOpen-collapse${status.index}" class="accordion-collapse collapse">
				      <div class="accordion-body" style='padding: 0!important;'>
				         <div class="list-group" >
			 				<c:forEach var="memberlist" items="${d.memberlist}">
			 				
								  <a href="#" class="list-group-item list-group-item-action"><span class="status-dot" id="status-dot-${memberlist.memberId}"></span> &emsp;${memberlist.memberName} &nbsp; ${memberlist.jobName} 
								
								   </a>
			 					
							
			  				</c:forEach>
						</div>
				      </div>
				    </div>
				</div>
			
			
			</c:forEach>	
			

			
		</div> 
</body>
</html>