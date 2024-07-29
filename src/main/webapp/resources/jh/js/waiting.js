/**
 *  대기중 문서, 상세보기
 */
	
document.addEventListener('DOMContentLoaded', function() {
    //const table = document.getElementById('docTable');

   $("#waitingTable").on('click', "button", function(e) {
        e.stopPropagation();
    }); 
    
    $("#waitingTable").on('click', function(event) {
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