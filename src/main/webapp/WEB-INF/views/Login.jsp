<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NPNC LOGIN</title>
<style>
* {
  box-sizing: border-box;
  padding: 0;
  margin: 0;
  font-family: 'Spoqa Han Sans Neo', 'sans-serif';
}

body {
  background-image: url('${path}/resources/hj/—Pngtree—blue background_919872.jpg');
  background-size: cover;
  background-repeat: no-repeat;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  margin: 0;
}

.container {
  display: flex;
  align-items: center;
  justify-content: center; /* 컨테이너 내의 내용물을 중앙에 정렬 */
  background: rgba(255, 255, 255, 0.1);
  border-radius: 16px;
  padding: 40px;
  box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
  max-width: 900px; /* 최대 너비를 900px로 설정 */
}

.logo-container {
  margin-right: 100px; /* 로고와 폼 사이 간격 증가 */
}

.logo {
  width: 400px;
}

.form-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%; /* 폼 컨테이너가 전체 너비를 차지하도록 설정 */
}

fieldset {
  border: none;
  margin: 10px 0;
  padding: 0;
  width: 100%;
}

input {
  border: none;
  background-color: rgba(255, 255, 255, 0.3);
  font-size: 16px;
  color: white;
  padding: 10px;
  width: calc(100% - 20px);
  margin: 0 10px;
  border-radius: 5px;
}

input::placeholder {
  color: rgba(255, 255, 255, 0.7);
}

input:focus {
  outline: none;
  background-color: rgba(255, 255, 255, 0.5);
}

button {
  border: none;
  background-color: #3d97d7;
  color: white;
  font-size: 16px;
  padding: 10px;
  width: 100%;
  border-radius: 5px;
  cursor: pointer;
  margin-top: 20px;
  transition: background-color 0.3s ease;
}

button:hover {
  background-color: #357ab8;
}

.failure-message,
.failure-message2,
.strongPassword-message {
  color: red;
  display: none;
}

.show {
  display: block;
}
</style>
</head>
<body>
<div class="container">
    <div class="logo-container">
        <img class="logo" src="${path}/resources/hj/logologin.png" alt="I'MWARE Logo"/>
    </div>
    <div class="form-container">
        <form action="${pageContext.request.contextPath}/logincheck" method="post">
            <fieldset>
                <input name="username" id="username" type="text" placeholder="아이디" />
            </fieldset>
            <div class="failure-message hide">아이디는 4~12글자이어야 합니다</div>
            <div class="failure-message2 hide">영어 또는 숫자만 가능합니다</div>
            <fieldset>
                <input name="password" id="password" type="password" placeholder="비밀번호" />
            </fieldset>
            <div class="strongPassword-message hide">8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&)를 사용하세요</div>
            <button type="submit">로그인</button>
        </form>
    </div>
</div>
<script>
document.addEventListener("DOMContentLoaded", function() {
    var elInputUsername = document.getElementById("username");
    var elFailureMessage = document.querySelector(".failure-message");
    var elFailureMessageTwo = document.querySelector(".failure-message2");
    var elInputPassword = document.getElementById("password");
    var elStrongPasswordMessage = document.querySelector(".strongPassword-message");

    function onlyNumberAndEnglish(value) {
        return /^[a-zA-Z0-9]+$/.test(value);
    }

    function idLength(value) {
        return value.length >= 4 && value.length <= 12;
    }

    function strongPassword(value) {
        var pattern = /^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[@$!%*#?&])[A-Za-z0-9@$!%*#?&]{8,}$/;
        return pattern.test(value);
    }

    elInputUsername.addEventListener("input", function() {
        var value = elInputUsername.value;
        elFailureMessage.classList.toggle("show", !idLength(value));
        elFailureMessageTwo.classList.toggle("show", !onlyNumberAndEnglish(value));
    });

    elInputPassword.addEventListener("input", function() {
        var value = elInputPassword.value;
        elStrongPasswordMessage.classList.toggle("show", !strongPassword(value));
    });
});
</script>
</body>
</html>
