<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>외부 주소록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        /* 팝업 스타일 */
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background: white;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            z-index: 1000;
        }

        .popup-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }

        .popup-overlay.show {
            display: block;
        }

        .menu {
            display: none;
            position: absolute;
            background: white;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .contact-card {
            position: relative;
            padding: 10px;
            border: 1px solid #ddd;
            margin-bottom: 10px;
            background: #f9f9f9;
        }

        .contact-card:hover .menu {
            display: block;
        }

        .star.favorite {
            color: gold;
        }

        /* 스타일 */
        .contact-info {
            margin-bottom: 10px;
        }

        .contact-info label {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>외부 주소록</h1>
        <div id="contacts">
            <c:forEach var="contact" items="${contacts}">
                <div class="contact-card" data-id="${contact.AB_EXTERNAL_KEY}">
                    <div>
                        <span class="star <c:if test="${contact.AB_EXTERNAL_BOOKMARK == 'Y'}">favorite</c:if>" 
                              title="즐겨찾기" 
                              onclick="toggleFavorite(this, ${contact.AB_EXTERNAL_KEY})"></span>
                        <strong>${contact.AB_EXTERNAL_NAME}</strong> (${contact.AB_EXTERNAL_EMAIL})<br>
                        <span>회사: ${contact.AB_EXTERNAL_COMPANY}</span><br>
                        <span>부서: ${contact.AB_EXTERNAL_DEPARTMENT}</span><br>
                        <span>직급: ${contact.AB_EXTERNAL_JOB}</span>
                    </div>
                    <div>
                        <button onclick="openEditPopup(${contact.AB_EXTERNAL_KEY})">수정</button>
                        <button onclick="openDeletePopup(${contact.AB_EXTERNAL_KEY})">삭제</button>
                    </div>
                </div>
            </c:forEach>
        </div>
        <button onclick="openAddPopup()">등록하기</button>
    </div>

    <!-- 수정 팝업 -->
    <div id="edit-popup" class="popup">
        <h2>정보 수정</h2>
        <form id="edit-form" action="${pageContext.request.contextPath}/external/edit" method="post">
            <input type="hidden" name="AB_EXTERNAL_KEY" id="edit-id">
            <label>이름:</label>
            <input type="text" name="AB_EXTERNAL_NAME" id="edit-name" required><br>
            <label>전화번호:</label>
            <input type="text" name="AB_EXTERNAL_TELL" id="edit-phone" required><br>
            <label>이메일:</label>
            <input type="email" name="AB_EXTERNAL_EMAIL" id="edit-email" required><br>
            <label>회사:</label>
            <input type="text" name="AB_EXTERNAL_COMPANY" id="edit-company"><br>
            <label>부서:</label>
            <input type="text" name="AB_EXTERNAL_DEPARTMENT" id="edit-department"><br>
            <label>직급:</label>
            <input type="text" name="AB_EXTERNAL_JOB" id="edit-job"><br>
            <button type="submit">저장</button>
            <button type="button" onclick="closePopup()">취소</button>
        </form>
    </div>

    <!-- 삭제 팝업 -->
    <div id="delete-popup" class="popup">
        <h2>정말 삭제하시겠습니까?</h2>
        <form action="${pageContext.request.contextPath}/external/delete" method="post">
            <input type="hidden" name="AB_EXTERNAL_KEY" id="delete-id">
            <button type="submit">확인</button>
            <button type="button" onclick="closePopup()">취소</button>
        </form>
    </div>

    <!-- 등록 팝업 -->
    <div id="add-popup" class="popup">
        <h2>정보 등록</h2>
        <form id="add-form" action="${pageContext.request.contextPath}/external/add" method="post">
            <label>이름:</label>
            <input type="text" name="AB_EXTERNAL_NAME" id="add-name" required><br>
            <label>전화번호:</label>
            <input type="text" name="AB_EXTERNAL_TELL" id="add-phone" required><br>
            <label>이메일:</label>
            <input type="email" name="AB_EXTERNAL_EMAIL" id="add-email" required><br>
            <label>회사:</label>
            <input type="text" name="AB_EXTERNAL_COMPANY" id="add-company"><br>
            <label>부서:</label>
            <input type="text" name="AB_EXTERNAL_DEPARTMENT" id="add-department"><br>
            <label>직급:</label>
            <input type="text" name="AB_EXTERNAL_JOB" id="add-job"><br>
            <button type="submit">등록</button>
            <button type="button" onclick="closePopup()">취소</button>
        </form>
    </div>

    <!-- 오버레이 -->
    <div id="popup-overlay" class="popup-overlay"></div>

    <script>
        function toggleMenu(button) {
            const menu = button.nextElementSibling;
            menu.style.display = menu.style.display === 'block' ? 'none' : 'block';
        }

        function toggleFavorite(star, id) {
            const isFavorite = star.classList.contains('favorite');
            const newStatus = isFavorite ? 'N' : 'Y';
            // AJAX 요청을 통해 즐겨찾기 상태를 서버에 저장
            fetch('${pageContext.request.contextPath}/external/toggleFavorite', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ AB_EXTERNAL_KEY: id, AB_EXTERNAL_BOOKMARK: newStatus })
            }).then(response => {
                if (response.ok) {
                    star.classList.toggle('favorite');
                } else {
                    alert('즐겨찾기 상태를 변경할 수 없습니다.');
                }
            });
        }

        function openEditPopup(id) {
            fetch(`${pageContext.request.contextPath}/external/get/${id}`)
                .then(response => response.json())
                .then(data => {
                    document.getElementById('edit-id').value = data.AB_EXTERNAL_KEY;
                    document.getElementById('edit-name').value = data.AB_EXTERNAL_NAME;
                    document.getElementById('edit-phone').value = data.AB_EXTERNAL_TELL;
                    document.getElementById('edit-email').value = data.AB_EXTERNAL_EMAIL;
                    document.getElementById('edit-company').value = data.AB_EXTERNAL_COMPANY;
                    document.getElementById('edit-department').value = data.AB_EXTERNAL_DEPARTMENT;
                    document.getElementById('edit-job').value = data.AB_EXTERNAL_JOB;
                    document.getElementById('edit-popup').style.display = 'block';
                    document.getElementById('popup-overlay').classList.add('show');
                });
        }

        function openDeletePopup(id) {
            document.getElementById('delete-id').value = id;
            document.getElementById('delete-popup').style.display = 'block';
            document.getElementById('popup-overlay').classList.add('show');
        }

        function openAddPopup() {
            document.getElementById('add-popup').style.display = 'block';
            document.getElementById('popup-overlay').classList.add('show');
        }

        function closePopup() {
            document.querySelectorAll('.popup').forEach(popup => {
                popup.style.display = 'none';
            });
            document.getElementById('popup-overlay').classList.remove('show');
        }
    </script>
</body>
</html>