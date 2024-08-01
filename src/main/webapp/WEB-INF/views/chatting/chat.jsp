<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    

<c:set var="path" value="${pageContext.request.contextPath }"/>
<sec:authentication var="loginMember" property="principal"/>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
	<meta charset="UTF-8">
	<title>Chat Room</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
.avatar-img {
    float: left;
    margin-right: 10px; /* 이미지와 텍스트 사이의 간격 조정 */
}
.friend-item.selected {
    background-color: #e0e0e0;
}
.friend-item {
  list-style-type: none;

}

/* 초대 모달 스타일 */
#inviteModal .modal-content {
    width: 300px;
    padding: 20px;
    border-radius: 10px;
    text-align: center;
    position:
}
/* 초대 모달 스타일 */
.modal {
    display: none; /* 기본적으로 숨김 */
    position: fixed; /* 화면에 고정 */
    z-index: 1000; /* 다른 요소들보다 위에 표시 */
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto; /* 필요한 경우 스크롤 */
    background-color: rgba(0, 0, 0, 0.4); /* 반투명 배경 */
    justify-content: center;
    align-items: center;
    display: flex; /* 플렉스 박스 사용 */
}

.modal-content {
    background-color: #fff;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    max-width: 500px; /* 최대 너비 설정 */
    border-radius: 10px;
    text-align: center; /* 중앙 정렬 */
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}


    #charCount {
        margin-top: 5px;
        font-size: 0.9em;
        color: #777;
        text-align: right;
            margin-bottom: 4px;
        
    }
    #fileButton {
        background: none;
        border: none;
        cursor: pointer;
        font-size: 1.5em;
        margin-right: 10px;
    }
    #fileInput {
        display: none;
    }
        #message {
            flex: 1;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 10px 0 0 10px;
            outline: none;
            resize:none;
            
        }

#roomMemberList {
    list-style-type: none; /* Remove default bullets */
    padding: 0; /* Remove default padding */
    margin: 0; /* Remove default margin */
}

#roomMemberList li {
    padding: 10px;
    border-bottom: 1px solid #ddd; /* Add a bottom border */
}

#roomMemberList li:last-child {
    border-bottom: none; /* Remove the bottom border from the last item */
}
	.unreadCount {
    font-size: 0.75em;
    color: #FF0000;
    margin-top: 5px;
    text-align: right;
}
	
            #send {
            padding: 10px 20px;
            border: none;
            background-color: #1472e8;
            color: white;
            cursor: pointer;
            border-radius: 0 10px 10px 0;
        }
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        width: 100%;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        display: flex;
        flex-direction: column;
        height: 100vh;
    }
    .header {
        background-color: #1472e8;
        color: #fff;
        padding: 10px;
        text-align: center;
        font-size: 1.5em;
    }
        #conversation {
              flex: 1;
        border: 1px solid #ccc;
        border-radius: 10px;
        padding: 10px;
        overflow-y: scroll;
        background-color: #fff;
        }
    #chatting {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }
 
    
    .chat-input {
        display: flex;
        border-top: 1px solid #ddd;
        padding: 10px;
        flex-direction: column;
    }
    .chat-input input {
        flex-grow: 1;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 20px;
        margin-right: 10px;
        width: 40%
    }
    .chat-input button {
        border: none;
        background-color: #4CAF50;
        color: white;
        border-radius: 20px;
        cursor: pointer;
    }
    .chat-input button:hover {
        background-color: #45a049;
    }
    .message {
        display: flex;
    }
    .message.sent {
        justify-content: flex-end;
    }
    .message.received {
        justify-content: flex-start;
    }
    .bubble {
        padding: 10px 15px;
        border-radius: 20px;
        position: relative;
        font-size: 0.9em;
    }
    .bubble.sent {
        background-color: #4d93f761;
    }
    .bubble.received {
        background-color: #fff;
        border: 1px solid #ddd;
    }
    .bubble::after {
        content: '';
        position: absolute;
        width: 0;
        height: 0;
        border: 10px solid transparent;
    }
    .bubble.sent::after {
        right: -10px;
        top: 10px;
    }
    .bubble.received::after {
        left: -10px;
        top: 10px;
    }
    .sender {
        margin-bottom: 5px;
  		font-size: 14px;
    }
    .sendDate {
        font-size: 0.75em;
        color: #777;
        margin-top: 5px;
        text-align: right;
    }
    .sidebar {
    position: fixed;
    right: 0;
    top: 0;
    width: 250px;
    height: 100%;
    background: white;
    box-shadow: -2px 0 5px rgba(0,0,0,0.1);
    z-index: 100;
}

