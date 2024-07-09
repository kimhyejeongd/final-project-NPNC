var activeInactiveWeekends = true;
var clickCount =0;
var calendar= $('#calendar').fullCalendar({
	
	
	
	locale					: 'ko',
	timezone 				: 'local',
	nextDayThreshold		: '09:00:00',
	allDaySlot				: true,
	displayEventTime		: true,
	displayEventEnd			: true,
	firstDay 				: 0, //월요일이 먼저오게 하려면 1
	weeknumbers 			: false, //주 번호 표시
	selectable  			: true, //캘린더에서 날짜랑 시간 선택할 수 있게 표시
	weekNumberCalculation	: "ISO",
	eventLimit 				: true,
	view 					: {
								month : {eventLimit : 12} // 한날짜에 최대 12개의 이벤트표시(월간 보기 기준)
							  },
	eventLimitClick  		: 'week', //popover 12개가 넘는 이벤트-> +x more로 표시, 누르면 주간보기가 팝업으로 표시!
	navLinks 				: true, 
	/*defaultDate   			: moment('2024-06'),*/
	timeFormat 				: 'HH:mm',
	defaultTimeEventDuration: '01:00:00', //기본 이벤트 지속시간을 1시간으로 설정
	editable 				: true, 
	minTime					: '00:00:00',
	maxTime					: '24:00:00',
	slotLabelFormat 		: 'HH:mm', //시간슬롯의 레이블형식
	weekends 				: true, //주말 표시 설정
	nowIndicator 			: true, //현재 시간 표시하는 지시선
	dayPopoverFormat 		: 'MM/DD dddd', //하루 이벤트 팝업 형식 -> 월/일/요일 형식
	longPressDelay 			: 0,  //길게누르기 지연시간
	eventLongPressDelay 	: 0, //이벤트 길게누르기 지연시간
	selectLongPreeDelay 	: 0, // 선택 길게 누르기 지연시간
	header 					: {
								left : 'today, prevYear, nextYear, viewWeekends',
								center : 'prev, title, next',
								right : 'month, agendaWeek, agendaDay, listWeek' 
							  },
	views 					: {
								month : {
									columnFormat : 'dddd'
								},
								agendaWeek : {
									columnFormat : 'M/D ddd',
									titleFormat : 'YYYY년 M월 D일',
									eventLimit : false
								},
								agendaDay : {
									columnFormat : 'dddd',
									eventLimit : false
								},
								listWeek : {
									columnFormat : ''
								}
							   },
	customButtons  			: { //주말 숨기기 & 보이기
	 							viewWeekends : {
									text : '주말',
									click : function (){
										activeInactiveWeekends ? activeInactiveWeekends = false : activeInactiveWeekends = true;
										$('#calendar').fullCalendar('option',{
											weekends : activeInactiveWeekends
										});
									}
									
								}
							  },
	
	select : function(startDate, endDate, jsEvent, view){
		
		//$(".fc-body").unbind('click');
		$(".fc-body").on('click', 'td', function(e){
			
			$("#content").addClass("contentOpened")
			.css({
				display: "block",
				left: e.pageX,
				top: e.pageY
				
			});
			return false;
			/*다른 클릭 이벤트 핸들러가 실행되지 않도록 방지하는 역할*/
		});
		
		var today = moment();
		/*날짜와 시간을 나타내는 moment 객체 생성*/
		//라이브러리 Moment.js
		
		if(view.name == "month"){
			startDate.set({
				hours:today.hours(),
				minute: today.minutes()
			});
			startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
			endDate = moment(endDate).subtract(1, 'days');
			
			endDate.set({
				hours: today.hours() +1,
				minute: today.minutes()
			});
			endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
		} else{
			startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
			endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
			
		}
		//날짜 클릭하면 카테고리 선택 메뉴
		var $content = $('#content');
		$content.on("click","a", function (e){
			e.preventDefault();
			
			
			//카테고리를 골랐을떄
			if ($(this).data().role !== 'close'){
				newEvent(startDate, endDate, $(this).html());
			}
			$content.removeClass("contentOpened");
			$content.hide();
		});
		$('body').on('click', function() {
			$content.removeClass("contentOpened");
			$content.hide();
		})
		//날짜선택시 달력
		$("#cal-start, #cal-end").datetimepicker({
		    format: 'YYYY-MM-DD HH:mm'
		});
		
		
	
	}
	
	
});