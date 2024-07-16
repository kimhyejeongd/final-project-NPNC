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
var currentYear = moment().format('YYYY'),
	currentMonth = moment().format('MM');

var calendarE1 = document.getElementById('calendar'),
	calendar = new FullCalendar.Calendar(calendarE1,{
		initialView : 'dayGridMonth',
		initialDate : currentYear + '-' + currentMonth + '-16',
		height : 'parent',
		themeSystem : 'bootstrap5',
		navLinks : true,
		selectable : true,
		droppable : true,
		editable : true,
		locale : 'ko',
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
		headerToolbar : {
			left : 'prev,next today',
			center : 'title',
			right : 'dayGridMonth,timeGridDay,listWeek'
		},
		eventClick : function(info){
			editEvent(info.event);
		}
	});
	
	calendar.render();