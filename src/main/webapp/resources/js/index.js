/**
 * 메인화면 js
 */

 $(document).ready(function() {
    // 진행 문서 버튼 클릭 이벤트
    $('#btnInProgress').click(function() {
		console.log('진행문서');
		$("#waitingTable").css('display', 'none');
		$("#inproTable").css('display', 'table');
    });

    // 결재 대기 문서 버튼 클릭 이벤트
    $('#btnPending').click(function() {
		console.log('결재 대기 문서');
		$("#waitingTable").css('display', 'table');
		$("#inproTable").css('display', 'none');
    });
    $("#waitingTable").on('click', "button", function(e) {
        e.stopPropagation();
    }); 
    
    $("table").on('click', function(event) {
        const target = event.target;
   		 if (target.tagName.toLowerCase() === 'button'|| (target.tagName.toLowerCase() === 'input' && target.type === 'button')) {
            event.stopPropagation();
            return;
        } 

        const row = target.closest('tr');
        if (row && row.dataset.docId) {
            const docId = row.dataset.docId;
            console.log(docId);
            selectWaitingDoc(docId);
        }
    });
    
    
	//상세보기
	function selectWaitingDoc(docId){
		const $form = $("<form>").attr({'action': sessionStorage.getItem("path") + '/document/view/docDetail', 'method': 'post'});
		$("<input>").attr({'value': docId, 'name': 'docId','type': 'hidden'}).appendTo($form);
		$("<input>").attr({'value': 'document/list/waiting', 'name': 'history','type': 'hidden'}).appendTo($form);
		$form.appendTo("body").submit();
	}
});