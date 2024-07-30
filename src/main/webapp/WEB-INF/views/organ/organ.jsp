<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:set var="path" value="${pageContext.request.contextPath }"/>
<sec:authentication var="currentUserId" property="principal.memberId"/>
<sec:authentication var="loginMember" property="principal"/>


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
							  <button type="button" onclick="noteOrganGo('${memberlist.memberName}','${memberlist.jobName}','${memberlist.memberKey}');" class="btn btn-icon btn-round btn-success modal_btn1Organ" style=" height: 1.6rem; width: 1.6rem!important; min-width: 0rem!important; border-radius: 50%!important; font-size: 1rem;"  >
		                        <i class="fas fa-envelope"></i>
		                      </button>
		                      <div class="btn btn-icon btn-round btn-primary messageBtn"  data-member-id="${memberlist.memberKey}" style=" height: 1.6rem; width: 1.6rem!important;  border-radius: 50%!important; min-width: 0rem!important; margin-left:7px; font-size: 1rem;">
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
     var socket = new SockJS('${path}/ws-stomp');
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
     

            $(document).on('click', '.messageBtn', function(event) {
                event.stopPropagation();

                var memberId = $(this).data('member-id'); // 대상 멤버 ID
                var chatWindowUrl = '${path}/chat'; // 채팅 창 URL

                // 팝업 창의 옵션 설정
                var popupOptions = 'width=400,height=500,left=' + (screen.width - 400) / 2 + ',top=' + (screen.height - 500) / 2;

                // 팝업 창 생성
                var chatWindow = window.open(chatWindowUrl, 'chatWindow', popupOptions);

                // 폼 생성 및 전송
                var form = $('<form>', {
                    'action': chatWindowUrl,
                    'method': 'post',
                    'target': 'chatWindow'
                }).append($('<input>', {
                    'type': 'hidden',
                    'name': 'memberNo',
                    'value': memberId
                }), $('<input>', {
                    'type': 'hidden',
                    'name': 'memberNo',
                    'value': '${loginMember.memberKey}'
                }));

                // 폼을 body에 추가하고 제출
                form.appendTo('body').submit();
                form.remove(); // 폼 제거
            });
   
          	</script>
          	<!-- 모달 팝업 창 내용 -->
              <div class="modal1Organ">
				    <div class="modal_popup1Organ">
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
			                              id="postMsgTitleOrgan"
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
			                              id="postMsgDetailOrgan"
			                              rows="8" cols="50"
			                            ></textarea>
			                          </div>
                    			   </div>
								   <div class="form-group">
									   <div class="input-group-prepend" style="padding:0px;">
			   		                		<button type="button" class="btn btn-outlime-primary" onclick="fn_addFileOrgan();">
			   		                		추가
			   		                		</button>
			   		                		<button type="button" class="btn btn-outlime-primary" onclick="fn_delFileOrgan();">
			   		                		삭제
			   		                		</button>
			   		                	</div>
									</div>	         
								   <div class="form-group">
								   								
									<form id="fileInputsContainerOrgan">
	   								<div id="basicFileFormOrgan" class="input-group mb-3" style="padding:0px;">

	   					                <div class="input-group-prepend" style="padding:0px;">
	   					                	<span class="input-group-textOrgan">첨부파일1</span>
	   					                </div>
	   					            	 <div class="custom-file">
	   					               
	   					                    <input type="file" class="custom-file-input" name="upFileOrgan" id="upFileOrgan" multiple >
	   					                    
	   					                </div>
	   					                 
	   					                
	   					            </div>
									</form>

	   							   </div>  	   
								   <div class="form-group">
										<button class="btn btn-primary" style="margin-right: 10px;" id="organNoteSendButton">전송</button>
										<button class="btn btn-primary btn-border close_btn1Organ" >닫기</button>
								   </div>
				          </div>
				    </div>
			  </div>
			  <script>
				

				  	//열기 버튼을 눌렀을 때 모달팝업이 열림
				  	  document.querySelectorAll('.modal_btn1Organ').forEach((button, index) => {
				  		 const modal1Organ = document.querySelectorAll('.modal1Organ');
				            button.addEventListener('click', function() {
				                // 인덱스 출력
				                console.log('Modal button index:', index);

				                // 'on' 클래스 추가
				                modal1Organ[0].classList.add('on1Organ');
				            });
				        });
				  	
				  	document.querySelectorAll('.close_btn1Organ').forEach((button, index) => {
				  		const modal1Organ = document.querySelectorAll('.modal1Organ');
				        button.addEventListener('click', function() {
				            // 인덱스 출력
				            console.log('Modal button index:', index);
							
				            // 'on' 클래스 제거
				            modal1Organ[0].classList.remove('on1Organ');
				        });
				    });
					
				  	function noteOrganGo(memberName,jobName,memberKey){
						console.log(memberKey);
				  		const organNoteTitle = document.getElementById("organNoteTitle");
				  		event.stopPropagation();
				  		console.log(memberName+jobName);
				  		organNoteTitle.innerHTML=memberName+"&nbsp;"+jobName
						
						// 전송 버튼의 onclick 속성을 동적으로 생성하여 설정
				         var sendButton = document.getElementById('organNoteSendButton');
				         sendButton.setAttribute('onclick', `organNoteOneGo(\${memberKey});`);
				  	} 
				
				/* 개별발송 파일 추가 로직*/
		    	
				(function() {
				    let count = 2;
				    
				    const addFileformOrgan = () => {
				        if (count <= 5) {
				            const fileForm = $("#basicFileFormOrgan").clone(true);
				            fileForm.find("span.input-group-textOrgan").text("첨부파일" + count);
				            fileForm.find("input[type=file]").attr("id", "upFileOrgan" + count).val("");
				            fileForm.appendTo("#fileInputsContainerOrgan");
				            count++;
				        } else {
				            alert("첨부파일은 5개까지 가능합니다");
				        }
				    }
				    
				    const delFileformOrgan = () => {
				        if (count != 2) {
				            $("#fileInputsContainerOrgan").children().last().remove();
				            count--;
				        }
				    }
				    
				    // addFileformOrgan과 delFileformOrgan 함수를 전역 객체에 노출하여 다른 곳에서도 호출할 수 있도록 합니다.
				    window.addFileformOrgan = addFileformOrgan;
				    window.delFileformOrgan = delFileformOrgan;
				    
				    // fn_addFileOrgan과 fn_delFileOrgan 함수를 전역 객체에 노출하여 다른 곳에서도 호출할 수 있도록 합니다.
				    window.fn_addFileOrgan = addFileformOrgan;
				    window.fn_delFileOrgan = delFileformOrgan;
				})();
				
		
		
				
				/* 타입 , 알람 , 수신인, 메세지  */
		     	function organNoteAlarmSend(reMemberKey, memberKey){
			   	 console.log('send보내짐');
			   		stompClient.send("/pub/msg/"+reMemberKey,{},
			   			JSON.stringify({
							
							alarmType : 'Note',
							alarmPath : 'notein',
			   				alarmSendMember : memberKey,
							alarmReMember : reMemberKey,
							alarmDate : new Date().toISOString()
							
			   				
			   				
			   			})
			   				
			   		);
			   		  
			   	}
				
				<!-- 조직도 쪽지 발송-->

				function organNoteOneGo(reMemberKey){
					var formData = new FormData();
			         	var upFiles = document.getElementsByName('upFileOrgan');
						
			         	for (var i = 0; i < upFiles.length; i++) {
			         		   var fileList = upFiles[i].files;
			         		    for (var j = 0; j < fileList.length; j++) {
			         		        formData.append('upFile', fileList[j]);
			         		    }

			         	}
						
						var memberKey = ${loginMember.memberKey};
			            console.log(memberKey);
			            var postMsgDetail = document.getElementById('postMsgDetailOrgan').value;
			            console.log(postMsgDetail);
						var postMsgTitle =document.getElementById('postMsgTitleOrgan').value;
						console.log(postMsgTitle);
						
						var reMemberKeyOrgan=[];
						reMemberKeyOrgan.push( reMemberKey);  
						
						formData.append('reMemberKey', reMemberKeyOrgan);
						
						formData.append('memberKey', memberKey);
						formData.append('postMsgDetail', postMsgDetail);
						formData.append('postMsgTitle', postMsgTitle);
						
						formData.forEach((value, key) => {
						    console.log(key, value);
						});

				    	$.ajax({
				    		url : '${path}/notewrite',
				    		type : 'POST',
				    		data :
					    	
				    			formData,
				    	    processData: false, // 필수 항목
				    	    contentType: false, // 필수 항목
				    		success : function(){
				    			alert('성공');
				    			
				    				organNoteAlarmSend(reMemberKey, memberKey);
				    			
				    			
				    		}
				    	});
						const modal1Organ = document.querySelectorAll('.modal1Organ');

				    	modal1Organ[0].classList.remove('on1Organ');
			      	 	document.getElementById('postMsgDetailOrgan').value='';
			      		document.getElementById('postMsgTitleOrgan').value='';
						
					    const children = $("#fileInputsContainerOrgan").children();
					    if (children.length > 1) {
					        children.slice(1).remove();
					    }
						children.first().find("input[type=file]").val("");
						
				}	
				
			  </script>
			  
</body>
