<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- SweetAlert2 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.min.css" rel="stylesheet">
  <!-- SweetAlert2 JS -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.all.min.js"></script>
</head>
<body>
 	<%@ include file="/WEB-INF/views/admin/adminsidebar.jsp" %> 
 	<div class="main-panel">
  	<%@ include file="/WEB-INF/views/admin/adminheader_bar.jsp" %> 
		<div>	
			<br><br><br><br>
		    <div>
		   		<h4 class="card-title">전체사원관리</h4>
			</div>
			<br>
		<div class="col-md-12">
		                <div class="card">
		                  <div class="card-body">
		                  <p>사원 수 : ${totaldata }</p>
		                  <form action="${path }/admin/member/searchMember">
		                   <nav
					        class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
					       >
								  <select class="form-select input-fixed" name="searchType">					              	
					              	<option></option>
					              	<option value="재직" <c:if test="${searchT eq '재직'}">selected</c:if>>재직</option>
					              	<option value="휴직" <c:if test="${searchT eq '휴직'}">selected</c:if>>휴직</option>
					              	<option value="퇴사" <c:if test="${searchT eq '퇴사'}">selected</c:if>>퇴사</option>
					              </select>
		                          <div class="input-group">
				                    <div class="input-group-prepend">
				                      <button type="submit" class="btn btn-search pe-1">
				                        <i class="fa fa-search search-icon"></i>
				                      </button>
				                    </div>
				                    <input
				                      type="text"
				                      id="searchKey"
				                      name="searchKey"
				                      placeholder="Search name..."
				                      class="form-control"
				                      value="${searchK }"
				                    />
				                  </div>          
				               </nav>
				              </form>
				              
		                    <div class="table-responsive">
		                      <table
		                        id="multi-filter-select"
		                        class="display table table-striped table-hover"
		                      >
		                        <thead>
		                          <tr>
		                            <th>아이디</th>
		                            <th>이름</th>
		                            <th>부서</th>
		                            <th>직급</th>
		                            <th>사내번호</th>
		                            <th>근속상태</th>
		                            <th>입사일</th>
		                          </tr>
		                        </thead>
		                        <tbody>	
		                        <c:if test="${not empty members }">
		                        	<c:forEach var="m" items="${members }">		                 
				                          <tr>
				                            <td>${m.memberId }</td>
				                            <td>${m.memberName }</td>
				                            <td>${m.department.deptName }</td>
				                            <td>${m.job.jobName }</td>
				                            <td>${m.memberTell }</td>
				                            <td>${m.memberState }</td>
				                            <td>${m.memberEnrollDate}</td>
				                            <td>
				                            	<%-- <button onclick="updateMember('${m.memberKey}');" class="btn btn-dark btn-round">수정</button> --%>
				                            	<button type="button" class="btn btn-dark btn-round" data-toggle="modal" data-target="#updateformModal" data-member-key="${m.memberKey}">
											    	수정
											  	</button>
				                            	 &ensp;&ensp;&ensp;
				                            	<button onclick="deleteModal('${m.memberKey}');" class="btn btn-dark btn-round">삭제</button>
				                            </td>
				                          </tr>
			                        </c:forEach>
		                         </c:if>
		                         <c:if test="${empty members }">
		                         	<tr>
		                         		<td><h3>등록된 사원이 없습니다.</h3></td>
		                         	</tr>
		                         	
		                         </c:if>
		                         
		                        </tbody>
		                      </table>
		              		<div>${pagebar}</div>
		                    </div>
		                    	  	<button type="button" class="btn btn-primary btn-round" data-toggle="modal" data-target="#formModal">
								    	사원 등록
								  	</button>
					  			<%-- <button onclick="location.assign('${path}/admin/member/insertmember.do')" class="btn btn-success btn-round" >등록</button> --%>
		                  </div>
		                </div>
		              </div>
			</div>
				<%@ include file="/WEB-INF/views/common/footer.jsp" %> 	
				
	 		<!-- 사원 등록 모달 정의 -->
	 		<%@ include file="/WEB-INF/views/admin/member/insertmodal.jsp" %>

 			<!-- 사원 수정 모달 -->
	 		<%@ include file="/WEB-INF/views/admin/member/updatemodal.jsp" %>
 </div> 
 
