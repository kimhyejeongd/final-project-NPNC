<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication var="loginMember" property="principal"/>
<!DOCTYPE html>
<html>
<style>
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
</style>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
 	<%@ include file="/WEB-INF/views/admin/adminsidebar.jsp" %> 
 	

    <div class="main-panel">
        <div class="container">
            <div class="page-inner" style="display: flex">
                <div class="col w-45" style="width:20%">
                    <div class="card card-round" style="height: 500px;width: 402px;">
                        <div class="card-header">
                            <div class="card-head-row card-tools-still-right" style="display: flex; justify-content: space-between;">
                                <div class="card-title" id="formfoldername">전자문서 양식 폴더 목록</div>
                                <div>
	                                <button class="btn btn-primary btn-xs" data-bs-toggle="modal" data-bs-target="#addFolder">폴더 추가</button>
	                                <button class="btn btn-primary btn-xs" data-bs-toggle="modal" data-bs-target="#updateFolder">폴더 수정</button>
                                </div>
                            </div>
                        </div>
                        <div class="p-4 overflow-hidden">
                            <div class="form-group d-flex gap-1 p-0 pb-4">
                                <input id="searchInput" type="text" class="form-control" placeholder="이름으로 검색">
                            </div>
                            <div class="card-list p-0 overflow-x-auto m-0 rounded" style="height: 330px;">
                                <div class="accordion" id="accordionPanelsStayOpenExample">

                                    <c:forEach var="f" items="${folders}">
                                        <div class="accordion-item">
                                            <div id="panelsStayOpen-collapse${f.erFormFolderKey}" class="accordion-collapse collapse show">
                                                <div class="accordion-body" style="padding: 0!important;">
                                                    <div class="list-group" id="memberlist">
                                                            <a href="#" class="list-group-item list-group-item-action align-items-center folder-item accordion-header droppable" data-folder-key="${f.erFormFolderKey}" data-folder-group="${f.erFormKey}"> 
                                                                <i class="fas fa-user me-2"></i>
																${f.erFormFolderName }
                                                            </a>
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
                <div style="width:60%">
			
                
                  
                    <!-- Projects table -->
                    <table class="table table-hover align-items-center mb-0" id="docTable">
                        <thead class="thead-light">
                        	<tr>
                        		<th>
                        		  <div style="display: flex; justify-content: center; margin-bottom: 10px;">
							        <button class="btn btn-danger btn-xs" id="deleteSelected">삭제</button>
							    </div>
                        		</th>
                        		<th></th>
                        		<th></th>
                        		<th></th>
                        		<th></th>
                        		<th></th>
                        	</tr>
                            <tr class="text-center">
                                <th scope="col" class="">
                                    <input type="checkbox" id="checkAll">
                                </th>
                                <th scope="col" class="">양식명</th>
                                <th scope="col" class="">최종 수정자</th>
                                <th scope="col" class="">사용여부</th>
                                <th scope="col" class="">수정</th>
                            </tr>
                        </thead>
                        <tbody id="docTableBody"></tbody>
                    </table>
                    <div style="display: ruby-text; margin-top: 10px;">
							<button class="btn btn-primary btn-xs" onclick="window.location.href='${path}/admin/documentForm/form'">양식 추가</button>
                    </div>
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
    
    			<!-- Update Folder Modal -->
			<div class="modal fade" id="updateFolder" tabindex="-1" aria-labelledby="updateFolderModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-body">
			                <form id="updateFolderForm">
			                    <div class="form-group mb-3">
			                        <label for="updateFolderSelect" class="form-label">폴더 선택</label>
			                        <select class="form-select" id="updateFolderSelect">
			                        	<c:forEach var="f" items="${folders }">
			                        		 <option value="${f.erFormFolderKey}" data-folder-name="${f.erFormFolderName}">
			                        		 	${f.erFormFolderName}
			                        		 </option>
			                        	</c:forEach>
			                        </select>
			                    </div>
			                    <div class="form-group mb-3">
			                        <label for="updateFolderName" class="form-label">폴더 이름</label>
			                        <input type="text" class="form-control" id="updateFolderName" placeholder="폴더 이름 입력">
			                    </div>
			                    <div class="form-group mb-3">
			                        <label for="updateUseYn" class="form-label">사용 여부</label>
			                        <div class="form-check" style="display:flex">
			                            <input class="form-check-input" type="radio" name="updateUseYn" id="updateUseYnY" value="Y">
			                            <label class="form-check-label" for="updateUseYnY">사용</label>
			                            <input class="form-check-input" type="radio" name="updateUseYn" id="updateUseYnN" value="N">
			                            <label class="form-check-label" for="updateUseYnN">비사용</label>
			                        </div>
			                    </div>
			                    <button type="submit" class="btn btn-primary">저장</button>
			                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			                </form>
			            </div>
			        </div>
			    </div>
			</div>
    
    <!-- addForm modal-->
    
        <div class="modal fade" id="addStorage">
    <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    	<h3 class="modal-title">보관함 추가</h3>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
                 <div class="modal-body">
                    <form id="addStorageForm">
                    	<div class="mb-3">
							<label for="storageName" class="form-label">보관함 명</label>
							<input type="text" class="form-control" id="storageName" placeholder="보관함 이름 입력">
                    	</div>
                    	<div class="form-group mb-3">
						    <label for="storageFolderType" class="form-label">보관기한</label>
						    <select class="form-select" id="storageFolderType">
						        <option value="">선택하세요</option>
						        <option value="1">1년</option>
						        <option value="5">5년</option>
						        <option value=10>10년</option>
						    </select>
						</div>
						              <div class="col w-45" style="">
                <div class="card card-round" style="height: 500px;" >
                <div class="card-header">
                	보관함 관리자
                  </div>
                  <div class="p-4 overflow-hidden">
                    <div class="form-group d-flex gap-1 p-0 pb-4">
		                <input type="text" class="form-control" placeholder="이름으로 검색">
		                <button class="btn btn-outline-info btn-sm"><i class="fa fa-search search-icon"></i></button>
		            </div>
                    <div class="card-list p-0 overflow-x-auto m-0 rounded" style="height: 330px;">
	                    <div class="accordion" id="accordionPanelsStayOpenExample">
						<c:forEach var="d" items="${members }" varStatus="status">
							<div class="accordion-item">
							    <h2 class="accordion-header">
							      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse${status.index}" aria-expanded="true" aria-controls="panelsStayOpen-collapse${status.index}">
							        <i class="fas fa-bookmark me-2"></i>${d.departmentName} 
							      </button>
							    </h2>
				    			<div id="panelsStayOpen-collapse${status.index}" class="accordion-collapse collapse show">
							      <div class="accordion-body" style='padding: 0!important;'>
							         <div class="list-group" id="memberlist">
						 				<c:forEach var="memberlist" items="${d.memberlist}">
										  <a href="#" class="list-group-item list-group-item-action align-items-center member-item" data-id="${memberlist.memberKey }" data-name="${memberlist.memberName }" data-job="${memberlist.jobName }" data-jobkey="${memberlist.jobKey }" data-team="${d.departmentName}" data-teamKey="${memberlist.departmentKey }">&emsp;<i class="fas fa-user me-2"></i><b>${memberlist.memberName}</b>&ensp;${memberlist.jobName}</a>
						  				</c:forEach>
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
              <div style="display: flex;justify-content: center;">
                         <button type="submit" class="btn btn-primary">저장</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
              </div>
                    </form>
                </div>
               
			</div>
		</div>
    </div>

  

