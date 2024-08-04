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
  </style>
 </head>
<body>
	<div class="wrapper">
      <!-- Sidebar -->
 	<%@ include file="/WEB-INF/views/admin/adminsidebar.jsp" %> 
      <!-- End Sidebar -->
	  <div class="main-panel">
        <div class="main-header">
          <div class="main-header-logo">
          </div>
          <!--  header Navbar 넣을 곳 -->
          <c:import url="${path}/WEB-INF/views/common/header_bar.jsp"/>
        </div>
		<!-- 메인 내용 -->
		
		<div class="container">
          <div class="page-inner">
            <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4">
              <div>
                <h3 class="fw-bold text-center">양식 수정</h3>
              </div>
            </div>
            <div class="row">
              <div class=""> <!-- 컨테이너박스 -->
                <div class="card card-round p-3">
                  <div class="card-body">
	                <form method="post" action="${path}/admin/documentForm/updateForm" id="docForm" >
		               	<div class="form-group d-flex">
					      <label for="smallInput"><span class="h5 me-5">양식명</span></label>
					      <div class="border" style="height: auto; min-height: 30px; width: 90%;" id="">
					      		<input type="text" class="form-control form-control-sm" style="border: none; height: auto; min-height: 30px; font-size: 15px;" id="smallInput" name="erFormName">
					      </div>
					    </div>
	
					    <div class="form-group d-flex align-items-center gap-3">
					      <label for="smallInput"><span class="h5" style="margin-right: 1.9rem !important;" >양식폴더</span></label>
					      <div class="border d-flex flex-wrap" style="height: auto; min-height: 30px; width: 90%;" id="storageDiv">
					      </div>
					      <button class="btn btn-sm btn-info btn-block" style="width: 70px; height: 30px" type="button" id="storageBtn">선택</button>
					    </div>
	
	
					    <!-- <div class="form-group d-flex align-items-center gap-3">
					      <label for="smallInput"><span class="h5" style="margin-right: 0.9rem !important;" >참조문서</span></label>
					      <div class="border d-block" style="height: auto; min-height: 30px; width: 90%;" id="">
					      </div>
					      <button class="btn btn-sm btn-info btn-block" style="width: 70px; height: 30px" type="button" id="referDocBtn">선택</button>
					    </div> -->
	
					    <div class="form-group" id="">
				          	<label for="exampleFormControlFile1"><span class="h5">내용</span></label>
					        <div id="htmlDiv" class="scrollable-content justify-content-center d-flex" style="width: auto; height: 800px; margin: 0px auto">
					        	<!-- 문서 작성 창 -->
					        	<%-- <iframe id="htmlDiv_frame" src="${path }/document/doc4" marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0" scrolling="yes" style="width:100%; height:100%;"></iframe> --%>
					        	<div id="summernote" data-form="${form }"></div>
					        	<%-- <c:import url="${path}/WEB-INF/views/document/doc4.jsp"/> --%>
					        </div>
				        </div>
						<div class="p-3 text-center">
								<button class="btn btn-primary" id="submitbtn" type="button">양식저장</button>
						</div>
	               </form>
		        </div>
             </div>
           </div>
         </div>
         </div>
       </div>
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
function loadHtml(html) {
    $('.note-editable.card-block').load('${path}/resources/upload/docformhtml/'+html+'.html');
    Swal.close();
}

