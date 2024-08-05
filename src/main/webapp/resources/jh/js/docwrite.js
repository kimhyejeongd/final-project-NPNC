/**
 * 	문서 작성
 */

 function sendDataToParent(data) {
    console.dir(data);
    $("#approvalDiv").html(''); // approvalDiv 초기화
    
    // 선택 결재자
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
		
        let widthCalc = (item.memberTeam.length * 1.5) + 1;
        $("<input>", {
            name: 'approvers[' + index + '].memberTeamName',
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
            name: 'approvers[' + index + '].memberJobName',
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
    // 참조인
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
            name: 'referers[' + index + '].memberTeamName',
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
            name: 'referers[' + index + '].memberJobName',
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
        	e.stopPropagation(); // 이벤트 버블링 방지
        	let $div = $(e.target).closest('div.col');
        	let savedData = JSON.parse(localStorage.getItem('selectedReferer'));
        	let index = parseInt($div.attr('id').replace('referer', '')); // 해당 <div>의 인덱스 번호 확인
        	console.log(index);
            savedData.splice(index, 1);  // 배열에서 해당 항목 삭제
            localStorage.setItem('selectedReferer', JSON.stringify(savedData));  // 로컬 스토리지 업데이트
        	$(e.target).parent().remove();
        });
    });
}
function sendStorageToParent(data){
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
         name: 'erDocStorageKey',
         value: data.erStorageKey,
         css: {
             border: 'none',
             width: 'auto',
             maxWidth: '80px'
         },
         type: 'hidden'
     }).appendTo($div);
     
     $("<span>", {
         name: '',
         text: data.erStorageFolder + " > ",
         css: {
             border: 'none',
             width: 'auto',
             maxWidth: '80px'
         },
     }).attr('readonly', true).appendTo($div);
     
     $("<span>", {
         name: '',
         text: data.erStorageName,
         css: {
             border: 'none',
             width: 'auto',
             maxWidth: '80px'
         },
     }).attr('readonly', true).appendTo($div);
     
     $div.appendTo($("#storageDiv"));
     $("#storageBtn").text('재선택');
}

function fn_arrayFiles(files, existingCount){
	Array.from(files).forEach((file, index) => {
       	let adjustedIndex = existingCount + index + 1;
       	console.log('files[index] : ' + index); 
    	let files=this.files;
    	let $div = $("<div>").addClass('m-0 p-2 d-flex align-items-center justify-content-between file-name')
								.css({
									'width': '100%',
									'min-height': '30px',
									'font-size' : 'larger',
									'text-align': 'left',
									'border-radius': '15px',
									'background-color': 'white !important'
								});
	  	
		let $box = $("<div>").addClass('d-flex align-items-center')
							.css({
								'color': 'black',
								'background-color': 'white !important',
								'border': 'none !important',
								'width': '500px'
							});
		
		 $box.html('<input name="files[' + (adjustedIndex-1) + '].fileOrderby" class="badge rounded-pill text-bg-secondary ms-0" value="' + (adjustedIndex) + '" style="border-radius: 15px; width: 23px; display: inline; background-color: white;">' +
                 '<input name="files[' + (adjustedIndex-1) + '].fileOriName" class="fileInput form-control" style="color: black; background: white !important; border: none; width: 500px;" value="' + file.name + '" readonly>');
		
		let $buttonbox=$("<div>").addClass('d-flex');
		$buttonbox.html(`<button class="btn btn-sm btn-outline-secondary ml-2 bringBtn ms-2" id="fileViewBtn" type="button">자세히보기</button>
							<button class="btn btn-sm btn-outline-secondary ml-2 bringBtn ms-2" id="fileDownBtn" type="button">다운로드</button>
							<button class="btn btn-sm btn-outline-primary ml-2 bringBtn ms-2" id="fileDeleteBtn" type="button">삭제</button>`);
		$div.append($box).append($buttonbox);
		$('#fileinputDiv').append($div);
    });
}
//파일 상세보기
$(document).on('click', '#fileViewBtn', function() {
	console.log('파일 상세보기');
	let fileName = $(this).data('filename');
	console.log('원본 파일명:', fileName);
	let encodedFileName = encodeURIComponent(fileName); // 파일명 인코딩
	console.log('인코딩된 파일명:', encodedFileName);
    $.ajax({
        url: sessionStorage.getItem("path") + `/document/files/detail/${encodedFileName}`,
        method: 'GET',
        success: function (data) {
			console.log(data);
			// 파일 확장자 확인
            let fileExtension = data.fileOriName.split('.').pop().toLowerCase();
            let imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'];
            $('#fileDetailOriname').text(data.fileOriName);
            $('#fileDetailSize').text(data.fileSize + ' bytes');
            $('#fileDetailUploadDate').text(new Date(data.fileUploadDate).toLocaleString());
            
            // 이미지일 경우
            if (imageExtensions.includes(fileExtension)) {
	            $('#fileDetailImage').attr('src', sessionStorage.getItem("path") + `/document/files/download/${encodedFileName}`).show();
            } else {
            // 이미지가 아닌 경우
            	$('#fileDetailImage').hide();
        	}

            $('#fileDetailModal').modal('show');
        },
        error: function (jqXHR, textStatus, errorThrown) {
			console.error("Error fetching file details: ", textStatus, errorThrown);
            $('.modal-body').html('파일 정보를 불러오는 데 실패했습니다.');
            $('#fileDetailModal').modal('show');
        }
    });
});
//파일 다운로드
$(document).on('click', '#fileDownBtn', function() {
    let fileName = $(this).data('filename');
    window.location.href = sessionStorage.getItem("path") + `/document/files/download/${fileName}`;
});