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
	// 로컬 스토리지 불러오기
    let savedData = JSON.parse(localStorage.getItem('selectedApprover')) || [];
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
						'data-job': item.memberJob,
						});
		let $i = $("<i>").addClass('fas fa-user me-2');
		let $span=$("<span>").addClass('badge rounded-pill text-bg-secondary me-2 ms-0')
								.text(`${item.orderby}`);
		let $div = $("<div>").append($($span));
		let $select = $("<select>").addClass('form-select w-25');
			$select.append($("<option>").text('검토'))
					.append($("<option>").text('결재'))
					.append($("<option>").text('전결'))
					.append($("<option>").text('후결'))
					.append($("<option>").text('협조'));
    	$select.val(item.category); // 카테고리에 맞는 옵션 선택
		$div.append($i).append(`<b>${item.memberName}</b>&ensp;${item.memberJob}`);
        $a.append($($div)).append($select).appendTo($("div#memberlist2"));
        //조직도에서 없앰
        $("div#memberlist>a").each(function(){
			if ($(this).data('id') == item.memberKey) {
                $(this).css('display', 'none');
            }
		});
    });
	
	$("#rightBtn").click(e=>{
		console.log("right");
		//이미 선택된 결재자 있으면 반영
		if($("div#memberlist2>a").length > 0){
			count=$("div#memberlist2>a").length;
		}else{
			count=0;
		}
		//선택항목의 데이터를 결재라인으로 출력
		$("div#memberlist>a.selected").each(function(){
			count++;
			let no = $(this).data('id');
			let name = $(this).data('name');
			let job = $(this).data('job');
			let jobKey = $(this).data('jobkey');
			let teamName = $(this).data('team');
			let teamKey = $(this).data('teamkey');
			$(this).removeClass('selected');
			$(this).css('display', 'none');
			let $a = $("<a>").addClass('border rounded list-group-item list-group-item-action align-items-center justify-content-between')
							.attr({
								'href':'#',
								'data-id': no, 
								'data-name' : name, 
								'data-teamkey': teamKey,
								'data-team': teamName,
								'data-jobkey': jobKey,
								'data-job': job,
								'data-orderby' : count
							});
			let $i = $("<i>").addClass('fas fa-user me-2');
			let $span=$("<span>").addClass('badge rounded-pill text-bg-secondary me-2 ms-0')
									.text(`${count}`);
			let $div = $("<div>").append($($span));
			let $select = $("<select>").addClass('form-select w-25');
			$select.append($("<option>").text('검토'))
					.append($("<option>").text('결재'))
					.append($("<option>").text('전결'))
					.append($("<option>").text('후결'))
					.append($("<option>").text('협조'));
			$div.append($i).append(`<b>${name}</b>&ensp;${job}`);
			$a.append($($div)).append($select).appendTo($("div#memberlist2"));
		});
	});
	
	$("#leftBtn").click(e => {
	    console.log("left");
	    let selectedElements = $("div#memberlist2>a.selected");
	
	    // 선택된 항목들 중에서 가장 높은 순서
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
		$selectedItems.each(function(index){
			console.log($(this));
			let no = $(this).data('id');
			let name = $(this).data('name');
			let job = $(this).data('job');
			let teamName = $(this).data('team');
			let jobKey = $(this).data('jobkey');
			let teamKey = $(this).data('teamkey');
			let orderby =$(`#memberlist2 > a:nth-child(${index+1}) > div > span`).text();
			let category=$(this).children().last().val();
			let $app = {
				        orderby: orderby,
				        memberKey: no,
				        memberTeam: teamName,
				        memberJob: job,
				        memberName: name,
				        category: category,
				        teamKey: teamKey,
				        jobKey: jobKey
					    };
			data.push($app);
		});
		console.dir(data);
		// 로컬 스토리지에 데이터 저장
    	localStorage.setItem('selectedApprover', JSON.stringify(data));
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
				window.close();
			}
		});
	});
	//$("#refreshBtn").click(e=>{
	//	window.location.reload();
	//});
	$("#bringBtn").click(e=>{
		let no = $(e.target).data('id');
		$.ajax({
			data: no,
			
		});
	});
	 $(".toggle-btn").mouseenter(function(e) {
        e.stopPropagation(); // 이벤트 버블링 방지
        let target = $(this).data("target");
        $(target).show();
    });

    $(".toggle-btn").mouseleave(function(e) {
        e.stopPropagation(); // 이벤트 버블링 방지
        let target = $(this).data("target");
        $(target).on('mouseenter', function() {
            $(target).show();
        })
        $(target).hide();
    });
    
    // 결재라인 저장 버튼 클릭 시
	$("#saveBtn").click(function(e) {
		Swal.fire({
			title: '결재라인 저장',
			html: '<p>현재 선택된 결제라인 정보를 저장하시겠습니까?</p><p>저장할 결재라인 명을 입력해주세요.</p>결재라인 명 : <input type="text" class="" name="name" id="linename">',
			showCancelButton: true,
			confirmButtonClass: 'btn btn-success',
			cancelButtonClass: 'btn btn-danger ms-2',
			confirmButtonText: '저장',
			cancelButtonText: '취소',
			buttonsStyling: false,
			reverseButtons: false
		}).then((result) => {
		    if (result.isConfirmed) {
		        console.log('결제라인 저장');
		        let lineName = $("input#linename").val();
		
		        let approvers = [];
		        $("div#memberlist2>a").each(function() {
		            let ApproverLine = {
		                memberKey: $(this).data('id'),
		                //memberName: $(this).data('name'),
		                erApName: $(this).data('name'),
		                //memberJob: $(this).data('job'),
		                erApJobKey: $(this).data('jobkey'),
		                //memberTeam: $(this).data('team'),
		                erApTeamKey: $(this).data('teamkey'),
		                //orderby: $(this).find("div > span").text(),
		                erApOrderby: $(this).find("div > span").text(),
		                //category: $(this).children().last().val()
		                erApCategory: $(this).children().last().val()
		            };
		            approvers.push(ApproverLine);
		        });
		
		        let ApproverLineStorage = {
		            erApLineStorageName: lineName,
		            approvers: approvers
		        };
				console.log(ApproverLineStorage);
		        $.ajax({
		            type: "POST",
		            url: sessionStorage.getItem("path")+`/document/write/save/approverline`,
		            contentType: "application/json",
		            data: JSON.stringify(ApproverLineStorage),
		            success: function(response) {
		                if (response.status === "success") {
			                // 로컬 스토리지에 데이터 저장
					    	//localStorage.setItem('selectedApprover', JSON.stringify(approvers));
		                    alert(response.message);
		                } else {
		                    alert(response.message);
		                }
		                window.location.reload();	
		            }
		        });
		    }
		});
	});
	//결재라인 불러오기
	$(".bringBtn").click(function(e) {
		e.stopPropagation();
		console.dir($(this));
		Swal.fire({
			title: '결재라인 불러오기',
			text: '해당 결제라인을 불러오시겠습니까? 현재 선택된 내용은 사라집니다.',
			showCancelButton: true,
			confirmButtonClass: 'btn btn-success',
			cancelButtonClass: 'btn btn-danger ms-2',
			confirmButtonText: '확인',
			cancelButtonText: '취소',
			buttonsStyling: false,
			reverseButtons: false
		}).then((result) => {
			if (result.isConfirmed) {
				console.log('결제라인 불러오기');
				$("#memberlist2").html('');
				//데이터 가져오기
				let modalContent = $(this).closest('.d-flex').find('.modal-like');
				let ids = [];
		        modalContent.find('.badge').each(function(item) {
					let $a = $("<a>")
	        			.addClass('border rounded list-group-item list-group-item-action align-items-center justify-content-between')
	    				.attr({
							'href':'#',
							'data-id': $(this).data('id'),
							'data-name' : $(this).data('name'), 
							'data-team': $(this).data('team'),
							'data-teamkey': $(this).data('teamkey'),
							'data-jobkey': $(this).data('jobkey'),
							'data-job': $(this).data('job'),
							'data-category': $(this).data('category')
							});
					let $i = $("<i>").addClass('fas fa-user me-2');
					let $span=$("<span>").addClass('badge rounded-pill text-bg-secondary me-2 ms-0')
											.text($(this).text());
					let $div = $("<div>").append($($span));
					let $select = $("<select>").addClass('form-select w-25');
						$select.append($("<option>").text('검토'))
								.append($("<option>").text('결재'))
								.append($("<option>").text('전결'))
								.append($("<option>").text('후결'))
								.append($("<option>").text('협조'));
			    	$select.val($(this).data('category')); // 카테고리에 맞는 옵션 선택
					$div.append($i).append(`<b>${$(this).data('name')}</b>&ensp;${$(this).data('job')}`);
			        $a.append($($div)).append($select).appendTo($("div#memberlist2"));
			        ids.push($(this).text());
				});
		        //조직도에서 없앰
		        $("div#memberlist>a").each(function(e){
					console.log(ids);
					if (ids.includes($(e.target).data('id'))) {
		                $(e.target).css('display', 'none');
		            }
				});
				}
				/*$.ajax({
					type: "get",
					url: sessionStorage.getItem("path")+`/document/write/delete/approverline`,
					data: JSON.stringify($(e.target).data('id')),
					dataType:"json",
					contentType: "application/json; charset=utf-8",
					success: function(response){
						if(response.status === "success"){
							alert(response.message);
							window.location.reload();
						}
						else{
							alert(response.message);
						}
					}
				});*/
		});
	});
    // 삭제 버튼 클릭 시
	$(".deleteBtn").click(function(e) {
		e.stopPropagation();
		console.dir($(this));
		Swal.fire({
			title: '결재라인 삭제',
			text: '해당 결제라인을 삭제하시겠습니까?',
			showCancelButton: true,
			confirmButtonClass: 'btn btn-success',
			cancelButtonClass: 'btn btn-danger ms-2',
			confirmButtonText: '삭제',
			cancelButtonText: '취소',
			buttonsStyling: false,
			reverseButtons: false
		}).then((result) => {
			if (result.isConfirmed) {
				console.log('결제라인 삭제');
				$.ajax({
					type: "POST",
					url: sessionStorage.getItem("path")+`/document/write/delete/approverline`,
					data: JSON.stringify($(e.target).data('id')),
					dataType:"json",
					contentType: "application/json; charset=utf-8",
					success: function(response){
						if(response.status === "success"){
							alert(response.message);
							window.location.reload();
						}
						else{
							alert(response.message);
						}
					}
				});
			}
		});
	});
});	