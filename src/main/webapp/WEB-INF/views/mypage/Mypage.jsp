<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<sec:authentication var="loginMember" property="principal"/>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
    <link rel="stylesheet" href="${path}/resources/assets/css/demo.css" />
    <style>
        .profile-card {
            display: flex;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            background-color: #fff;
            padding: 20px;
        }
        .profile-image {
            flex: 0 0 150px;
            margin-right: 20px;
        }
        .profile-image img {
            border-radius: 8px;
            width: 150px;
            height: 150px;
        }
        .profile-info {
            flex: 1;
        }
        .profile-info .row {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 10px;
        }
        .profile-info .col {
            flex: 1;
            min-width: 300px;
        }
        .btn-custom {
            margin-top: 10px;
        }
        .form-group input {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <div class="sidebar" data-background-color="dark">
            <div class="sidebar-logo">
                <!-- Logo Header -->
                <div class="logo-header" data-background-color="dark">
                    <a href="${path}/home" class="logo">
                        <img src="${path}/resources/assets/img/KakaoTalk_Photo_2024-07-08-14-27-11.png" alt="navbar brand" class="navbar-brand" height="90"/>
                    </a>
                    <div class="nav-toggle">
                        <button class="btn btn-toggle toggle-sidebar">
                            <i class="gg-menu-right"></i>
                        </button>
                        <button class="btn btn-toggle sidenav-toggler">
                            <i class="gg-menu-left"></i>
                        </button>
                    </div>
                </div>
                <!-- End Logo Header -->
            </div>
            <div class="sidebar-wrapper scrollbar scrollbar-inner">
                <div class="sidebar-content">
                    <ul class="nav nav-secondary">
                        <li class="nav-item">
                            <a href="${path}/member/mypage">
                                <i class="fas fa-home"></i><p>Mypage</p>
                            </a>
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
                            <div class="col-md-12">
                                <div class="profile-card">
                                    <!-- Profile Image -->
                                    <div class="profile-image">
                                        <img id="profileImage" src="${path}/member/profileImage/${member.memberId}" alt="Profile Image" />
                                        <!-- 프로필 사진 수정 버튼 -->
                                        <button id="editProfileImageButton" class="btn btn-sm btn-primary" style="margin-top: 10px;">프로필 사진 수정</button>
                                        <!-- 프로필 이미지 업로드 폼, 초기에는 숨김 -->
                                        <div id="profileImageForm" style="display: none; margin-top: 10px;">
                                            <label for="profileImageUpload">프로필 이미지 변경</label>
                                            <input type="file" class="form-control" id="profileImageUpload">
                                            <button class="btn btn-primary btn-custom" id="uploadProfileImageButton">이미지 업로드</button>
                                        </div>
                                    </div>
                                    <!-- Profile Information -->
                                    <div class="profile-info">
                                        <h4>My Profile</h4>
                                        <div class="row">
                                            <div class="col">
                                                <p><strong>아이디:</strong> <span>${member.memberId}</span></p>
                                                <p><strong>이름:</strong> <span>${member.memberName}</span></p>
                                                <p><strong>이메일:</strong> <span>${member.memberEmail}</span></p>
                                                <p><strong>전화번호:</strong> <span>${member.memberPhone}</span></p>
                                                <p><strong>주소:</strong> <span>${member.memberAddress}</span></p>
                                            </div>
                                        </div>
                                        <!-- 정보 수정 버튼 -->
                                        <button class="btn btn-primary" id="editProfileButton">정보 수정</button>
                                        <!-- 정보 수정 폼, 초기에는 숨김 -->
                                        <div id="editProfileForm" style="display: none; margin-top: 10px;">
                                            <form id="profileForm">
                                                <div class="form-group">
                                                    <label for="memberName">이름</label>
                                                    <input type="text" class="form-control" id="memberName" value="${member.memberName}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="memberEmail">이메일</label>
                                                    <input type="email" class="form-control" id="memberEmail" value="${member.memberEmail}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="memberPhone">전화번호</label>
                                                    <input type="text" class="form-control" id="memberPhone" value="${member.memberPhone}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="memberAddress">주소</label>
                                                    <input type="text" class="form-control" id="memberAddress" value="${member.memberAddress}">
                                                </div>
                                                <button type="button" class="btn btn-primary" id="saveProfileButton">저장</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 비밀번호 변경 섹션 -->
                        <div class="row mt-4">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="title">비밀번호 변경</h5>
                                    </div>
                                    <div class="card-body">
                                        <form id="passwordForm">
                                            <div class="form-group">
                                                <label for="currentPassword">현재 비밀번호</label>
                                                <input type="password" class="form-control" id="currentPassword">
                                            </div>
                                            <div class="form-group">
                                                <label for="newPassword">새 비밀번호</label>
                                                <input type="password" class="form-control" id="newPassword">
                                            </div>
                                            <div class="form-group">
                                                <label for="confirmPassword">비밀번호 확인</label>
                                                <input type="password" class="form-control" id="confirmPassword">
                                            </div>
                                            <button type="button" class="btn btn-primary" id="changePasswordButton">비밀번호 변경</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>
        </div>
    </div>

    <!-- JavaScript Files -->
    <script src="${path}/resources/assets/js/core/jquery.3.2.1.min.js"></script>
    <script src="${path}/resources/assets/js/core/popper.min.js"></script>
    <script src="${path}/resources/assets/js/core/bootstrap.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/datatables/datatables.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/jquery.mask/jquery.mask.min.js"></script>
    <script src="${path}/resources/assets/js/kaiadmin.min.js"></script>
    <script src="${path}/resources/assets/js/demo.js"></script>
    <script src="${path}/resources/js/mypage.js"></script>

</body>
</html>
