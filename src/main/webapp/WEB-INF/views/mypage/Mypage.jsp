<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Mypage</title>
    <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport"/>
    <link rel="icon" href="${path}/resources/assets/img/kaiadmin/favicon.ico" type="image/x-icon"/>

    <!-- Fonts and icons -->
    <script src="${path}/resources/assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
      WebFont.load({
        google: { families: ["Public Sans:300,400,500,600,700"] },
        custom: {
          families: [
            "Font Awesome 5 Solid",
            "Font Awesome 5 Regular",
            "Font Awesome 5 Brands",
            "simple-line-icons",
          ],
          urls: ["${path}/resources/assets/css/fonts.min.css"],
        },
        active: function () {
          sessionStorage.fonts = true;
        },
      });
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/kaiadmin.min.css" />

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="${path}/resources/assets/css/demo.css" />
</head>
<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <div class="sidebar" data-background-color="dark">
            <div class="sidebar-logo">
                <!-- Logo Header -->
                <div class="logo-header" data-background-color="dark">
                    <a href="index.html" class="logo">
                        <img src="${path}/resources/assets/img/kaiadmin/logo_light.svg" alt="navbar brand" class="navbar-brand" height="20"/>
                    </a>
                    <div class="nav-toggle">
                        <button class="btn btn-toggle toggle-sidebar">
                            <i class="gg-menu-right"></i>
                        </button>
                        <button class="btn btn-toggle sidenav-toggler">
                            <i class="gg-menu-left"></i>
                        </button>
                    </div>
                    <button class="topbar-toggler more">
                        <i class="gg-more-vertical-alt"></i>
                    </button>
                </div>
                <!-- End Logo Header -->
            </div>
            <div class="sidebar-wrapper scrollbar scrollbar-inner">
                <div class="sidebar-content">
                    <ul class="nav nav-secondary">
                        <li class="nav-item active">
                            <a data-bs-toggle="collapse" href="#dashboard" class="collapsed" aria-expanded="false">
                                <i class="fas fa-home"></i>
                                <p>Dashboard</p>
                                <span class="caret"></span>
                            </a>
                            <div class="collapse" id="dashboard">
                                <ul class="nav nav-collapse">
                                    <li>
                                        <a href="../demo1/index.html">
                                            <span class="sub-item">Dashboard 1</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-section">
                            <span class="sidebar-mini-icon">
                                <i class="fa fa-ellipsis-h"></i>
                            </span>
                            <h4 class="text-section">Components</h4>
                        </li>
                        <li class="nav-item">
                            <a data-bs-toggle="collapse" href="#base">
                                <i class="fas fa-layer-group"></i>
                                <p>Mypage</p>
                                <span class="caret"></span>
                            </a>
                            <div class="collapse" id="base">
                                <ul class="nav nav-collapse"></ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- End Sidebar -->

        <div class="main-panel">
            <%@ include file="/WEB-INF/views/common/header_bar.jsp" %>
            <div class="container">
                <div class="page-inner">
                    <div class="container-fluid mt--6">
                        <div class="row">
                            <div class="col">
                                <div class="card card-round">
                                    <div class="card-header">
                                        <div class="card-head-row card-tools-still-right">
                                            <h4 class="card-title">My Page</h4>
                                            <div class="card-tools">
                                                <button class="btn btn-icon btn-link btn-primary btn-xs">
                                                    <span class="fa fa-angle-down"></span>
                                                </button>
                                                <button class="btn btn-icon btn-link btn-primary btn-xs btn-refresh-card">
                                                    <span class="fa fa-sync-alt"></span>
                                                </button>
                                                <button class="btn btn-icon btn-link btn-primary btn-xs">
                                                    <span class="fa fa-times"></span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="table-responsive table-hover table-sales">
                                                    <img id="profileImage" src="${path}/${member.memberProfileImage}" alt="Profile Image" style="width:150px;height:150px;">
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <p>아이디: <span>${member.memberId}</span></p>
                                                <p>이름: <span>${member.memberName}</span></p>
                                                <p>
                                                    주소: <span id="memberAddressText">${member.memberAddress}</span>
                                                    <button class="btn btn-sm btn-primary" id="editAddressButton">수정</button>
                                                    <input type="text" id="memberAddress" name="memberAddress" value="${member.memberAddress}" style="display:none;">
                                                    <div id="addressSearchBox" style="display:none;">
                                                        <input type="text" id="postcode" placeholder="우편번호">
                                                        <input type="text" id="roadAddress" placeholder="도로명주소">
                                                        <input type="text" id="jibunAddress" placeholder="지번주소">
                                                        <button class="btn btn-sm btn-secondary" id="searchAddressButton">주소 검색</button>
                                                        <button class="btn btn-sm btn-secondary" id="saveAddressButton">주소 저장</button>
                                                    </div>
                                                </p>
                                                <p>핸드폰: <span>${member.memberPhone}</span></p>
                                                <p>
                                                    e-mail: <span id="memberEmailText">${member.memberEmail}</span>
                                                    <input type="email" id="memberEmail" name="memberEmail" value="${member.memberEmail}" style="display:none;">
                                                </p>
                                                <p>
                                                    비밀번호:
                                                    <button class="btn btn-sm btn-primary" id="editPasswordButton">수정</button>
                                                    <div id="passwordForm" style="display:none;">
                                                        <p>이메일 인증이 필요합니다.</p>
                                                        <input type="email" id="verificationEmail" placeholder="이메일 입력">
                                                        <button class="btn btn-sm btn-secondary" id="sendEmailVerificationButton">이메일 인증 보내기</button>
                                                        <div id="emailVerificationForm" style="display: none;">
                                                            <input type="text" id="emailVerificationCode" placeholder="인증 코드 입력">
                                                            <button class="btn btn-sm btn-secondary" id="verifyCodeButton">인증 코드 확인</button>
                                                        </div>
                                                        <div id="passwordChangeForm" style="display: none;">
                                                            <p>새 비밀번호: <input type="password" id="newPassword" name="newPassword"></p>
                                                            <button class="btn btn-sm btn-secondary" id="saveNewPasswordButton">비밀번호 저장</button>
                                                        </div>
                                                    </div>
                                                </p>
                                                <p>성별: <span>${member.memberGender}</span></p>
                                                <p>입사일: <span>${member.memberEnrollDate}</span></p>
                                                <p>퇴사일: <span>${member.memberLeaveDate}</span></p>
                                                <p>부서: <span>${member.departmentName}</span></p>
                                                <p>직급: <span>${member.jobKey}</span></p>
                                                <p>권한: <span>${member.accessKey}</span></p>
                                                <p>현황: <span>${member.memberState}</span></p>

                                                <button id="saveChangesButton" class="btn btn-primary" style="display:none;">저장</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            	 	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 	
        </div>

        <script>
            $(document).ready(function() {
                $('#editAddressButton').click(function() {
                    $('#memberAddress').toggle();
                    $('#addressSearchBox').toggle();
                    $('#saveChangesButton').toggle();
                });
                
                $('#searchAddressButton').click(function() {
                    new daum.Postcode({
                        oncomplete: function(data) {
                            $('#postcode').val(data.zonecode);
                            $('#roadAddress').val(data.roadAddress);
                            $('#jibunAddress').val(data.jibunAddress);
                        }
                    }).open();
                });

                $('#saveAddressButton').click(function() {
                    const newAddress = $('#roadAddress').val();
                    $('#memberAddressText').text(newAddress);
                    $('#memberAddress').val(newAddress).hide();
                    $('#addressSearchBox').hide();
                    $('#saveChangesButton').show();
                });

                $('#editPasswordButton').click(function() {
                    $('#passwordForm').toggle();
                });

                $('#sendEmailVerificationButton').click(function() {
                    // 이메일 전송 로직
                    $('#emailVerificationForm').show();
                });

                $('#verifyCodeButton').click(function() {
                    // 인증 코드 확인 로직
                    $('#passwordChangeForm').show();
                });

                $('#saveNewPasswordButton').click(function() {
                    // 비밀번호 저장 로직
                });

                $('#saveChangesButton').click(function() {
                    // 변경 사항 저장 로직
                });
            });
        </script>
    </div>
</body>
</html>
