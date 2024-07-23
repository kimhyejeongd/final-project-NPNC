<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication var="loginMember" property="principal"/>

    
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    
    

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<style>
	.unread-badge {
		background-color: red;
		color: white;
		border-radius: 50%;
		display: inline-block;
		padding: 2px 6px;
		font-size: 0.8em;
		font-weight: bold;
		position: absolute;
		top: 5px;
		right: 5px;
		display: none; /* ê¸°ë³¸ì ì¼ë¡ ì¨ê¹ ì²ë¦¬ */
	}
	
	.room-item {
		position: relative;
	}
	/* ê¸°ë³¸ ì¤íì¼ */
	.roomForm {
		display: flex;
	}
	
	/* body {
		font-family: 'Arial', sans-serif;
		background-color: #f0f0f0;
		margin: 0;
		padding: 0;
		display: flex;
		justify-content: center;
		align-items: flex-start; /* ìì : ììë ì¤í¬ë¡¤ ê°ë¥íê² */
		min-height: 100vh; /* ì¶ê°: íë©´ í¬ê¸° ìµì ëì´ */
	} */
	
	.container {
		background-color: #fff;
		border-radius: 10px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		width: 400px;
		max-width: 100%;
		margin: 20px 0; /* ì¶ê°: ìí ë§ì§ */
	}
	
	.header {
		background-color: #4CAF50;
		color: #fff;
		padding: 15px;
		text-align: center;
		font-size: 1.5em;
	}
	
	.tabs {
		display: flex;
		justify-content: space-around;
		margin: 20px 0;
		position: relative;
	}
	
	.tab {
		padding: 10px 20px;
		cursor: pointer;
	}
	
	.tab.active {
		background-color: #4CAF50;
		color: white;
		border-radius: 10px;
	}
	
	.menu-button {
		background-color: transparent;
		border: none;
		cursor: pointer;
		font-size: 1.5em;
		
	}
	
	.dropdown-menu {
		display: none;
		position: absolute;
		right: 0;
		top: 40px;
		background-color: white;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		border-radius: 5px;
		overflow: hidden;
		z-index: 1;
	}
	
	.dropdown-menu a {
		display: block;
		padding: 10px 20px;
		text-decoration: none;
		color: black;
	}
	
	.dropdown-menu a:hover {
		background-color: #f0f0f0;
	}
	
	.friend-list, .room-list {
		list-style-type: none;
		padding: 0;
		margin: 0;
	}
	
	.friend-item, .room-item {
		display: flex;
		align-items: center;
		padding: 15px;
		border-bottom: 1px solid #eee;
		transition: background-color 0.3s;
	}
	
	.friend-item img, .room-item img {
		width: 50px;
		height: 50px;
		border-radius: 50%;
		margin-right: 15px;
		object-fit: cover;
	}
	
	.friend-item .friend-info, .room-item .room-info {
		flex: 1;
		display: flex;
		flex-direction: column;
		overflow: hidden;
	}
	
	.friend-item .friend-name, .room-item {
		font-weight: bold;
		font-size: 1.1em;
		color: #333;
		margin-bottom: 5px;
		display: block;
	}
	
	.room-title {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	
	.friend-item .friend-status, .room-item .recent-message {
		color: #777;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	
	.friend-item.selected {
		background-color: #3a3f3e4d; /* ì í ì ë°°ê²½ìì ê²ì ì¼ë¡ ì¤ì  */
	}
	
	.content {
		display: none;
	}
	
	.content.active {
		display: block;
	}
	/* ëª¨ë¬ ì¤íì¼ */
	.modal {
		display: none;
		position: fixed;
		z-index: 2;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgba(0, 0, 0, 0.4);
		justify-content: center;
		align-items: center;
	}
	
	.modal-content {
		background-color: #fff;
		margin: auto;
		padding: 20px;
		border: 1px solid #888;
		width: 80%;
		max-width: 500px;
		border-radius: 10px;
	}
	
	.close {
		color: #aaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}
	
	.close:hover, .close:focus {
		color: black;
		text-decoration: none;
		cursor: pointer;
	}
	
	.search-bar {
		width: 80%; /* ìë ¥ íëì ëë¹ë¥¼ ì¤ìëë¤ */
		margin: 10px auto 20px; /* ì, ìë ì¬ë°±ê³¼ ìë ì¸ë¶ ì¬ë°±ì¼ë¡ ì¤ì ì ë ¬ */
		padding: 8px 10px; /* í¨ë©ì ì¡°ì íì¬ ìë ¥ íëì ëì´ë¥¼ ì¡°ê¸ ì¤ìëë¤ */
		box-sizing: border-box;
		border-radius: 5px;
		border: 1px solid #ccc;
		display: block; /* íëë¥¼ ë¸ë¡ ììë¡ ë§ë¤ì´ ì¤ ì ì²´ ì¬ì© */
	}
	
	.modal-content {
		width: 300px; /* ëª¨ë¬ ëë¹ ì¡°ì  */
		padding: 20px;
		border-radius: 10px;
		text-align: center;
	}
	
	.profile-info {
		margin-top: 20px;
	}
	
	.profile-image {
		width: 100px;
		height: 100px;
		border-radius: 50%;
		margin-bottom: 10px;
	}
	
	.profile-name, .profile-department {
		font-size: 16px;
		color: #333;
	}
	
	.start-chat-btn {
		padding: 10px 20px;
		background-color: #4CAF50;
		color: white;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		margin-top: 15px;
	}
	
	.start-chat-btn:hover {
		background-color: #45a049;
	}
	</style>
	<style>
	.list-group-item{
			display: flex;
			flex-direction: row;
		justify-content: space-between;
	}
</style>
<!--이성록 모달 팝업 스타일 -->
	<style>
			h2{
    			text-align: center;
			}
			
			
			/*모달 팝업 영역 스타일링*/
			.modal1 {
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
			.modal1 .modal_popup1 {
			/*팝업*/
			    position: relative;
			    top: 50%;
			    left: 50%;
			    width:40%;
			    transform: translate(-50%, -50%);
			    padding: 20px;
			    background: #ffffff;
			    border-radius: 20px;
			}
			.modal1 .modal_popup1 .close_btn1 {
			  /*   display: block; */
			    padding: 10px 20px;
			    background-color: rgb(116, 0, 0);
			    border: none;
			    border-radius: 5px;
			    color: #fff;
			    cursor: pointer;
			    transition: box-shadow 0.2s;
			}
			.modal1.on1 {
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
              class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom"
            >
              <div class="container-fluid">
                <nav
                  class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
                >
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <button type="submit" class="btn btn-search pe-1">
                        <i class="fa fa-search search-icon"></i>
                      </button>
                    </div>
                    <input
                      type="text"
                      placeholder="Search ..."
                      class="form-control"
                    />
                  </div>
                </nav>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

				 <script type="text/javascript">
				 var myChatRoomList=null;
					 $(document).ready(function() {
	
						 		headerUnread();

						 
					        $('#messageDropdown').on('show.bs.dropdown', function() {
			                event.stopPropagation(); // Ã¬ÂÂ´Ã«Â²Â¤Ã­ÂÂ¸ Ã«Â²ÂÃ«Â¸ÂÃ«Â§Â Ã«Â°Â©Ã¬Â§Â
					            $.ajax({
					                url: '${path}/chatRoom', // Ã¬ÂÂ¬ÃªÂ¸Â° URLÃ¬ÂÂ Ã¬Â ÂÃ¬Â ÂÃ­ÂÂÃªÂ²Â Ã¬ÂÂÃ¬Â ÂÃ­ÂÂ´Ã¬ÂÂ¼ Ã­ÂÂ©Ã«ÂÂÃ«ÂÂ¤.
					                type: 'GET',
					                data: {
					                    inputValue: '1' // Ã­ÂÂÃ¬ÂÂÃ­ÂÂ Ã­ÂÂÃ«ÂÂ¼Ã«Â¯Â¸Ã­ÂÂ°Ã«Â¥Â¼ Ã¬ÂÂ¬ÃªÂ¸Â°Ã¬ÂÂ Ã¬Â ÂÃ«ÂÂ¬Ã­ÂÂ©Ã«ÂÂÃ«ÂÂ¤.
					                },
					                success: function(response) {

					                    $('.notif-center').eq(0).html(response);
					                    console.log(response);

					                },
					                error: function(xhr, status, error) {
					                    var errorMessage = "Sorry but there was an error: " + xhr.status + " " + xhr.statusText;
					                    $("#messageContent").html(errorMessage);
					                }
					            });
					        });
					    });
					 $(document).ready(
					            function(){
					               $("#organ").on('show.bs.dropdown', function(){
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
						<span class="notification">4</span>
                      
                    </a>
                    <ul class="dropdown-menu messages-notif-box animated fadeIn"
                      aria-labelledby="messageDropdown">
                      <li>
                        <div class="dropdown-title d-flex justify-content-between align-items-center">
                          Messages
                          <a href="#" class="small">Mark all as read</a>
                        </div>
                      </li>
                      <li>
                      <div id="messageContent">
          				<%-- 	<jsp:include page="${path }chatting/chatRoom.jsp"></jsp:include> 			        --%>   
				        </div>
                         <div class="message-notif-scroll ">
                          <div class="notif-center">
                            
                          </div>
                        </div> 
                      </li>
                      <li>
                        <a class="see-all" href="javascript:void(0);"
                          >See all messages<i class="fa fa-angle-right"></i>
                        </a>
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
                        <div class="notif-scroll scrollbar-outer" style="overflow: auto;">
                          <div class="notif-center">
                            <a href="#">
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
	                        </a>
                         
                          </div>
                        </div>
                      </li>
                      <li>
                        <a class="see-all" href="javascript:void(0);"
                          >See all notifications<i class="fa fa-angle-right"></i>
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
                        <img
                          src="assets/img/profile.jpg"
                          alt="..."
                          class="avatar-img rounded-circle"
                        />
                      </div>
                      <span class="profile-username">
                        <span class="op-7">Hi,</span>
                        <span class="fw-bold">Hizrian</span>
                      </span>
                    </a>
                    <ul class="dropdown-menu dropdown-user animated fadeIn">
                      <div class="dropdown-user-scroll scrollbar-outer">
                        <li>
                          <div class="user-box">
                            <div class="avatar-lg">
                              <img
                                src="assets/img/profile.jpg"
                                alt="image profile"
                                class="avatar-img rounded"
                              />
                            </div>
                            <div class="u-text">
                              <h4>Hizrian</h4>
                              <p class="text-muted">hello@example.com</p>
                              <a
                                href="profile.html"
                                class="btn btn-xs btn-secondary btn-sm"
                                >View Profile</a
                              >
                            </div>
                          </div>
                        </li>
                        <li>
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="#">My Profile</a>
                          <a class="dropdown-item" href="#">My Balance</a>
                          <a class="dropdown-item" href="#">Inbox</a>
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="#">Account Setting</a>
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="#">Logout</a>
                        </li>
                      </div>
                    </ul>
                  </li>
                </ul>
              </div>
            </nav>
            <!-- End Navbar -->
            
            <script>
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
		        let socket = new SockJS('http://localhost:8080/ws-stomp');
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
	
		            
		            stompClient.subscribe('${path}/sub/${loginMember.memberKey}', function (msg) {
		                console.log('구독 중', msg);/* 얘가 깨져요 얘 구독중이 깨져요  */
		                var bodyObject= JSON.parse(msg.body);
		                console.log('test'+bodyObject.message);
		                
		             	$.notify({
				   		 	icon: 'icon-bell',
				   		 	title: '쪽지가 도착했습니다', /* 얘가 깨져요 얘 */
				   		 	message: bodyObject.message /* 얘는 안깨져요 */
				   		 },{
				   		 	type: 'primary',
				   		 	placement: {
				   		 		from: "bottom",
				   		 		align: "right"
				   		 	},
				   		 	time: 1000,
				   		 });
						 
						 
						 <a href="#">
                          <div class="notif-icon notif-success">
                            <i class="fa fa-envelope"></i>
                          </div>
                          <div class="notif-content">
                            <span class="block"> new user registered </span>
                            <span class="time">5 minutes ago</span>
                          </div>
                        </a>
		            });
		            stompClient.subscribe('${path}/sub/broadcast', function (msg) {
		                console.log('구독 중', msg);
						
						var bodyObject= JSON.parse(msg.body);
							                console.log('test'+bodyObject.message);
							                
							             	$.notify({
									   		 	icon: 'icon-bell',
									   		 	title: '쪽지가 도착했습니다', /* 얘가 깨져요 얘 */
									   		 	message: bodyObject.alarmSendMember+"님께서 쪽지를 보내셨습니다." /* 얘는 안깨져요 */
									   		 },{
									   		 	type: 'primary',
									   		 	placement: {
									   		 		from: "bottom",
									   		 		align: "right"
									   		 	},
									   		 	time: 1000,
									   		 });
		            });
		            
		            stompClient.subscribe('/user/queue/users', function (message) {
		                var users = JSON.parse(message.body);

		                for (var username in users) {
		                    if (users.hasOwnProperty(username) && username !== '${loginMember.memberKey}') { // 본인의 상태는 업데이트하지 않음
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
                    console.error('status-dot element not found for user: ' + username);
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
		 			}
		 		})
		 		
		        connect();
		    }

		    window.onbeforeunload = function () {
		        disconnect();
		    }
		    
            
            </script>
            
          </div>
          