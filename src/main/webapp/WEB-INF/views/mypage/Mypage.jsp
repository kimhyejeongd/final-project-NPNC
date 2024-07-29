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
        <!-- End Main Panel -->
    </div>

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
    <script src="${path}/resources/assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
    <script src="${path}/resources/assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>
    <script src="${path}/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

    <!-- 주소 검색을 위한 Daum Postcode API -->
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

    <!-- Atlantis JS -->
    <script src="${path}/resources/assets/js/atlantis.min.js"></script>

    <!-- Custom JS -->
    <script>
        $(document).ready(function() {
            $("#editAddressButton").click(function() {
                $("#memberAddressText").hide();
                $("#editAddressButton").hide();
                $("#memberAddress").show();
                $("#addressSearchBox").show();
                $("#saveChangesButton").show();
            });

            $("#searchAddressButton").click(function() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        var roadAddr = data.roadAddress; // 도로명 주소
                        var jibunAddr = data.jibunAddress; // 지번 주소

                        // 우편번호와 주소 정보를 해당 필드에 넣음
                        $('#postcode').val(data.zonecode);
                        $('#roadAddress').val(roadAddr);
                        $('#jibunAddress').val(jibunAddr);
                    }
                }).open();
            });

            $("#saveAddressButton").click(function() {
                var newAddress = $("#roadAddress").val();
                $("#memberAddress").val(newAddress);
                $("#memberAddressText").text(newAddress).show();
                $("#memberAddress").hide();
                $("#addressSearchBox").hide();
                $("#saveChangesButton").hide();
                alert("주소가 성공적으로 저장되었습니다."); // 주소 저장 확인 메시지
            });

            $("#editPasswordButton").click(function() {
                $("#passwordForm").show();
            });

            $("#sendEmailVerificationButton").click(function() {
                var email = $("#verificationEmail").val();
                if (email) {
                    $.ajax({
                        url: '/member/sendPasswordResetEmail',
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify({ email: email }),
                        success: function(response) {
                            if (response.success) {
                                alert("Verification email sent. Please check your inbox.");
                                $("#emailVerificationForm").show();
                            } else {
                                alert("Failed to send verification email.");
                            }
                        }
                    });
                }
            });

            $("#verifyCodeButton").click(function() {
                var code = $("#emailVerificationCode").val();
                if (code) {
                    $.ajax({
                        url: '/member/verifyCode',
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify({ code: code }),
                        success: function(response) {
                            if (response.success) {
                                alert("Code verified. You can now change your password.");
                                $("#passwordChangeForm").show();
                            } else {
                                alert("Invalid code. Please try again.");
                            }
                        }
                    });
                }
            });

            $("#saveNewPasswordButton").click(function() {
                var newPassword = $("#newPassword").val();
                var email = $("#verificationEmail").val();
                if (newPassword) {
                    $.ajax({
                        url: '/member/changePassword',
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify({ email: email, newPassword: newPassword }),
                        success: function(response) {
                            if (response.success) {
                                alert("Password changed successfully.");
                                $("#passwordForm").hide();
                            } else {
                                alert("Failed to change password.");
                            }
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>