<!-- Bootstrap JS and dependencies -->
  <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script> -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

			<script>
				
				/* 수정모달 정보 가져오기 */
				
			  $('#updateformModal').on('show.bs.modal', function (event) {
			        var button = $(event.relatedTarget); // 버튼을 클릭한 요소
			        var memberKey = button.data('member-key'); // `data-member-key` 속성 값
			        
			        // AJAX 요청으로 memberKey를 사용해 서버로부터 데이터를 가져오는 경우
			        // 여기에서는 예를 들어 jQuery AJAX 요청을 사용합니다.
			        $.ajax({
			            url: '${path}/admin/member/updatemember', // 서버의 실제 엔드포인트로 대체
			            type: 'GET',
			            data: { memberKey: memberKey },
			            dataType: 'json', // 서버 응답을 JSON으로 처리
			            success: function(data) {
			                console.log(data); // 전체 응답을 확인

			                var member = data.member; // 데이터 구조에서 member 객체 추출
			                console.log(member.memberName); // memberName 필드 확인
							console.log(member.memberEnrollDate);
			                
							 function formatDate(timestamp) {
				                    var date = new Date(timestamp);
				                    var year = date.getFullYear();
				                    var month = ('0' + (date.getMonth() + 1)).slice(-2);
				                    var day = ('0' + date.getDate()).slice(-2);
				                    return year + '-' + month + '-' + day;
				                }
			                
			                // member 객체에 포함된 값을 폼에 채움
			                $('#memberIdup').val(member.memberId);
			                $('#memberNameup').val(member.memberName);
			                $('#addr_dtl2').val(member.memberAddress);
/* 			                $('#memberAddressup').val(member.memberAddress); */
			                $('#memberPhoneup').val(member.memberPhone);
			                $('#memberTellup').val(member.memberTell);
			                $('#memberEmailup').val(member.memberEmail);
			                $('#memberEnrollDateup').val(formatDate(member.memberEnrollDate));
			                $('#memberBirthdateup').val(formatDate(member.memberBirthdate));

			                // 성별 체크박스 설정
			                if (member.memberGender === 'M') {
			                    $('#memberGenderup').prop('checked', true);
			                } else if (member.memberGender === 'F') {
			                    $('#memberGender2up').prop('checked', true);
			                }
							
			                // 부서와 직급 선택 설정
			                $('#departmentup').val(member.department.deptKey);
			                $('#jobup').val(member.job.jobKey);

			                // 상태 선택 설정
			                $('#memberStateup').val(member.memberState);

			                // 권한 체크박스 설정
			                $('input[name="accessKey"]').each(function() {
			                    if ($(this).val() == member.accessKey) {
			                        $(this).prop('checked', true);
			                    } else {
			                        $(this).prop('checked', false);
			                    }
			                });
			                
			                
			            },
			            error: function(xhr, status, error) {
			                console.error("AJAX Error: ", status, error);
			            }
			        });
			    });
			
			  // 페이지 로드 시 초기 설정 확인
			    document.addEventListener('DOMContentLoaded', function() {
			        toggleReadOnly();
			    });

