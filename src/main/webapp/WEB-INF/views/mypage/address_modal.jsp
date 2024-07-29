<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
