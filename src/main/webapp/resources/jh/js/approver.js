/**
 * 결재자 선택 팝업
 */
document.addEventListener("DOMContentLoaded", function() {
        const colors = ['#ea1010', '#FF8C00', '#ffec21', '#619931', '#3a80db', '#4B0082', '#8B008B'];
        const lines = document.querySelectorAll('.line-color');
        lines.forEach((line, index) => {
            line.style.backgroundColor = colors[index % colors.length];
        });
    });
$(document).ready(function() {
	let count = 0;
	$("#rightBtn").click(e=>{
		console.log("right");
		//이미 선택된 결재자 있으면 반영
		if($("div#memberlist2>a").length > 0){
			count=$("div#memberlist2>a").length;
		}
		//선택항목의 데이터를 결재라인으로 출력
		$("div#memberlist>a.selected").each(function(){
			count++;
			let no = $(this).data('id');
			let name = $(this).data('name');
			let job = $(this).data('job');
			let teamName = $(this).data('team');
			$(this).removeClass('selected');
			$(this).css('display', 'none');
			let $a = $("<a>").addClass('border rounded list-group-item list-group-item-action align-items-center justify-content-between').attr({'href':'#','data-id': no, 'data-name' : name, 'data-teamName': teamName,'data-job': job});
			let $i = $("<i>").addClass('fas fa-user me-2');
			let $span=$("<span>").addClass('badge rounded-pill text-bg-secondary me-2 ms-0').text(`${count}`);
			let $div = $("<div>").append($($span));
			let $select = $("<select>").addClass('form-select w-25');
			$select.append($("<option>").text('검토')).append($("<option>").text('결재')).append($("<option>").text('전결	')).append($("<option>").text('후결')).append($("<option>").text('협조'));
			$div.append($i).append(`<b>${name}</b>&ensp;${job}`);
			$a.append($($div)).append($select).appendTo($("div#memberlist2"));
		});
	});
	
	$("#leftBtn").click(e => {
	    console.log("left");
	    let selectedElements = $("div#memberlist2>a.selected");
	
	    // 선택된 항목들 중에서 가장 높은 순서를 찾습니다.
	    let maxOrder = 0;
	    selectedElements.each(function() {
	        let order = parseInt($(this).find("div > span").text());
	        if (order > maxOrder) {
	            maxOrder = order;
	        }
	    });
	
	    console.log("Max order: ", maxOrder);
	
	    selectedElements.each(function() {
	        let currentOrder = parseInt($(this).find("div > span").text());
		    // 선택된 항목 삭제
	        $(this).remove();
	
	        // 삭제된 항목보다 높은 순서의 번호 -1
	        $("div#memberlist2>a").each(function() {
	            let order = parseInt($(this).find("div > span").text());
	            if (order > currentOrder) {
	                $(this).find("div > span").text(order - 1);
	            }
	        });
	
	        let no = $(this).data('id');
	        // 조직도에 다시 표시
	        $("div#memberlist>a").each(function() {
	            if ($(this).data('id') == no) {
	                $(this).removeClass('selected');
	                $(this).css('display', '');
	            }
	        });
	    });
	});


	$("#topBtn").click(e => {
	    console.log("top");
	    let $selectedItems = $("div#memberlist2>a.selected");
	
	    // 선택된 항목이 없으면 더 이상 진행하지 않음
	    if ($selectedItems.length === 0) {
	        return;
	    }
	
	    $selectedItems.each(function(index) {
	        let $currentItem = $(this);
	        let $prevItem = $currentItem.prev("a");
	
	        // 첫 번째 항목이면 처리하지 않음
	        if ($prevItem.length === 0) {
	            return;
	        }
	
	        // 이동 처리
	        $currentItem.insertBefore($prevItem);
	
	        // 숫자 처리
	        let $currentSpan = $currentItem.find("div > span");
	        let $prevSpan = $prevItem.find("div > span");
	
	        let currentNumber = parseInt($currentSpan.text()) - 1;
	        $currentSpan.text(currentNumber);
	
	        let prevNumber = parseInt($prevSpan.text()) + 1;
	        $prevSpan.text(prevNumber);
    	});
	});

	$("#downBtn").click(e => {
	    console.log("down");
	    let $selectedItems = $("div#memberlist2>a.selected");
	
	    // 선택된 항목이 없으면 더 이상 진행하지 않음
	    if ($selectedItems.length === 0) {
	        return;
	    }
	
	    // 아래로 내리기 위해 역순으로 반복
	    $($selectedItems.get().reverse()).each(function(index) {
	        let $currentItem = $(this);
	        let $nextItem = $currentItem.next("a");
	
	        // 마지막 항목이면 처리하지 않음
	        if ($nextItem.length === 0) {
	            return;
	        }
	
	        // 이동 처리
	        $currentItem.insertAfter($nextItem);
	
	        // 숫자 처리
	        let $currentSpan = $currentItem.find("div > span");
	        let $nextSpan = $nextItem.find("div > span");
	
	        let currentNumber = parseInt($currentSpan.text()) + 1;
	        $currentSpan.text(currentNumber);
	
	        let nextNumber = parseInt($nextSpan.text()) - 1;
	        $nextSpan.text(nextNumber);
	    });
	});
	$("div#memberlist>a").click(e=> {
		$(e.currentTarget).toggleClass('selected');
	});
	$("div#memberlist2").on('click', "a", e=>{
		$(e.currentTarget).toggleClass('selected');
	})
	$("div#memberlist2").on('click', "select", function(e) {
	    $("div#memberlist2>a.selected").toggleClass('selected');
	    e.stopPropagation();
	});
	$("#okBtn").click(e=>{
		let $selectedItems = $("div#memberlist2>a");
		let data = [];
		//순회하며 객체 배열에 값 추가
		$selectedItems.each(function(){
			console.log($(this));
			let no = $(this).data('id');
			let name = $(this).data('name');
			let job = $(this).data('job');
			let teamName = $(this).data('teamname');
			let orderby =$(this).find("span.badge.rounded-pill.text-bg-secondary").text();
			let category=$(this).children().last().val();
			let $app = {
				        orderby: orderby,
				        no: no,
				        team: teamName,
				        job: job,
				        name: name,
				        category: category
					    };
			data.push($app);
		});
		console.dir(data);
		//부모창에 전달
		window.opener.sendDataToParent(data);
		window.close();
	});
	$("#cancelBtn").click(e=>{
		Swal.fire({
			title: '창 닫기',
			html: '정말 창을 닫으시겠습니까?<br>작성 중인 내용은 저장되지 않습니다.',
			showCancelButton: true,
			confirmButtonClass: 'btn btn-success',
			cancelButtonClass: 'btn btn-danger ms-2',
			confirmButtonText: '예',
			cancelButtonText: '아니오',
			buttonsStyling: false,
			reverseButtons: false
		}).then((result) => {
			if (result.isConfirmed) {
				// 임시저장 버튼이 클릭되었을 때 처리할 로직
				window.close();
			}
		});
	});
});	