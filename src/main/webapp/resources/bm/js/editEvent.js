/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event, element, view) {

    $('#eventDelete').data('id', event.calendarKey); //클릭한 이벤트 ID

	$("#content").hide();
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

        if (calAllDay.is(':checked')) {
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
            type: "get",
            url: "",
            data: {
                //...
            },
            success: function (response) {
                alert('수정되었습니다.')
            }
        });

    });
};

// 삭제버튼
$('#deleteEvent').on('click', function () {
    
    $('#deleteEvent').unbind();
    $("#calendar").fullCalendar('removeEvents', $(this).data('id'));
    eventModal.modal('hide');

    //삭제시
    $.ajax({
        type: "get",
        url: "",
        data: {
            //...
        },
        success: function (response) {
            alert('삭제되었습니다.');
        }
    });

});