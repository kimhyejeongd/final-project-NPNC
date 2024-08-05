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
  justify-content: center;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 16px;
  padding: 40px;
  box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
  max-width: 900px;
  width: 100%;
}

.logo-container {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 50%;
}

.logo {
  max-width: 100%;
  height: auto;
}

.separator {
  width: 2px;
  background-color: white;
  height: 100%;
}



.form-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 50%;
  margin-right:40px;

}

label {
  color: white;
  font-size: 14px;
  margin-bottom: 0px;
  align-self: flex-start;
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
  font-size: 14px; /* 글자 크기 줄이기 */
  color: white;
  padding: 8px; /* 세로 길이 줄이기 위해 padding 조정 */
  width: 120%; /* 가로 길이 늘리기 */
  margin: 0 0 5px 0;
  border-radius: 20px;
}

input::placeholder {
  color: rgba(255, 255, 255, 0.7);
  font-size: 12px; /* placeholder 글자 크기 줄이기 */
}

input:focus {
  outline: none;
  background-color: rgba(255, 255, 255, 0.5);
}

button {
  border: none;
  background-color: #3d97d7;
  color: white;
  font-size: 16px; /* 버튼 글자 크기 줄이기 */
  padding: 10px; /* 세로 길이 줄이기 위해 padding 조정 */
  width: 120%; /* 가로 길이 늘리기 */
  border-radius: 20px;
  cursor: pointer;
  margin-top: 15px;
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
        <img class="logo" src="${path}/resources/hj/npnclogin.png" alt="npnc Logo"/>
    </div>
    <div class="separator"></div>
    <div class="form-container">
        <form action="${pageContext.request.contextPath}/logincheck" method="post">
            <label for="username">ID</label>
            <fieldset>
                <input name="username" id="username" type="text" placeholder="아이디" />
            </fieldset>
<!--             <div class="failure-message hide">아이디는 4~12글자이어야 합니다</div>
            <div class="failure-message2 hide">영어 또는 숫자만 가능합니다</div> -->
            <label for="password">PASSWORD</label>
            <fieldset>
                <input name="password" id="apassword" type="password" placeholder="비밀번호" />
            </fieldset>
<!--             <div class="strongPassword-message hide">8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&)를 사용하세요</div> -->
            <button type="submit">login</button>
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
