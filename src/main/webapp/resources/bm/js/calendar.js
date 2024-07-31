
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
        editable: false,
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
        },
        eventDidMount: function(info) {
		  var tooltip = new bootstrap.Tooltip(info.el, {
		    title: `
		      <div class="tooltip-content">
		        <div class="popover-title">${info.event.title}</div>
		        <div class="popover-info">등록자 : ${info.event.extendedProps.empName}</div>
		        <div class="popover-info">시간 : ${getDisplayEventDate(info.event)}</div>
		          <div class="popover-description"><strong>설명:</strong> ${info.event.extendedProps.description}</div>
		        </div>
		      </div>
		    `,
		    html: true,
		    placement: 'top',
		    trigger: 'hover',
		    container: 'body'
		  });
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
    $('#myCalendar, #deptCalendar, #companyCalendar, #reservationCalendar').prop('checked', true);
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
    $('#myCalendar, #deptCalendar, #companyCalendar, #reservationCalendar, #myVacationCalendar, #deptVacationCalendar').on('change', function() {
        reloadCalendarEvents();
    });
    

    function reloadCalendarEvents() {
            calendar.removeAllEvents();  // 기존 이벤트 삭제
        fetchCalendarEvents(
            function(events) {
                calendar.addEventSource(events);  // 새로운 이벤트 추가
            },
            function(error) {
                console.error('데이터를 가져오는 도중 에러발생 :', error);
            }
        )
        fetchVacationEvents(
			function(events){
				calendar.addEventSource(events);
			},
			function(error){
				console.error('데이터를 가져오는 도중 에러발생 :', error )
			}
		)
        
    }
	function fetchVacationEvents(successCallback, failureCallback){
		var searchType = '';
		
		if($('#myVacationCalendar').is(':checked')){
			searchType += 'A';
		}
		if($('#deptVacationCalendar').is(':checked')){
			searchType += 'B';
		}
		$.ajax({
			url: path+"/calendar/checkvacation",
			method: 'POST',
			dataType: 'json',
			traditional: true,
			data: JSON.stringify({
				searchType: searchType,
				empNo: userKey,
				deptCode : userDeptCode
			}),
			contentType: "application/json; charset=utf-8",
			success: function(data){
				var events = data.map(function(event){
					return {
						id: event._id,
						empNo: event._id,
						title: event.title,
						start: event.start,
						end: event.end,
						backgroundColor: '#ff9e27',
						description: event.title,
						empName: event.empName,
						empDeptCode: event.deptCode,
						vacationKey: event.vacationkey
					}
				});
				events = events.filter(function(event){
					 return event !== undefined;
				})
				successCallback(events);
			},
			error: function(xhr, status, error){
				failureCallback('오류가 발생했습니다: '+ error);
			}
		})
		
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
        if ($('#reservationCalendar').is(':checked')){
			searchType += 'D';
		}
		
        $.ajax({
            url: path+"/calendar/checkcalendar",
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
     function getDisplayEventDate(event) {
        var start = new Date(event.start);
        var end = new Date(event.end || event.start);
        return start.toLocaleString() + ' - ' + end.toLocaleString();
      }
});
