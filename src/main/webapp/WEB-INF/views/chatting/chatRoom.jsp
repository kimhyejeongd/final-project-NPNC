<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication var="loginMember" property="principal"/>

<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html lang="en">
<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>친구 목록</title>
<style>
#conversation {
	flex: 1;
	border: 1px solid #ccc;
	border-radius: 10px;
	padding: 10px;
	overflow: hidden; /* 스크롤바 숨김 */
	background-color: #fff;
}

#chatting {
	display: flex;
	flex-direction: column;
	gap: 10px;
	height: 100%; /* 부모 요소 크기에 맞추기 */
}
.unread-badge {
	background-color: red;
	color: white;
	border-radius: 50%;
	display: inline-block;
	padding: 0px 6px;
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


.container1 {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 400px;
	max-width: 100%;
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
	position: relative;
	margin-bottom: 5px;
	margin-top: 5px;
}

.tab {
	padding: 5px 20px;
	cursor: pointer;
}

.tab.active {
	background-color: #1572e8;
	color: white;
}

.menu-button {
	background-color: transparent;
	border: none;
	cursor: pointer;
	font-size: 1.5em;
	position: relative;
	left: 230px;	
}

.dropdown-menu1 {
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

.dropdown-menu1 a {
	display: block;
	padding: 10px 20px;
	text-decoration: none;
	color: black;
}

.dropdown-menu1 a:hover {
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
    height: 26px;

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
	background-color: #1472e8;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 15px;
}

.start-chat-btn:hover {
	background-color: #4d8fed;
}

body{
 overflow-style: none;
 }
</style>
</head>
<body >
	<div id="profileModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<h2>프로필 정보</h2>
			<div class="profile-info">
				<img src="" alt="프로필 이미지" class="profile-image">
				<p class="profile-name"></p>
				<p class="profile-department"></p>
				<button type="button" class="start-chat-btn">채팅 시작</button>
			</div>
		</div>
	</div>
	
	

	<div class="container1">
			<button class="menu-button">&#9776;</button>
			<div class="dropdown-menu1">
				<a href="#" id="newChatButton">새로운 채팅</a>
			</div>
 		<div class="tabs">
			<div class="tab" data-tab="contacts">연락처</div>
			<div class="tab active" data-tab="chat">채팅</div>
		</div> 
		<div id="contacts" class="content">
			<input type="text" id="searchFriend" class="search-bar"
				placeholder="친구 검색...">

			<ul class="friend-list">
				<c:forEach var="m" items="${members}">
					<c:if test="${m.memberId != loginMember.memberId}">
						<li class="friend-item" data-member-no="${m.memberKey}"><img
							src="profile1.jpg" alt="프로필 사진">
							<div class="friend-info">
								<div class="friend-name">${m.memberId}</div>
								<div class="friend-status">${m.departmentName }</div>
							</div></li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
		<div id="chat" class="content active">
			<ul class="room-list" id="roomList">
				<c:forEach var="room" items="${mychatRoomList}">
					<li class="room-item" id="room-${room.chatRoomKey}">
						<form class="roomForm" method="post" action="${path}/chat">
							<input type="hidden" name="roomId" value="${room.chatRoomKey}">
							<img src="room_icon.jpg" alt="방 아이콘">
								<div class="unread-badge" id="unread-${room.chatRoomKey}">0</div>
							<!-- 안 읽은 메시지 배지 추가 -->
							<div class="room-info">
								<div class="room-title">
									<c:forEach var="member"
										items="${myRoomMemberList[room.chatRoomKey]}">

                                        ${member.memberName}
                                    </c:forEach>
								</div>
								<div class="recent-message recent-message-${room.chatRoomKey}"></div>
							</div>
						</form>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	


	<!-- 모달 -->
	<div id="newChatModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<h2>새로운 채팅</h2>
			<input type="text" id="searchUser" class="search-bar"
				placeholder="유저 검색">
			<ul class="friend-list" id="modalFriendList">
				<c:forEach var="m" items="${members}">
					<c:if test="${m.memberId != loginMember.memberId}">
						<li class="friend-item" data-member-no="${m.memberKey}"><img
							src="profile1.jpg" alt="프로필 사진">
							<div class="friend-info">
								<div class="friend-name">${m.memberId}</div>
								<div class="friend-status">부서이름</div>
							</div></li>
					</c:if>
				</c:forEach>
			</ul>
			<button type="button" id="createNewChatButton">채팅방 만들기</button>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">

    //친구검색기능
    $('#searchFriend').on('input', function() {
        var searchValue = $(this).val().toLowerCase();
        $('#contacts .friend-list .friend-item').filter(function() {
            $(this).toggle($(this).find('.friend-name').text().toLowerCase().indexOf(searchValue) > -1);
        });
    });
    
    
    $(document).ready(function() {
    var myChatRoomList = ${mychatRoomListJ}; 

        var selectedMembers = [];

        // 모달 열기
        $('#newChatButton').click(function() {
          	 event.stopPropagation(); 

            $('#newChatModal').show();
        });

        // 모달 닫기
        $('.close').click(function() {
          	 event.stopPropagation(); 

            $('#newChatModal').hide();
        });

        // 모달 외부 클릭 시 닫기
        $(window).click(function(event) {
         	 event.stopPropagation(); 

        	if ($(event.target).is('#newChatModal')) {
                $('#newChatModal').hide();
            } else if ($('.dropdown-menu1').is(':visible') && !$(event.target).closest('.menu-button, .dropdown-menu1').length) {
                $('.dropdown-menu1').hide();
            }
        });

        // 유저 검색
        $('#searchUser').on('input', function() {
            var searchValue = $(this).val().toLowerCase();
            $('#modalFriendList .friend-item').filter(function() {
                $(this).toggle($(this).find('.friend-name').text().toLowerCase().indexOf(searchValue) > -1)
            });
        });

        // 친구 선택
        $('#modalFriendList').on('click', '.friend-item', function() {
          	 event.stopPropagation(); 

            const memberNo = $(this).data('member-no');
            
            if ($(this).hasClass('selected')) {
                $(this).removeClass('selected');
                const index = selectedMembers.indexOf(memberNo);
                if (index > -1) {
                    selectedMembers.splice(index, 1);
                }
            } else {
                $(this).addClass('selected');
                selectedMembers.push(memberNo);
            }
            console.log(selectedMembers);
        });

        // 새로운 채팅방 만들기
        $('#createNewChatButton').click(function() {
          	 event.stopPropagation(); 

        	
            var form = $('<form>', {
                'method': 'post',
                'action': '${path}/chat'
            });

            // 선택한 멤버들을 히든 필드로 추가
            selectedMembers.forEach(function(memberNo) {
                $('<input>').attr({
                    'type': 'hidden',
                    'name': 'memberNo',
                    'value': memberNo
                }).appendTo(form);
            });

            // 히든 필드에 로그인한 사용자 ID 추가
            $('<input>').attr({
                'type': 'hidden',
                'name': 'memberNo',
                'value': '${loginMember.memberKey}'
            }).appendTo(form);

            // 폼을 body에 추가하고 전송
            form.appendTo('body').submit();

            // 폼 전송 후 히든 필드 제거
            form.find('input[type="hidden"]').remove();
        });
        
        
        $('.room-item').click(e=>{
        	e.stopPropagation();
        });
     // 채팅방 더블 클릭 시 채팅방 입장
        $('.room-item').dblclick(function() {

            var roomId = $(this).find('input[name="roomId"]').val();
            activeRoomId = roomId; // 활성화된 채팅방 ID 업데이트

            // 팝업 창의 옵션 설정
            var popupWidth = 400;
            var popupHeight = 520;
            var popupLeft = (screen.width - popupWidth) / 2;
            var popupTop = (screen.height - popupHeight) / 2;

            // 팝업 창 생성
            var popupOptions = 'width=' + popupWidth + ',height=' + popupHeight + ',left=' + popupLeft + ',top=' + popupTop;
            var popup = window.open('', 'chatPopup', popupOptions);

            // 폼 생성 및 전송
            var form = $('<form>', {
                'method': 'post',
                'action': '${path}/chat',
                'target': 'chatPopup'

            }).append($('<input>', {
                'type': 'hidden',
                'name': 'roomId',
                'value': roomId
            }));

            var unreadBadge = $("#unread-" + roomId);
            unreadBadge.hide();

            form.appendTo('body').submit();
        });

        // 탭 전환 기능
        $('.tab').click(function() {
          	 event.stopPropagation(); 

            var tabId = $(this).data('tab');

            // 모든 탭 비활성화
            $('.tab').removeClass('active');
            $('.content').removeClass('active');

            // 선택한 탭 및 콘텐츠 활성화
            $(this).addClass('active');
            $('#' + tabId).addClass('active');
        });

        // 메뉴 버튼 클릭 시 드롭다운 메뉴 표시/숨기기
        $('.menu-button').click(function() {
          	 event.stopPropagation(); 

            $('.dropdown-menu1').toggle();
        });

        // 페이지 로드 시 드롭다운 메뉴 숨기기
        $(document).click(function(event) {
          	 event.stopPropagation(); 

            if (!$(event.target).closest('.menu-button, .dropdown-menu1').length) {
                $('.dropdown-menu1').hide();
            }
        });
        
        // 채팅방 목록 초기화 및 구독
        $('.room-item').each(function() {

            var roomId = $(this).find('input[name="roomId"]').val();
            var recentMessageElement = $(this).find('.recent-message-' + roomId);
            subscribeToRoom(roomId, recentMessageElement);
            loadChat(roomId, recentMessageElement);
        });
        
     // 현재 웹소켓 세션을 저장할 변수 
        var currentSession = null;
        var activeRoomId = null; // 현재 활성화된 채팅방 ID 저장

        function subscribeToRoom(roomId, recentMessageElement) {
            var socket = new SockJS('${path}/ws-stomp');
            var stompClient = Stomp.over(socket);
            stompClient.connect({"type":"room","room":roomId,"loginMemberKey":${loginMember.memberKey}}, function(frame) {
                console.log('Connected to room ' + roomId + ': ' + frame);
                
                stompClient.subscribe('/roomSession/' + roomId, function(session) {

                    currentSession = JSON.parse(session.body);
                    console.log("Current session data: ", currentSession);
                    console.log("Current session data: ", Object.keys(currentSession.memberSessions));
                    Object.keys(currentSession.memberSessions).forEach((e)=> console.log(e));
                    console.log("Current session roomId: ", currentSession.roomId);
                    console.log("Current session data: ", '${loginMember.memberKey}');
                    console.log("Current session data: ", roomId);
                    

                });
                
                stompClient.subscribe('/room/' + roomId, function(chatMessage) {
                    var message = JSON.parse(chatMessage.body);
                    recentMessageElement.html(message.chatMsgDetail);

                    var roomItem = $("#room-" + roomId);
                    roomItem.prependTo("#roomList");
                    
                    console.log("==================")
                    	
                    if(currentSession != null){
	                    console.log(currentSession);
	                    console.log("=============currentSession================");
	                    console.log(currentSession.roomId);
	                    console.log(Object.keys(currentSession.memberSessions));
	                    deleteReadBadge(currentSession.roomId,Object.keys(currentSession.memberSessions));
                    }
                    
                    // loadChat 함수 호출하여 최신 메시지와 읽지 않은 메시지 배지 업데이트
                        loadChat(roomId, recentMessageElement);
                    
                });


          
            });
            
            
        }
        function deleteReadBadge(currRoomId,currMemberKey){
        	$.ajax({
        		url:'${path}/deleteReadBadge',
        		type:'POST',
        		data:{"currRoomId":currRoomId,"currMemberKey":currMemberKey}
        	})
        }
        function loadChat(chatRoomKey, recentMessageElement) {
            $.ajax({
                url: '${path}/loadRecentChat', // 서버 요청 URL
                type: 'POST',
                data: { chatRoomKey: chatRoomKey ,memberId: '${loginMember.memberKey}'},
                success: function(response) {
                    console.log(response + "===loadRecentChat======");
                    console.log(unreadCount)
                    var recentMessage = response.chats.length > 0 ? response.chats[response.chats.length-1].chatMsgDetail : '최근 메시지 없음';
                    if (recentMessage === '') {
                        recentMessage = '[파일]';
                    }
                    recentMessageElement.html(recentMessage);
                    
                    var unreadCount = response.unreadCount;
                    var unreadBadge = $("#unread-" + chatRoomKey);


                    unreadBadge.text(unreadCount); 
                    
                    if (unreadCount > 0) {
                        unreadBadge.show();
                    } else {
                        unreadBadge.hide();
                    }
                    updateTotalUnreadCount();

                },
                error: function(error) {
                    console.log("====에러 ====");
                }
            });
        }
        
        function updateTotalUnreadCount() {
            var totalUnread = 0;
            $('.unread-badge').each(function() {
                var unreadCount = parseInt($(this).text());
                if (!isNaN(unreadCount)) {
                    totalUnread += unreadCount;
                }
            });
            $('.notification').eq(0).text(totalUnread);
        }
    });



        // 친구 클릭 이벤트
        $('.friend-list').on('click', '.friend-item', function() {
          	 event.stopPropagation(); 

            var memberId = $(this).data('member-no');
            var memberName = $(this).find('.friend-name').text();
            var memberStatus = $(this).find('.friend-status').text();
            
            // 모달에 정보 설정 및 멤버 ID 저장
            $('#profileModal').data('member-id', memberId);
            $('#profileModal .profile-image').attr('src', 'profile_path/' + memberId + '.jpg');
            $('#profileModal .profile-name').text(memberName);
            $('#profileModal .profile-department').text(memberStatus);
            
            // 모달 표시
            $('#profileModal').show();
        });

        // "채팅 시작" 버튼 클릭 이벤트
        $('#profileModal .start-chat-btn').click(function() {
          	 event.stopPropagation(); 

            var memberId = $('#profileModal').data('member-id'); // 멤버 ID 저장
            var chatWindowUrl = '${path}/chat'; // 채팅 창 URL
            
            // 팝업 창의 옵션 설정
            var popupOptions = 'width=400,height=500,left=' + (screen.width - 400) / 2 + ',top=' + (screen.height - 500) / 2;

            // 팝업 창 생성
            var chatWindow = window.open(chatWindowUrl, 'chatWindow', popupOptions);

            // 폼 생성 및 전송
            var form = $('<form>', {
                'action': chatWindowUrl,
                'method': 'post',
                'target': 'chatWindow',
                'onsubmit': event.stopPropagation()
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
            $('#profileModal').hide();
        });

        // 모달 닫기 버튼
        $('#profileModal .close').click(function() {
          	 event.stopPropagation(); 

            $('#profileModal').hide();
        });

        // 모달 외부 클릭 시 닫기
        $(window).click(function(event) {
          	 event.stopPropagation(); 

            if ($(event.target).is('#profileModal')) {
                $('#profileModal').hide();
            }
        });
        
        





    </script>
</body>
</html>