$(document).ready(function() {
	// 현재 URL의 쿼리스트링 가져오기
	var queryString = window.location.search;

	// URLSearchParams 객체 생성
	var urlParams = new URLSearchParams(queryString);

	// 특정 파라미터 값 가져오기
	var param1Value = urlParams.get('formKey');
	var param2Value = urlParams.get('folderName');
	console.log(param1Value+"formKey"+typeof param1Value);
	console.log(param2Value+"folderName");
	
	
		$.ajax({
			url:"${path}/admin/documentForm/selectCurrentForm",
		   	type: 'POST',
	        data: JSON.stringify({
	        	formKey : param1Value, 
	        	folderName : param2Value
	        }),
	        contentType: 'application/json;charset=utf-8',
	        success: function(response) {
	        	console.log(response);
                $('#summernote').summernote('code', response);
	        },
	        error: function(response) {
	            console.error('Error updating folder:', response);
	        }
		})
	

	/*     // 페이지가 로드될 때 모달을 표시하고 리스트를 표시
    const listItems = [
        '리스트 항목 1',
        '리스트 항목 2',
        '리스트 항목 3',
        '리스트 항목 4'
    ];

    let listHtml = '<ul>';
    listItems.forEach((item,idx) => {
        listHtml += '<li onclick="loadHtml('+(idx+1)+')">'+item+'</li>';
    });
    listHtml += '</ul>';
    
    Swal.fire({
        title: '리스트',
        html: '<div id="modal-content" onclick="loadHtml()">'+listHtml+'</div>',
        icon: 'info',
        confirmButtonText: '닫기'
    }); */
    // Summernote 및 기타 기능 초기화
    const fileBtn = document.getElementById('fileBtn');
    const fileInput = document.getElementById('formFile');
    const fileDiv = document.getElementById('fileDiv');

    $('#fileBtn').on('click', function() {
        $('#formFile').click();
    });
    


    var ui = $.summernote.ui;
    var table = `<c:out value="${html}" escapeXml="false"/>`;

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
        defaultFontSize: '14px'
    });

    $("#submitbtn").click(function() {
        // 작성된 HTML 내용을 가져옴
        let htmlContent = $('.note-editable.card-block').html();
        
        // 폼에 HTML 내용을 추가
        $("<input>").attr({
            type: "hidden",
            name: "htmlContent",
            value: htmlContent
        }).appendTo("#docForm");
        
        $("<input>").attr({
            type: "hidden",
            name: "storageDiv",
            value: $('#storage input[name="erFormFolderName"]').val()
        }).appendTo("#docForm");
        
        $("<input>").attr({
            type: "hidden",
            name: "formKey",
            value: param1Value
        }).appendTo("#docForm");
        
        

        // 폼을 서버로 전송
        $("#docForm").submit();
    });
    

    
});

$("#fileDiv").off('click', '#fileDeleteBtn').on('click', '#fileDeleteBtn', function(e) {
    e.stopPropagation();
    $(e.target).parent().parent().remove();
    $('#fileinputDiv .file-name').each(function(index, element) {
        $(element).find('.badge').val(index + 1); 
    });
});



