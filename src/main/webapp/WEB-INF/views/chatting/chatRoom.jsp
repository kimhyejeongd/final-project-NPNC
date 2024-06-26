<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginMember" value="${sessionScope.loginMember}"/>
<html lang="en">
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>친구 목록</title>
<style>
    /* 기본 스타일 */
    .roomForm{
    	display: flex;
    }
 body {
    font-family: 'Arial', sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: flex-start; /* 수정: 위아래 스크롤 가능하게 */
    min-height: 100vh; /* 추가: 화면 크기 최소 높이 */
}
    .container {
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 400px;
    max-width: 100%;
    margin: 20px 0; /* 추가: 상하 마진 */
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
        background-color: #3a3f3e4d; /* 선택 시 배경색을 검정으로 설정 */
    }
    .content {
        display: none;
    }
    .content.active {
        display: block;
    }
    /* 모달 스타일 */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
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
    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    .search-bar {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        box-sizing: border-box;
        border-radius: 5px;
        border: 1px solid #ccc;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="header">친구 목록</div>
        <div class="tabs">
            <div class="tab" data-tab="contacts">연락처</div>
            <div class="tab active" data-tab="chat">채팅</div>
            <button class="menu-button">&#9776;</button>
            <div class="dropdown-menu">
                <a href="#" id="newChatButton">새로운 채팅</a>
            </div>
        </div>
        <div id="contacts" class="content">
            <ul class="friend-list">
                <c:forEach var="m" items="${members}">
                    <c:if test="${m.memberId != loginMember.memberId}">
                        <li class="friend-item" data-member-no="${m.memberNo}">
                            <img src="profile1.jpg" alt="프로필 사진">
                            <div class="friend-info">
                                <div class="friend-name">${m.memberId}</div>
                                <div class="friend-status">부서이름</div>
                            </div>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
        <div id="chat" class="content active">
            <ul class="room-list">
                <c:forEach var="entry" items="${roomList}">
                    <!-- room-item 요소 내 input 태그 추가 -->
					<li class="room-item">
					    <form class="roomForm" method="post" action="${path}/chat">
					        <input type="hidden" name="roomId" value="${entry.key }">
					        <img src="room_icon.jpg" alt="방 아이콘">
					        <div class="room-info">
					            <div class="room-title">
					                <c:forEach var="member" items="${entry.value}">
					                    ${member.memberId}
					                </c:forEach>
					            </div>
					            <div class="recent-message-${entry.key }">최근 메시지 내용</div>
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
            <input type="text" id="searchUser" class="search-bar" placeholder="유저 검색">
            <ul class="friend-list" id="modalFriendList">
                <c:forEach var="m" items="${members}">
                    <c:if test="${m.memberId != loginMember.memberId}">
                        <li class="friend-item" data-member-no="${m.memberNo}">
                            <img src="profile1.jpg" alt="프로필 사진">
                            <div class="friend-info">
                                <div class="friend-name">${m.memberId}</div>
                                <div class="friend-status">부서이름</div>
                            </div>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
            <button type="button" id="createNewChatButton">채팅방 만들기</button>
        </div>
    </div>

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
    
   
    
    
    $(document).ready(function() {
        var selectedMembers = [];

        // 모달 열기
        $('#newChatButton').click(function() {
            $('#newChatModal').show();
        });

        // 모달 닫기
        $('.close').click(function() {
            $('#newChatModal').hide();
        });

        // 모달 외부 클릭 시 닫기
        $(window).click(function(event) {
            if ($(event.target).is('#newChatModal')) {
                $('#newChatModal').hide();
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
                'value': '${loginMember.memberNo}'
            }).appendTo(form);

            // 폼을 body에 추가하고 전송
            form.appendTo('body').submit();

            // 폼 전송 후 히든 필드 제거
            form.find('input[type="hidden"]').remove();
        });

        // 채팅방 더블 클릭 시 채팅방 입장
        $('.room-item').dblclick(function() {
            var roomId = $(this).find('input[name="roomId"]').val();
            
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
        
            form.appendTo('body').submit();
        });

        // 탭 전환 기능
        $('.tab').click(function() {
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
            $('.dropdown-menu').toggle();
        });

        // 페이지 로드 시 드롭다운 메뉴 숨기기
        $(document).click(function(event) {
            if (!$(event.target).closest('.menu-button, .dropdown-menu').length) {
                $('.dropdown-menu').hide();
            }
        });
        
        // 채팅방 목록 초기화 및 구독
        $('.room-item').each(function() {
            var roomId = $(this).find('input[name="roomId"]').val();
            var recentMessageElement = $(this).find('.recent-message-' + roomId);
            subscribeToRoom(roomId, recentMessageElement);
            loadChat(roomId, recentMessageElement);
        });

        function subscribeToRoom(roomId, recentMessageElement) {
            var socket = new SockJS('http://localhost:8082/sock/ws-stomp');
            var stompClient = Stomp.over(socket);
            stompClient.connect({}, function(frame) {
                console.log('Connected to room ' + roomId + ': ' + frame);
                stompClient.subscribe('/room/' + roomId, function(chatMessage) {
                    var message = JSON.parse(chatMessage.body);
                    recentMessageElement.text(message.message);
                });
            });
        }
        
        function loadChat(roomId, recentMessageElement) {
            $.ajax({
                url: '${path}/loadRecentChat', // 서버 요청 URL
                type: 'POST',
                data: { roomId: roomId },
                success: function(response) {
                    console.log(response + "===loadRecentChat======");
                    var recentMessage = response.length > 0 ? response[response.length-1].message : '최근 메시지 없음';
                    recentMessageElement.text(recentMessage);
                },
                error: function(error) {
                    console.log("====에러 ====");
                }
            });
        }
    });





    </script>
</body>
</html>
