/**
 * 	임시저장, 회수 문서함(재기안, 삭제)
 */

 function rewriteModal(no){
	console.log(no);
	Swal.fire({
		title: '문서 재작성 확인',
		html: '문서를 다시 작성하시겠습니까?',
		showCancelButton: true,
		confirmButtonClass: 'btn btn-success',
		cancelButtonClass: 'btn btn-danger ms-2',
		confirmButtonText: '확인',
		cancelButtonText: '취소',
		buttonsStyling: false,
		reverseButtons: false
	}).then(result => {
		if (result.isConfirmed) {
			let $form = $("<form>").attr({
									'method' : 'post', 
									'action': sessionStorage.getItem("path") + `/document/rewrite`,
									'type' : 'hidden'
									})
								;
			$("<input>").attr({
								'name' : 'serial',
								'value' : no,
								'type' : 'hidden' 
							}).appendTo($form)
			$form.appendTo($("body")).submit();
		}
	});
};
 function deleteModal(no){
	console.log(no);
	Swal.fire({
		title: '삭제 확인',
		html: '<h4>정말 삭제하시겠습니까?</h4>',
		showCancelButton: true,
		confirmButtonClass: 'btn btn-success',
		cancelButtonClass: 'btn btn-danger ms-2',
		confirmButtonText: '삭제',
		cancelButtonText: '취소',
		buttonsStyling: false,
		reverseButtons: false
	}).then(result => {
		if (result.isConfirmed) {
			//삭제 요청 전송
			$.ajax({
				url: sessionStorage.getItem("path") + `/document/delete`,
				data: {no : no},
				dataType: "json",
				method: "post",
				success: data=>{
					console.log();
					if(data.status==="success"){
						Swal.fire({
							title: '삭제 완료',
							html: '<h4>정상적으로 삭제되었습니다.</h4>',
							showCancelButton: true,
							confirmButtonClass: 'btn btn-success',
							cancelButtonClass: 'btn btn-danger ms-2',
							confirmButtonText: '확인',
							cancelButtonText: '취소',
							buttonsStyling: false,
							reverseButtons: false
						}).then(result => {
							location.reload();
						});
					}else{
			            alert("다음과 같은 에러가 발생하였습니다. (" + data.message + ")");
			        };
				},
				error: (xhr, status, error) => {
                    console.error("Error: ", error);
                    alert("삭제 요청 중 오류가 발생했습니다.");
                }
			});
		}
	});
};
document.addEventListener("DOMContentLoaded", function() {
    //const table = document.getElementById('docTable');

    $("table").on('click', "button", function(e) {
        e.stopPropagation();
    });
    
    $("table").on('click', function(event) {
        const target = event.target;
     	// 버튼이 클릭된 경우 이벤트 전파를 막고 함수를 종료
        if (target.tagName.toLowerCase() === 'button'|| (target.tagName.toLowerCase() === 'input' && target.type === 'button')) {
            event.stopPropagation();
            return;
        }

        const row = target.closest('tr');
        if (row && row.dataset.docId) {
            const docId = row.dataset.docId;
            console.log(docId);
            selectDoc(docId);
        }
    });
    
    
	//상세보기
	function selectDoc(docId){
		const $form = $("<form>").attr({'action': sessionStorage.getItem("path") + '/document/view/docDetail', 'method': 'post'});
		$("<input>").attr({'value': docId, 'name': 'docId','type': 'hidden'}).appendTo($form);
		$form.appendTo("body").submit();
	}
});