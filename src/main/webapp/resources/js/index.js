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
	
	
  var calendarE1 = document.getElementById('calendar');
  var currentYear = moment().format('YYYY'),
  	  currentMonth = moment().format('MM');
    var calendar = new FullCalendar.Calendar(calendarE1, {
        initialView: 'dayGridMonth',
        initialDate: currentYear+'-'+currentMonth +'-31',
        height: 'parent',
        themeSystem: 'bootstrap5',
        contentHeight : 'parent',
        navLinks: false,
        selectable: false,
        droppable: false,
        editable: false,
        locale: 'ko',
        dayMaxEvents: true,
        headerToolbar:{
			left : 'prev',
			center : 'title',
			right: 'next'
		},
        events: function(fetchInfo, successCallback, failureCallback) {
			fetchCalendarEvents(successCallback, failureCallback);
		}

    });
        function fetchCalendarEvents(successCallback, failureCallback){
			 $.ajax({
                url: path + "/homecalendar",
                method: 'POST',
                dataType: 'json',
                success: function(data) {
					console.log(data);
                    var events = data.map(function(event) {
                        return {
                            id: event._id,  // id를 추가합니다.
	                        empNo: event._id,
	                        title: event.title,
	                        start: event.start,
	                        end: event.end,
	                        backgroundColor: event.backgroundColor,
	                        description: event.description,
	                        empName: event.empName,
	                        empDeptCode: event.deptCode,
	                        allDay: event.allDay === 'Y' ? true : false,
	                        type: event.type,
	                        calendarKey: event.calendarKey,
	                        selectedMembers: event.selectedMembers
                        };
                    });
                    successCallback(events); // 이벤트 데이터를 반환
                },
                error: function(jqXHR, textStatus) {
           
                    failureCallback(textStatus); // 에러 콜백 호출
                }
            });
		}


    calendar.render();
});