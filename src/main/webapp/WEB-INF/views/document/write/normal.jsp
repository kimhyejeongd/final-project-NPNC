<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="me" value="${pageContext.request.userPrincipal}"/>
<%-- <c:set var="form" value="${formName}"/> --%>
<%
    String html = (String) request.getAttribute("html");
    if (html == null) {
        html = "";
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <title>문서 작성</title>
  <meta
    content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    name="viewport"
  />
  <link
    rel="icon"
    type="image/x-icon"
  />
  <!-- SweetAlert2 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.min.css" rel="stylesheet">
  <!-- SweetAlert2 JS -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.all.min.js"></script>
  
  <!-- Bootstrap CSS -->
  <!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"> -->
  <!-- Summernote CSS -->
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
   <script src="${path}/resources/jh/js/docwrite.js"></script>
   <script src="${path}/resources/jh/js/doc-alarm.js"></script>
  <style>
  	#approvalDiv{
	    font-size: .875rem !important;
	    line-height: 1.5;
        border-color: #ebedf2;
	    height: inherit !important;
	    border-width: 2px;
	    min-height: calc(1.5em + .5rem + calc(var(--bs-border-width)* 2));
	    border-radius: var(--bs-border-radius-sm);
	    border: var(--bs-border-width) solid var(--bs-border-color);
	    font-weight: 400;
  	}
  	.scrollable-content {
        width: 100%;
        height: 800px;
        margin: 0 auto;
        border: 1px solid #ccc;
        overflow-y: scroll; /* 세로 스크롤만 */
        overflow-x: scroll;  /* 가로 스크롤도 필요할 경우 */
     }
     .note-toolbar {
	    background-color: #f5f5f5 !important;
        margin-bottom: -15px;
	}
	.note-statusbar{
		display: none;
	}
	.note-editor.note-frame .note-editing-area .note-editable {
	    margin-top: 0px !important;
	    border: none !important; /* border 속성을 none으로 설정 */
	}
	#htmlDiv > div.note-editor.note-frame.card > div.note-editing-area > div.note-editable.card-block{
		display: flex;
		justify-content: center;
	}
	.outer-cell {
		display: flex;
		justify-content: space-between;
		align-items: flex-start;
		padding: 0;
		vertical-align: top;
		background: white; 
		border: currentColor; 
		text-align: right; 
		color: black; 
		font-size: 14px; 
		font-weight: normal; 
		vertical-align: top;
	}

	#approverTable {
		border-collapse: collapse;
		margin-left: auto; /* 오른쪽에 붙이기 위해 사용 */
		font-family: "malgun gothic", dotum, arial, tahoma;
		text-align: center !important;
		border: 0px solid rgb(0, 0, 0); 
		width: auto; 
		margin-top: 1px; 
		border-collapse: collapse;
	}

	#approverTable th,
	#approverTable td {
		border: 1px solid black;
		padding: 5px;
		text-align: center !important;
		vertical-align: middle;
		font-size: 14px;
	}

	#approverTable th {
		background: #ddd;
		font-weight: bold;
		color: #000;
		padding: 5px; 
		border: 1px solid black; 
		height: 18px; 
		text-align: center; 
		font-size: 14px; 
		font-weight: bold; 
		vertical-align: middle;
	}

	#approverTable td {
		background: #fff;
		color: #000;
		padding: 5px; 
		border: 1px solid black; 
		font-size: 14px; 
		font-weight: normal; 
		vertical-align: middle; 
		width: auto;
	}
  </style>
 </head>
