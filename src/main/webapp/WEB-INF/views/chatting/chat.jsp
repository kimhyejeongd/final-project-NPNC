<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
	<c:set var="loginMember" value="${sessionScope.loginMember}"/>
	<meta charset="UTF-8">
	<title>Chat Room</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
    #charCount {
        margin-top: 5px;
        font-size: 0.9em;
        color: #777;
        text-align: right;
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
            background-color: #4CAF50;
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
        max-width: 600px;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        overflow: hidden;
        display: flex;
        flex-direction: column;
        height: 100vh;
    }
    .header {
        background-color: #4CAF50;
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
        padding: 10px 20px;
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
        max-width: 70%;
        padding: 10px 15px;
        border-radius: 20px;
        position: relative;
        font-size: 0.9em;
    }
    .bubble.sent {
        background-color: #dcf8c6;
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
        border-left-color: #dcf8c6;
        right: -10px;
        top: 10px;
    }
    .bubble.received::after {
        border-right-color: #fff;
        left: -10px;
        top: 10px;
    }
    .sender {
        font-weight: bold;
        margin-bottom: 5px;
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
            <div id="charCount">0/1000</div> <!-- 글자 수 표시 요소 추가 -->
            <div>
	            <button type="button" id="fileButton">&#128206;</button>
	            <input type="file" id="fileInput">
	            <textarea type="text" id="message" placeholder="메시지를 입력하세요"></textarea>
	            <button id="send">보내기</button>
            </div>
        </form>
    </div>
</div>

<div class="sidebar" style="display:none;">
    <ul id="roomMemberList"></ul>
    <!-- 기타 메뉴 항목들 -->
    <div class="exit-button">나가기</div>
</div>

<script type="text/javascript">
var sessionCount = 0;

var stompClient = null;
var roomId = ${roomId};
var chatList = ${chatList};
var countRoomMember = ${countRoomMember};


$('#fileButton').on('click', function() {
    $('#fileInput').click();
});

$('#fileInput').on('change', function(event) {
    var file = event.target.files[0];
    if (file) {
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
            	
                    alert('파일 업로드 성공: ' + response.chatMsgFileOri);
                    console.log('파일 저장 경로: ' + response.chatMsgFilePost);
                // 파일 입력 요소 초기화
                $('#fileInput').val('');

            },
            error: function(error) {
                console.error('파일 업로드 중 오류 발생:', error);
                alert('파일 업로드 중 오류 발생');
            }
        });
    }
});






$(document).ready(function() {
	 var roomMembers = ${roomMembers}; // JSP EL을 사용하여 서버에서 받은 유저 리스트를 할당
     roomMembers.forEach(function(member) {
         $('#roomMemberList').append('<li>' + member.memberId + '</li>'); // 각 멤버 이름을 리스트 아이템으로 추가
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
                memberId: '${loginMember.memberId}'
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
        var socket = new SockJS('http://localhost:8080/ws-stomp');
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
            stompClient.subscribe('${path}/room/' + roomId, function (chatMessage) {
                showChat(chatMessage);
            });

            stompClient.subscribe("${path}/room/" + roomId + "/sessionCount", function (message) {
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
        if (message.trim() === "") {
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
                'chatMsgTime': new Date().toISOString()
            }));
        $('#message').val('');
        $("#conversation").scrollTop($("#conversation")[0].scrollHeight); // 스크롤 맨 아래로 이동
        

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
            for (var chat in chatList) {
                (function(chat) {
                    var messageClass = chatList[chat].memberKey.toString() === '${loginMember.memberKey}' ? 'sent' : 'received';

                    var formattedTime = formatDateTime(chatList[chat].chatMsgTime);

                    var unreadCount = chatList[chat].chatReadCount;
                    if (sessionCount + unreadCount > countRoomMember) {
                        unreadCount -= 1;
                    }
                    var messageElement = $(
                        '<div class="message ' + messageClass + '"><div class="bubble ' + messageClass + '">' 
                        + '<div class="sender">' + chatList[chat].memberKey + '</div>'
                        + chatList[chat].chatMsgDetail 
                        + '<div class="sendDate">' + formattedTime + '</div>'
                        + '<div class="unreadCount">미확인 ' + unreadCount + '명</div>'
                        + '</div></div>'
                    );

                    $("#chatting").append(messageElement);
                    $("#conversation").scrollTop($("#conversation")[0].scrollHeight);
                })(chat);
                
            }
            updateUnreadCounts();
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
        var formattedTime = formatDateTime(message.chatMsgTime);


        var messageElement = $(
            '<div class="message ' + messageClass + '"><div class="bubble ' + messageClass + '">' 
            + '<div class="sender">' + message.memberKey + '</div>'
            + message.chatMsgDetail 
            + '<div class="sendDate">' + formatDateTime(message.chatMsgTime) + '</div>'
            + '<div class="unreadCount">미확인 ' + unreadCount + '명</div>'
            + '</div></div>'
        );

        $("#chatting").append(messageElement);
        $("#conversation").scrollTop($("#conversation")[0].scrollHeight);
        
        updateUnreadCounts();
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
                $(this).text("미확인 " + unreadCount + "명");
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

    window.onload = function () {
        connect();
	}

    window.onbeforeunload = function () {
        disconnect();
    }
</script>



<!--   <div>
    현재 채팅 세션 수: <span id="chatSessionCount"></span>
</div>   -->



</body>
</html>
