/**
 * 참조인 선택 팝업
 */
$(document).ready(function() {
	let count = 0;
    // 로컬 스토리지 불러오기
    let savedData = JSON.parse(localStorage.getItem('selectedReferer')) || [];

    
    // 데이터를 화면에 표시하는 로직
    savedData.forEach(function(item) {
        let $a = $("<a>")
        			.addClass('border rounded list-group-item list-group-item-action align-items-center justify-content-between')
    				.attr({
						'href':'#',
						'data-id': item.memberKey, 
						'data-name' : item.memberName, 
						'data-team': item.memberTeam,
						'data-teamkey': item.teamKey,
						'data-jobkey': item.jobKey,
						'data-job': item.memberJob
						});
		let $i = $("<i>").addClass('fas fa-user me-2');
		let $span=$("<span>").addClass('badge rounded-pill text-bg-secondary me-2 ms-0').text(``).css('display', 'none');
		
		let $div = $("<div>").append($($span));
		$div.append($i).append(`<b>${item.memberName}</b>&ensp;${item.memberJob}`);
        $a.append($($div)).appendTo($("div#memberlist2"));
        //조직도에서 없앰
        $("div#memberlist>a").each(function(){
			if ($(this).data('id') == item.memberKey) {
                $(this).css('display', 'none');
            }
		});
    });
	
	$("#rightBtn").click(e=>{
		console.log("right");
		//선택항목의 데이터를 결재라인으로 출력
		$("div#memberlist>a.selected").each(function(){
			count++;
			let no = $(this).data('id');
			let name = $(this).data('name');
			let job = $(this).data('job');
			let teamName = $(this).data('team');
			let jobKey = $(this).data('jobkey');
			let teamKey = $(this).data('teamkey');
			$(this).removeClass('selected');
			$(this).css('display', 'none');
			let $a = $("<a>").addClass('border rounded list-group-item list-group-item-action align-items-center justify-content-between')
					.attr({
						'href':'#',
						'data-id': no, 
						'data-name' : name, 
						'data-team': teamName,
						'data-job': job,
						'data-jobKey' : jobKey,
						'data-teamKey' : teamKey
						});
			let $i = $("<i>").addClass('fas fa-user me-2');
			let $span=$("<span>").addClass('badge rounded-pill text-bg-secondary me-2 ms-0').text(``).css('display', 'none');
			let $div = $("<div>").append($($span));
			$div.append($i).append(`<b>${name}</b>&ensp;${job}`);
			$a.append($($div)).appendTo($("div#memberlist2"));
		});
	});
	
	$("#leftBtn").click(e => {
	    console.log("left");
	    let selectedElements = $("div#memberlist2>a.selected");
	
	    selectedElements.each(function() {
		    // 선택된 항목 삭제
	        $(this).remove();
	
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
			let teamName = $(this).data('team');
			let jobKey = $(this).data('jobkey');
			let teamKey = $(this).data('teamkey');
			let $app = {
				        memberKey: no,
				        memberTeam: teamName,
				        memberJob: job,
				        memberName: name,
				        teamKey: teamKey,
				        jobKey: jobKey
					    };
			data.push($app);
		});
		console.dir(data);
		// 로컬 스토리지에 데이터 저장
    	localStorage.setItem('selectedReferer', JSON.stringify(data));
    	
		//부모창에 전달
		window.opener.sendRefererToParent(data);
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
				window.close();
			}
		});
	});
});	