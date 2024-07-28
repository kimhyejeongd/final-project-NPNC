<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<style type="text/css">
    .drop-hover {
        border: 2px dashed #007bff;
    }
    .drop-zone {
        position: fixed;
        bottom: 0;
        width: 100%;
        height: 100px;
        background-color: #f8f9fa;
        text-align: center;
        line-height: 100px;
        border-top: 2px dashed #007bff;
        display: none;
        opacity: 0.5; /* 클릭 중일 때 연한 색 */
    }
    .drop-zone.highlight {
        background-color: #007bff;
        color: white;
        display: block;
        opacity: 1; /* 드롭 오버 시 진한 색 */
    }
    .accordion-header.dragging {
        background-color: #e2e6ea; /* 드래그 중일 때 연한 색 */
    }
    .accordion-header.drop-hover {
        background-color: #007bff; /* 드롭 오버 시 진한 색 */
        color: white;
    }
</style>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <jsp:include page="/WEB-INF/views/admin/adminsidebar.jsp"></jsp:include>

    <div class="main-panel">
        <div class="container">
            <div class="page-inner" style="display: flex">
                <div class="col w-45" style="width:20%">
                    <div class="card card-round" style="height: 500px;">
                        <div class="card-header">
                            <div class="card-head-row card-tools-still-right">
                                <div class="card-title" id="formfoldername" style="padding-right: 76px;">전자문서 보관함 폴더 목록</div>
                                <button class="btn btn-primary btn-xs" data-bs-toggle="modal" data-bs-target="#addFolder">폴더 추가</button>
                                <div class="card-tools"></div>
                            </div>
                        </div>
                        <div class="p-4 overflow-hidden">
                            <div class="form-group d-flex gap-1 p-0 pb-4">
                                <input id="searchInput" type="text" class="form-control" placeholder="이름으로 검색">
                            </div>
                            <div class="card-list p-0 overflow-x-auto m-0 rounded" style="height: 330px;">
                                <div class="accordion" id="accordionPanelsStayOpenExample">
                                    <c:forEach var="f" items="${folders }">
                                        <c:set var="folderJson" value="${f}"/>
                                        <div class="accordion-item">
                                            <c:if test="${f.folderLevel==1}">
                                                <h2 class="accordion-header droppable" data-folder="${folderJson}" data-folder-key="${f.folderKey}">
                                                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse${f.folderKey}" aria-expanded="true" aria-controls="panelsStayOpen-collapse0">
                                                        <i class="fas fa-bookmark me-2"></i>
                                                        ${f.folderName}
                                                    </button>
                                                </h2>
                                            </c:if>
                                            <div id="panelsStayOpen-collapse${f.folderKey}" class="accordion-collapse collapse show">
                                                <div class="accordion-body" style="padding: 0!important;">
                                                    <div class="list-group" id="memberlist">
                                                        <c:if test="${f.folderLevel==2}">
                                                            <a href="#" class="list-group-item list-group-item-action align-items-center folder-item" data-folder-key="${f.folderKey}" data-folder='${folderJson}' data-folder-level='${f.folderLevel}'> 
                                                                <i class="fas fa-user me-2"></i>
                                                                ${f.folderName}
                                                            </a>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="width:67%">
                    <!-- Projects table -->
                    <table class="table table-hover align-items-center mb-0" id="docTable">
                        <thead class="thead-light">
                            <tr class="text-center">
                                <th scope="col" class="">
                                    <input type="checkbox" id="checkAll">
                                </th>
                                <th scope="col" class="">보관함명</th>
                                <th scope="col" class="">보관함 관리자</th>
                                <th scope="col" class="">보관 기한</th>
                                <th scope="col" class="">사용여부</th>
                            </tr>
                        </thead>
                        <tbody id="docTableBody"></tbody>
                    </table>
                </div>
            </div>
        </div>
        <div id="dropZone" class="drop-zone">폴더를 여기로 드래그해서 삭제</div> <!-- 드롭 존 추가 -->
    </div>

    <!-- Add Folder Modal -->
    <div class="modal fade" id="addFolder" tabindex="-1" aria-labelledby="addFolderModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addFolderModalLabel">폴더 추가</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addFolderForm">
                        <div class="mb-3">
                            <label for="folderName" class="form-label">폴더명</label>
                            <div>
	                            <input type="text" class="form-control" id="folderName" placeholder="폴더 이름 입력">
	                            <div class="form-group mb-3">
								    <label for="folderType" class="form-label">분류</label>
								    <select class="form-select" id="folderType">
								        <option value="">선택하세요</option>
								        <option value="main">대분류</option>
								        <option value="sub">소분류</option>
								    </select>
								</div>
                            </div>
                            <div id="subCategoryMenu" class="form-group mb-3" style="display: none;">
							    <label for="subCategoryName" class="form-label">대분류 선택</label>
							    <select class="form-select" id="subCategoryName">
							    	<c:forEach var="f" items="${folders}">
							    		<c:if test="${f.folderLevel==1}">
									        <option value="${f.folderGroup }" id="folderGroup">${f.folderName}</option>							    	
							    		</c:if>
							    	</c:forEach>
							    </select>
							</div>
                            <label for="use" class="form-label">사용 여부</label>
                            <div class="form-check" style="display:flex">
                                <input class="form-check-input" type="radio" name="useYn" id="flexRadioDefault1" value="Y" checked>
                                <label class="form-check-label" for="flexRadioDefault1">
                                    사용
                                </label>
                                <input class="form-check-input" type="radio" name="useYn" id="flexRadioDefault2" value="N">
                                <label class="form-check-label" for="flexRadioDefault2">
                                    비사용
                                </label>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">저장</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
        	
            // 폴더 추가 폼 제출 이벤트 처리
            $('#addFolderForm').on('submit', function(e) {
                e.preventDefault(); // 기본 폼 제출 동작을 막음

                var folderName = $('#folderName').val();
                var folderType = $('#folderType').val();
                var useStatus = $('input[name="useYn"]:checked').val(); // 라디오 버튼 값 추출
                var folderGroup = $('#folderGroup').val();

                // 유효성 검사
                if (!folderName || !folderType) {
                    if (!folderName && !folderType) {
                        alert("폴더명과 분류를 선택하세요.");
                    } else if (!folderName) {
                        alert("폴더명을 입력하세요.");
                    } else {
                        alert("분류를 선택하세요.");
                    }
                    return; // 폼 제출 중단
                }
				
                var requestData = {
                    folderName: folderName,
                    folderLevel:folderType === 'sub' ? 2 : 1,
                    useYn: useStatus,
                    folderGroup: folderGroup
                };

                $.ajax({
                    url: '${path}/admin/documentForm/createFolder', // 서버 요청 URL
                    type: 'POST',
                    data: JSON.stringify(requestData),
                    contentType: 'application/json;charset=utf-8',
                    success: function(response) {
                        console.log('Folder added successfully:', response);
                        // 성공 시 필요한 추가 동작을 여기에 작성
                        // 예: 폴더 목록 갱신, 모달 닫기 등
                        $('#addFolder').modal('hide');
                        location.reload(); // 폴더 목록 갱신을 위해 페이지 새로 고침
                    },
                    error: function(response) {
                        console.error('Error adding folder:', response);
                    }
                });
            });
            $('#folderType').on('change', function() {
                var selectedValue = $(this).val();
                if (selectedValue === 'sub') {
                    $('#subCategoryMenu').show(); // 대분류 선택 시 소분류 메뉴 표시
                } else {
                    $('#subCategoryMenu').hide(); // 소분류 선택 시 소분류 메뉴 숨김
                }
            });
            // 검색 입력 필드에 keyup 이벤트 추가
            $('#searchInput').on('keyup', function() {
                var searchValue = $(this).val().toLowerCase();

                $('.folder-item').each(function() {
                    var folderName = $(this).text().toLowerCase();
                    var folderLevel = $(this).data('folder-level'); // 폴더 레벨 가져오기

                    if (folderLevel == 2 && folderName.includes(searchValue)) {
                        $(this).show();
                    } else {
                        $(this).hide();
                    }
                });
            });

            // jQuery로 Bootstrap Collapse 토글 처리
            $('[data-bs-toggle="collapse"]').click(function() {
                var target = $(this).data('bs-target');
                $(target).collapse('toggle');
            });

            $('#checkAll').click(function() {
                if ($(this).is(':checked')) {
                    $('.checkItem').prop('checked', true);
                } else {
                    $('.checkItem').prop('checked', false);
                }
            });

            $('.folder-item').on('click', function(e) {
                e.preventDefault(); // 기본 클릭 동작을 막음

                var folderKey = $(this).data('folder-key'); // 클릭된 항목의 folderId 가져오기

                $.ajax({
                    url: '${path}/admin/documentForm/selectDoc', // 서버 요청 URL
                    type: 'GET',
                    data: { folderKey: folderKey }, // 요청에 포함될 데이터
                    success: function(response) {
                        // 서버에서 받은 데이터를 사용하여 테이블을 동적으로 생성
                        var tableBody = $('#docTableBody');
                        tableBody.empty(); // 기존 내용을 비움

                        response.forEach(function(doc, index) {
                            console.log(doc);
                            var row = 
                                '<tr class="text-center">' +
                                    '<td class="approverNow p-3"><input type="checkbox" class="checkItem"></td>' +
                                    '<td class="approverNow p-3">' + doc.erStorageName + '</td>' +
                                    '<td class="approverNow p-3">' + doc.department.deptName + " " + doc.member.memberName + " " + doc.job.jobName + '</td>' +
                                    '<td class="approverNow p-3">' + doc.erStorageTerm + '년</td>' +
                                    '<td class="approverNow p-3">' + doc.storageFolder.useYn + '</td>' +
                                '</tr>';
                            tableBody.append(row);
                        });
                    }
                });
            });

            // 드래그 이벤트 설정
            $(document).on('dragstart', '.folder-item', function(event) {
                event.stopPropagation();

                var item = $(this);
                event.originalEvent.dataTransfer.setData('text/plain', item.data('folder-key'));
                item.css('opacity', '0.5');
                window.draggedItem = item;  // 드래그된 요소를 전역 변수로 저장
                $('#dropZone').show(); // 드래그 시작 시 드롭 존 표시
                $('.accordion-header').addClass('dragging'); // 드래그 중일 때 연한 색
            });

            $(document).on('dragend', '.folder-item', function(event) {
                event.stopPropagation();

                window.draggedItem.css('opacity', '1');
                $('#dropZone').hide(); // 드래그 종료 시 드롭 존 숨김
                $('.accordion-header').removeClass('dragging'); // 드래그 종료 시 연한 색 제거
            });

            // 드롭 가능한 영역 설정
            $(document).on('dragover', '.accordion-header.droppable', function(event) {
                event.stopPropagation();

                event.preventDefault();
                $(this).addClass('drop-hover');
            });

            $(document).on('dragleave', '.accordion-header.droppable', function(event) {
                $(this).removeClass('drop-hover');
            });

            $(document).on('drop', '.accordion-header.droppable', function(event) {
                event.stopPropagation();
                
                event.preventDefault();
                $(this).removeClass('drop-hover');
                
                var draggable = window.draggedItem;  // 드래그된 요소를 가져옴
                var targetAccordionItem = $(this); // 최상위 부모인 .accordion-item을 찾아서
                
                var draggedFolder = draggable.data('folder-key'); // 드래그된 폴더 데이터 추출
                var targetFolder = targetAccordionItem.data('folder-key'); // 타겟 폴더 데이터 추출

                var draggableEle = window.draggedItem.closest(".accordion-item");
                var targetEle = targetAccordionItem.closest(".accordion-item");
                
                $.ajax({
                    url: '${path}/admin/documentForm/updateFolderOrder', // 서버 요청 URL
                    type: 'POST',
                    data: JSON.stringify({
                        "draggedFolder": draggedFolder,
                        "targetFolder": targetFolder,
                    }),
                    contentType: 'application/json;charset=utf-8',
                    success: function(response) {
                        targetEle.after(draggableEle);
                    },
                    error: function(response) {
                        console.error('Error updating folder order');
                    }
                });
            });

            // 드롭 존 설정
            $(document).on('dragover', function(event) {
                event.preventDefault();
                var dropZone = $('#dropZone');
                var mouseY = event.originalEvent.clientY;
                if (mouseY > $(window).height() - 100) {
                    dropZone.addClass('highlight');
                } else {
                    dropZone.removeClass('highlight');
                }
            });

            $(document).on('dragleave', '#dropZone', function(event) {
                $(this).removeClass('highlight');
            });

            $(document).on('drop', function(event) {
                event.preventDefault();
                var dropZone = $('#dropZone');
                dropZone.removeClass('highlight');

                if (!window.draggedItem) return; // 드래그된 항목이 없는 경우 종료

                var folderLevel = window.draggedItem.data('folder-level');
                if (folderLevel == 2) {
                    var draggedFolderKey = window.draggedItem.data('folder-key');
                    console.log(draggedFolderKey+"----");
					console.log(typeof draggedFolderKey);

                    if (event.originalEvent.clientY > $(window).height() - 100) { // 하단에 드롭한 경우
                        $.ajax({
                            url: '${path}/admin/documentForm/removeFolder', // 서버 요청 URL
                            type: 'POST',
                            data: {"draggedFolderKey":draggedFolderKey},
                            success: function(response) {
                                window.draggedItem.remove(); // 드래그된 요소를 제거
                            },
                            error: function(response) {
                                console.error('Error removing folder:', response);
                            }
                        });
                    }
                }
            });
        });
    </script>
</body>
</html>
