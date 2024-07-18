/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event, element, view) {

    $('#eventDelete').data('id', event.calendarKey); //클릭한 이벤트 ID

	
    $('.popover.fade.top').remove();
    $(element).popover("hide");

    if (event.allDay === true) {
        calAllday.prop('checked', true);
    } else {
        calAllday.prop('checked', false);
    }

    if (event.end === null) {
        event.end = event.start;
    }

    if (event.allDay === true && event.end !== event.start) {
        calEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
    } else {
        calEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
    }

    modalTitle.html('일정 수정');
    calTitle.val(event.title);
    calStart.val(event.start.format('YYYY-MM-DD HH:mm'));
    calType.val(event.type);
    calDesc.val(event.description);
    calColor.val(event.backgroundColor).css('color', event.backgroundColor);

    addBtnEvent.hide();
    modifyBtnEvent.show();
    eventModal.modal('show');

    //업데이트 버튼 클릭시
    $('#eventUpdate').unbind();
    $('#eventUpdate').on('click', function () {

        if (calStart.val() > calEnd.val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (calTitle.val() === '') {
            alert('일정명은 필수입니다.')
            return false;
        }

        var statusAllDay;
        var startDate;
        var endDate;
        var displayDate;

        if (calAllday.is(':checked')) {
            statusAllDay = true;
            startDate = moment(calStart.val()).format('YYYY-MM-DD');
            endDate = moment(calEnd.val()).format('YYYY-MM-DD');
            displayDate = moment(calEnd.val()).add(1, 'days').format('YYYY-MM-DD');
        } else {
            statusAllDay = false;
            startDate = calStart.val();
            endDate = calEnd.val();
            displayDate = endDate;
        }

        eventModal.modal('hide');
		var eventData={
			_id : "rr",
			title: calTitle.val(),
			start: startDate,
			end: displayDate,
			description : calDesc.val(),
			type: calType.val(),
			username: '보민',
			backgroundColor : calColor.val(),
			textColor: '#ffffff',
			calendarKey: event.calendarKey,
			allDay: statusAllDay
			
		};
	        event.allDay = statusAllDay;
	        event.title = calTitle.val();
	        event.start = startDate;
	        event.end = displayDate;
	        event.type = calType.val();
	        event.backgroundColor = calColor.val();
	        event.description = calDesc.val();

        $("#calendar").fullCalendar('updateEvent', event);

        //일정 업데이트
        $.ajax({
            type: "POST",
            url: "/calendar/updatecalendar.do",
            data: JSON.stringify(eventData),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (response) {
               if(response.status === "success"){
				alert(response.message);
			   }
			   else{
				alert(response.message);
			   }
            }
        });

    });
	// 삭제버튼
	$('#eventDelete').unbind();
	$('#eventDelete').on('click', function () {
        $("#calendar").fullCalendar('removeEvents', function(ev) {
            return ev.calendarKey === event.calendarKey;
        });
	    eventModal.modal('hide');
	
		var calKey = event.calendarKey;
		console.log(calKey);
	    //삭제시
	    $.ajax({
	        type: "POST",
	        url: "/calendar/deletecalendar.do",
	        data: JSON.stringify(calKey),
	        dataType: 'json',
	        contentType: 'application/json; charset=utf-8',
	        success: function (response) {
	   	  	    if(response.status === "success"){
				alert(response.message);
			    }
			    else{
				alert(response.message);
			    }
	        }
	    });
	
	});
};
