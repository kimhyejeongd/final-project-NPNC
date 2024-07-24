/*document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    locale: 'ko',
    timeZone: 'local',
    nextDayThreshold: '09:00:00',
    allDaySlot: true,
    displayEventTime: true,
    displayEventEnd: true,
    firstDay: 0,
    weekNumbers: false,
    selectable: true,
    weekNumberCalculation: "ISO",
    navLinks: true,
    slotMinTime: '00:00:00',
    slotMaxTime: '24:00:00',
    headerToolbar: {
      left: 'today,prev,next',
      center: 'title',
      right: 'viewWeekends'
    },
    customButtons: {
      viewWeekends: {
        text: '주말',
        click: function() {
          activeInactiveWeekends = !activeInactiveWeekends;
          calendar.setOption('weekends', activeInactiveWeekends);
        }
      }
    },
    views: {
      month: {
        eventLimit: 12
      },
      agendaWeek: {
        eventLimit: false
      },
      agendaDay: {
        eventLimit: false
      }
    },
    editable: true,
    nowIndicator: true,
    select: function(info) {
      var today = moment();

      var startDate = moment(info.start).format('YYYY-MM-DD HH:mm');
      var endDate = moment(info.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm');

      if (info.view.type === "month") {
        startDate = moment(info.start).set({
          hours: today.hours(),
          minute: today.minutes()
        }).format('YYYY-MM-DD HH:mm');
        endDate = moment(info.end).subtract(1, 'days').set({
          hours: today.hours() + 1,
          minute: today.minutes()
        }).format('YYYY-MM-DD HH:mm');
      }

      var content = document.getElementById('content');
      content.classList.add("contentOpened");
      content.style.display = "block";
      content.style.left = info.jsEvent.pageX + "px";
      content.style.top = info.jsEvent.pageY + "px";

      document.body.addEventListener('click', function() {
        content.classList.remove("contentOpened");
        content.style.display = "none";
      });

      content.addEventListener("click", function(e) {
        e.preventDefault();
        if (e.target.dataset.role !== 'close') {
          newEvent(startDate, endDate, e.target.innerHTML);
        }
        content.classList.remove("contentOpened");
        content.style.display = "none";
      });

      $("#cal-start, #cal-end").daterangepicker({
		locale:{			
        	format: 'YYYY-MM-DD HH:mm'
		},
		startDate:moment().subtract(29,'days'),
		endDate: moment()
      });
    },
    eventClick: function(info) {
      editEvent(info.event);
    }
  });

  calendar.render();
  selectCalList(calendar);
});

function selectCalList(calendar) {
  $.ajax({
    url: '/calendar/selectcalendar.do',
    type: 'GET',
    data: {
      memberKey: 1
    },
    success: function(response) {
      var events = response.map(function(res) {
        return {
          calendarKey: res.calendarKey,
          title: res.title,
          start: res.start,
          end: res.end,
          backgroundColor: res.backgroundColor,
          type: res.type,
          allDay: res.allDay
        };
      });

      calendar.removeAllEvents();
      calendar.addEventSource(events);
    },
    error: function() {
      console.log("Failed to fetch data from the server");
    }
  });
}*/ 
	
