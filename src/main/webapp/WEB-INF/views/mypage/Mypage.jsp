<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
                                        <img id="profileImage" src="${path}/${member.memberProfileImage}" alt="Profile Image">
                                    </div>
                                    <!-- Profile Information -->
                                    <div class="profile-info">
                                        <h4>My Profile</h4>
                                        <div class="row">
                                            <div class="col">
                                                <p><strong>아이디:</strong> <span>${member.memberId}</span></p>
                                                <p><strong>이름:</strong> <span>${member.memberName}</span></p>
                                                <p><strong>주소:</strong> <span id="memberAddressText">${member.memberAddress}</span>
                                                    <button class="btn btn-sm btn-primary btn-custom" data-bs-toggle="modal" data-bs-target="#addressModal">수정</button>
                                                </p>
                                                <p><strong>핸드폰:</strong> <span>${member.memberPhone}</span></p>
                                                <p><strong>e-mail:</strong> <span id="memberEmailText">${member.memberEmail}</span>
                                                    <button class="btn btn-sm btn-primary btn-custom" data-bs-toggle="modal" data-bs-target="#passwordModal">비밀번호 수정</button>
                                                </p>
                                                <p><strong>성별:</strong> <span>${member.memberGender}</span></p>
                                            </div>
                                            <div class="col">
                                                <p><strong>입사일:</strong> <span>${member.memberEnrollDate}</span></p>
                                                <p><strong>퇴사일:</strong> <span>${member.memberLeaveDate}</span></p>
                                                <p><strong>부서:</strong> <span>${member.departmentName}</span></p>
                                                <p><strong>직급:</strong> <span>${member.jobKey}</span></p>
                                                <p><strong>권한:</strong> <span>${member.accessKey}</span></p>
                                                <p><strong>현황:</strong> <span>${member.memberState}</span></p>
                                                <button id="saveChangesButton" class="btn btn-primary btn-custom" style="display:none;">저장</button>
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
        <!-- End Main Panel -->
    </div>

    <!-- Address Modal -->
    <div class="modal fade" id="addressModal" tabindex="-1" aria-labelledby="addressModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addressModalLabel">주소 수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="roadAddress">도로명 주소</label>
                        <input type="text" class="form-control" id="roadAddress" placeholder="도로명주소">
                    </div>
                    <div class="form-group">
                        <label for="jibunAddress">지번 주소</label>
                        <input type="text" class="form-control" id="jibunAddress" placeholder="지번주소">
                    </div>
                    <div class="form-group">
                        <label for="postcode">우편번호</label>
                        <input type="text" class="form-control" id="postcode" placeholder="우편번호">
                    </div>
                    <button type="button" class="btn btn-secondary" id="searchAddressButton">주소 검색</button>
                    <button type="button" class="btn btn-primary" id="saveAddressButton">주소 저장</button>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Password Modal -->
    <div class="modal fade" id="passwordModal" tabindex="-1" aria-labelledby="passwordModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="passwordModalLabel">비밀번호 수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>이메일 인증이 필요합니다.</p>
                    <div class="form-group">
                        <label for="verificationEmail">이메일 입력</label>
                        <input type="email" class="form-control" id="verificationEmail" placeholder="이메일 입력">
                    </div>
                    <button type="button" class="btn btn-secondary" id="sendEmailVerificationButton">이메일 인증 보내기</button>
                    <div id="emailVerificationForm" class="mt-3" style="display: none;">
                        <div class="form-group">
                            <label for="emailVerificationCode">인증 코드 입력</label>
                            <input type="text" class="form-control" id="emailVerificationCode" placeholder="인증 코드 입력">
                        </div>
                        <button type="button" class="btn btn-secondary" id="verifyCodeButton">인증 코드 확인</button>
                    </div>
                    <div id="passwordChangeForm" class="mt-3" style="display: none;">
                        <div class="form-group">
                            <label for="newPassword">새 비밀번호</label>
                            <input type="password" class="form-control" id="newPassword" placeholder="새 비밀번호">
                        </div>
                        <button type="button" class="btn btn-primary" id="saveNewPasswordButton">비밀번호 저장</button>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

    <!-- Core JS Files -->
    <script src="${path}/resources/assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="${path}/resources/assets/js/core/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <!-- Plugin JS Files -->
    <script src="${path}/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/chart.js/chart.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/chart-circle/circles.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/datatables/datatables.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/jsvectormap/world.js"></script>
    <script src="${path}/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

    <!-- Kaiadmin JS -->
    <script src="${path}/resources/assets/js/kaiadmin.min.js"></script>
    <script src="${path}/resources/assets/js/setting-demo.js"></script>
    <script src="${path}/resources/assets/js/demo.js"></script>

    <!-- Page Specific JS -->
    <script>
        $(document).ready(function() {
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
                $('#addressModal').modal('hide');
                $('#saveChangesButton').show();
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
</body>
</html>