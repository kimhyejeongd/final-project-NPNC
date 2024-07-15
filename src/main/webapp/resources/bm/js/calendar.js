var activeInactiveWeekends = true;
var clickCount = 0;

function selectCalList() {
    $.ajax({
        url: '/calendar/selectcalendar.do',
        type: 'GET',
        data: {
            memberKey: 1
        },
        success: function(response) {
            var events = [];
            
            for (var i = 0; i < response.length; i++) {
                var res = response[i];
                var event = {
					calendarKey: res.calendarKey,
                    title: res.title,
                    start: res.start,
                    end: res.end,
                    backgroundColor: res.backgroundColor,
                    type:res.type,
                    allDay:res.allDay
                    
                };
                
                events.push(event);
            }
            console.log('Events:', events);
            $('#calendar').fullCalendar('removeEvents');  // 기존 이벤트 제거
            $('#calendar').fullCalendar('addEventSource', events);  // 새로운 이벤트 추가
        },
        error: function() {
            console.log("Failed to fetch data from the server");
        }
    });
}

$(document).ready(function() {
    var calendar = $('#calendar').fullCalendar({
        locale: 'ko',
        timezone: 'local',
        nextDayThreshold: '09:00:00',
        allDaySlot: true,
        displayEventTime: true,
        displayEventEnd: true,
        firstDay: 0,
        weekNumbers: false,
        selectable: true,
        weekNumberCalculation: "ISO",
        eventLimit: true,
        view: {
            month: { eventLimit: 12 }
        },
        eventLimitClick: 'week',
        navLinks: true,
        timeFormat: 'HH:mm',
        defaultTimeEventDuration: '01:00:00',
        editable: true,
        minTime: '00:00:00',
        maxTime: '24:00:00',
        slotLabelFormat: 'HH:mm',
        weekends: true,
        nowIndicator: true,
        dayPopoverFormat: 'MM/DD dddd',
        longPressDelay: 0,
        eventLongPressDelay: 0,
        selectLongPressDelay: 0,
        header: {
            left: 'today, prevYear, nextYear, viewWeekends',
            center: 'prev, title, next',
            right: 'month, agendaWeek, agendaDay, listWeek'
        },
        views: {
            month: {
                columnFormat: 'dddd'
            },
            agendaWeek: {
                columnFormat: 'M/D ddd',
                titleFormat: 'YYYY년 M월 D일',
                eventLimit: false
            },
            agendaDay: {
                columnFormat: 'dddd',
                eventLimit: false
            },
            listWeek: {
                columnFormat: ''
            }
        },
        customButtons: {
            viewWeekends: {
                text: '주말',
                click: function() {
                    activeInactiveWeekends = !activeInactiveWeekends;
                    $('#calendar').fullCalendar('option', {
                        weekends: activeInactiveWeekends
                    });
                }
            }
        },
        select: function(startDate, endDate, jsEvent, view) {
            $(".fc-body").on('click', 'td', function(e) {
                $("#content").addClass("contentOpened")
                    .css({
                        display: "block",
                        left: e.pageX,
                        top: e.pageY
                    });
                return false;
            });

            var today = moment();

            if (view.name == "month") {
                startDate.set({
                    hours: today.hours(),
                    minute: today.minutes()
                });
                startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
                endDate = moment(endDate).subtract(1, 'days');
                endDate.set({
                    hours: today.hours() + 1,
                    minute: today.minutes()
                });
                endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
            } else {
                startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
                endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
            }

            var $content = $('#content');
            $content.on("click", "a", function(e) {
                e.preventDefault();
                if ($(this).data().role !== 'close') {
                    newEvent(startDate, endDate, $(this).html());
                }
                $content.removeClass("contentOpened");
                $content.hide();
            });
            $('body').on('click', function() {
                $content.removeClass("contentOpened");
                $content.hide();
            });

            $("#cal-start, #cal-end").datetimepicker({
                format: 'YYYY-MM-DD HH:mm'
            });
        },
        eventClick: function (event, jsEvent, view) {
   			 editEvent(event);
  		}
    });

    // 페이지 로딩 시 selectCalList 함수 호출
    selectCalList();
});