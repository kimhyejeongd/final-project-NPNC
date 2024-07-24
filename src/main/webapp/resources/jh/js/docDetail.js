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
	function downloadFile(fileUrl) {
	    // 파일을 다운로드하기 위한 링크를 생성하고 클릭합니다.
	    window.location.href = fileUrl;
	}
	$("#closeBtn").click(function(){
		window.history.back();
	});
});