<body>
	<div class="wrapper">
      <!-- Sidebar -->
      <c:import url="/WEB-INF/views/document/documentSidebar.jsp"/>
      <!-- End Sidebar -->
	  <div class="main-panel">
        <div class="main-header">
          <div class="main-header-logo">
          </div>
          <!--  header Navbar 넣을 곳 -->
          <%@ include file="/WEB-INF/views/common/header_bar.jsp" %>
        </div>
		<!-- 메인 내용 -->
		
		<div class="container">
          <div class="page-inner">
            <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4">
              <div>
                <h3 class="fw-bold text-center">문서 작성</h3>
              </div>
            </div>
            <div class="row">
              <div class=""> <!-- 컨테이너박스 -->
                <div class="card card-round p-3">
                  <div class="card-body">
                <form method="post" action="${path}/document/writeend" id="docForm" enctype="multipart/form-data">
		      		<input type="hidden" class="form-control form-control-sm" name="erDocFormKey" value="${form }">
	               	<div class="form-group d-flex">
				      <label for="smallInput"><span class="h5 me-5">문서명</span></label>
				      <div class="border" style="height: auto; min-height: 30px; width: 90%;" id="">
				      		<input type="text" class="form-control form-control-sm" style="border: none; height: auto; min-height: 30px; font-size: 15px;" id="smallInput" name="erDocTitle" required>
				      </div>
				    </div>
				    <div class="form-group">
				      <label class=""><span class="h5 me-1">긴급 여부</span></label>
				          <input class="ms-3" type="radio" name="erDocEmergencyYn" value="Y" id="flexRadioDefault1" required>
				          <label class="ms-1" for="flexRadioDefault1"><span class="h5">긴급</span> </label>
				          <input class="ms-3" type="radio" name="erDocEmergencyYn" value="N" id="flexRadioDefault2" checked required>
				          <label class="ms-1" for="flexRadioDefault2"><span class="h5">일반</span>
			          </label>
				    </div>
				    <div class="form-group d-flex align-items-center gap-3">
				      <label for="smallInput"><span class="h5" style="margin-right: 1.9rem !important;" >보관함</span></label>
				      <div class="border d-flex flex-wrap" style="height: auto; min-height: 30px; width: 90%;" id="storageDiv"></div>
				      <button class="btn btn-sm btn-info btn-block" style="width: 70px; height: 30px" type="button" id="storageBtn">선택</button>
				    </div>
				    <div class="form-group d-flex">
				      <label for="smallInput"><span class="h5 me-5">결재자</span></label>
				      	<div class="col w-100 align-items-center p-0">
						      <div class="border col" style="height: auto; min-height: 30px; width: 100%;" id="approvalDiv">
									<span class="m-0 w-100 d-flex" style="color: gray; font-size: 15px; justify-content: center; height: 50px; align-items: center">결재자를 선택하세요</span> 
						      </div>
						      <button class="btn btn-sm btn-info w-100 row m-0" type="button" id="approverBtn">선택</button>
						    </div>
						</div>
				    <div class="form-group d-flex align-items-top gap-3">
				      <label for="smallInput"><span class="h5" style="margin-right: 1.9rem !important;">참조인</span></label>
					      <div class="border d-flex flex-wrap" style="height: auto; min-height: 30px; width: 90%;" id="refererDiv">
					      </div>
					      <button class="btn btn-sm btn-info btn-block" type="button" style="width: 70px; height: 30px" id="refererBtn">선택</button>
			        </div>
				    <div class="form-group d-flex" id="fileDiv">
			          <span class="h5" style="margin-right: 2.1rem !important;">첨부파일</span>
			          <div class="col w-100 align-items-center p-0">
				          <div class="border col" style="height: auto; min-height: 30px; width: 100%;" id="fileinputDiv">
								<span class="m-0 w-100 d-flex" id="dragspan" style="color: gray; font-size: 15px; justify-content: center; height: 50px; align-items: center"> </span> 
					          	<input type="file" class="form-control" id="formFile" name="upfile" multiple style="display:none;">
					          	<!-- 추가된 파일 출력 위치 -->
					      </div>
				      	  <button class="btn btn-sm btn-info w-100 row m-0" type="button" id="fileBtn">선택</button>
				     </div>
				    </div>
				    <div class="form-group" id="">
			          	<label for="exampleFormControlFile1"><span class="h5">문서내용</span></label>
				        <div id="htmlDiv" class="scrollable-content justify-content-center d-flex" style="width: auto; height: 800px; margin: 0px auto">
				        	<!-- 문서 작성 창 -->
				        	<div id="summernote" data-form="${form }"></div>
				        </div>
			        </div>
	                  <div class="p-3 text-center">
	                  		<button class="btn btn-primary" id="submitbtn" type="button">기안하기</button>
	                  		<button class="btn btn-primary ms-2" id="savedraftbtn" type="button">임시저장</button>
	                  </div>
               </form>
		        </div>
             </div>
           </div>
         </div>
         </div>
       </div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
      </div>
    </div>
