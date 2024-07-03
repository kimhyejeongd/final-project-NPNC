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
	<div>
		<div class="col-md-12">
		                <div class="card">
		                  <div class="card-header">
		                    <h4 class="card-title">Multi Filter Select</h4>
		                  </div>
		                  <div class="card-body">
		                    <div class="table-responsive">
		                      <table
		                        id="multi-filter-select"
		                        class="display table table-striped table-hover"
		                      >
		                        <thead>
		                          <tr>
		                            <th>Name</th>
		                            <th>Position</th>
		                            <th>Office</th>
		                            <th>Age</th>
		                            <th>Start date</th>
		                            <th>Salary</th>
		                          </tr>
		                        </thead>
		                        <tbody>	
		                          <tr>
		                            <td>Tiger Nixon</td>
		                            <td>System Architect</td>
		                            <td>Edinburgh</td>
		                            <td>61</td>
		                            <td>2011/04/25</td>
		                            <td>$320,800</td>
		                          </tr>
		                          <tr>
		                            <td>Garrett Winters</td>
		                            <td>Accountant</td>
		                            <td>Tokyo</td>
		                            <td>63</td>
		                            <td>2011/07/25</td>
		                            <td>$170,750</td>
		                          </tr>
		                        </tbody>
		                      </table>
		                    </div>
					  <button>등록</button>
		                  </div>
		                </div>
		              </div>
			</div>
</body>
</html>