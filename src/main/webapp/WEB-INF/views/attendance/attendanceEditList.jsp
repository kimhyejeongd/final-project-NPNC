<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%@ include file="/WEB-INF/views/attendance/attendanceSidebar.jsp" %> 
 	<div class="main-panel">
		<div>
		<%@ include file="/WEB-INF/views/common/header_bar.jsp" %> 	
			<div class="col-md-12">
			                <div class="card">
			                  <div class="card-header">
			                  <br><br><br><br>
			                    <h4 class="card-title">수정요청목록</h4>
			                  </div>
			                  <div class="card-body">
			                  	    
							 <nav
								class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
							 >   
					              <select class="form-select input-fixed" id="searchType" name="searchType">
					              	<option></option>
					              	<option value="처리중">처리중</option>
					              	<option value="승인">승인</option>
					              	<option value="반려">반려</option>
					              </select>     
				               </nav>		
                  
			                  
			                    <div class="table-responsive">
			                      <table
			                        id="multi-filter-select"
			                        class="display table table-striped table-hover"
			                      >
			                        <thead>
			                          <tr>
			                            <th>번호</th>
			                            <th>등록일</th>
			                            <th>수정요청날짜</th>
			                            <th>출근/퇴근</th>
			                            <th>수정전시간</th>
			                            <th>수정요청시간</th>
			                            <th>상태</th>
			                          </tr>
			                        </thead>
			                        <tbody>	
			                        <c:if test="${not empty attendanceEdit }">
			                        	<c:forEach var="a" items="${attendanceEdit }">
					                          <tr>
					                            <td>${a.attendanceEditKey}</td>
					                            <td>${a.attendanceEditDate}</td>
					                            <td>${a.attendanceEditRequestDate }</td>
					                            <td>${a.attendanceEditStartEnd }</td>
					                            <td>${fn:substring(a.attendanceEditBeforeTime, fn:length(a.attendanceEditBeforeTime) - 8, fn:length(a.attendanceEditBeforeTime))}</td>
          										<td>${fn:substring(a.attendanceEditAfterTime, fn:length(a.attendanceEditAfterTime) - 8, fn:length(a.attendanceEditAfterTime))}</td>
					                            <td>${a.attendanceEditState}</td>
					                            <td>
					                            	<button type="button" class="btn btn-dark btn-round" data-toggle="modal" data-target="#editmemModal" data-member-key="${a.attendanceEditKey}">
											    		상세
											  		</button>
					                            </td>
					                          </tr>
				                        </c:forEach>
			                         </c:if>
			                         <c:if test="${empty attendanceEdit }">
			                         	<tr>
			                         		<td><h3>등록된 수정요청이 없습니다.</h3></td>
			                         	</tr>
			                         	
			                         </c:if>
			                         
			                        </tbody>
			                      </table>
			              		<div>${pagebar}</div>
			                </div>
			              </div>
				</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/common/footer.jsp" %> 	
			<%@ include file="/WEB-INF/views/attendance/attendanceEditDetail.jsp" %>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
			
		<script>
			
			$(document).ready(function() {
			    $('#editmemModal').on('show.bs.modal', function (event) {
			        var button = $(event.relatedTarget); // 버튼을 클릭한 버튼을 참조합니다.
			        var attendanceEditKey = button.data('member-key'); // data-attendanceeditkey 속성의 값을 가져옵니다.
			        console.log(attendanceEditKey);
			        // AJAX를 사용하여 서버에서 데이터 가져오기
			        $.ajax({
			            url: '${path}/attendance/attendanceEditDetail',
			            type: 'POST',
			            data: { attendanceEditKey: attendanceEditKey },
			            /* dataType: 'json', // 서버 응답을 JSON으로 처리 */
			            success: function(data) {
			            	console.log(data);
			            	console.log(data.attendanceEdit.attendanceEditKey);
			            	
			            	 function formatDate(timestamp) {
				                    var date = new Date(timestamp);
				                    var year = date.getFullYear();
				                    var month = ('0' + (date.getMonth() + 1)).slice(-2);
				                    var day = ('0' + date.getDate()).slice(-2);
				                    return year + '-' + month + '-' + day;
				                }

			                // 모달에 데이터 설정
			                $('#attendanceEditKeyMo').val(data.attendanceEdit.attendanceEditKey);
			                $('#attendanceEditMemberMo').val(data.attendanceEdit.attendanceEditMember); 
			                $('#attendanceEditDateMo').val(formatDate(data.attendanceEdit.attendanceEditDate));
			                $('#attendanceEditRequestDateMo').val(formatDate(data.attendanceEdit.attendanceEditRequestDate));
			                $('#attendanceEditBeforeStateMo').val(data.attendanceEdit.attendanceEditBeforeState);
			             	$('#attendanceEditBeforeTimeMo').val(data.attendanceEdit.attendanceEditBeforeTime); 
			                $('#attendanceEditStartEndMo').val(data.attendanceEdit.attendanceEditStartEnd);
			                $('#attendanceEditAfterTimeMo').val(data.attendanceEdit.attendanceEditAfterTime);
			                $('#attendanceEditAfterStateMo').val(data.attendanceEdit.attendanceEditAfterState);
			                $('#attendanceEditRequestMo').val(data.attendanceEdit.attendanceEditRequest);
			                $('#attendanceEditOpinionMo').val(data.attendanceEdit.attendanceEditOpinion);
			                /* $('#attendanceKeyMo').val(data.attendanceEdit.attendance.attendanceKey);  */
			                

			            },
			            error: function() {
			                alert('Failed to fetch data.');
			            }
			        });
			    });
			});
			
			document.getElementById("searchType").addEventListener("change",e=>{
				console.log("맞냐");
				const searchType = e.currentTarget.value;
				fetch("${path}/attendance/searchAttendanceEdit?searchType=" + searchType)
				.then(response => response.text())
				.then(data => {
					document.querySelector("div[class='table-responsive']").innerHTML = data;
				})
				
			});		
			
		 	   /*  location.assign('${path}/attendance/searchAttendanceEdit?cPage=' + pageNo + '&searchType=${searchT}'); */
			 function fn_paging(pageNo) {
		 	    console.log('오긴왔냐?');
		 	    var searchType= document.getElementById("searchType").value;
			 	   $.ajax({
			            url: '${path}/attendance/searchAttendanceEdit', // 서버의 실제 엔드포인트로 대체
			            type: 'GET',
			            data: { cPage: pageNo ,searchType : searchType},
			            dataType: 'text', // 서버 응답을 JSON으로 처리
			            success: function(data) {
	
			                document.querySelector("div[class='table-responsive']").innerHTML = data;
	
			            },
			            error: function(xhr, status, error) {
			                console.error("AJAX Error: ", status, error);
			            }
			        });
			    }

		 	 

/* 				const attendanceEditDetail=(key)=> {
					 let form = document.createElement("form");
			            form.setAttribute("method", "post");
			            form.setAttribute("action", "${path}/attendance/attendanceEditDetail");

			            let $key = document.createElement("input");
			            $key.setAttribute("type", "hidden");
			            $key.setAttribute("name", "attendanceEditKey");
			            $key.setAttribute("value", key);

			            form.appendChild($key);

			            document.body.appendChild(form);
			            form.submit();
				} */
		</script>

</body>
</html>