<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>외부 주소록</title>

    <!-- 기본 CSS 파일 -->
    <link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/kaiadmin.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/demo.css" />

    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.min.css" rel="stylesheet">

    <style>
        /* 팝업 스타일 */
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background: white;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            z-index: 1000;
        }
		
        .popup-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;	
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }

        .popup-overlay.show {
            display: block;
        }

        .menu {
            display: none;
            position: absolute;
            background: white;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .contact-card {
            position: relative;
            padding: 10px;
            border: 1px solid #ddd;
            margin-bottom: 10px;
            background: #f9f9f9;
        }

        .contact-card:hover .menu {
            display: block;
        }

        .star {
            font-size: 24px; /* 별의 크기 */ !important;
            color: gray; /* 기본 색상 */ 
            cursor: pointer; /* 클릭 가능하게 보이도록 */
            margin-left: 10px; /* 왼쪽에 여백 추가 */
        }

        .star.favorite {
            color: gold; /* 즐겨찾기 색상 */
        }

        /* 스타일 */
        .contact-info {
            margin-bottom: 10px;
        }

        .contact-info label {
            font-weight: bold;
            }
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
                    <h1 class="mb-4">외부 주소록 목록</h1>

                    <!-- 외부 주소록 목록 테이블 -->
                    <table class="table">
                        <thead>
                            <tr>
                                <th>이름</th>
                                <th>전화번호</th>
                                <th>이메일</th>
                                <th>회사명</th>
                                <th>즐겨찾기</th>
                                <th>조치</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="contact" items="${contacts}">
                                <tr>
                                    <td>${contact.AB_EXTERNAL_NAME}</td>
                                    <td>${contact.AB_EXTERNAL_TELL}</td>
                                    <td>${contact.AB_EXTERNAL_EMAIL}</td>
                                    <td>${contact.AB_EXTERNAL_COMPANY}</td>
                                    <td>
                                        <!-- 즐겨찾기 아이콘 -->
                                        <i class="fas fa-star bookmark-icon" 
                                           data-id="${contact.AB_EXTERNAL_KEY}" 
                                           data-bookmark="${contact.AB_EXTERNAL_BOOKMARK}"
                                           style="color:${contact.AB_EXTERNAL_BOOKMARK == 'Y' ? 'gold' : 'gray'};"></i>
                                    </td>
                                    <td>
                                        <!-- 수정 버튼 -->
                                        <button type="button" class="btn btn-primary" onclick="openEditModal(${contact.AB_EXTERNAL_KEY}, '${contact.AB_EXTERNAL_NAME}', '${contact.AB_EXTERNAL_TELL}', '${contact.AB_EXTERNAL_EMAIL}', '${contact.AB_EXTERNAL_COMPANY}', '${contact.AB_EXTERNAL_DEPARTMENT}', '${contact.AB_EXTERNAL_JOB}', '${contact.AB_EXTERNAL_MEMO}')">수정</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- Footer -->
                <c:import url="${path}/WEB-INF/views/common/footer.jsp"/>
            </div>
        </div>


        <!-- 수정 모달 -->
        <div class="modal fade" id="editContactModal" tabindex="-1" aria-labelledby="editContactModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editContactModalLabel">외부 주소록 수정</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="editContactForm" action="${path}/external/edit" method="post">
                        <input type="hidden" id="contactKey" name="AB_EXTERNAL_KEY" />
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="name">이름</label>
                                <input type="text" id="name" name="AB_EXTERNAL_NAME" class="form-control" readonly>
                            </div>
                            <div class="form-group">
                                <label for="tell">전화번호</label>
                                <input type="text" id="tell" name="AB_EXTERNAL_TELL" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="email">이메일</label>
                                <input type="email" id="email" name="AB_EXTERNAL_EMAIL" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="company">회사명</label>
                                <input type="text" id="company" name="AB_EXTERNAL_COMPANY" class="form-control" readonly>
                            </div>
                            <div class="form-group">
                                <label for="department">부서</label>
                                <input type="text" id="department" name="AB_EXTERNAL_DEPARTMENT" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="job">직급</label>
                                <input type="text" id="job" name="AB_EXTERNAL_JOB" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="memo">메모</label>
                                <textarea id="memo" name="AB_EXTERNAL_MEMO" class="form-control" rows="3" required></textarea>
                            </div>
                             
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            <button type="submit" class="btn btn-primary">수정 완료</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="${path}/resources/assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="${path}/resources/assets/js/core/popper.min.js"></script>
    <script src="${path}/resources/assets/js/core/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JS -->
    <script src="${path}/resources/assets/js/kaiadmin.js"></script>

    <!-- 모달 스크립트 -->
    <script>
    function openEditModal(key, name, tell, email, company, department, job, memo, bookmark) {
        // 모달 폼의 필드에 데이터 설정
        document.getElementById('contactKey').value = key;
        document.getElementById('name').value = name;
        document.getElementById('tell').value = tell;
        document.getElementById('email').value = email;
        document.getElementById('company').value = company;
        document.getElementById('department').value = department;
        document.getElementById('job').value = job;
        document.getElementById('memo').value = memo;
        document.getElementById('bookmark').value = bookmark;

        // 모달 열기
        var myModal = new bootstrap.Modal(document.getElementById('editContactModal'));
        myModal.show();
    }
    </script>

    <!-- 즐겨찾기 토글 스크립트 -->
    <script>
    $(document).ready(function() {
        $('.bookmark-icon').click(function() {
            var icon = $(this);
            var id = icon.data('id');
            var currentStatus = icon.data('bookmark');
            var newStatus = currentStatus === 'Y' ? 'N' : 'Y';

            $.ajax({
                url: '${path}/external/toggleFavorite',
                type: 'POST',
                data: { 'AB_EXTERNAL_KEY': id },
                success: function(response) {
                    if (response === 'success') {
                        icon.data('bookmark', newStatus);
                        icon.css('color', newStatus === 'Y' ? 'gold' : 'gray');
                    } else {
                        alert('즐겨찾기 토글에 실패했습니다.');
                    }
                },
                error: function() {
                    alert('서버 오류');
                }
            });
        });
    });
    </script>
</body>
</html>