/* 			    function toggleReadOnly() {
			        var memberState = document.getElementById('memberState').value;
			        var memberLeaveDateInput = document.getElementById('memberLeaveDate');
			        
			        // 퇴사 상태인 경우 readonly 속성을 제거
			        if (memberState === '퇴사') {
			            memberLeaveDateInput.removeAttribute('readonly');
			        } else {
			            // 그 외의 경우에는 readonly 속성을 추가
			            memberLeaveDateInput.setAttribute('readonly', 'readonly');
			        }
			    } */
				
			    function toggleReadOnly() {
			        var memberState = $('#memberStateup').val();
			        var memberLeaveDateInput = $('#memberLeaveDateup'); // 'memberLeaveDate' 대신 'memberLeaveDateup'으로 변경
			        
			        // 요소가 존재하는지 확인
			        if (memberLeaveDateInput.length) {
			            // 퇴사 상태인 경우 readonly 속성을 제거
			            if (memberState === '퇴사') {
			                memberLeaveDateInput.removeAttr('readonly');
			            } else {
			                // 그 외의 경우에는 readonly 속성을 추가
			                memberLeaveDateInput.attr('readonly', 'readonly');
			            }
			        } else {
			            console.error("Element #memberLeaveDateup not found");
			        }
			    }
				
			
			 	function fn_paging(pageNo) {
			 	    console.log('오긴왔냐?');
			 	    /* cosnt searchKey= ${searchK}; */
			 	    location.assign('${path}/admin/member/searchMember?cPage=' + pageNo + '&searchKey=${searchK}&totaldata=${totaldata}&searchType=${searchT}');
			 	    /* location.assign('${path}/${url}?cPage=' + pageNo + '&numPerpage=${numPerpage}&searchKey=${searchK}&searchType=${searchType}&searchStartDate=${searchStartDate}&searchEndDate=${searchEndDate}'); */
			 	    
			 	}	
			
			
				const updateMember=(key)=>{
				            let form = document.createElement("form");
				            form.setAttribute("method", "post");
				            form.setAttribute("action", "${path}/admin/member/updatemember.do");

				            let $key = document.createElement("input");
				            $key.setAttribute("type", "hidden");
				            $key.setAttribute("name", "memberKey");
				            $key.setAttribute("value", key);

				            form.appendChild($key);

				            document.body.appendChild(form);
				            form.submit();
						}
				
				
			
				 function deleteModal(no){
						console.log(no);
						Swal.fire({
							title: '삭제 확인',
							html: '<h4>정말 삭제하시겠습니까?</h4>',
							showCancelButton: true,
							confirmButtonClass: 'btn btn-success',
							cancelButtonClass: 'btn btn-danger ms-2',
							confirmButtonText: '삭제',
							cancelButtonText: '취소',
							buttonsStyling: false,
							reverseButtons: false
						}).then(result => {
							if (result.isConfirmed) {
								//삭제 요청 전송
								$.ajax({
									url: '${path}/admin/member/deletemember.do',
									data: {no : no},
									dataType: "json",
									method: "post",
									success: data=>{
										console.log();
										if(data.status==="success"){
											Swal.fire({
												title: '삭제 완료',
												html: '<h4>정상적으로 삭제되었습니다.</h4>',
												showCancelButton: true,
												confirmButtonClass: 'btn btn-success',
												cancelButtonClass: 'btn btn-danger ms-2',
												confirmButtonText: '확인',
												cancelButtonText: '취소',
												buttonsStyling: false,
												reverseButtons: false
											}).then(result => {
												location.reload();
											});
										}else{
								            alert("다음과 같은 에러가 발생하였습니다. (" + data.message + ")");
								        };
									},
									error: (xhr, status, error) => {
					                    console.error("Error: ", error);
					                    alert("삭제 요청 중 오류가 발생했습니다.");
					                }
								});
							}
						});
					};
				
				
				
				
				const deleteMember=(key)=>{
					   if(confirm("정말 삭제 하시겠습니까?")){
				           let form = document.createElement("form");
				           form.setAttribute("method", "post");
				           form.setAttribute("action", "${path}/admin/member/deletemember.do");
				
				           let $key = document.createElement("input");
				           $key.setAttribute("type", "hidden");
				           $key.setAttribute("name", "memberKey");
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