<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>새 주소록 추가</title>
    
    <!-- CSS Files -->
    <link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/kaiadmin.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/demo.css" />

    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 40px;
            max-width: 600px; /* 가로폭을 줄입니다. */
        }

        .page-inner h2 {
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .card {
            border: 1px solid #ddd;
            border-radius: 0.25rem;
            box-shadow: 0 0 0 1px rgba(0,0,0,.1);
        }

        .card-body {
            padding: 1.25rem;
        }

        .form-row .col {
            margin-bottom: 1.5rem; /* 각 요소 사이에 여백을 추가합니다. */
        }

        .form-control {
            border-radius: 0.25rem;
            box-shadow: inset 0 1px 2px rgba(0,0,0,.075);
            font-size: 1rem;
        }

        .form-control:focus {
            border-color: #80bdff;
            outline: 0;
            box-shadow: 0 0 0 0.2rem rgba(38,143,255,.25);
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }

        .btn-primary:focus, .btn-primary.focus {
            box-shadow: 0 0 0 0.2rem rgba(38,143,255,.5);
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <%@ include file="/WEB-INF/views/board/boardSidebar.jsp" %>

        <div class="main-panel">
            <!-- Header Bar -->
            <c:import url="/WEB-INF/views/common/header_bar.jsp"/>

            <div class="container">
                <div class="page-inner">
                    <h2 class="mb-4">새 주소록 추가</h2>
                    <div class="card">
                        <div class="card-body">
                            <form id="addContactForm" action="${path}/external/add" method="post">
                                <div class="form-row">
                                    <div class="col">
                                        <input type="text" name="AB_EXTERNAL_NAME" class="form-control" placeholder="이름" required>
                                    </div>
                                    <div class="col">
                                        <input type="text" name="AB_EXTERNAL_TELL" class="form-control" placeholder="전화번호" required>
                                    </div>
                                    <div class="col">
                                        <input type="email" name="AB_EXTERNAL_EMAIL" class="form-control" placeholder="이메일">
                                    </div>
                                    <div class="col">
                                        <input type="text" name="AB_EXTERNAL_COMPANY" class="form-control" placeholder="회사명">
                                    </div>
                                </div>
                                <div class="form-row mt-2">
                                    <div class="col">
                                        <input type="text" name="AB_EXTERNAL_DEPARTMENT" class="form-control" placeholder="부서">
                                    </div>
                                    <div class="col">
                                        <input type="text" name="AB_EXTERNAL_JOB" class="form-control" placeholder="직책">
                                    </div>
                                    <div class="col">
                                        <select name="AB_EXTERNAL_GENDER" class="form-control" required>
                                            <option value="">성별</option>
                                            <option value="M">남성</option>
                                            <option value="F">여성</option>
                                        </select>
                                    </div>
                                    <div class="col">
                                        <textarea name="AB_EXTERNAL_MEMO" class="form-control" placeholder="메모"></textarea>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary mt-3">추가</button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Footer -->
                <c:import url="$/WEB-INF/views/common/footer.jsp"/>
            </div>
        </div>
    </div>

    <!-- JS Files -->
    <script src="${path}/resources/assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="${path}/resources/assets/js/core/popper.min.js"></script>
    <script src="${path}/resources/assets/js/core/bootstrap.bundle.min.js"></script>
    <script src="${path}/resources/assets/js/kaiadmin.js"></script>
</body>
</html>
