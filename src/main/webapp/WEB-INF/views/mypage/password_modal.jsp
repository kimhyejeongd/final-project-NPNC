<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal fade" id="passwordModal" tabindex="-1" aria-labelledby="passwordModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="passwordModalLabel">비밀번호 수정</h5>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="verificationEmail">이메일</label>
                    <input type="email" class="form-control" id="verificationEmail" placeholder="이메일 입력">
                    <button type="button" class="btn btn-secondary" id="sendEmailVerificationButton">이메일 인증 보내기</button>
                </div>
                <div id="emailVerificationForm" style="display: none;">
                    <div class="form-group">
                        <label for="emailVerificationCode">인증 코드</label>
                        <input type="text" class="form-control" id="emailVerificationCode" placeholder="인증 코드 입력">
                        <button type="button" class="btn btn-secondary" id="verifyCodeButton">인증 코드 확인</button>
                    </div>
                </div>
                <div id="passwordChangeForm" style="display: none;">
                    <div class="form-group">
                        <label for="newPassword">새 비밀번호</label>
                        <input type="password" class="form-control" id="newPassword" placeholder="새 비밀번호">
                    </div>
                    <button type="button" class="btn btn-primary" id="saveNewPasswordButton">비밀번호 저장</button>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<!-- password_modal.jsp -->
<div class="modal fade" id="passwordModal" tabindex="-1" aria-labelledby="passwordModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="passwordModalLabel">비밀번호 수정</h5>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="verificationEmail">이메일</label>
                    <input type="email" class="form-control" id="verificationEmail" placeholder="이메일 입력">
                    <button type="button" class="btn btn-secondary" id="sendEmailVerificationButton">이메일 인증 보내기</button>
                </div>
                <div id="emailVerificationForm" style="display: none;">
                    <div class="form-group">
                        <label for="emailVerificationCode">인증 코드</label>
                        <input type="text" class="form-control" id="emailVerificationCode" placeholder="인증 코드 입력">
                        <button type="button" class="btn btn-secondary" id="verifyCodeButton">인증 코드 확인</button>
                    </div>
                </div>
                <div id="passwordChangeForm" style="display: none;">
                    <div class="form-group">
                        <label for="newPassword">새 비밀번호</label>
                        <input type="password" class="form-control" id="newPassword" placeholder="새 비밀번호">
                    </div>
                    <button type="button" class="btn btn-primary" id="saveNewPasswordButton">비밀번호 저장</button>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