<!-- SweetAlert2 초기화 및 모달 관련 스크립트 -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.all.min.js"></script>
  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <!-- Bootstrap JS -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- Summernote JS -->
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<script>
$(document).ready(function() {
	
	// 파일 선택 버튼과 파일 입력 필드
    const fileBtn = document.getElementById('fileBtn');
    const fileInput = document.getElementById('formFile');
    const fileDiv = document.getElementById('fileDiv');
	
 	// 파일 선택 버튼 클릭 시 파일 입력 필드 클릭
     $('#fileBtn').on('click', function() {
        $('#formFile').click();
    });
 	
 	// 파일 입력 필드에서 파일이 선택되면 호출되는 이벤트 핸들러
    $('#formFile').on('change', function() {
        // 선택한 파일 가져오기
        let fileInput = document.getElementById('formFile'); // fileInput 요소 가져오기
        let files = fileInput.files;
		$("#dragspan").removeClass('d-flex').css('display', 'none');
		// 현재 파일 리스트에서 이미 추가된 파일의 개수를 계산
	    let existingCount = $('#fileinputDiv .file-name').length;
		console.log('이미 추가된 파일 개수 : ' + existingCount);
        
     // 선택한 파일 이름을 표시하기 위한 내용 추가
      fn_arrayFiles(files, existingCount);
    });
	
	 var ui = $.summernote.ui;
	//기안 작성
	var table = `<c:out value="${html}" escapeXml="false"/>`;

	// Initialize Summernote
	$('#summernote').summernote({
	    height: '100%', 
	    width: '100%',
	    focus: false, 
	    callbacks: {
	        onInit: function() {
	            $('#summernote').summernote('code', table);
	        }
	    },
	    toolbar: [
		    // [groupName, [list of button]]
		    /* ['mybutton', 'undobtn'],
		    ['mybutton', 'redobtn'], */
		    ['fontname', ['fontname']],
		    ['fontsize', ['fontsize']],
		    ['lineHeights', ['lineHeights']],
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    ['color', ['forecolor','color']],
		    ['table', ['table']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['insert',['picture','link','video']],
		  ],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		lineHeights: ['0.2', '0.3', '0.4', '0.5', '0.6', '0.8', '1.0', '1.2', '1.4', '1.5', '2.0', '3.0'],
		defaultFontSize: '14px' // 기본 폰트 크기 설정
		/* buttons:{
			undobtn: undo,
			redobtn: redo
		} */
	});
	
	// 기안하기 버튼 클릭 시
	$("#submitbtn").click(async function() {
		
		// 폼 유효성 검사
        if ($("#docForm")[0].checkValidity() === false) {
        	console.log('유효성 검사 false');
        	await Swal.fire({
    			title: '확인 요청',
    			html: '제목을 입력해주세요.',
    			showCancelButton: false,
    			confirmButtonClass: 'btn btn-success',
    			confirmButtonText: '확인',
    			buttonsStyling: false,
    			reverseButtons: false,
    			didOpen: () => {
                    document.querySelector('#htmlDiv').setAttribute('inert', ''); // 모달 외부 비활성화
                },
                willClose: () => {
                    document.querySelector('#htmlDiv').removeAttribute('inert'); // 모달 닫힐 때 비활성화 해제
                }
            }).then((result) => {
            });
            $("#docForm")[0].reportValidity();
           	return;
        } 
		
      //보관함 선택 여부 확인
        if($("#storageDiv").html() === '' || $("#storageDiv").html() === null){
        	console.log('보관함 미선택');
        	await Swal.fire({
                title: '확인 요청',
                html: '보관함을 선택해주세요.',
                icon: 'warning', 
                showCancelButton: false,
                confirmButtonClass: 'btn btn-success',
                confirmButtonText: '확인',
                buttonsStyling: false,
                didOpen: () => {
                    document.querySelector('#summernote').setAttribute('inert', ''); // 모달 외부 비활성화
                },
                willClose: () => {
                    document.querySelector('#summernote').removeAttribute('inert'); // 모달 닫힐 때 비활성화 해제
                }
            }).then((result) => {
	            $("#storageBtn").click();
            });
            return; 
        }

        // 결재자 선택 여부 검사
        if ($("#approvalDiv span").text() === '결재자를 선택하세요') {
            console.log('결재자 없음');
            
            const result = await Swal.fire({
                title: '확인 요청',
                html: '결재자가 없습니다. 그래도 진행하시겠습니까?',
                icon: 'warning', 
                showCancelButton: true,
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger ms-2',
                confirmButtonText: '확인',
                cancelButtonText: '취소',
                buttonsStyling: false,
                reverseButtons: false,
                didOpen: () => {
                    document.querySelector('#summernote').setAttribute('inert', ''); // 모달 외부 비활성화
                },
                willClose: () => {
                    document.querySelector('#summernote').removeAttribute('inert'); // 모달 닫힐 때 비활성화 해제
                }
            });
            if(!result.isConfirmed) {
               $("#approverBtn").click();
             return;
            }
        }
        
       
		// SweetAlert2 모달 띄우기
		const docResult = await Swal.fire({
			title: '결재',
			html: '<textarea class="form-control" id="input-field" placeholder="결재 의견을 작성하세요" style="resize:none"></textarea>',
			showCancelButton: true,
			confirmButtonClass: 'btn btn-success',
			cancelButtonClass: 'btn btn-danger ms-2',
			confirmButtonText: '결재',
			cancelButtonText: '취소',
			buttonsStyling: false,
			reverseButtons: false
		});
		
			if (docResult.isConfirmed) {
				// 결재 버튼이 클릭되었을 때 처리할 로직
				console.log('결재하기');
				// 로컬 스토리지에서 데이터를 삭제
				localStorage.removeItem('selectedReferer'); 
				localStorage.removeItem('selectedApprover'); 
				
				let dochtml = $("#htmlDiv > div.note-editor.note-frame.card > div.note-editing-area > div.note-editable.card-block").html();
				console.log(dochtml);
				if(dochtml != null){
					let opinion = $('#input-field').val();
					$("<input>").val(dochtml).css('display', 'none').attr('name', 'html').prependTo($("#docForm"));
					$("<input>").val(opinion).css('display', 'none').attr('name', 'msg').prependTo($("#docForm"));
					$("<input>").val($("#summernote").data('form')).css('display', 'none').attr('name', 'docFormKey').prependTo($("#docForm"));
					
					// 폼 데이터를 수집
			        let formData = new FormData(document.getElementById("docForm"));
			        formData.delete("files");
			        
			        let fileInput = document.getElementById('formFile'); // fileInput 요소 가져오기
			        let files = fileInput.files;

		            /* // 다중 파일 추가
		            for (let i = 0; i < files.length; i++) {
		            	formData.append('upfile', files[i]);
		            }  */

		            // FormData의 내용 확인
					formData.entries().forEach(e=>{
		            	console.log(e);
	            	});
		            
					
			     	// AJAX로 폼 데이터를 전송
			        fetch(sessionStorage.getItem("path")+'/document/writeend', {
			            method: 'POST',
			            body: formData,
			        })
			        .then(response => response.json())
			        .then(data => {
			            if (data.status === "success") {
			                alert(data.message);
			                var loginMemberKey = ${loginMember.memberKey};
			                var loginMemberName = "${loginMember.memberName}";
			                var loginMemberJobName = "${loginMember.jobName}";
			                
			                //다음 결재자 알람 발송
			                if (data.nextAprover && data.nextAprover.memberKey) {
			                	console.log('결재자 알람 send try');
			                	 console.log(data.nextAprover);
				                nextAproverAlarmSend(parseInt(data.nextAprover.memberKey), loginMemberKey, loginMemberName, loginMemberJobName);
			                }
			                //참조인 있으면 발송
							if (data.referer != null && data.referer.length > 0) {
								console.log(data.referer.length);
								console.log('참조인 알람 send try');
								// 각 참조인에 대해 반복 전송
								$.each(data.referer, function(index, referer) {
									refererAlarmSend(referer.memberKey, loginMemberKey, loginMemberName, loginMemberJobName, data.serialKey)
								});
							}
			                
			                // 성공 시 페이지 리다이렉트
			                window.location.href = sessionStorage.getItem("path")+"/document/home";
			            } else {
			                alert(data.message);
			                console.log(data.object);
			            }
			        })
			        .catch(error => {
			            alert("다음과 같은 에러가 발생하였습니다. (" + error.message + ")");
			        }); 
			    } else{
			        alert('문서 양식 불러오기 오류');
			    }
			}
	});
	
	$("#savedraftbtn").click(function() {
		Swal.fire({
			title: '임시저장',
			text: '작성중인 문서 내용이 저장됩니다.',
			showCancelButton: true,
			confirmButtonClass: 'btn btn-success',
			cancelButtonClass: 'btn btn-danger ms-2',
			confirmButtonText: '임시저장',
			cancelButtonText: '닫기',
			buttonsStyling: false,
			reverseButtons: false
		}).then((result) => {
			if (result.isConfirmed) {
				// 임시저장 버튼이 클릭되었을 때 처리할 로직
				let dochtml = $("#htmlDiv > div.note-editor.note-frame.card > div.note-editing-area > div.note-editable.card-block").html();
				$("<input>").val(dochtml).css('display', 'none').attr('name', 'html').prependTo($("#docForm"));
				$("<input>").val(dochtml).css('display', 'none').attr('name', 'html').prependTo($("#docForm"));
				$("<input>").val($("#summernote").data('form')).css('display', 'none').attr('name', 'docFormKey').prependTo($("#docForm"));
				// 폼 데이터를 수집
		        let formData = new FormData(document.getElementById("docForm"));
				
		        let fileInput = document.getElementById('formFile'); // fileInput 요소 가져오기
		        let files = fileInput.files;
		        
		        //내용 확인
		        formData.entries().forEach(e=>{
	            	console.log(e);
            	});
				
		     	// AJAX로 폼 데이터를 전송
		        fetch(sessionStorage.getItem("path")+'/document/savedraft', {
		            method: 'POST',
		            body: formData,
		        })
		        .then(response => response.json())
		        .then(data => {
		            if (data.status === "success") {
		                alert(data.message);
		                
		                // 성공 시 페이지 리다이렉트
		                window.location.href = sessionStorage.getItem("path")+"/document/list/employee/draft";
		            } else {
		                alert(data.message);
		            }
		        })
		        .catch(error => {
		            alert("다음과 같은 에러가 발생하였습니다. (" + error.message + ")");
		        });
			}
		});
	});
});

$("#fileDiv").off('click', '#fileDeleteBtn').on('click', '#fileDeleteBtn', function(e) {
	e.stopPropagation(); // 이벤트 버블링 방지
	$(e.target).parent().parent().remove();
	//인덱스 재조정
    $('#fileinputDiv .file-name').each(function(index, element) {
        $(element).find('.badge').val(index + 1); 
    });
});
$("#approverBtn").click(function() {
	sessionStorage.setItem("path", '${pageContext.request.contextPath}');
	window.open('${pageContext.request.contextPath}/document/write/approver', 'approver', 'width=900, height=700, left=500, top=100');
});
$("#refererBtn").click(function() {
	window.open('${pageContext.request.contextPath}/document/write/referer', 'referer', 'width=900, height=700, left=500, top=100');
});
$("#storageBtn").click(function() {
	window.open('${pageContext.request.contextPath}/document/write/storage', 'storage', 'width=900, height=700, left=500, top=100');
});
$("#refererDiv").off('click', '.Xbtn').on('click', '.Xbtn', function(e) {
	e.stopPropagation(); // 이벤트 버블링 방지
	let $div = $(e.target).closest('div.col');
	let savedData = JSON.parse(localStorage.getItem('selectedReferer'));
	let index = parseInt($div.attr('id').replace('referer', '')); // 해당 <div>의 인덱스 번호 확인
	console.log(index);
    savedData.splice(index, 1);  // 배열에서 해당 항목 삭제
    localStorage.setItem('selectedReferer', JSON.stringify(savedData));  // 로컬 스토리지 업데이트
	$(e.target).parent().remove();
});
</script>
</body>
</html>