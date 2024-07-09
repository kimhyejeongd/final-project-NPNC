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
  background-image: url('${path}/resources/jh/images/sea-7409361_1920.jpg');
  background-size: cover;
  background-repeat: no-repeat;
}

main {
  background: linear-gradient(124.47deg, rgba(255, 255, 255, 0.0), rgba(255, 255, 255, 0.0), rgba(255, 255, 255, 0.0));
  border-radius: 16px;
  box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 30rem; /* 가로 길이 증가 */
  height: auto;
  padding: 30px;
  margin: 170px auto;
  transition: all 0.3s ease;
}

main:hover {
  background: linear-gradient(124.47deg, rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0.5));
  box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(5px);
}

.logo {
  width: 170px;
  margin: 12px auto;
}

fieldset {
  border-radius: 50px;
  border: 1px solid rgba(255, 255, 255, 0.3);
  background: linear-gradient(124.47deg, rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.0), rgba(255, 255, 255, 0.2));
  box-shadow: 0 4px 30px rgba(0, 0, 0, 0.2);
  backdrop-filter: blur(0px);
  margin: 10px;
  padding: 8px 12px; /* 세로 길이 감소 */
  width: 100%; /* 필드셋 가로 길이 증가 */
  transition: all 0.3s ease;
}

fieldset:hover {
  background: linear-gradient(124.47deg, rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0.5));
  box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(5px);
}

input {
  border: none;
  background-color: transparent;
  font-size: 16px;
  color: rgba(255, 255, 255, 0.9);
  padding: 8px;
  width: 100%;
}

input::placeholder {
  color: rgba(255, 255, 255, 0.5);
}

input:focus {
  outline: none;
}

button {
  border: 1px solid rgba(255, 255, 255, 0.3);
  border-radius: 50px;
  color: rgba(255, 255, 255, 0.9);
  font-size: 16px;
  box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
  background: linear-gradient(124.47deg, rgba(61, 151, 215, 0.2), rgba(61, 151, 215, 0.0), rgba(61, 151, 215, 0.2));
  backdrop-filter: blur(5px);
  cursor: pointer;
  width: 100%; /* 버튼 가로 길이 증가 */
  height: 3rem;
  margin-top: 10px;
  transition: all 0.3s ease;
}

button:hover {
  background: linear-gradient(124.47deg, rgba(61, 151, 215, 0.8), rgba(61, 151, 215, 0.6), rgba(61, 151, 215, 0.8));
  top: 1px;
  margin-top: 1px;
}

button:active {
  position: relative;
  top: 5px;
  margin-top: 5px;
}

main > div {
  color: #ffffff;
  font-size: 14px;
  padding: 0px 30px;
  position: relative;
  top: -10px;
}

.failure-message,
.failure-message2,
.strongPassword-message {
  position: relative;
  top: -10px;
  color: red;
  display: none;
}

.hide {
  display: none;
}

.show {
  display: block;
}
</style>
</head>
<body>
<main>
    <img class="logo" src="${path}/resources/jh/images/KakaoTalk_20240708_224711693.png" alt="NPNC Logo"/>
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
</main>
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
