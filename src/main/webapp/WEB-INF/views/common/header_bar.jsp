<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication var="loginMember" property="principal"/>

    
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    
    
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" defer></script>
   <style>

   </style>
   <style>
	
   .list-group-item{
         display: flex;
         flex-direction: row;
      	 justify-content: space-between;
   }
   
   #headerNavLogo {
       display: none;
   }
	</style>
	<!--이성록 모달 팝업 스타일 -->

	<style>
			h2{
    			text-align: center;
			}
			
			
			/*모달 팝업 영역 스타일링*/
			.modal1Organ {
			/*팝업 배경*/
				display: none; /*평소에는 보이지 않도록*/
			    position: fixed;
			    top:0;
			    left: 0;
			    width: 100%;
			    height: 100vh;
			    overflow: hidden;
			    background: rgba(0,0,0,0.5);
			}
			.modal1Organ .modal_popup1Organ {
			/*팝업*/
			    position: relative;
			    top: 50%;
			    left: 50%;
			    width:30%;
			    transform: translate(-50%, -50%);
			    padding: 20px;
			    background: #ffffff;
			    border-radius: 20px;
			}
			.modal1Organ .modal_popup1Organ .close_btn1Organ {
			  /*   display: block; */
			    cursor: pointer;
			}
			.modal1Organ.on1Organ {
			    display: block;
			    position: fixed;
			    
			}
	
	  </style>

	  
	  

      <div class="main-header">
            <div class="main-header-logo">
              <!-- Logo Header -->
              <div class="logo-header" data-background-color="dark">
                <a href="index.html" class="logo">
                  <img
                    src="assets/img/kaiadmin/logo_light.svg"
                    alt="navbar brand"
                    class="navbar-brand"
                    height="20"                  />
                </a>
                <div class="nav-toggle">
                  <button class="btn btn-toggle toggle-sidebar">
                    <i class="gg-menu-right"></i>
                  </button>
                  <button class="btn btn-toggle sidenav-toggler">
                    <i class="gg-menu-left"></i>
                  </button>
                </div>
                <button class="topbar-toggler more">
                  <i class="gg-more-vertical-alt"></i>
                </button>
              </div>
              <!-- End Logo Header -->
            </div>
            <!-- Navbar Header -->
            <nav
              class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom "
            >
              <div class="container-fluid">
                <nav
                  class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
                >
				<div class="container-fluid">
				   <a class="navbar-brand" href="#" id="headerNavLogo">
					<img
		               src="${path}/resources/assets/img/KakaoTalk_Photo_2024-06-28-10-37-54.png"
		               alt="navbar brand"
		               class="navbar-brand"
		               height="70"
		             />
				   </a>
				  
				   <div class="collapse navbar-collapse" id="navbarNav">
				     <ul class="navbar-nav">
				       <li class="nav-item">
				         <a class="nav-link" href="${path}/document/home" 
				           >전자결재</a
				         >
				       </li>
				       <li class="nav-item">
				         <a class="nav-link" href="${path}/calendar">캘린더</a>
				       </li>
				       <li class="nav-item">
				         <a class="nav-link" href="${path}/notehome">쪽지</a>
				       </li>
				       <li class="nav-item">
				         <a class="nav-link" href="${path}/board/list">게시판</a>
				       </li>
				       <li class="nav-item">
				         <a class="nav-link" href="${path}/attendance/selectAttendanceAll">근태</a>
				       </li>

			          <li class="nav-item">
				         <a class="nav-link" href="${path}/external/list">외부주소록</a>
				        </li>

				       <c:if test="${loginMember.accessKey eq 2 }">
				       	 <a class="nav-link" href="${path}/admin/manageAdminMain">경영</a>
				       </c:if>
				        <c:if test="${loginMember.accessKey eq 3 }">
				       	 <a class="nav-link" href="${path}/admin/personAdminMain">인사</a>
				       </c:if>

				     </ul>
				   </div>
				 </div>
				
                </nav>
      		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
			
			<!-- 로고 메인화면 아닐 시 숨기는 로직 -->
		
			<script>
				// 원하는 URL을 설정
				const targetUrl = "http://14.36.141.71:10079/GDJ79_NPNC_final/";
				const targetUrl2="http://14.36.141.71:10079/GDJ79_NPNC_final/?continue";
				
				// 현재 URL을 확인
				const currentUrl = window.location.href;
				console.log(currentUrl+"들어오나요");
				// navbar-brand 요소 선택
				const headerNavLogo = document.getElementById("headerNavLogo");

				// 현재 URL이 targetUrl과 일치하지 않으면 요소 숨기기
				if (currentUrl == targetUrl||currentUrl==targetUrl2) {
				    headerNavLogo.style.display = "inline";
				}
				
			</script>
			
             <script type="text/javascript">

					<!-- 조직도 내용 함수-->
					 $(document).ready(
			            function(){
			               $("#organ").on('click', function(){
			            	     event.stopPropagation();
			            	     $.ajax({
			            	    	url : '${path}/organ',
			            	    	type: 'GET',
			            	    	success : function(response){
			            	    		$('#organcontainer').html("");
			            	    		$('#organcontainer').html(response);
			            	    	}
			            	     });
			               });   
			            }
			         );
					 
					<!-- 알람 내용 드랍다운 함수 -->
					$(document).ready(
			            function(){
			               $("#notifDropdown").on('click', function(){
								
								$.ajax({
									url:'${path}/alarmSelectAll',
									type:'POST',
									data:{
										
										memberKey : ${loginMember.memberKey}
											
										},
									success:function(response){
										
										var alarmBox = document.getElementById('alarmBox');
										 alarmBox.innerHTML = ''; // Clear innerHTML
										for(let i=0; i<response.length;i++){
											var divIcon = null;
								            var faIcon = null;
								            var divContent = null;
								            var spanBlock = null;
								            console.dir(response[i]);
								            //알람 종류 분기정
							            	switch (response[i].alarmType) {
									                case 'Note':
									                  //쪽지 알람 목록 출력 디자인
													  divIcon = document.createElement('div');
								   			          divIcon.className = 'notif-icon notif-success';
							
								   			          faIcon = document.createElement('i');
								   			          faIcon.className = 'fa fa-envelope';
							
								   			          divContent = document.createElement('div');
								   			          divContent.className = 'notif-content';
							
								   			          spanBlock = document.createElement('span');
								   			          spanBlock.className = 'block';
								   			          spanBlock.textContent = response[i].memberName+" "+response[i].jobName +'님의 쪽지';
								   			  		  spanBlock.style.fontSize = '11px'; // 원하는 폰트 크기로 설정
									                    
									                    
									                    break;
							
									                case 'DocReferer':
									                    //참조문서 알람 목록 출력 디자인
														divIcon = document.createElement('div');
								   			          	divIcon.className = 'notif-icon notif-primary';
							
								   			          	faIcon = document.createElement('i');
								   			         	faIcon.className = 'fa fa-book';
							
									   			        divContent = document.createElement('div');
									   			        divContent.className = 'notif-content';
								
								   			          	spanBlock = document.createElement('span');
								   			            spanBlock.className = 'block';
								   			            spanBlock.textContent = response[i].memberName+" "+response[i].jobName +'님이 작성한 참조문서 1건 도착';
								   			  		    spanBlock.style.fontSize = '11px'; // 원하는 폰트 크기로 설정
									                    
									                    break;
							
									                case 'DocAprover':
										                  //결재 대기 문서 알람 목록 출력 디자인
														  divIcon = document.createElement('div');
									   			          divIcon.className = 'notif-icon notif-primary';
								
									   			          faIcon = document.createElement('i');
									   			          faIcon.className = 'fa fa-book';
								
									   			          divContent = document.createElement('div');
									   			          divContent.className = 'notif-content';
								
									   			          spanBlock = document.createElement('span');
									   			          spanBlock.className = 'block';
									   			          spanBlock.textContent = response[i].memberName+" "+response[i].jobName +'님의 결재 대기 문서 1건 도착';
									   			  		  spanBlock.style.fontSize = '11px'; // 원하는 폰트 크기로 설정
									                    
									                    break;
									                case 'DocComplete':
									                	//기안문서 결재완료 알람 목록 출력 디자인
									                	  divIcon = document.createElement('div');
									   			          divIcon.className = 'notif-icon notif-primary';
								
									   			          faIcon = document.createElement('i');
									   			          faIcon.className = 'fa fa-book';
								
									   			          divContent = document.createElement('div');
									   			          divContent.className = 'notif-content';
								
									   			          spanBlock = document.createElement('span');
									   			          spanBlock.className = 'block';
									                	  spanBlock.textContent = '문서 번호 : ' + response[i].docSerialKey + '  승인 완료';
									                	
									                	break;
									                default:
									                    console.error('Unknown alarm type:', response[i].alarmType);
									                    break;
							            	}
										
										   
										   var a = document.createElement('a');
					   			           a.href = 'javascript:alarmDeleteOne(\''+ response[i].alarmKey+'\''+'\,\''+'${path}/'+ response[i].alarmPath+'\');';
					   					   a.className='noteDeleteOne';		
					   					   a.id =  response[i].alarmKey;
					   					   
					   			          var spanTime = document.createElement('span');
					   			          spanTime.className = 'time';
					   				   	
					   					  // 예시 ISO 8601 날짜 문자열
					   					  const isoDateString = response[i].alarmDate; // 서버에서 받아온 ISO 8601 형식의 날짜 문자열
					
					   					   	// ISO 8601 문자열을 Date 객체로 변환
					   					  const date = new Date(isoDateString);
					
					   					  // Date 객체를 로컬 형식으로 변환하여 출력
					   					  const formattedDate = date.toLocaleString(); // 로컬 시간 형식으로 변환
					
					   					  // spanTime에 포맷된 날짜를 설정
					   					  spanTime.textContent = formattedDate + " ";
					   					   	
					   				      // Append the child elements
					   				      divIcon.appendChild(faIcon);
					   				      divContent.appendChild(spanBlock);
					  				          divContent.appendChild(spanTime);
					  				          a.appendChild(divIcon);
					  				          a.appendChild(divContent);
					   				   		
						   			      // alarmBox의 첫 번째 자식으로 추가
						   			      const alarmBox = document.getElementById('alarmBox');
						   			      alarmBox.insertBefore(a, alarmBox.firstChild);
											
										}
										
									   
									}//success end
								}); //ajax end
			               });   
			            }
			         );
					
		             var myChatRoomList;
		                $(document).ready(function() {
		            	     event.stopPropagation();

		                         headerUnread();

		                   
		                       $('#messageDropdown').on('show.bs.dropdown', function() {
		                         event.stopPropagation(); 
		                           $.ajax({
		                               url: '${path}/chatRoom', 
		                               data: {
		                                   inputValue: '1' 
		                               },
		                               success: function(response) {

		                                   $('.notif-center').eq(0).html(response);


							                },
							                error: function(xhr, status, error) {
							                    var errorMessage = "Sorry but there was an error: " + xhr.status + " " + xhr.statusText;
							                    $("#messageContent").html(errorMessage);
							                }
							            });
							        });
							    });
							 		 
					 var headerUnread = ()=>{						 
						$.ajax({
							url:'${path}/headerUnread',
							type:'POST',
							data:{ memberKey:${loginMember.memberKey}},
							success:function(response){
				                $('.notification').eq(0).text(response);
								
							}
						});
					 }
				</script> 

                <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
                  <li
                    class="nav-item topbar-icon dropdown hidden-caret d-flex d-lg-none"
                  >
                    <a
                      class="nav-link dropdown-toggle"
                      data-bs-toggle="dropdown"
                      href="#"
                      role="button"
                      aria-expanded="false"
                      aria-haspopup="true"
                    >
                      <i class="fa fa-search"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-search animated fadeIn">
                      <form class="navbar-left navbar-form nav-search">
                        <div class="input-group">
                          <input
                            type="text"
                            placeholder="Search ..."
                            class="form-control"
                          />
                        </div>
                      </form>
                    </ul>
                  </li>
                  <li class="nav-item topbar-icon dropdown hidden-caret">
                    <a
                      class="nav-link dropdown-toggle"
                      href="#"
                      id="messageDropdown"
                      role="button"
                      data-bs-toggle="dropdown"
                      aria-haspopup="true"
                      aria-expanded="false"
                    >
                      <i class="fa fa-envelope"></i>
                  <span class="notification"></span>
                      
                    </a>
                    <ul class="dropdown-menu messages-notif-box animated fadeIn"
                      aria-labelledby="messageDropdown">
                      <li>
                        <div class="dropdown-title d-flex justify-content-between align-items-center">
                          메신저
                          <!-- <a href="#" class="small">Mark all as read</a> -->
                        </div>
                      </li>
                      <li>
                      <div id="messageContent">
                      <%--    <jsp:include page="${path }chatting/chatRoom.jsp"></jsp:include>                  --%>   
                    </div>
                         <div class="message-notif-scroll ">
                          <div class="notif-center">
                            
                          </div>
                        </div> 
                      </li>
                    </ul>
                  </li>
                  <li class="nav-item topbar-icon dropdown hidden-caret">
                    <a
                      class="nav-link dropdown-toggle"
                      href="#"
                      id="notifDropdown"
                      role="button"
                      data-bs-toggle="dropdown"
                      aria-haspopup="true"
                      aria-expanded="false"
                    >
                      <i class="fa fa-bell"></i>
                      <span class="notification">4</span>
                    </a>
                    <ul
                      class="dropdown-menu notif-box animated fadeIn"
                      aria-labelledby="notifDropdown"
                    >
                      <li>
                        <div class="dropdown-title">
                          읽지 않은 알람이 4개 있습니다.
                        </div>
                      </li>
                      <li>
                        <div class="notif-scroll scrollbar-outer" style="overflow: auto;" >
                          <div class="notif-center" id="alarmBox">
                           <!-- <a href="#">
                              <div class="notif-icon notif-secondary">
                                <i class="fa fa-file-invoice-dollar"></i>
                              </div>
                              <div class="notif-content">
                                <span class="block"> New user registered </span>
                                <span class="time">5 minutes ago</span>
                              </div>
                            </a>
							<a href="#">
	                          <div class="notif-icon notif-success">
	                            <i class="fa fa-envelope"></i>
	                          </div>
	                          <div class="notif-content">
	                            <span class="block"> New user registered </span>
	                            <span class="time">5 minutes ago</span>
	                          </div>
	                        </a>
							<a href="#">
	                          <div class="notif-icon notif-success">
	                            <i class="fa fa-envelope"></i>
	                          </div>
	                          <div class="notif-content">
	                            <span class="block"> New user registered </span>
	                            <span class="time">5 minutes ago</span>
	                          </div>
	                        </a>
							<a href="#">
	                          <div class="notif-icon notif-success">
	                            <i class="fa fa-envelope"></i>
	                          </div>
	                          <div class="notif-content">
	                            <span class="block"> New user registered </span>
	                            <span class="time">5 minutes ago</span>
	                          </div>
	                        </a>-->
                         
                          </div>
						 
                        </div>
                      </li>
                      <li>
                        <a class="see-all" href="javascript:alarmReadAll();"
                          ><span>전체 알림 읽음 처리<i class="fa fa-check ms-2" style="color: green; transform: translateY(2px);"></i></span>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="nav-item topbar-icon dropdown hidden-caret">
                    <a
                      class="nav-link"
                      data-bs-toggle="dropdown"
                      id="organ"
                      href="#"
                      data-bs-auto-close="outside"
                      aria-expanded="false"
                    >
                      <i class="fas fa-layer-group"></i>
                    </a>
                    <div class="dropdown-menu quick-actions animated fadeIn">
                      <div class="quick-actions-header">
                        <span class="title mb-1">사내 조직도</span>
                        <span class="subtitle op-7">부서별 조회</span>
                      </div>
                      
                      <div class="quick-actions-items" id="organcontainer"style="overflow: auto; width: 100%; max-height: 300px; padding: 0px; ">
                          
                      
                      </div>
                    </div>
                  </li>

                  <li class="nav-item topbar-user dropdown hidden-caret">
                    <a
                      class="dropdown-toggle profile-pic"
                      data-bs-toggle="dropdown"
                      href="#"
                      aria-expanded="false"
                    >
                      <div class="avatar-sm">
						<c:choose>
							<c:when test="${loginMember.memberProfileImage==null || loginMember.memberProfileImage=='basicPicture'}">
								<img
		                          src="${path}/resources/assets/img/unname.png"
		                          alt="..."
		                          class="avatar-img rounded-circle"
	
		                        />
						 	</c:when>
							<c:otherwise>
								<img
		                          src="assets/img/${loginMember.memberProfileImage}.jpg"
		                          alt="..."
		                          class="avatar-img rounded-circle"
		                        />
	
							</c:otherwise>	
						</c:choose>	

                      </div>
                      <span class="profile-username">
                        <span class="op-7">안녕하세요,</span>
                        <span class="fw-bold">${loginMember.memberName}님</span>
                      </span>
                    </a>
                    <ul class="dropdown-menu dropdown-user animated fadeIn">
                      <div class="dropdown-user-scroll scrollbar-outer">
                        <li>
                          <div class="user-box">
                            <div class="avatar-lg">
								<c:choose>
									<c:when test="${loginMember.memberProfileImage==null || loginMember.memberProfileImage=='basicPicture'}">
										<img
				                          src="${path}/resources/assets/img/unname.png"
				                          alt="..."
				                          class="avatar-img rounded-circle proContentImg"
				                        />
								 	</c:when>
									<c:otherwise>
										<img
				                          src="assets/img/${loginMember.memberProfileImage}.jpg"
				                          alt="..."
				                          class="avatar-img rounded-circle proContentImg"
				                        />

									</c:otherwise>	
								</c:choose>
                            </div>
                            <div class="u-text">
                              <h4>${loginMember.memberName} ${loginMember.jobName}</h4>
                              <p class="text-muted">${loginMember.departmentName}</p>
                              <a
                                href="${path}/member/mypage"
                                class="btn btn-info"
                                >My Page</a
                              >
                            </div>
                          </div>
                        </li>
                        <li>
                        <!--  <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="#">My Profile</a>
                          <a class="dropdown-item" href="#">My Balance</a>
                          <a class="dropdown-item" href="#">Inbox</a>
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="#">Account Setting</a>-->
                          <div class="dropdown-divider"></div>
						  <a class="dropdown-item" href="${path}/logout">Logout</a>
                        </li>
                      </div>
                    </ul>
                  </li>
                </ul>
              </div>
            </nav>
            <!-- End Navbar -->
            
            <script>
		
			<!-- 알람 이동 전 삭제 로직 -->
			
			function alarmDeleteOne(alarmKey, path){
				console.log(path);
				$.ajax({
					url:'${path}/alarmDeleteOne',
					type:'POST',
					data:{ memberKey:${loginMember.memberKey},
						   alarmKey: alarmKey
					},
					success:function(response){
						window.location.href = path;

					}
				});	
			}	
		
			<!-- 알람 전체 삭제 -->
			function alarmReadAll(){
				$.ajax({
					url:'${path}/alarmDeleteAll',
					type:'POST',
					data:{ memberKey:${loginMember.memberKey}},
					success:function(response){
						var alarmBox = document.getElementById('alarmBox');
						alarmBox.innerHTML = ''; // Clear innerHTML
						$('.notification').eq(1).text(0);
													
						$('.dropdown-title').eq(1).text("읽지 않은 알람이 "+0+"개 있습니다.");
					}
				});
			}	
				
			<!-- 알람 숫자 온로드 함수 -->		
			function onWindowLoadAlarmNum() {
					$.ajax({
						url:'${path}/alarmSelectAll',
						type:'POST',
						data:{ memberKey:${loginMember.memberKey}},
						success:function(response){
			                $('.notification').eq(1).text(response.length);
							$('.dropdown-title').eq(1).text("읽지 않은 알람이 "+response.length+"개 있습니다.");
						}
					});
		      }
	
	        // 알람 숫자 표기
	     	window.onload = onWindowLoadAlarmNum();
					  
            var stompClient = null;
            var userStatusMap = {};
            var totalUnread = 0;

            
            function updateTotalUnreadCount() {
                $('.notification').eq(0).text(totalUnread);
            }

         
          function setConnected(connected) {
              $("#connect").prop("disabled", connected);
              $("#disconnect").prop("disabled", !connected);
              if (connected) {
                  $("#conversation").show();
              }
              else {
                  $("#conversation").hide();
              }
              $("#greetings").html("");
          }
            
            function connect() {
            	//socket 설정
		        let socket = new SockJS('${path}/ws-stomp');
		        stompClient = Stomp.over(socket);
		        stompClient.connect({"token" : "발급받은 토큰" }, function (frame) {
		            setConnected(true);
		            console.log('Connected: ' + frame);
		            
		            myChatRoomList.forEach(function(room) {
		                var roomId = room.chatRoomKey;
		                stompClient.subscribe('/room/' + roomId, function() {
					 		headerUnread();
		                });
		            });
	
		            
		            
		            var divIcon = null;
		            var faIcon = null;
		            var divContent = null;
		            var spanBlock = null;
		            //알람 종류 분기정
		            function handleNotification(bodyObject) {
		            	switch (bodyObject.alarmType) {
		                case 'Note':
		                    $.notify({
		                        icon: 'icon-bell',
		                        title: '쪽지가 도착했습니다',
		                        message: bodyObject.memberName + " " + bodyObject.jobName + "님께서 쪽지를 보내셨습니다."
		                    }, {
		                        type: 'primary',
		                        placement: {
		                            from: "bottom",
		                            align: "right"
		                        },
		                        time: 1000
		                    });
		                    
		                    
		                  //쪽지 알람 목록 출력 디자인
						  divIcon = document.createElement('div');
	   			          divIcon.className = 'notif-icon notif-success';

	   			          faIcon = document.createElement('i');
	   			          faIcon.className = 'fa fa-envelope';

	   			          divContent = document.createElement('div');
	   			          divContent.className = 'notif-content';

	   			          spanBlock = document.createElement('span');
	   			          spanBlock.className = 'block';
	   			          spanBlock.textContent = bodyObject.memberName+" "+bodyObject.memberName +'님의 쪽지';
	   			  		  spanBlock.style.fontSize = '11px'; // 원하는 폰트 크기로 설정
		                    
		                    
		                    break;

		                case 'DocReferer':
		                    $.notify({
		                        icon: 'icon-bell',
		                        title: '참조문서가 도착하였습니다.',
		                        message: bodyObject.memberName + " " + bodyObject.jobName + '님이 작성한 참조문서 1건이 도착하였습니다'
		                    }, {
		                        type: 'primary',
		                        placement: {
		                            from: "bottom",
		                            align: "right"
		                        },
		                        time: 1000
		                    });
		                    
		                    //참조문서 알람 목록 출력 디자인
							divIcon = document.createElement('div');
	   			          	divIcon.className = 'notif-icon notif-primary';

	   			          	faIcon = document.createElement('i');
	   			         	faIcon.className = 'fa fa-book';

		   			        divContent = document.createElement('div');
		   			        divContent.className = 'notif-content';
	
	   			          	spanBlock = document.createElement('span');
	   			            spanBlock.className = 'block';
	   			            spanBlock.textContent = bodyObject.memberName+" "+bodyObject.jobName +'님이 작성한 참조문서 1건이 도착하였습니다';
	   			  		    spanBlock.style.fontSize = '11px'; // 원하는 폰트 크기로 설정
		                    
		                    break;

		                case 'DocAprover':
		                    $.notify({
		                        icon: 'icon-bell',
		                        title: '결재 대기 문서가 도착하였습니다.',
		                        message: bodyObject.memberName + " " + bodyObject.jobName + '님이 작성한 문서가 결재 대기중입니다.'
		                    }, {
		                        type: 'primary',
		                        placement: {
		                            from: "bottom",
		                            align: "right"
		                        },
		                        time: 1000
		                    });
		                    
			                  //결재 대기 문서 알람 목록 출력 디자인
							  divIcon = document.createElement('div');
		   			          divIcon.className = 'notif-icon notif-primary';
	
		   			          faIcon = document.createElement('i');
		   			          faIcon.className = 'fa fa-book';
	
		   			          divContent = document.createElement('div');
		   			          divContent.className = 'notif-content';
	
		   			          spanBlock = document.createElement('span');
		   			          spanBlock.className = 'block';
		   			          spanBlock.textContent = bodyObject.memberName+" "+bodyObject.jobName +'님이 작성한 문서가 결재 대기중입니다.';
		   			  		  spanBlock.style.fontSize = '11px'; // 원하는 폰트 크기로 설정
		                    
		                    break;
		                case 'DocComplete':
		                    $.notify({
		                        icon: 'icon-bell',
		                        title: '기안한 문서가 승인되었습니다.',
		                        message: '문서 번호 : ' + bodyObject.docSerialKey + '  승인 완료'
		                    }, {
		                        type: 'primary',
		                        placement: {
		                            from: "bottom",
		                            align: "right"
		                        },
		                        time: 1000
		                    });
		                    
			                  //결재 대기 문서 알람 목록 출력 디자인
							  divIcon = document.createElement('div');
		   			          divIcon.className = 'notif-icon notif-primary';
	
		   			          faIcon = document.createElement('i');
		   			          faIcon.className = 'fa fa-book';
	
		   			          divContent = document.createElement('div');
		   			          divContent.className = 'notif-content';
	
		   			          spanBlock = document.createElement('span');
		   			          spanBlock.className = 'block';
		   			          spanBlock.textContent = '문서 번호 : ' + bodyObject.docSerialKey + '  승인 완료';
		   			  		  spanBlock.style.fontSize = '11px'; // 원하는 폰트 크기로 설정
		                    
		                    break;
		   			  		  
		                default:
		                    console.error('Unknown alarm type:', bodyObject.alarmType);
		                    break;
		            	}
		            
		            }
		            
		            stompClient.subscribe('/sub/${loginMember.memberKey}', function (msg) {
		                console.log('구독 중', msg);
		                var bodyObject= JSON.parse(msg.body);
		                console.log('test'+bodyObject.message);
		                
		              	//분기별 디자인 진행
						handleNotification(bodyObject);
		                
	              		//공통 디자인
					   // Step 1: Extract the current number from the element
			           var notificationText = $('.notification').eq(1).text();
			           var currentCount = parseInt(notificationText, 10);

			           // Step 2: Perform the desired operation (e.g., increment by 1)
			           var updatedCount = currentCount + 1; // Or currentCount - 1 for decrement

			           // Step 3: Update the elements with the new value
			           $('.notification').eq(1).text(updatedCount);

			           var dropdownTitle = $('.dropdown-title').eq(1).text();
			           var newDropdownTitle = dropdownTitle.replace(/\d+/, updatedCount);
			           $('.dropdown-title').eq(1).text(newDropdownTitle);
					   
					   var a = document.createElement('a');
   			           a.href = 'javascript:alarmDeleteOne(\''+ bodyObject.alarmKey+'\''+'\,\''+'${path}/'+ bodyObject.alarmPath+'\');';
   					   a.className='noteDeleteOne';		
   					   a.id =  bodyObject.alarmKey;
	   					  
	   			          

   			          var spanTime = document.createElement('span');
   			          spanTime.className = 'time';
   				   	
   					  // 예시 ISO 8601 날짜 문자열
   					  const isoDateString = bodyObject.alarmDate; // 서버에서 받아온 ISO 8601 형식의 날짜 문자열

   					   	// ISO 8601 문자열을 Date 객체로 변환
   					  const date = new Date(isoDateString);

   					  // Date 객체를 로컬 형식으로 변환하여 출력
   					  const formattedDate = date.toLocaleString(); // 로컬 시간 형식으로 변환

   					  // 또는 직접 포맷하여 사용할 수 있습니다.
   					  const year = date.getFullYear();
   					  const month = (date.getMonth() + 1).toString().padStart(2, '0');
   					  const day = date.getDate().toString().padStart(2, '0');
   					  const hours = date.getHours().toString().padStart(2, '0');
   					  const minutes = date.getMinutes().toString().padStart(2, '0');
   					  const seconds = date.getSeconds().toString().padStart(2, '0');
   					  const customFormattedDate = `\${year}-\${month}-\${day} \${hours}:\${minutes}:\${seconds}`;

   					  // spanTime에 포맷된 날짜를 설정
   					  spanTime.textContent = customFormattedDate + " ";
   					   	
   				      // Append the child elements
   				      divIcon.appendChild(faIcon);
   				      divContent.appendChild(spanBlock);
  				          divContent.appendChild(spanTime);
  				          a.appendChild(divIcon);
  				          a.appendChild(divContent);
   				   		
	   			      // alarmBox의 첫 번째 자식으로 추가
	   			      const alarmBox = document.getElementById('alarmBox');
	   			      alarmBox.insertBefore(a, alarmBox.firstChild);
		                
		            });
		            
		            
		            stompClient.subscribe('/sub/broadcast', function (msg) {
		                console.log('구독 중', msg);
						var bodyObject= JSON.parse(msg.body);
						//분기별 디자인 진행
						handleNotification(bodyObject);
			            
		               //공통 디자인
					   // Step 1: Extract the current number from the element
			           var notificationText = $('.notification').eq(1).text();
			           var currentCount = parseInt(notificationText, 10);

			           // Step 2: Perform the desired operation (e.g., increment by 1)
			           var updatedCount = currentCount + 1; // Or currentCount - 1 for decrement

			           // Step 3: Update the elements with the new value
			           $('.notification').eq(1).text(updatedCount);

			           var dropdownTitle = $('.dropdown-title').eq(1).text();
			           var newDropdownTitle = dropdownTitle.replace(/\d+/, updatedCount);
			           $('.dropdown-title').eq(1).text(newDropdownTitle);
					   
					   var a = document.createElement('a');
   			           a.href = 'javascript:alarmDeleteOne(\''+ bodyObject.alarmKey+'\''+'\,\''+'${path}/'+ bodyObject.alarmPath+'\');';
   					   a.className='noteDeleteOne';		
   					   a.id =  bodyObject.alarmKey;
	   					  
	   			          

   			          var spanTime = document.createElement('span');
   			          spanTime.className = 'time';
   				   	
   					  // 예시 ISO 8601 날짜 문자열
   					  const isoDateString = bodyObject.alarmDate; // 서버에서 받아온 ISO 8601 형식의 날짜 문자열

   					   	// ISO 8601 문자열을 Date 객체로 변환
   					  const date = new Date(isoDateString);

   					  // Date 객체를 로컬 형식으로 변환하여 출력
   					  const formattedDate = date.toLocaleString(); // 로컬 시간 형식으로 변환

   					  // 또는 직접 포맷하여 사용할 수 있습니다.
   					  const year = date.getFullYear();
   					  const month = (date.getMonth() + 1).toString().padStart(2, '0');
   					  const day = date.getDate().toString().padStart(2, '0');
   					  const hours = date.getHours().toString().padStart(2, '0');
   					  const minutes = date.getMinutes().toString().padStart(2, '0');
   					  const seconds = date.getSeconds().toString().padStart(2, '0');
   					  const customFormattedDate = `\${year}-\${month}-\${day} \${hours}:\${minutes}:\${seconds}`;

   					  // spanTime에 포맷된 날짜를 설정
   					  spanTime.textContent = customFormattedDate + " ";
   					   	
   				      // Append the child elements
   				      divIcon.appendChild(faIcon);
   				      divContent.appendChild(spanBlock);
  				          divContent.appendChild(spanTime);
  				          a.appendChild(divIcon);
  				          a.appendChild(divContent);
   				   		
	   			      // alarmBox의 첫 번째 자식으로 추가
	   			      const alarmBox = document.getElementById('alarmBox');
	   			      alarmBox.insertBefore(a, alarmBox.firstChild);
						 
		            });
		            
		            stompClient.subscribe('/user/queue/users', function (message) {
		                 var users = JSON.parse(message.body);


	                      for (var username in users) {
	                          if (users.hasOwnProperty(username) && username !== '${loginMember.memberId}') { // 본인의 상태는 업데이트하지 않음
	                              userStatusMap[username] = users[username];
	                              updateUserStatus(username, users[username]);
	                          }
	                      }
                  	 });
              });
          }
            function updateUserStatus(username, isOnline) {
                var statusDot = document.getElementById('status-dot-' + username);
                
                console.log(statusDot);
                 if (!statusDot) {
                    console.log('status-dot element not found for user: ' + username);
                    return;
                } 

                statusDot.className = 'status-dot ' + (isOnline ? 'online' : 'offline');
            }
            
            function disconnect() {
              if (stompClient !== null) {
                  stompClient.disconnect();
              }
              setConnected(false);
              console.log("Disconnected");
          }
         
          window.onload = function () {
             console.log("---=-=-=-=-=-=");

             $.ajax({
                url:'${path}/myChatRoomList',
                data:{memberKey:'${loginMember.memberKey}'},
                type:'POST',
                success:function(response){
                   console.log(response+"---=-=-=-=-=-=");
                   myChatRoomList = response;
                   connect();
                }
             })
             
              
          }

          window.onbeforeunload = function () {
              disconnect();
          }
          
            
            </script>
            
          </div>
          