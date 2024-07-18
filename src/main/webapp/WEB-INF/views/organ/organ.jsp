<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:set var="path" value="${pageContext.request.contextPath }"/>
<sec:authentication var="currentUserId" property="principal.memberId"/>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
              .status-dot {
            height: 10px;
            width: 10px;
            border-radius: 50%;
            display: inline-block;
            background-color: red; /* 기본값: 오프라인 */
        }

        .online {
            background-color: green;
        }
</style>

	<div class="accordion" id="accordionPanelsStayOpenExample">
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
		 					<c:if test="${currentUserId != memberlist.memberId }">
							  <a href="#" class="list-group-item list-group-item-action"><span class="status-dot" id="status-dot-${memberlist.memberId}"></span> &emsp;${memberlist.memberName} &nbsp; ${memberlist.jobName} 
							  <div>
							  <button type="button" onclick="noteOrganGo('${memberlist.memberName}','${memberlist.jobName}');" class="btn btn-icon btn-round btn-success modal_btn1" style=" height: 1.6rem; width: 1.6rem!important; min-width: 0rem!important; border-radius: 50%!important; font-size: 1rem;"  >
		                        <i class="fas fa-envelope"></i>
		                      </button>
		                      <div class="btn btn-icon btn-round btn-primary" style=" height: 1.6rem; width: 1.6rem!important;  border-radius: 50%!important; min-width: 0rem!important; margin-left:7px; font-size: 1rem;">
	                              <i class="fa fa-comment"></i>
	                            </div>
							  </div>
							   </a>
		 					</c:if>
						
		  				</c:forEach>
					</div>
			      </div>
			    </div>
			</div>
		
		
		</c:forEach>	
		

		
	</div> 
	<!-- 모달 팝업 스크립트 -->
           


 <script>

 var stompClient = null;

 function connectMainPage() {
     var socket = new SockJS('/ws-stomp');
     stompClient = Stomp.over(socket);
     stompClient.connect({}, function (frame) {
         console.log('Connected: ' + frame);
         stompClient.subscribe('/topic/status', function (message) {
             console.log("Raw message: ", message); // 추가 로그
             var status = JSON.parse(message.body);
             console.log("Parsed message: ", status); // 추가 로그
             updateUserStatus(status.username, status.isOnline);
         });

     });
 }




     connectMainPage(); // WebSocket 연결
     
     
          	//열기 버튼을 눌렀을 때 모달팝업이 열림
          	  document.querySelectorAll('.modal_btn1').forEach((button, index) => {
          		 const modal1 = document.querySelectorAll('.modal1');
		            button.addEventListener('click', function() {
		                // 인덱스 출력
		                console.log('Modal button index:', index);
		
		                // 'on' 클래스 추가
		                modal1[0].classList.add('on1');
		            });
		        });
          	
          	document.querySelectorAll('.close_btn1').forEach((button, index) => {
          		const modal1 = document.querySelectorAll('.modal1');
	            button.addEventListener('click', function() {
	                // 인덱스 출력
	                console.log('Modal button index:', index);
					
	                // 'on' 클래스 제거
	                modal1[0].classList.remove('on1');
	            });
	        });
          	function noteOrganGo(memberName,jobName){
          		const organNoteTitle = document.getElementById("organNoteTitle");
          		event.stopPropagation();
          		console.log(memberName+jobName);
          		organNoteTitle.innerHTML=memberName+"&nbsp;"+jobName
          	} 
          	</script>
          	<!-- 모달 팝업 창 내용 -->
              <div class="modal1">
				    <div class="modal_popup1">
				         <div>
				         <%--   	  <c:forEach var="d" items="${AllMemberList}">
				           	    <input type="radio"  name="reMemberKey1" value="${d.memberKey }">
				           	  	<p>${d.memberKey}<p>
				           	  </c:forEach>  --%>
				           	  <div class="form-group">
				           		   <h2 id="organNoteTitle">전체 쪽지</h2>
				           	  </div>   
				           		    <div class="form-group">
			                          <div class="input-group">
			                            <span class="input-group-text">제목</span>
			                            <textarea
			                              class="form-control"
			                              aria-label="With textarea"
			                              id="postMsgTitleAll"
			                              rows="1" cols="50"
			                            ></textarea>
			                          </div>
                    			   </div>		
								   <div class="form-group">
			                          <div class="input-group">
			                            <span class="input-group-text">내용</span>
			                            <textarea
			                              class="form-control"
			                              aria-label="With textarea"
			                              id="postMsgDetailAll"
			                              rows="8" cols="50"
			                            ></textarea>
			                          </div>
                    			   </div>		           	   
								 <div class="form-group">
								<button class="btn btn-primary" style="margin-right: 10px;" onclick="noteAllgo();">전송</button>
								<button class="btn btn-primary btn-border close_btn1" >닫기</button>
								</div>
				          </div>
				    </div>
			  </div>
</body>