document.addEventListener('DOMContentLoaded', function() {
    var currentYear = moment().format('YYYY'),
        currentMonth = moment().format('MM');

    var calendarE1 = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarE1, {
        initialView: 'dayGridMonth',
        initialDate: currentYear + '-' + currentMonth + '-16',
        height: 'parent',
        themeSystem: 'bootstrap5',
        navLinks: true,
        selectable: true,
        droppable: true,
        editable: true,
        locale: 'ko',
        timezone: "local",
        select: function(info) {
            var today = moment();

            var startDate = moment(info.start).format('YYYY-MM-DD HH:mm');
            var endDate = moment(info.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm');

            if (info.view.type === "month") {
                startDate = moment(info.start).set({
                    hours: today.hours(),
                    minute: today.minutes()
                }).format('YYYY-MM-DD HH:mm');
                endDate = moment(info.end).subtract(1, 'days').set({
                    hours: today.hours() + 1,
                    minute: today.minutes()
                }).format('YYYY-MM-DD HH:mm');
            }
            var content = document.getElementById('content');
            content.classList.add("contentOpened");
            content.style.display = "block";
            content.style.left = info.jsEvent.pageX - 265 + "px";
            content.style.top = info.jsEvent.pageY + "px";

            document.body.addEventListener('click', function() {
                content.classList.remove("contentOpened");
                content.style.display = "none";
            });

            content.addEventListener("click", function(e) {
                e.preventDefault();
                if (e.target.dataset.role !== 'close') {
                    newEvent(startDate, endDate, e.target.innerHTML);
                }
                content.classList.remove("contentOpened");
                content.style.display = "none";
            });

            $("#cal-start, #cal-end").daterangepicker({
                locale: {
                    format: 'YYYY-MM-DD HH:mm'
                },
                startDate: moment().subtract(29, 'days'),
                endDate: moment()
            });
        },
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridDay,listWeek'
        },
        eventClick: function(info) {
            editEvent(info.event);
        },
        events: function(fetchInfo, successCallback, failureCallback) {
            fetchCalendarEvents(successCallback, failureCallback);
        }
    });

    calendar.render();

    window.calendar = calendar;

    // 네비게이션 버튼 클릭 시 이벤트를 다시 로드
    document.querySelectorAll('.fc-prev-button, .fc-next-button, .fc-today-button').forEach(button => {
        button.addEventListener('click', function() {
            reloadCalendarEvents();
        });
    });

    // 체크박스 초기 상태 설정 및 이벤트 로드
    $('#myCalendar, #deptCalendar, #companyCalendar').prop('checked', true);
    fetchCalendarEvents(
        function(events) {
            calendar.removeAllEvents();	  // 기존 이벤트 삭제
            calendar.addEventSource(events);  // 새로운 이벤트 추가
        },
        function(error) {
            console.error('Error fetching events:', error);
        }
    );

    // 체크박스 변경 시 캘린더 이벤트를 다시 로드
    $('#myCalendar, #deptCalendar, #companyCalendar').on('change', function() {
        reloadCalendarEvents();
    });

    function reloadCalendarEvents() {
        fetchCalendarEvents(
            function(events) {
                calendar.removeAllEvents();  // 기존 이벤트 삭제
                calendar.addEventSource(events);  // 새로운 이벤트 추가
            },
            function(error) {
                console.error('Error fetching events:', error);
            }
        );
    }

    function fetchCalendarEvents(successCallback, failureCallback) {
        var searchType = '';

        if ($('#myCalendar').is(':checked')) {
            searchType += 'A';
        }
        if ($('#deptCalendar').is(':checked')) {
            searchType += 'B';
        }
        if ($('#companyCalendar').is(':checked')) {
            searchType += 'C';
        }

        $.ajax({
            url: "/calendar/checkcalendar",
            method: 'POST',
            dataType: 'json',
            traditional: true,
            data: JSON.stringify({
                searchType: searchType,
                empNo: userKey,
                deptCode: userDeptCode
            }),
            contentType: "application/json; charset=utf-8",
            success: function(data) {
                var events = data.map(function(event) {
                    return {
                        id: event._id,  // id를 추가합니다.
                        title: event.title,
                        start: event.start,
                        end: event.end,
                        backgroundColor: event.backgroundColor,
                        description: event.description,
                        empName: event.name,
                        empDeptCode: event.deptCode,
                        allDay: event.allDay === 'Y' ? true : false,
                        type: event.type,
                        calendarKey: event.calendarKey,
                        selectedMembers: event.selectedMembers
                    };
                });

                events = events.filter(function(event) {
                    return event !== undefined;
                });

                successCallback(events);
            },
            error: function(xhr, status, error) {
                failureCallback('오류가 발생했습니다: ' + error);
            }
        });
    }
});
