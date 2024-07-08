<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인페이지</h2>
	<form action="${pageContext.request.contextPath}/loginpage" method="post">
		<input name="username" type="text">
		<input name="password" type="password">
		<input type="submit" value="로그인">
	</form>
 <!--  <main>
    <img
         class="logo"
         src="./images/codestates-logo1.png"
         alt="CODE_STATES_LOGO"
         />

    <fieldset>
      <input type="text" id="username" placeholder="아이디" />
    </fieldset>

    <div class="success-message hide">사용할 수 있는 아이디입니다</div>
    <div class="failure-message hide">아이디는 4~12글자이어야 합니다</div>
    <div class="failure-message2 hide">영어 또는 숫자만 가능합니다</div>

    <fieldset>
      <input type="password" id="password" placeholder="비밀번호" />
    </fieldset>

    <div class="strongPassword-message hide">8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&)를 사용하세요</div>

    <fieldset>
      <input
             type="password"
             id="password-retype"
             placeholder="비밀번호 확인"
             />
    </fieldset>

    <div class="mismatch-message hide">비밀번호가 일치하지 않습니다</div>

    <fieldset class="signup">
      <button>로그인</button>
    </fieldset>
  </main> -->
</body>
    <script src="script2.js"></script>
</html>