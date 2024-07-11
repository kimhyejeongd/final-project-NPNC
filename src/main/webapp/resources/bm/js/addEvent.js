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



//일정생성
var newEvent = function(start, end, eventType){
	
	$("#content").hide(); //메뉴숨김 
	
	modalTitle.html('새 일정');
	calType.val(eventType).prop('selected',true);
	calTitle.val('');
	calStart.val(start);
	calEnd.val(end);
	calDesc.val('');
	
	addBtnEvent.show();
	modifyBtnEvent.hide();
	eventModal.modal('show');
	
	$('#eventSave').unbind();
	$('#eventSave').on('click', function () {
		var eventData ={
			_id : "rr",
			title: calTitle.val(),
			start: calStart.val(),
			end: calEnd.val(),
			description : calDesc.val(),
			type: calType.val(),
			username: '보민',
			backgroundColor : calColor.val(),
			textColor: '#ffffff',
			calendarKey: '',
			allDay: false
		};
		
		console.log(eventData);
		
		if(eventData.start>eventData.end){
			alert('끝나는 날짜가 앞설 수 없습니다.');
			return false;
		}
		var endDay;
		if(calAllday.is(':checked')){
			eventData.start = moment(eventData.start).format('YYYY-MM-DD');
			eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
		
			eventData.allDay = true;
		}
		$("#calendar").fullCalendar('renderEvent', eventData, true);
		eventModal.find('input, textarea').val('');
		calAllday.prop('checked', false);
		eventModal.modal('hide');
		
		$.ajax({
			type: "POST",
			url: "/calendar/insertcalendar.do",
			data: JSON.stringify(eventData),
			contentType: "application/json; charset=utf-8",
			dataType:"json",
			success: function(response){
				if(response.status === "success"){
					alert(response.message);
					eventData.calendarKey=response.calendarKey;
				}
				else{
					alert(response.message);
				}
			}
			
		});
	});
	
	
	
	
	
};