$("#storageBtn").click(function() {
    window.open('${pageContext.request.contextPath}/admin/documentForm/selectFolder', 'selectFolderWindow', 'width=900, height=700, left=500, top=100');
});
function sendDataToParent(data) {
    console.dir(data);
    $("#approvalDiv").html('');
    
    data.forEach(function(item, index) {
        let $div = $("<div>", {
            id: "approval" + index,
            css: {
                width: '100%',
                fontSize: 'larger',
                textAlign: 'left',
                borderRadius: '15px'
            },
            class: 'col m-0 p-2'
        });

        $("<input>", {
            name: 'approvers[' + index + '].orderby',
            value: item.orderby,
            css: {
                borderRadius: '15px',
                width: '23px',
                display: 'inline',
                backgroundColor: 'white'
            },
            class: 'badge rounded-pill text-bg-secondary me-2 ms-0'
        }).attr('readonly', true).appendTo($div);
        
        $("<input>", {
            name: 'approvers[' + index + '].memberKey',
            value: item.memberKey,
            css: {
                display: 'none',
                border: 'none',
                width: 'auto',
                maxWidth: '80px'
            },
        }).attr('readonly', true).appendTo($div);
        $("<input>", {
            name: 'approvers[' + index + '].memberTeamKey',
            value: item.teamKey,
            css: {
                display: 'none',
                border: 'none',
                width: 'auto',
                maxWidth: '80px'
            },
        }).attr('readonly', true).appendTo($div);
        $("<input>", {
            name: 'approvers[' + index + '].memberJobKey',
            value: item.jobKey,
            css: {
                display: 'none',
                border: 'none',
                width: 'auto',
                maxWidth: '80px'
            },
        }).attr('readonly', true).appendTo($div);
        $("<input>", {
            name: 'approvers[' + index + '].memberKey',
            value: item.memberKey,
            css: {
                display: 'none',
                border: 'none',
                width: 'auto',
                maxWidth: '80px'
            },
        }).attr('readonly', true).appendTo($div);
        
        let widthCalc = (item.memberTeam.length * 1.5) + 1;
        $("<input>", {
            name: 'approvers[' + index + '].memberTeam',
            value: item.memberTeam,
            css: {
                border: 'none',
                width: widthCalc + "ch",
                maxWidth: '80px',
                backgroundColor: 'white'
            },
        }).attr('readonly', true).appendTo($div);
    
        widthCalc = (item.memberJob.length * 1.5) + 1;
        $("<input>", {
            name: 'approvers[' + index + '].memberJob',
            value: item.memberJob,
            css: {
                border: 'none',
                width: widthCalc + "ch",
                maxWidth: '80px',
                backgroundColor: 'white'
            },
        }).attr('readonly', true).appendTo($div);

        widthCalc = (item.memberName.length * 1.5) + 1;
        $("<input>", {
            name: 'approvers[' + index + '].memberName',
            value: item.memberName,
            css: {
                border: 'none',
                width: widthCalc + "ch",
                maxWidth: '80px',
                backgroundColor: 'white'
            },
        }).attr('readonly', true).appendTo($div);

        widthCalc = (item.category.length * 1.5) + 1;
        $("<input>", {
            name: 'approvers[' + index + '].category',
            value: item.category,
            css: {
                border: 'none',
                width: widthCalc + "ch",
                maxWidth: '80px',
                backgroundColor: 'white'
            },
        }).attr('readonly', true).appendTo($div);

        $div.appendTo($("#approvalDiv"));
        $("#approverBtn").text('재선택');
    });
}
function sendRefererToParent(data) {
    console.dir(data);
    $("#refererDiv").html('');
    data.forEach(function(item, index) {
        let $div = $("<div>", {
            id: "referer" + index,
            css: {
                width: '100%',
                textAlign: 'left',
                borderRadius: '15px'
            },
            class: 'col m-0 p-2'
        });

        $("<input>", {
            name: 'referers[' + index + '].memberKey',
            value: item.memberKey,
            css: {
                display: 'none',
                border: 'none',
                width: 'auto',
                maxWidth: '80px'
            },
        }).attr('readonly', true).appendTo($div);
        $("<input>", {
            name: 'referers[' + index + '].memberTeamKey',
            value: item.teamKey,
            css: {
                display: 'none',
                border: 'none',
                width: 'auto',
                maxWidth: '80px'
            },
        }).attr('readonly', true).appendTo($div);
        $("<input>", {
            name: 'referers[' + index + '].memberJobKey',
            value: item.jobKey,
            css: {
                display: 'none',
                border: 'none',
                width: 'auto',
                maxWidth: '80px'
            },
        }).attr('readonly', true).appendTo($div);
    
        let widthCalc = (item.memberTeam.length * 1.5) + 1;
        $("<input>", {
            name: 'referers[' + index + '].memberTeam',
            value: item.memberTeam,
            css: {
                border: 'none',
                width: widthCalc + "ch",
                maxWidth: '80px',
                backgroundColor: 'white'
            },
        }).attr('readonly', true).appendTo($div);

        widthCalc = (item.memberJob.length * 1.5) + 1;
        $("<input>", {
            name: 'referers[' + index + '].memberJob',
            value: item.memberJob,
            css: {
                border: 'none',
                width: widthCalc + "ch",
                maxWidth: '80px',
                backgroundColor: 'white'
            },
        }).attr('readonly', true).appendTo($div);

        widthCalc = (item.memberName.length * 1.5) + 1;
        $("<input>", {
            name: 'referers[' + index + '].memberName',
            value: item.memberName,
            css: {
                border: 'none',
                width: widthCalc + "ch",
                maxWidth: '80px',
                backgroundColor: 'white'
            },
        }).attr('readonly', true).appendTo($div);
        
        $("<button>").addClass('badge rounded-pill text-bg-secondary')
                    .text('X')
                    .attr({'type': 'button'})
                    .css('width', '3.2ch')
                    .addClass('Xbtn')
                    .appendTo($div);

        $div.appendTo($("#refererDiv"));
        
        $("#refererDiv").off('click', '.Xbtn').on('click', '.Xbtn', function(e) {
            e.stopPropagation();
            let $div = $(e.target).closest('div.col');
            let savedData = JSON.parse(localStorage.getItem('selectedReferer'));
            let index = parseInt($div.attr('id').replace('referer', '')); 
            console.log(index);
            savedData.splice(index, 1);
            localStorage.setItem('selectedReferer', JSON.stringify(savedData));
            $(e.target).parent().remove();
        });
    });
}
function sendFolderToParent(data){
    console.log(data);
    $("#storageDiv").html('');
    
    let $div = $("<div>", {
         id: "storage",
         css: {
             width: '100%',
             textAlign: 'left',
             borderRadius: '15px'
         },
         class: 'col m-0 p-2'
     });

     $("<input>", {
         name: 'erFormFolderKey',
         value: data.erFormFolderKey,
         css: {
             border: 'none',
             width: 'auto',
             maxWidth: '80px'
         },
         type: 'hidden'
     }).appendTo($div);
     
     $("<input>", {
         name: 'erFormFolderName',
         value: data.erFormFolderName,
         css: {
             border: 'none',
             width: 'auto',
             maxWidth: '80px'
         },
         type: 'hidden'
     }).appendTo($div);
     
     $("<span>", {
         name: '',
         text: data.erFormFolderName,
         css: {
             border: 'none',
             width: 'auto',
             maxWidth: '80px'
         },
     }).attr('readonly', true).appendTo($div);
     
     $div.appendTo($("#storageDiv"));
     $("#storageBtn").text('재선택');
}

</script>
</body>
</html>