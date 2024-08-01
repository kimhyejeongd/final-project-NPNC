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
                    <div class="card card-round" style="height: 500px;width: 402px;">
                        <div class="card-header">
                            <div class="card-head-row card-tools-still-right" style="display: flex; justify-content: space-between;">
                                <div class="card-title" id="formfoldername">전자문서 보관함 폴더 목록</div>
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
                                    <c:forEach var="f" items="${folders }">
                                        <c:set var="folderJson" value="${f}"/>
                                        <div class="accordion-item">
                                            <c:if test="${f.folderLevel==1}">
                                                <a href="#" class="accordion-header folder-item droppable" data-folder="${folderJson}" data-folder-key="${f.folderKey}" data-folder-group="${f.folderGroup}" data-folder-level="${f.folderLevel}">
                                                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse${f.folderKey}" aria-expanded="true" aria-controls="panelsStayOpen-collapse0">
                                                        <i class="fas fa-bookmark me-2"></i>
                                                        ${f.folderName}
                                                    </button>
                                                </a>
                                            </c:if>
                                            <div id="panelsStayOpen-collapse${f.folderKey}" class="accordion-collapse collapse show">
                                                <div class="accordion-body" style="padding: 0!important;">
                                                    <div class="list-group" id="memberlist">
                                                        <c:if test="${f.folderLevel==2}">
                                                            <a href="#" class="list-group-item list-group-item-action align-items-center folder-item accordion-header droppable" data-folder-key="${f.folderKey}" data-folder='${folderJson}' data-folder-level='${f.folderLevel}' data-folder-group="${f.folderGroup}"> 
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
                <div style="width:60%">
			<!-- Update Folder Modal -->
			<div class="modal fade" id="updateFolder" tabindex="-1" aria-labelledby="updateFolderModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-body">
			                <form id="updateFolderForm">
			                    <div class="form-group mb-3">
			                        <label for="updateFolderSelect" class="form-label">폴더 선택</label>
			                        <select class="form-select" id="updateFolderSelect">
			                            <optgroup label="대분류">
			                                <c:forEach var="f" items="${folders}">
			                                    <c:if test="${f.folderLevel == 1}">
			                                        <option value="${f.folderKey}" data-folder-level="${f.folderLevel}" data-folder-group="${f.folderGroup}" data-folder-name="${f.folderName}" data-use-yn="${f.useYn}">
			                                            ${f.folderName}
			                                        </option>
			                                    </c:if>
			                                </c:forEach>
			                            </optgroup>
			                            <optgroup label="소분류">
			                                <c:forEach var="f" items="${folders}">
			                                    <c:if test="${f.folderLevel == 2}">
			                                        <option value="${f.folderKey}" data-folder-level="${f.folderLevel}" data-folder-group="${f.folderGroup}" data-folder-name="${f.folderName}" data-use-yn="${f.useYn}">
			                                            ${f.folderName}
			                                        </option>
			                                    </c:if>
			                                </c:forEach>
			                            </optgroup>
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
                                <th scope="col" class="">보관함명</th>
                                <th scope="col" class="">보관함 관리자</th>
                                <th scope="col" class="">보관 기한</th>
                                <th scope="col" class="">사용여부</th>
                                <th scope="col" class="">수정</th>
                            </tr>
                        </thead>
                        <tbody id="docTableBody"></tbody>
                    </table>
                    <div style="display: ruby-text; margin-top: 10px;">
						<button class="btn btn-primary btn-xs" data-bs-toggle="modal" data-bs-target="#addStorage">보관함 추가</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="dropZone" class="drop-zone">폴더를 여기로 드래그해서 삭제</div> <!-- 드롭 존 추가 -->
    </div>
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
    
    <!-- Update Storage Modal -->
	<div class="modal fade" id="updateStorage">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h3 class="modal-title">보관함 수정</h3>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <form id="updateStorageForm">

                  	<div class="mb-3">
							<label for="storageName" class="form-label">보관함 명</label>
							<input type="text" class="form-control" id="updateStorageName" placeholder="보관함 이름 입력">
                    	</div>
                    	<div class="form-group mb-3">
						    <label for="updateFolderType" class="form-label">보관기한</label>
						    <select class="form-select" id="updateFolderType">
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
              			
	                    <div style="display: flex; justify-content: center;">
	                        <button type="submit" class="btn btn-primary">저장</button>
	                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
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
									        <option value="${f.folderGroup}" id="folderGroup_${f.folderKey }">${f.folderName}</option>							    	
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
        	var selectedFolderKey = null;
        	
        	 var selectedStorageId = null;
        	 var oriName=null;
        	  $('#updateFolderSelect').on('change', function() {
        	        var selectedOption = $(this).find('option:selected');
        	        var folderName = selectedOption.data('folder-name');
        	        var useYn = selectedOption.data('use-yn');

        	        $('#updateFolderName').val(folderName);
        	        $('input[name="updateUseYn"][value="' + useYn + '"]').prop('checked', true);
        	    });

        	    // 폴더 수정 폼 제출 이벤트
        	    $('#updateFolderForm').on('submit', function(e) {
        	        e.preventDefault(); // 기본 폼 제출 동작을 막음

        	        var folderKey = $('#updateFolderSelect').val();
        	        var folderName = $('#updateFolderName').val();
        	        var useYn = $('input[name="updateUseYn"]:checked').val();

        	        // 유효성 검사
        	        if (!folderKey || !folderName) {
        	            alert("모든 필드를 채워주세요.");
        	            return;
        	        }

        	        var requestData = {
        	            folderKey: folderKey,
        	            folderName: folderName,
        	            useYn: useYn
        	        };

        	        $.ajax({
        	            url: '${path}/admin/documentForm/updateFolder', // 서버 요청 URL
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
        	 
        	
            // 수정 버튼 클릭 이벤트
            $(document).on('click', '.btn-primary[data-bs-target="#updateStorage"]', function() {
                var row = $(this).closest('tr');
                var storageId = row.data('id');
                oriName = row.find('td').eq(1).text().trim(); // 보관함 이름 가져오기
            
                
                // 선택된 보관함 ID 저장
                selectedStorageId = storageId;
                $('#updateStorage').modal('show');
				console.log($('#oriName').val());
            });

            // 수정 폼 제출 이벤트
            $('#updateStorageForm').on('submit', function(e) {
                e.preventDefault(); // 기본 폼 제출 동작을 막음
                var storageName = $('#updateStorageName').val();
                var folderType = $('#updateFolderType').val();
                var selectedMember = $('.member-item.active').data('id'); // 선택된 멤버의 ID 가져오기
                // 유효성 검사
                if (!storageName || !folderType || !selectedMember) {
                    alert("모든 필드를 채워주세요.");
                    return;
                }

                var requestData = {
                	storageKey: selectedStorageId,
                	storageFolderKey:selectedFolderKey,
                    storageName: storageName,
                    storageTerm: folderType,
                    storageManager: selectedMember,
                    oriName:oriName
                };

                $.ajax({
                    url: '${path}/admin/documentForm/updateStorage', // 서버 요청 URL
                    type: 'POST',
                    data: JSON.stringify(requestData),
                    contentType: 'application/json;charset=utf-8',
                    success: function(response) {
                        console.log('Storage updated successfully:', response);
                        $('#updateStorage').modal('hide');
                        location.reload(); // 수정된 내용을 반영하기 위해 페이지 새로 고침
                    },
                    error: function(response) {
                        console.error('Error updating storage:', response);
                    }
                });
            });
        	
            // 삭제 버튼 클릭 이벤트
            $('#deleteSelected').on('click', function() {
                var selectedIds = [];
                $('.checkItem:checked').each(function() {
                    var row = $(this).closest('tr');
                    var storageId = row.data('id');
                    selectedIds.push(storageId);
                });

                if (selectedIds.length === 0) {
                    alert("삭제할 보관함을 선택해주세요.");
                    return;
                }

                var confirmDelete = confirm("선택한 보관함을 삭제하시겠습니까?");
                if (confirmDelete) {
                    $.ajax({
                        url: '${path}/admin/documentForm/deleteStorage',
                        type: 'POST',
                        data: JSON.stringify(selectedIds),
                        contentType: 'application/json;charset=utf-8',
                        success: function(response) {
                            console.log('Storage deleted successfully:', response);
                            // 성공 시 삭제된 보관함을 테이블에서 제거
                            $('.checkItem:checked').closest('tr').remove();
                        },
                        error: function(response) {
                            console.error('Error deleting storage:', response);
                        }
                    });
                }
            });
        	
        	$('#addStorageForm').on('submit', function(e) {
                e.preventDefault(); // 기본 폼 제출 동작을 막음

                var storageName = $('#storageName').val();
                var folderType = $('#storageFolderType').val();
                var selectedMember = $('.member-item.active').data('id'); // 선택된 멤버의 ID 가져오기
                
                if (!selectedFolderKey) {
                    alert("폴더를 선택해주세요.");
                    return;
                }
                // 유효성 검사
                if (!storageName || !folderType || !selectedMember) {
                    alert("모든 필드를 채워주세요.");
                    return;
                }

                var requestData = {
                    storageName: storageName,
                    storageTerm: folderType,
                    storageManager: selectedMember,
                    storageFolderKey : selectedFolderKey
                };

                $.ajax({
                    url: '${path}/admin/documentForm/createStorage', // 서버 요청 URL
                    type: 'POST',
                    data: JSON.stringify(requestData),
                    contentType: 'application/json;charset=utf-8',
                    success: function(response) {
                        console.log('Storage added successfully:', response);
                        $('#addStorage').modal('hide');
                        $("#docTableBody").empty();

                        response.forEach(function(storage) {
                            var row = 
                                '<tr class="text-center" data-id="'+storage.erStorageKey+'">' +
                                    '<td class="approverNow p-3"><input type="checkbox" class="checkItem"></td>' +
                                    '<td class="approverNow p-3">' + storage.erStorageName + '</td>' +
                                    '<td class="approverNow p-3">' + storage.department.deptName + " " + storage.member.memberName + " " + storage.job.jobName + '</td>' +
                                    '<td class="approverNow p-3">' + storage.erStorageTerm + '년</td>' +
                                    '<td class="approverNow p-3">' + storage.storageFolder.useYn + '</td>' +
                                    '<td class="approverNow p-3">' +
                                    '<button class="btn btn-primary btn-xs" data-bs-toggle="modal" data-bs-target="#updateStorage">수정</button>'+
                                    '</td>'
                                '</tr>';
                            $("#docTableBody").append(row);
                        });
                    },
                    error: function(response) {
                        console.error('Error adding storage:', response);
                    }
                });
            });

            // 멤버 클릭 이벤트 처리
            $(document).on('click', '.member-item', function(e) {
                e.preventDefault();
                $('.member-item').removeClass('active');
                $(this).addClass('active');
            });

            // 이름으로 검색
            $('#searchInput').on('keyup', function() {
                var value = $(this).val().toLowerCase();
                $('.member-item').filter(function() {
                    $(this).toggle($(this).data('name').toLowerCase().indexOf(value) > -1);
                });
            });
            // 폴더 추가 폼 제출 이벤트 처리
            $('#addFolderForm').on('submit', function(e) {
                e.preventDefault(); // 기본 폼 제출 동작을 막음

                var folderName = $('#folderName').val();
                var folderType = $('#folderType').val();
                var useStatus = $('input[name="useYn"]:checked').val(); // 라디오 버튼 값 추출
                var folderGroup = $('#subCategoryName').val();

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
				var folderLevel = $(this).data('folder-level');
                if(folderLevel ==2){
                	selectedFolderKey = folderKey;
                	console.log(selectedFolderKey);
                }
                
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
                                '<tr class="text-center" data-id="'+doc.erStorageKey+'" >'+
                                    '<td class="approverNow p-3"><input type="checkbox" class="checkItem"></td>' +
                                    '<td class="approverNow p-3">' + doc.erStorageName + '</td>' +
                                    '<td class="approverNow p-3">' + doc.department.deptName + " " + doc.member.memberName + " " + doc.job.jobName + '</td>' +
                                    '<td class="approverNow p-3">' + doc.erStorageTerm + '년</td>' +
                                    '<td class="approverNow p-3">' + doc.storageFolder.useYn + '</td>' +
                                    '<td class="approverNow p-3">' + 
                                    '<button class="btn btn-primary btn-xs" data-bs-toggle="modal" data-bs-target="#updateStorage">수정</button>'+
                          			'<input type="hidden" id="oriName" name="oriName" value="'+doc.erStorageName+'">'
                                    + '</td>' +
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
                    	console.log(response.draggedOrder);
                    	console.log(response.targetFolder.folderOrderBy);
                    	if(response.targetFolder.folderLevel ==2 && 
                    			response.draggedOrder>response.targetFolder.folderOrderBy){                    		
                        	targetEle.before(draggableEle);
                        	console.log("beforebeforebeforebefore");
                    	}else{
                        	targetEle.after(draggableEle);
                    	}
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
				var draggedFolderKey = window.draggedItem.data('folder-key');
				var draggedFolderGroup = window.draggedItem.data('folder-group');
                    console.log(draggedFolderKey+"----");
					console.log(typeof draggedFolderKey);

                    if (event.originalEvent.clientY > $(window).height() - 100) { // 하단에 드롭한 경우
                        console.log(draggedFolderKey);
                    	$.ajax({
                            url: '${path}/admin/documentForm/removeFolder', // 서버 요청 URL
                            type: 'POST',
                            data: {"draggedFolderKey":draggedFolderKey},
                            success: function(response) {
                                window.draggedItem.remove(); // 드래그된 요소를 제거
                                // folderGroup이 같은 다른 태그도 제거
                                $('.folder-item').each(function() {
                                	if(folderLevel==1){                                		
	                                    var itemFolderGroup = $(this).data('folder-group');
	                                    if (itemFolderGroup === draggedFolderGroup) {
	                                        $(this).remove();
	                                    }
                                	}
                                });
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


