<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
		   	<h4 class="card-title">휴가관리</h4>
		</div>
		<form action="${path }/admin/vacation/insertVacation" method="post">
			<div class="form-group">
            		<div class="form-group form-inline">
                          <label
                            for="vacationName"
                            class="col-md-3 col-form-label"
                            >휴가등록(휴가명,연차사용여부)</label
                          >
                          <div class="col-md-9 p-0" style="display:flex">
                            <input
                              type="text"
                              class="form-control input-full"
                              id="vacationName"
                              name="vacationName"
                              placeholder="휴가명"
                            />
                          	&ensp;&ensp;&ensp;
                          	
                          	<div class="p-0" style="display:flex">
	                          	  <div class="form-check">
	                              <label
	                                class="form-check-label"
	                                for="vacationCalcYN"
	                              >
	                                Y
	                              </label>
	                              <input
	                                class="form-check-input"
	                                type="radio"
	                                name="vacationCalcYN"
	                                id="vacationCalcYN"
	                                value="Y"
									required
	                              />
	                            </div>
	                            &ensp;
	                            <div class="form-check">
	                              <label
	                                class="form-check-label"
	                                for="vacationCalcYN2"
	                              >
	                                N
	                              </label>
	                              <input
	                                class="form-check-input"
	                                type="radio"
	                                name="vacationCalcYN"
	                                id="vacationCalcYN2"
	                                value="N"
	                                required
	                              />
	                            </div>
                           </div>
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
			<th>휴가번호</th>
			<th>휴가명</th>
			<th>휴가여부</th>
			<th></th>
		</tr>
		<c:if test="${not empty vacation}">
			<c:forEach var="v" items="${vacation}">
				<tr>
					<td>${v.vacationKey }</td>
					<td>${v.vacationName }</td>
					<td>${v.vacationCalcYN }</td>
					<td>
						<button type="button" class="btn btn-dark btn-round" data-toggle="modal" data-target="#vacationformModal" data-member-key="${v.vacationKey}">
							수정
						</button>
						<button onclick="deleteVacation('${v.vacationKey }');" class="btn btn-dark btn-round">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</c:if>	
	</table>
	    </div>
	   </div>
	  </div>
	 </div>
	 <!-- 수정모달 -->
	 	<%@ include file="/WEB-INF/views/admin/vacation/updatevacationmodal.jsp" %> 	
	 	
	 	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 	
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script>
		
	 $('#vacationformModal').on('show.bs.modal', function (event) {
	        var button = $(event.relatedTarget); // 버튼을 클릭한 요소
	        var vacationKey = button.data('member-key'); // `data-member-key` 속성 값
	        
	        // AJAX 요청으로 memberKey를 사용해 서버로부터 데이터를 가져오는 경우
	        // 여기에서는 예를 들어 jQuery AJAX 요청을 사용합니다.
	        $.ajax({
	            url: '${path}/admin/vacation/updateVacation', // 서버의 실제 엔드포인트로 대체
	            type: 'GET',
	            data: { vacationKey: vacationKey },
	            dataType: 'json', // 서버 응답을 JSON으로 처리
	            success: function(data) {
	                console.log(data); // 전체 응답을 확인
	                console.log(data.vacation.vacationName);
	                
	                $('#vacationNameMo').val(data.vacation.vacationName);
	                $('#vacationKeyMo').val(data.vacation.vacationKey);

	                // 체크박스 설정
	                if (data.vacation.vacationCalcYN === 'Y') {
	                    $('#vacationCalcYNMo').prop('checked', true);
	                } else if (data.vacation.vacationCalcYN === 'N') {
	                    $('#vacationCalcYN2Mo').prop('checked', true);
	                }

	            },
	            error: function(xhr, status, error) {
	                console.error("AJAX Error: ", status, error);
	            }
	        });
	    });
	
		
		
		const deleteVacation=(key)=>{
		   if(confirm("정말 삭제 하시겠습니까?")){
	           let form = document.createElement("form");
	           form.setAttribute("method", "post");
	           form.setAttribute("action", "${path}/admin/vacation/deleteVacation");
	
	           let $key = document.createElement("input");
	           $key.setAttribute("type", "hidden");
	           $key.setAttribute("name", "vacationKey");
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