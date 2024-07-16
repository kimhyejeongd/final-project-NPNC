    var eventModal = $('#eventModal');
    var modalTitle = $('.modal-title');
    var calAllday = $('#cal-allday');
    var calTitle = $('#cal-title');
    var calStart = $('#cal-start');
    var calEnd = $('#cal-end');
    var calType = $('#cal-type');
    var calColor = $('#cal-color');
    var calDesc = $('#cal-desc');

    var addBtnEvent = $('.modalBtn-addEvent');
    var modifyBtnEvent = $('.modalBtn-modifyEvent');

    var newEvent = function(start, end, eventType) {
        $("#content").hide(); // 메뉴숨김 

        modalTitle.html('새 일정');
        calType.val(eventType).prop('selected', true);
        calTitle.val('');
        calStart.val(start);
        calEnd.val(end);
        calDesc.val('');

        addBtnEvent.show();
        modifyBtnEvent.hide();
        eventModal.modal('show');

        $('#eventSave').off('click').on('click', function () {
            var eventData = {
                id: Date.now().toString(), // 임시 ID
                title: calTitle.val(),
                start: calStart.val(),
                end: calEnd.val(),
                description: calDesc.val(),
                type: calType.val(),
                username: '보민',
                backgroundColor: calColor.val(),
                textColor: '#ffffff',
                allDay: calAllday.is(':checked')
            };

            if (eventData.start > eventData.end) {
                alert('끝나는 날짜가 앞설 수 없습니다.');
                return false;
            }

            if (eventData.allDay) {
                eventData.start = moment(eventData.start).format('YYYY-MM-DD');
                eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
            }

            $.ajax({
                type: "POST",
                url: "/calendar/insertcalendar.do",
                data: JSON.stringify(eventData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(response) {
                    if (response.status === "success") {
                        alert(response.message);
                        eventData.id = response.calendarKey;
                        calendar.addEvent(eventData);
                        eventModal.modal('hide');
                        eventModal.find('input, textarea').val('');
                        calAllday.prop('checked', false);
                    } else {
                        alert(response.message);
                    }
                }
            });
        });
    };

    function editEvent(event) {
        // Edit event logic here
    };