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
	.unreadCount {
    font-size: 0.75em;
    color: #FF0000;
    margin-top: 5px;
    text-align: right;
}
	
    #send {
        right: 24px;
        position: absolute;
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
        display: flex;
        flex-direction: column;
        flex-grow: 1;
        padding: 10px;
        overflow-y: auto;
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
    }
    .chat-input input {
        flex-grow: 1;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 20px;
        margin-right: 10px;
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
</style>
</head>
<body>

<div class="container" id="chat-container">
    <div class="header">채팅방</div>
    <div id="conversation">
        <div id="chatting">
            <!-- 채팅 내용이 여기에 추가됩니다 -->
        </div>
    </div>
    <div class="chat-input">
        <form id="chatForm">
            <input type="text" id="message" placeholder="메시지를 입력하세요">
            <button id="send">보내기</button>
        </form>
    </div>
</div>

<script type="text/javascript">
    var stompClient = null;
    var roomId = ${roomId};
    var chatList = ${chatList};

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
        var socket = new SockJS('http://localhost:8082/sock/ws-stomp');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function (frame) {
            setConnected(true);
            console.log('Connected: ' + frame);
            loadChat(chatList); // 저장된 채팅 불러오기
            
            // 구독
            stompClient.subscribe('/room/' + roomId, function (chatMessage) {
                showChat(chatMessage);
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

    // html에서 입력값, roomId를 받아서 Controller로 전달
// sendChat 함수
function sendChat() {
    var message = $("#message").val();
    if (message.trim() === "") {
        return; // 입력값이 없으면 전송하지 않음
    }

    stompClient.send("/send/" + roomId, {},
        JSON.stringify({
            'roomId': roomId,
            'memberNo': '${loginMember.memberNo}', 
            'message': message,
            'sendDate': new Date().toISOString()
        }));
    $('#message').val('');
    $("#conversation").scrollTop($("#conversation")[0].scrollHeight); // 스크롤 맨 아래로 이동
}


function formatDateTime(timestamp) {
    var date = new Date(timestamp);
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var period = hours >= 12 ? '오후' : '오전';
    hours = hours % 12;
    hours = hours ? hours : 12; // 0시를 12시로 변경
    minutes = minutes < 10 ? '0' + minutes : minutes;
    return period + ' ' + hours + ': ' + minutes;
}
//loadChat 함수
function loadChat(chatList) {
    if (chatList != null) {
        for (var chat in chatList) {
            (function(chat) { // 클로저를 사용하여 각 chat 변수를 고정
                var messageClass = chatList[chat].memberNo.toString() === '${loginMember.memberNo}' ? 'sent' : 'received';
                console.log("dsanlkdsankl++++++" + chatList[chat].memberNo);
                console.log("dsanlkdsankl++++++" + '${loginMember.memberNo}' + "멤버");

                var formattedTime = formatDateTime(chatList[chat].sendDate);

                $.ajax({
                    url: '${path}/updateReadStatus',
                    method: 'POST',
                    data: {
                        chatId: chatList[chat].chatId,
                        memberNo: '${loginMember.memberNo}'
                    },
                    success: function(response) {
                        console.log("Read status updated successfully for chatId: " + chatList[chat].chatId);

                        // 읽지 않은 사람 수를 줄인 후 메시지를 화면에 표시
                        var unreadCount = chatList[chat].readCount > 0 ? chatList[chat].readCount - 1 : 0;
                        var messageElement = $(
                            '<div class="message ' + messageClass + '"><div class="bubble ' + messageClass + '">' 
                            + '<div class="sender">' + chatList[chat].memberNo + '</div>'
                            + chatList[chat].message 
                            + '<div class="sendDate">' + formattedTime + '</div>'
                            + '<div class="unreadCount">미확인 ' + unreadCount + '명</div>'  // 추가된 부분
                            + '</div></div>'
                        );

                        $("#chatting").append(messageElement);
                        $("#conversation").scrollTop($("#conversation")[0].scrollHeight);
                    },
                    error: function(error) {
                        console.log("Error updating read status for chatId: " + chatList[chat].chatId, error);

                        // 읽음 상태 업데이트 실패 시 원래의 unreadCount로 메시지를 화면에 표시
                        var unreadCount = chatList[chat].readCount;
                        var messageElement = $(
                            '<div class="message ' + messageClass + '"><div class="bubble ' + messageClass + '">' 
                            + '<div class="sender">' + chatList[chat].memberNo + '</div>'
                            + chatList[chat].message 
                            + '<div class="sendDate">' + formattedTime + '</div>'
                            + '<div class="unreadCount">미확인 ' + unreadCount + '명</div>'  // 추가된 부분
                            + '</div></div>'
                        );

                        $("#chatting").append(messageElement);
                        $("#conversation").scrollTop($("#conversation")[0].scrollHeight);
                    }
                });
            })(chat); // 클로저 사용
        }
    }
}




// showChat 함수
function showChat(chatMessage) {
    var message = JSON.parse(chatMessage.body);
    console.log(message);

    $.ajax({
        url: '${path}/updateReadStatus',
        method: 'POST',
        data: {
            chatId: message.chatId,
            memberNo: '${loginMember.memberNo}'
        },
        success: function(response) {
            console.log("Read status updated successfully.");

            // 읽지 않은 사람 수를 줄인 후 메시지를 화면에 표시
            var messageClass = message.memberNo.toString() === '${loginMember.memberNo}' ? 'sent' : 'received';
            var unreadCount = message.readCount > 0 ? message.readCount - 1 : 0;
            var messageElement = $(
                '<div class="message ' + messageClass + '"><div class="bubble ' + messageClass + '">' 
                + '<div class="sender">' + message.memberNo + '</div>'
                + message.message 
                + '<div class="sendDate">' + formatDateTime(message.sendDate) + '</div>'
                + '<div class="unreadCount">미확인 ' + unreadCount + '명</div>'  // 수정된 부분
                + '</div></div>'
            );

            $("#chatting").append(messageElement);
            $("#conversation").scrollTop($("#conversation")[0].scrollHeight);
        },
        error: function(error) {
            console.log("Error updating read status:", error);
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
                sendChat();
                event.preventDefault(); // 입력창에서 Enter 키 눌렀을 때 폼이 제출되지 않도록 함
            }
        });

        $('#message').on('compositionstart', function() {
            isComposing = true;
        });

        $('#message').on('compositionend', function(event) {
            isComposing = false;
            // Enter 키가 눌렸을 때는 compositionend가 발생하므로 여기서도 sendChat을 호출
            if (event.originalEvent.data === '\n') {
                sendChat();
                event.preventDefault(); // 입력창에서 Enter 키 눌렀을 때 폼이 제출되지 않도록 함
            }
        });
    });

    // 창 키면 바로 연결
    window.onload = function () {
        connect();
    }

    window.onbeforeunload = function () {
        disconnect();
    }
</script>



</body>
</html>
