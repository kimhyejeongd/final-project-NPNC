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
    <meta charset="UTF-8">
    <title>Chat Application</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="container" id="chat-container">
    <div class="header">채팅방</div>
    <div id="conversation">
        <div id="chatting">
        	<c:forEach var="c" items="${aiChatList }">
        		<c:if test="${c.memberKey!=999}">
	        		<div class="message sent">
					    <div class="bubble sent">
					        <div class="sender">나</div>
					        ${c.chatMsgDetail}
					    </div>
					</div>
        		</c:if>
        		<c:if test="${c.memberKey==999}">
					<div class="message received">
					    <div class="bubble received">
					        <div class="sender">챗봇</div>
					        ${c.chatMsgDetail}
					    </div>
					</div>
			</c:if>
        	</c:forEach>
            <!-- 채팅 내용이 여기에 추가됩니다 -->
        </div>
    </div>
    <div class="chat-input">
        <form id="chatForm">
            <div style="display: flex">
                <div style="display:flex; flex-direction: column; width: 100vw;">
                    <div style="display:flex;">
                        <textarea id="message" maxlength="1000" placeholder="메시지를 입력하세요"></textarea>
                        <button id="send" type="button">보내기</button>
                    </div>          
                </div>
            </div>
        </form>
    </div>
</div>

<script>
// 발급받은 OpenAI API 키를 변수로 저장
const apiKey = 'sk-kHzVzmzlLeMrGO-izEowLuuDR6033m45kiHoHpBzfFT3BlbkFJ6NB8_0WNi2PB3TOVeJD8o3dBAre_uFiVfqSV13wykA';
// OpenAI API 엔드포인트 주소를 변수로 저장
const apiEndpoint = 'https://api.openai.com/v1/chat/completions';

// ChatGPT API 요청
async function fetchAIResponse(prompt) {
    // API 요청에 사용할 옵션을 정의
    const requestOptions = {
        method: 'POST',
        // API 요청의 헤더를 설정
        headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer '+apiKey
        },
        body: JSON.stringify({
            model: "gpt-3.5-turbo",  // 사용할 AI 모델
            messages: [{
                role: "user", // 메시지 역할을 user로 설정
                content: prompt // 사용자가 입력한 메시지
            }],
            temperature: 0.8, // 모델의 출력 다양성
            max_tokens: 1024, // 응답받을 메시지 최대 토큰(단어) 수 설정
            top_p: 1, // 토큰 샘플링 확률을 설정
            frequency_penalty: 0.5, // 일반적으로 나오지 않는 단어를 억제하는 정도
            presence_penalty: 0.5, // 동일한 단어나 구문이 반복되는 것을 억제하는 정도
        }),
    };
    // API 요청후 응답 처리
    try {
        const response = await fetch(apiEndpoint, requestOptions);
        const data = await response.json();
        console.log('API 응답:', data); // API 응답 로그 출력
        if (data && data.choices && data.choices.length > 0) {
            const aiResponse = data.choices[0].message.content;
            return aiResponse;
        } else {
            throw new Error('API 응답이 유효하지 않습니다.');
        }
    } catch (error) {
        console.error('OpenAI API 호출 중 오류 발생:', error);
        return 'OpenAI API 호출 중 오류 발생';
    }
}

async function sendMessage() {
    // 사용자가 입력한 메시지
    const message = $('#message').val().trim();
    // 메시지가 비어있으면 리턴
    if (message.length == 0) return;
    // 사용자 메시지 화면에 추가
    addMessage('나', message);
    $('#message').val('');
    // ChatGPT API 요청후 답변을 화면에 추가
    const aiResponse = await fetchAIResponse(message);
    addMessage('챗봇', aiResponse);
}

// 클릭 이벤트
$('#send').on('click', sendMessage);

// 엔터 키 이벤트
$('#message').on('keydown', async (e) => {
    if (e.key === 'Enter' && !e.shiftKey) { // Shift+Enter로 줄바꿈 가능
        e.preventDefault();
        await sendMessage();
    }
});

function addMessage(sender, message) {
	var sender1 = sender=='나'?'${loginMember.memberKey}':999;
	console.log(sender1);
	$.ajax({
        url: '${path}/aiChatUpload',
        type: 'POST',
        data: JSON.stringify({
        	chatRoomKey:${roomNo},
        	chatMsgDetail:message,
        	memberKey:sender1
        }),
        contentType: 'application/json'
        
	});
	
	
    const messageElement = document.createElement('div');
    messageElement.className = 'message ' + (sender === '나' ? 'sent' : 'received');

    const bubbleElement = document.createElement('div');
    bubbleElement.className = 'bubble ' + (sender === '나' ? 'sent' : 'received');

    const senderElement = document.createElement('div');
    senderElement.className = 'sender';
    senderElement.textContent = sender;

    bubbleElement.appendChild(senderElement);
    bubbleElement.appendChild(document.createTextNode(message));
    messageElement.appendChild(bubbleElement);

    $('#chatting').append(messageElement);
    $('#conversation').scrollTop($('#conversation')[0].scrollHeight);
	
	
	
}

</script>
</body>
</html>