.menu-button {
    position: absolute;
    right: 10px;
    top: 10px;
    border: none;
    background: none;
    color: #fff;
    font-size: 24px;
    cursor: pointer;
}
     .exit-button {
            position: absolute;
            bottom: 20px;
            width: 90%;
            left: 5%; /* 중앙 정렬 */
            padding: 10px 0;
            text-align: center;
            background-color: #dc3545;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }
     .invite-button  {
            position: absolute;
            bottom: 68px;
            width: 90%;
            left: 5%; /* 중앙 정렬 */
            padding: 10px 0;
            text-align: center;
            background-color: #dc3545;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }
        /* 드래그 중 효과 스타일 추가 */
#message.dragover {
    border-color: #4CAF50;
    background-color: #f0fff0;
}
        

    
</style>
</head>
<body>
<div class="container" id="chat-container">

    <div class="header">채팅방</div>
    
    <!-- 메뉴 버튼 -->
    <button id="menuButton" class="menu-button">&#9776;</button>

    <div id="conversation">
        <div id="chatting">
            <!-- 채팅 내용이 여기에 추가됩니다 -->
        </div>
    </div>
    <div class="chat-input">
        <form id="chatForm">
        <div style="display:flex;     justify-content: space-between;">

	            	<i class="bi bi-file-earmark-arrow-up" id="fileButton" style="margin-right:0;"></i>					
		
            <div id="charCount">0/1000</div> <!-- 글자 수 표시 요소 추가 -->
        </div>
            <div style="display: flex">

			

	            <input type="file" id="fileInput">
	            <div style="diaplay:flex; flex-direction: column; width: 100vw;">
	                <div id="fileInfo" style="display: none; margin-left: 10px;">
	                	    <span id="fileName"></span>
    						<span class="remove-file" onclick="removeFile()">X</span>
	                </div> <!-- 파일 정보 표시 요소 추가 -->	  
	                <div style="display:flex;">
			            <textarea type="text" id="message" maxlength="1000" placeholder="메시지를 입력하세요"></textarea>
			            <button id="send">보내기</button>
	                </div>          
	            </div>
            </div>
        </form>
    </div>
</div>

<div class="sidebar" style="display:none;">
    <ul id="roomMemberList"></ul>
    <!-- 기타 메뉴 항목들 -->
    <div class="invite-button">초대하기</div>
    <div class="exit-button">나가기</div>
</div>
<!-- Invite Modal -->
<div id="inviteModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>유저 초대하기</h2>
        <input type="text" id="searchInviteUser" class="search-bar" placeholder="유저 검색">
        <ul class="friend-list" id="inviteFriendList">
            <c:forEach var="user" items="${allMembers}">
                <c:if test="${user.memberId != loginMember.memberId && !fn:contains(roomMemberKeys, user.memberKey)}">
                    <li class="friend-item" data-member-no="${user.memberKey}">
                        <img src="profile1.jpg" alt="프로필 사진">
                        <div class="friend-info">
                            <div class="friend-name">${user.memberName}</div>
                            <div class="friend-status">${user.departmentName}</div>
                        </div>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
        <button type="button" id="inviteSelectedUsersButton">초대</button>
    </div>
</div>



<script type="text/javascript">
var sessionCount = 0;

var stompClient = null;
var roomId = ${roomId};
var chatList = ${chatList};
var countRoomMember = ${countRoomMember};
var fileMetaData = null;

$('#fileButton').click(function() {
    $('#fileInput').click(); // fileInput 클릭을 트리거
});

$('#fileInput').on('change', function(event) {
    var file = event.target.files[0];
    if (file) {
        uploadFile(file);
    }
});

function uploadFile(file) {
    var formData = new FormData();
    formData.append('file', file);
    formData.append('chatId', roomId);
    formData.append('memberId', '${loginMember.memberKey}');
    
    $.ajax({
        url: '${path}/upload',
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
            fileMetaData = response;
        	console.log(fileMetaData.chatMsgFileOri);
            $('#fileName').text(fileMetaData.chatMsgFileOri); // 첫 번째 span에 파일 이름 설정
            $('#fileInfo').show(); // fileInfo 요소를 표시
            $('#fileInput').val('');
        },
        error: function(error) {
            console.error('파일 업로드 중 오류 발생:', error);
            alert('파일 업로드 중 오류 발생');
        }
    });
}

