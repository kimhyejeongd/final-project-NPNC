/**
 * 전자문서 상세보기 
 */
document.addEventListener("DOMContentLoaded", function() {
	function viewFileDetails(fileUrl) {
	    $.ajax({
	        url: fileUrl,
	        method: 'GET',
	        success: function (data) {
	            $('#fileDetailContent').html(data);
	            $('#fileDetailModal').modal('show');
	        },
	        error: function () {
	            $('#fileDetailContent').html('파일을 불러오는 데 실패했습니다.');
	            $('#fileDetailModal').modal('show');
	        }
	    });
	}
	//파일 다운로드
	$(document).on('click', '#fileDownBtn', function() {
	    let fileName = $(this).data('filename');
	    window.location.href = sessionStorage.getItem("path") + `/files/download/${fileName}`;
	});
	$("#closeBtn").click(function(){
		window.history.back();
	});
});
function approveModal(no, serial){
	Swal.fire({
		title: '결재',
		html: `
		<div class="approve-group">
	      	<label>
            <input type="radio" name="approve" value="approve">
        	승인
	        </label><br>
	        <label>
            <input type="radio" name="approve" value="reject">
        	반려
	        </label><br>
	        <label>
            <input type="radio" name="approve" value="pend">
            보류(수정요청)
	        </label><br>
		<br>
		</div>
		<textarea class="form-control" id="input-field" placeholder="결재 의견을 작성하세요" style="resize:none"></textarea>`,
		showCancelButton: true,
		confirmButtonClass: 'btn btn-success',
		cancelButtonClass: 'btn btn-danger ms-2',
		confirmButtonText: '결재',
		cancelButtonText: '취소',
		buttonsStyling: false,
		reverseButtons: false
	}).then((result) => {
		if (result.isConfirmed) {
			// 결재 버튼이 클릭되었을 때 처리할 로직
			console.log('결재하기');
			
			let dochtml = $("#content").html();
			// 선택된 라디오 버튼의 값을 가져오기
    		let approvalType = $('input[name="approve"]:checked').val();

			if(dochtml != null){
				let opinion = $('#input-field').val();
				
		     	// AJAX로 폼 데이터를 전송
		        $.ajax({
					url : sessionStorage.getItem("path")+'/document/' + approvalType,
		            type: 'POST',
		            data: JSON.stringify({
						'no' : no,						
						'html' : dochtml,
						'msg' : opinion,
						'serial' : serial,
						'formNo' : sessionStorage.getItem("formNo")
						}),
					dataType : "json",
					contentType : "application/json; charset=utf-8",
					success : function(data){
			            console.log(data);
						
			            if (data.status === "success") {
			                alert(data.message);
							// 로컬 스토리지에서 데이터를 삭제
							sessionStorage.removeItem("formNo");
							 
			                // 성공 시 페이지 리다이렉트
			                //window.location.href = sessionStorage.getItem("path")+"/document/view/docDetail?docId="+data.no;
			                window.location.href = sessionStorage.getItem("path")+"/document/list/approver/waiting";
			            } else{
							alert(data.message);
						}
			        }
		       });
		    } else{
		        alert('문서 양식 불러오기 오류');
		    }
		}
	});
}