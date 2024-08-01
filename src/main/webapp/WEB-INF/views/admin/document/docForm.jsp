<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

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
                                <th scope="col" class="">작성 권한</th>
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
    
    
    

  

<script>
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
                    '<tr class="text-center" data-id="'+doc.erFormKey+'" >'+
                        '<td class="approverNow p-3"><input type="checkbox" class="checkItem"></td>' +
                        '<td class="approverNow p-3">' + doc.erFormName + '</td>' +
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
</script>
</body>
</html>