var messageTextarea = document.getElementById('message');

messageTextarea.addEventListener('dragover', function(event) {
    event.preventDefault();
    messageTextarea.classList.add('dragover');
});

messageTextarea.addEventListener('dragleave', function(event) {
    messageTextarea.classList.remove('dragover');
});

messageTextarea.addEventListener('drop', function(event) {
    event.preventDefault();
    messageTextarea.classList.remove('dragover');
    var file = event.dataTransfer.files[0];
    if (file) {
        uploadFile(file);
    }
});

function removeFile() {
    if (fileMetaData) {
        $.ajax({
            url: '${path}/deleteFile', // 파일 삭제를 처리하는 서버 엔드포인트
            type: 'POST',
            data: { filePath: fileMetaData.chatMsgFilePost },
            success: function(response) {
                console.log('파일 삭제 성공:', response);
                fileMetaData = null;

                // 파일 정보 숨기기
                $('#fileInfo').hide();
                $('#fileName').text(''); // 파일 이름 초기화
            },
            error: function(error) {
                console.error('파일 삭제 중 오류 발생:', error);
                alert('파일 삭제 중 오류 발생');
            }
        });
    }
}









$(document).ready(function() {
    $('#inviteModal').hide();

    // 초대 모달 열기
    $('.invite-button').click(function() {
        $('#inviteModal').show();
    });

    // 초대 모달 닫기
    $('#inviteModal .close').click(function() {
        $('#inviteModal').hide();
    });

    // 모달 외부 클릭 시 닫기
    $(window).click(function(event) {
        if ($(event.target).is('#inviteModal')) {
            $('#inviteModal').hide();
        }
    });

    // 유저 검색
    $('#searchInviteUser').on('input', function() {
        var searchValue = $(this).val().toLowerCase();
        $('#inviteFriendList .friend-item').filter(function() {
            $(this).toggle($(this).find('.friend-name').text().toLowerCase().indexOf(searchValue) > -1);
        });
    });

    // 유저 선택
    $('#inviteFriendList').on('click', '.friend-item', function() {
        $(this).toggleClass('selected');
    });

    // 초대 버튼 클릭 이벤트
    $('#inviteSelectedUsersButton').click(function() {
        var selectedUsers = $('#inviteFriendList .friend-item.selected').map(function() {
            return $(this).data('member-no');
        }).get();

        if (selectedUsers.length > 0) {
            $.ajax({
                url: '${path}/inviteToRoom',
                type: 'POST',
                data: {
                    roomId: roomId,
                    memberIds: selectedUsers
                },
                success: function(response) {
                	if (response>0){                		
	                    alert('유저를 성공적으로 초대했습니다.');

	                    // 선택된 유저들을 현재 유저 리스트에 추가
	                    selectedUsers.forEach(function(userNo) {
	                        var userName = $('#inviteFriendList .friend-item[data-member-no="' + userNo + '"]').find('.friend-name').text();
	                        $('#roomMemberList').append('<li>' + userName + '</li>');
	                    });

	                    // 선택된 유저들을 friend list에서 제거
	                    $('#inviteFriendList .friend-item.selected').remove();
	               
                	}
                },
                error: function(error) {
                    console.error('유저 초대 중 오류 발생:', error);
                    alert('유저 초대 중 오류 발생');
                }
            });
        } else {
            alert('초대할 유저를 선택하세요.');
        }
    });

	 var roomMembers = ${roomMembers}; // JSP EL을 사용하여 서버에서 받은 유저 리스트를 할당
     roomMembers.forEach(function(member) {
         $('#roomMemberList').append('<li>' + member.memberName + '</li>'); // 각 멤버 이름을 리스트 아이템으로 추가
     });
    // 메뉴 버튼 클릭 이벤트
    $('#menuButton').click(function() {
        $('.sidebar').toggle(); // 클래스 선택자로 변경
    });

    // 나가기 버튼 클릭 이벤트
$('.exit-button').click(function() {
    if (confirm('정말로 채팅방을 나가시겠습니까?')) {
        alert('채팅방에서 나갔습니다.');

        // AJAX 요청으로 폼 제출
        $.ajax({
            url: '${path}/exitChatRoom',
            type: 'POST',
            data: {
                roomId: roomId,
                memberKey: '${loginMember.memberKey}'
            },
            success: function(response) {
            	if (window.opener) {
                    window.opener.$('#room-' + roomId).remove();
                }
                // 성공적으로 제출된 후 창 닫기
                window.close();
                
            },
            error: function(error) {
                console.log('Error:', error);
            }
        });
    }
});

    // 외부 클릭 시 사이드바 닫기
    $(document).click(function(event) {
        if (!$(event.target).closest('#menuButton, .sidebar').length) {
            $('.sidebar').hide();
        }
    });
});



    function setConnected(connected) {
        if (connected) {
            $("#conversation").show();
        } else {
            $("#conversation").hide();
        }
        $("#message").html("");
        console.log(chatList);
    }

    function connect() {
        var socket = new SockJS('${path}/ws-stomp');
        stompClient = Stomp.over(socket);
        stompClient.connect({"type":"chat","room":roomId,"loginMemberKey":${loginMember.memberKey}}, function (frame) {
            setConnected(true);
            console.log('Connected: ' + frame);
            
            // 저장된 채팅 불러오기
            loadChat(chatList);

            // 세션 수 초기화
            console.log("getInitialSessionCount")
            getInitialSessionCount();

            updateUnreadCounts();
            
            // 구독
            stompClient.subscribe('/room/' + roomId, function (chatMessage) {
                showChat(chatMessage);
            });

            stompClient.subscribe("/room/" + roomId + "/sessionCount", function (message) {
                sessionCount = JSON.parse(message.body);
                console.log("Current chat session count: " + sessionCount);
                $("#chatSessionCount").text(sessionCount);

                updateUnreadCounts();
            });
        });
    }

    function disconnect() {
        if (stompClient !== null) {
            stompClient.disconnect();
        }
        setConnected(false);
        console.log("Disconnected");
    }

    function sendChat() {
        var message = $("#message").val();
        if (message.trim() === "" && fileMetaData === null) {
            return; // 입력값이 없으면 전송하지 않음
        }
        if (message.length > 1000) {
            alert('메시지는 1000자를 초과할 수 없습니다.');
            return ; // 전송을 막음
        }

        console.log(${roomMembers}.filter(m => m.memberKey != '${loginMember.memberKey}').map(m => m.memberKey));
        stompClient.send("/send/" + roomId, {},
            JSON.stringify({
                'chatRoomKey': roomId,
                'memberKey': '${loginMember.memberKey}', 
                'receiverKey': ${roomMembers}.filter(m => m.memberKey != '${loginMember.memberKey}').map(m => m.memberKey),
                'chatMsgDetail':  message.replace(/\n/g, '<br>'),
                'chatMsgTime': new Date().toISOString(),
                'file':fileMetaData,
                'memberName':'${loginMember.memberName}'
            }));
        $('#message').val('');
        $("#conversation").scrollTop($("#conversation")[0].scrollHeight); // 스크롤 맨 아래로 이동
        $('#charCount').text('0/1000'); 
        $('#fileInfo').hide().html(''); // 파일 정보 숨기기
        fileMetaData = null; // 파일 메타데이터 초기화
        

    }

    function getInitialSessionCount() {
        $.ajax({
            url: "${path}/room/" + roomId + "/sessionCount",
            method: "GET",
            success: function (count) {
                console.log("Initial chat session count: " + count);
                sessionCount = count;
                $("#chatSessionCount").text(count); 
            },
            error: function (error) {
                console.log("Error fetching initial chat session count:", error);
            }
        });
    }

    function formatDateTime(sqlDate) {
        var date = new Date(sqlDate);
        if (isNaN(date.getTime())) { // 유효하지 않은 날짜 처리
            return sqlDate;
        }
        var hours = date.getHours();
        var minutes = date.getMinutes();
        var period = hours >= 12 ? '오후' : '오전';
        hours = hours % 12;
        hours = hours ? hours : 12; // 0시를 12시로 변경
        minutes = minutes < 10 ? '0' + minutes : minutes;
        return period + ' ' + hours + ':' + minutes;
    }



    function loadChat(chatList) {
        console.log("loadChat");
        if (chatList != null) {
            var chatPromises = []; // chatPromises 배열을 초기화
            for (var chat in chatList) {
                (function(chat) {
                    var messageClass = chatList[chat].memberKey.toString() === '${loginMember.memberKey}' ? 'sent' : 'received';

                    var formattedTime = formatDateTime(chatList[chat].chatMsgTime);

                    var unreadCount = chatList[chat].chatReadCount;
                    if (sessionCount + unreadCount > countRoomMember) {
                        unreadCount -= 1;
                    }
                    if(unreadCount == 0){
                    	console.log("=====unreadCount 0=====");
                    	unreadCount = '';
                    }
                    var fileElement = '';

                    if (chatList[chat].file) {
                        var contentType = chatList[chat].file.fileContentType;
                        var filePath = chatList[chat].file.chatMsgFilePost;

                        if (contentType && contentType.startsWith('image/')) {
                            fileElement = '<img src="' + filePath + '" alt="Image" class="chat-image" style="max-width: 100%; height: auto;">';
                        } else if (contentType && contentType.startsWith('video/')) {
                            fileElement = '<video controls style="max-width: 100%; height: auto;"><source src="' + filePath + '" class="chat-video" type="' + contentType + '">Your browser does not support the video tag.</video>';
                        } else {
                            fileElement = '<a href="' + filePath + '" download>' + chatList[chat].file.chatMsgFileOri + '</a>';
                        }
                    }

                    var messageDetail = chatList[chat].chatMsgDetail !== undefined ? chatList[chat].chatMsgDetail : '';
                    console.log(messageClass);
                    var imgTag = messageClass === 'received' ?  '<div class="avatar"><img src="/resources/assets/img/unname.png" alt="..." class="avatar-img rounded-circle" style="width:34px;"></div>':'';
					var sender = messageClass === 'received' ? '<div class="sender">' + chatList[chat].memberName + '</div>' : '';
					var unreadReceived = messageClass === 'received' ? '<div style="display:flex; flex-direction: column-reverse; "><div class="sendDate" style="margin-bottom: 8px; margin-left: 10px;">' + formattedTime + '</div><div class="unreadCount">' + unreadCount + '</div></div>' : '';
					var unreadSent = messageClass === 'sent' ? '<div style="display:flex; flex-direction: column-reverse;     margin-right: 12px"><div class="sendDate" style="margin-bottom: 8px; margin-left: 10px;">' + formattedTime + '</div><div class="unreadCount">' + unreadCount + '</div></div>' : '';
                    if (messageDetail || fileElement) { // 메시지나 파일이 있는 경우에만 출력
                    	var messageElement = $(
                    		    '<div class="message ' + messageClass + '">'
                    		    + imgTag
                    		    + unreadSent
                    		    + '<div style="display:flex; flex-direction:column; max-width: 57%;">'
                    		    + sender
                    		    + '<div class="bubble ' + messageClass + '">'
                    		    + fileElement
                    		    + messageDetail
                    		   
                    		    +'</div>'
                    		    +'</div>'
                    		    + unreadReceived
                    		);
                        chatPromises.push($("#chatting").append(messageElement).promise());
                    }
                })(chat);
            }
            // 모든 메시지가 DOM에 추가된 후에 스크롤을 맨 아래로 이동
            $.when.apply($, chatPromises).done(function() {
                $("#conversation").scrollTop($("#conversation")[0].scrollHeight);
                updateUnreadCounts();
                addMediaClickEvent();
            });
        }
    }



    function showChat(chatMessage) {
        var message = JSON.parse(chatMessage.body);
        console.log(message);

        var messageClass = message.memberKey.toString() === '${loginMember.memberKey}' ? 'sent' : 'received';
        var unreadCount = message.chatReadCount;

        // unreadCount 업데이트 로직
        if (sessionCount + unreadCount > countRoomMember) {
            unreadCount -= 1;
        }
        if(unreadCount == 0){
        	unreadCount='';
        }
        var formattedTime = formatDateTime(message.chatMsgTime);
        var fileElement = '';

        if (message.file) {
            var contentType = message.file.fileContentType;
            var filePath = message.file.chatMsgFilePost;

            if (contentType && contentType.startsWith('image/')) {
                fileElement = '<img src="' + filePath + '" alt="Image" class="chat-image" style="max-width: 100%; height: auto;">';
            } else if (contentType && contentType.startsWith('video/')) {
                fileElement = '<video controls style="max-width: 100%; height: auto;"><source src="' + filePath + '" class="chat-video" type="' + contentType + '">Your browser does not support the video tag.</video>';
            } else {
                fileElement = '<a href="' + filePath + '" download>' + message.file.chatMsgFileOri + '</a>';
            }
        }

        var messageDetail = message.chatMsgDetail !== undefined ? message.chatMsgDetail : '';
        console.log(messageClass);
        var imgTag = messageClass === 'received' ?  '<div class="avatar"><img src="/resources/assets/img/unname.png" alt="..." class="avatar-img rounded-circle" style="width:34px;"></div>' : '';
        var sender = messageClass === 'received' ? '<div class="sender">' + message.memberName + '</div>' : '';
        var unreadReceived = messageClass === 'received' ? '<div style="display:flex; flex-direction: column-reverse; "><div class="sendDate" style="margin-bottom: 8px; margin-left: 10px;">' + formattedTime + '</div><div class="unreadCount">' + unreadCount + '</div></div>' : '';
        var unreadSent = messageClass === 'sent' ? '<div style="display:flex; flex-direction: column-reverse; margin-right: 12px"><div class="sendDate" style="margin-bottom: 8px; margin-left: 10px;">' + formattedTime + '</div><div class="unreadCount">' + unreadCount + '</div></div>' : '';
        
        if (messageDetail || fileElement) { // 메시지나 파일이 있는 경우에만 출력
            var messageElement = $(
                '<div class="message ' + messageClass + '">'
                + imgTag
                + unreadSent
                + '<div style="display:flex; flex-direction:column; max-width: 57%;">'
                + sender
                + '<div class="bubble ' + messageClass + '">'
                + fileElement
                + messageDetail
                + '</div>'
                + '</div>'
                + unreadReceived
            );
            $("#chatting").append(messageElement);
        }

        $("#conversation").scrollTop($("#conversation")[0].scrollHeight);
        updateUnreadCounts();
        addMediaClickEvent();
    }


    
    window.addEventListener('focus', function() {
        updateUnreadCounts();
    });

    function updateUnreadCounts() {
        $(".unreadCount").each(function() {
            var unreadCountText = $(this).text().replace("미확인 ", "").replace("명", "").trim();
            var unreadCount = parseInt(unreadCountText);

            if (sessionCount + unreadCount > countRoomMember) {
                unreadCount -= 1;
                $(this).text(unreadCount);
            }
            if(unreadCount ==0){
            	unreadCount = '';
            }
        });
    }


    $(function () {
        var isComposing = false;

        $("form").on('submit', function (e) {
            e.preventDefault();
        });

        $('#send').on('click', function() {
            sendChat();
        });

        $('#message').on('keydown', function(event) {
        	if (event.key === 'Enter' && !isComposing) {
                if (event.shiftKey) {
                    var start = this.selectionStart;
                    var end = this.selectionEnd;
                    var value = this.value;
                    this.value = value.substring(0, start) + "\n" + value.substring(end);
                    this.selectionStart = this.selectionEnd = start + 1;
                    event.preventDefault(); // 기본 Enter 동작 방지
                } else {
                    sendChat();
                    event.preventDefault(); // 입력창에서 Enter 키 눌렀을 때 폼이 제출되지 않도록 함
                }
            }
        });

        $('#message').on('compositionstart', function() {
            isComposing = true;
        });

        $('#message').on('compositionend', function(event) {
            isComposing = false;
            if (event.originalEvent.data === '\n') {
                sendChat();
                event.preventDefault(); // 입력창에서 Enter 키 눌렀을 때 폼이 제출되지 않도록 함
            }
        });
        
        // 메시지 입력란에 입력할 때마다 글자 수 업데이트
        $('#message').on('input', function() {
            var messageLength = $('#message').val().length
            $('#charCount').text(messageLength + '/1000');        });

    });
    function addMediaClickEvent() {
        $('.chat-image').off('click').on('click', function() {
            var src = $(this).attr('src');
            window.open(src, '_blank', 'width=800,height=600');
        });

        $('.chat-video').off('click').on('click', function() {
            var src = $(this).find('source').attr('src');
            window.open(src, '_blank', 'width=800,height=600');
        });
    }
    

    window.onload = function () {
        connect();
	}

    window.onbeforeunload = function () {
        disconnect();
    }
</script>



<!--   <div>
    현재 채팅 세션 수: <span id="chatSessionCount"></span>
</div>  -->



</body>
</html>
