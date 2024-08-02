<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>새 연락처 추가</title>

    <!-- 기본 CSS 파일 -->
    <link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/kaiadmin.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/demo.css" />

    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.min.css" rel="stylesheet">

    <style>
        .container {
            margin-top: 90px;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <%@ include file="/WEB-INF/views/board/boardSidebar.jsp" %>

        <div class="main-panel">
            <!-- Header Bar -->
            <c:import url="${path}/WEB-INF/views/common/header_bar.jsp"/>
            <div class="page-inner">
                <div class="container">
                    <h2 class="mt-4">새 연락처 추가</h2>
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
			        <div class="col">
			            <button type="submit" class="btn btn-success mt-2">추가</button>
			        </div>
			    </div>
			    <!-- Hidden fields for default values -->
			    <input type="hidden" name="AB_EXTERNAL_BOOKMARK" value="N">
			    <input type="hidden" name="AB_EXTERNAL_DELETE" value="N">
			</form>

                </div>

                <!-- Footer -->
                <c:import url="${path}/WEB-INF/views/common/footer.jsp"/>
            </div>
        </div>
    </div>

    <!-- 기존 스크립트 유지 -->
</body>
</html>