<script>
$(document).ready(function() {
	
	$('.folder-item').on('click', function(e) {
	    e.preventDefault(); // 기본 클릭 동작을 막음
	    
	    
	
	    var folderKey = $(this).data('folder-key'); // 클릭된 항목의 folderId 가져오기
	
	    
	    $.ajax({
	        url: '${path}/admin/documentForm/selectForm', // 서버 요청 URL
	        type: 'POST',
	        data: { folderKey: folderKey }, // 요청에 포함될 데이터
	        success: function(response) {
	            // 서버에서 받은 데이터를 사용하여 테이블을 동적으로 생성
	            console.log(response);
	            var tableBody = $('#docTableBody');
	            tableBody.empty(); // 기존 내용을 비움
	
	            response.forEach(function(doc, index) {
	                var updaterInfo = doc.erFormUpdater!=0 ? 
	                        doc.department.deptName + " " + doc.member.memberName + " " + doc.job.jobName : 
	                        '-';
	                var row = 
	                    '<tr class="text-center" data-id="'+doc.erFormKey+'" >'+
	                        '<td class="approverNow p-3"><input type="checkbox" class="checkItem"></td>' +
	                        '<td class="approverNow p-3">' + doc.erFormName + '</td>' +
	                        '<td class="approverNow p-3">' + updaterInfo + '</td>' +
	                        '<td class="approverNow p-3">' + doc.erFormYn + '</td>' +
	                        '<td class="approverNow p-3">' + 
	                        '<button class="btn btn-primary btn-xs" data-bs-toggle="modal" data-bs-target="#updateStorage" onclick="window.location.href=\'${path}/admin/documentForm/form?formKey='+doc.erFormKey+'\'">수정</button>'+
	                        
	              			'<input type="hidden" id="oriName" name="oriName" value="'+doc.erStorageName+'">'
	                        + '</td>' +
	                    '</tr>';
	                tableBody.append(row);
	                
	
	            });
	        }
	    });
	}); 
    // 폴더 추가 폼 제출 이벤트 처리
    $('#addFolderForm').on('submit', function(e) {
        e.preventDefault(); // 기본 폼 제출 동작을 막음
		console.log("addFolderForm");
        var erFormFolderName = $('#folderName').val();
/*         var useStatus = $('input[name="useYn"]:checked').val(); // 라디오 버튼 값 추출
 */
        // 유효성 검사
        if (!folderName) {
            if (!folderName && !useStatus) {
                alert("폴더명과 분류를 선택하세요.");
            } else if (!folderName) {
                alert("폴더명을 입력하세요.");
            } /* else {
                alert("분류를 선택하세요.");
            } */
            return; // 폼 제출 중단
        }
		
        var requestData = {
        	erFormFolderName: erFormFolderName,
            erFormFolderCreater:'${loginMember.memberKey}'/* ,
            useYn: useStatus */
        };

        $.ajax({
            url: '${path}/admin/documentForm/createDocFolder', // 서버 요청 URL
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
    
	  $('#updateFolderSelect').on('change', function() {
	        var selectedOption = $(this).find('option:selected');
	        var folderName = selectedOption.data('folder-name');
	     /*    var useYn = selectedOption.data('use-yn'); */

	   /*      $('input[name="updateUseYn"][value="' + useYn + '"]').prop('checked', true); */
	    });
    
 // 폴더 수정 폼 제출 이벤트
    $('#updateFolderForm').on('submit', function(e) {
        e.preventDefault(); // 기본 폼 제출 동작을 막음

        var folderKey = $('#updateFolderSelect').val();
        var folderName = $('#updateFolderName').val();
     /*    var useYn = $('input[name="updateUseYn"]:checked').val(); */

        // 유효성 검사
        if (!folderKey || !folderName) {
            alert("모든 필드를 채워주세요.");
            return;
        }

        var requestData = {
        		erFormFolderKey: folderKey,
        		erFormFolderName: folderName,
        		erFormFolderUpdater:'${loginMember.memberKey}'
        };
        $.ajax({
            url: '${path}/admin/documentForm/updateDocFolder', // 서버 요청 URL
            type: 'POST',
            data: JSON.stringify(requestData),
            contentType: 'application/json;charset=utf-8',
            success: function(response) {
                console.log('Folder updated successfully:', response);
                $('#updateFolder').modal('hide');
                location.reload(); // 수정된 내용을 반영하기 위해 페이지 새로 고침
            },
            error: function(response) {
                console.error('Error updating folder:', response);
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

    $(document).on('dragleave', '.accordion-header.droppable', function(event) {
        $(this).removeClass('drop-hover');
    });
    $(document).on('drop', function(event) {
        event.preventDefault();
        var dropZone = $('#dropZone');
        dropZone.removeClass('highlight');

        if (!window.draggedItem) return; // 드래그된 항목이 없는 경우 종료

        var folderLevel = window.draggedItem.data('folder-level');
		var draggedFolderKey = window.draggedItem.data('folder-key');
		var draggedFolderGroup = window.draggedItem.data('folder-group');
            console.log(draggedFolderKey+"----");
			console.log(typeof draggedFolderKey);

            if (event.originalEvent.clientY > $(window).height() - 100) { // 하단에 드롭한 경우
                console.log(draggedFolderKey);
            	$.ajax({
                    url: '${path}/admin/documentForm/removeDocFolder', // 서버 요청 URL
                    type: 'POST',
                    data: {draggedFolderKey},
                    success: function(response) {
                        window.draggedItem.remove(); // 드래그된 요소를 제거
                    },
                    error: function(response) {
                        console.error('Error removing folder:', response);
                    }
                });
            }
        
    });
});

</script>
</body>
</html>


