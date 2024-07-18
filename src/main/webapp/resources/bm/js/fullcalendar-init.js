/*Full Calendar Init*/
//Small Calendar
$('input[name="calendar"]').daterangepicker({
	singleDatePicker: true,
	showDropdowns: false,
	minYear: 1901,
	"cancelClass": "btn-secondary",
	autoApply: true,
	parentEl: "#inline_calendar",
});

/* Single Date*/
$('input[name="single-date-pick"]').daterangepicker({
	singleDatePicker: true,
	startDate: moment().startOf('hour'),
	showDropdowns: true,
	minYear: 1901,
	"cancelClass": "btn-secondary",
	locale: {
		format: 'YYYY-MM-DD'
	}
});
$('input[name="calendar"]').trigger("click");


var curYear = moment().format('YYYY'),
	curMonth = moment().format('MM');
	

$(document).ready(function() {
    $('#closeBtn, #cancelBtn').click(function() {
        // 모든 필드를 재설정합니다.
        $('.cal-event-name').val('');
        $('.cal-event-code').val('CAL001');
        $('.cal-event-date-start').val(getCurrentDateTime());
        $('.cal-event-date-end').val(getCurrentDateTime());
        $('#alldaycheck').prop('checked', false);
        $('.cal-event-content').val('');
       	$("[class$='inviteContainer']:not(:first)").remove();
      // 첫 번째 항목의 값 초기화
   	$(".inviteContainer:first").find("select[name='calEmp']").prop('selectedIndex', -1);
    });
});

function getCurrentDateTime() {
    var now = new Date();
    var year = now.getFullYear();
    var month = ('0' + (now.getMonth() + 1)).slice(-2);
    var day = ('0' + now.getDate()).slice(-2);
    var hours = ('0' + now.getHours()).slice(-2);
   	var minutes = '00'; // 분을 00으로 설정
    return year + '-' + month + '-' + day + ' ' + hours + ':' + minutes;
}



document.addEventListener('DOMContentLoaded', function() {
	// sessionStorage에서 캘린더 새로고침 표시를 확인	
	var allcalendar = {
		events: function(fetchInfo, successCallback, failureCallback) {
			// 기본적으로 첫 번째 이벤트 소스를 사용합니다.
			var eventSources = contextPath+`/schedule/schedulelistend`;
			$.ajax({
				url: eventSources,
				method: 'GET',
				dataType: 'json',
				traditional: true,
				async: false, //동기
				success: function(data) {
					var events = [];
					$.each(data, function(index, event) {
						events.push({
							id: event.calCode,
							title: event.calSubject,
							start: event.calStartDate,
							end: event.calEndDate,
							backgroundColor: event.calColor,
							extendedProps: {
								content: event.calContent,   // 추가
								myEmpNo: event.myEmpNo,// 추가
								invitationEmpList: event.invitationEmpList,
								checkList: event.CheckListAll,
								important: event.calImportYn,
								status: event.calStatus,
								reminder: event.reminderYn,
								allday: event.calAlldayYn,
								calNo: event.calNo,
							}
						});
					});
					successCallback(events);
				},
				error: function() {
					failureCallback('이벤트를 가져오는 도중 오류가 발생했습니다!' + error);
				}
			})
		}
	};

	var mycalendar = {
		events: function(fetchInfo, successCallback, failureCallback) {
			// 기본적으로 첫 번째 이벤트 소스를 사용합니다.
			var calCode = ''; // 이 부분에 필요한 calCode 값을 설정해주세요.
			var searchType = '';

			if($('#mycalendar').is(':checked')) {
				searchType += 'A'
				calCode = 'CAL001'
			}
			if($('#mydeptcalendar').is(':checked')) {
				searchType += 'B'
				calCode = 'CAL002'
			}
			if($('#companycalendar').is(':checked')) {
				searchType += 'C'
				calCode = 'CAL003'
			}if($('#reserveCalendar').is(':checked')) {
				searchType += 'D'
			}
			$.ajax({
				url: contextPath+"/schedule/searchschedule",
				method: 'POST',
				dataType: 'json',
				traditional: true,
				async: false, //동기
				data: JSON.stringify({ calCode: calCode, empNo: loginEmpNo, deptCode: loginDeptCode,  searchType: searchType }),
				contentType: "application/json",
				success: function(data) {
					var events = data.map(function(event, i) {
						//var titlePrefix = event.important === 'Y' ? '<i class="fas fa-star"></i> ' : ''; // Font Awesome 별표 아이콘 추가
						//로그인 한 사람의 번호가 만든 사람이거나 초대받는 사람일때
							return {
								id: event.calCode,
								title: (event.calCode === 'CAL004' || event.calCode === 'CAL005' || event.calCode === 'CAL006') ? event.myEmpName + " " + event.calSubject : event.calSubject,
								start: event.calStartDate,
								end: event.calEndDate,
								backgroundColor: event.calColor,
								//allday: event.calAlldayYn === 'Y',
								//allday: false,
								//icon: 'yellow-star', // 노란색 별 아이콘 클래스
								extendedProps: {
									content: event.calContent,
									myEmpNo: event.myEmpNo,
									myEmpName: event.myEmpName,
									myDeptCode: event.myDeptCode,
									invitationEmpList: event.invitationEmpList,
									important: event.calImportYn,
									status: event.calStatus,
									reminder: event.reminderYn,
									allday: event.calAlldayYn,
									calNo: event.calNo,
									
								}
							};
					});

					// 필터링을 통해 undefined가 된 요소를 제거합니다.
					events = events.filter(function(event) {
						return event !== undefined;
						
						
					});
					successCallback(events);
					
				},
				error: function() {
					failureCallback('이벤트를 가져오는 도중 오류가 발생했습니다!' + error);
				}
			})
		}
	};
	
	
	var myvacCalendar = {
		events: function(fetchInfo, successCallback, failureCallback) {
			// 기본적으로 첫 번째 이벤트 소스를 사용합니다.
			$.ajax({
				url: contextPath+`/schedule/searchVacation`,
				method: 'POST',
				dataType: 'json',
				traditional: true,
				async: false, //동기
				data: JSON.stringify({ empNo: loginEmpNo }),
				contentType: "application/json",
				 success: function(data) {
			        // 서버로부터 받은 데이터를 이벤트로 변환합니다.
			        var events = [];
			        data.searchList.forEach((v)=>{
						let event = {
							id: 'CAL008',
			            	title: v.vacOption+'('+v.vacPermit+')',
			            	backgroundColor: '#03cefc', // 색상 코드 형식을 수정했습니다.
			            	extendedProps: {
				              // 추가된 속성들...
				              myEmpNo: v.empNo
				              }
				            };
						let dateInfo = new Date(Date.parse(v.createDate));
						dateInfo.setHours(dateInfo.getHours() + (dateInfo.getTimezoneOffset() / -60));
				        switch(v.vacOption){
							case '오전반차': 
								event.start = dateInfo.toJSON().substr(0,11)+'09:00:00.000';
								event.end = dateInfo.toJSON().substr(0,11)+'14:00:00.000';
								event.allDay = false;
								break;
							case '오후반차': 
								event.start = dateInfo.toJSON().substr(0,11)+'14:00:00.000';
								event.end = dateInfo.toJSON().substr(0,11)+'18:00:00.000';
								event.allDay = false;
								break;
							case '연차': 
								event.start = dateInfo.toJSON().substr(0,11)+'00:00:00.000';
								event.end = dateInfo.toJSON().substr(0,11)+'23:59:00.000';
								event.allDay = true;
								break;
							case '병가': 
								event.start = dateInfo.toJSON().substr(0,11)+'00:00:00.000';
								event.end = dateInfo.toJSON().substr(0,11)+'23:59:00.000';
								event.allDay = true;
								break;
							case '공가': 
								event.start = dateInfo.toJSON().substr(0,11)+'00:00:00.000';
								event.end = dateInfo.toJSON().substr(0,11)+'23:59:00.000';
								event.allDay = true;
								break;
							case '결혼 (자녀)': 
								event.start = dateInfo.toJSON().substr(0,11)+'00:00:00.000';
								event.end = dateInfo.toJSON().substr(0,11)+'23:59:00.000';
								event.allDay = true;
								break;
							case '결혼 (본인)': 
								event.start = dateInfo.toJSON().substr(0,11)+'00:00:00.000';
								dateInfo.setDate(dateInfo.getDate()+3);
								event.end = dateInfo.toJSON().substr(0,11)+'23:59:00.000';
								event.allDay = true;
								break;
							case '조의 (부모 / 배우자 / 자녀)': 
								event.start = dateInfo.toJSON().substr(0,11)+'00:00:00.000';
								dateInfo.setDate(dateInfo.getDate()+5);
								event.end = dateInfo.toJSON().substr(0,11)+'23:59:00.000';
								event.allDay = true;
								break;
							case '조의 (조부모 / 형제 / 자매)': 
								event.start = dateInfo.toJSON().substr(0,11)+'00:00:00.000';
								dateInfo.setDate(dateInfo.getDate()+3);
								event.end = dateInfo.toJSON().substr(0,11)+'23:59:00.000';
								event.allDay = true;
								break;
						}
			            	
						events.push(event);
					});
			        /*var events = data.map(function(event) {
			          return {
						id: 'CAL008',
			            title: event.vacOption,
			            start: event.createDate,
			            end: event.createDate,
			            backgroundColor: '#eb34ab', // 색상 코드 형식을 수정했습니다.
			            extendedProps: {
			              // 추가된 속성들...
			              myEmpNo: event.empNo,
			            }
			          };
			        });*/
					// 필터링을 통해 undefined가 된 요소를 제거합니다.
					events = events.filter(function(event) {
						return event !== undefined;
					});
					successCallback(events);
				},
				error: function() {
					failureCallback('이벤트를 가져오는 도중 오류가 발생했습니다!' + error);
				}
			})
		}
	};

	var vacCalendar = {
		events: function(fetchInfo, successCallback, failureCallback) {
			// 기본적으로 첫 번째 이벤트 소스를 사용합니다.
			$.ajax({
				url: contextPath+`/schedule/searchVacationByDept`,
				method: 'POST',
				dataType: 'json',
				traditional: true,
				async: false, //동기
				data: JSON.stringify({ deptCode: loginDeptCode }),
				contentType: "application/json",
				 success: function(data) {
			        // 서버로부터 받은 데이터를 이벤트로 변환합니다.
			        var events = [];
			        data.searchListbyCode.forEach((v)=>{
						let event = {
							id: 'CAL008',
			            	title: v.myEmpName+" "+ v.vacOption,
			            	backgroundColor: '#03cefc', // 색상 코드 형식을 수정했습니다.
			            	extendedProps: {
				              // 추가된 속성들...
				              myEmpNo: v.empNo
				              }
				            };
						let dateInfo = new Date(Date.parse(v.createDate));
						dateInfo.setHours(dateInfo.getHours() + (dateInfo.getTimezoneOffset() / -60));
				        switch(v.vacOption){
							case '오전반차': 
								event.start = dateInfo.toJSON().substr(0,11)+'09:00:00.000';
								event.end = dateInfo.toJSON().substr(0,11)+'14:00:00.000';
								event.allDay = false;
								break;
							case '오후반차': 
								event.start = dateInfo.toJSON().substr(0,11)+'14:00:00.000';
								event.end = dateInfo.toJSON().substr(0,11)+'18:00:00.000';
								event.allDay = false;
								break;
							case '연차': 
								event.start = dateInfo.toJSON().substr(0,11)+'00:00:00.000';
								event.end = dateInfo.toJSON().substr(0,11)+'23:59:00.000';
								event.allDay = true;
								break;
							case '병가': 
								event.start = dateInfo.toJSON().substr(0,11)+'00:00:00.000';
								event.end = dateInfo.toJSON().substr(0,11)+'23:59:00.000';
								event.allDay = true;
								break;
							case '공가': 
								event.start = dateInfo.toJSON().substr(0,11)+'00:00:00.000';
								event.end = dateInfo.toJSON().substr(0,11)+'23:59:00.000';
								event.allDay = true;
								break;
							case '결혼 (자녀)': 
								event.start = dateInfo.toJSON().substr(0,11)+'00:00:00.000';
								event.end = dateInfo.toJSON().substr(0,11)+'23:59:00.000';
								event.allDay = true;
								break;
							case '결혼 (본인)': 
								event.start = dateInfo.toJSON().substr(0,11)+'00:00:00.000';
								dateInfo.setDate(dateInfo.getDate()+3);
								event.end = dateInfo.toJSON().substr(0,11)+'23:59:00.000';
								event.allDay = true;
								break;
							case '조의 (부모 / 배우자 / 자녀)': 
								event.start = dateInfo.toJSON().substr(0,11)+'00:00:00.000';
								dateInfo.setDate(dateInfo.getDate()+5);
								event.end = dateInfo.toJSON().substr(0,11)+'23:59:00.000';
								event.allDay = true;
								break;
							case '조의 (조부모 / 형제 / 자매)': 
								event.start = dateInfo.toJSON().substr(0,11)+'00:00:00.000';
								dateInfo.setDate(dateInfo.getDate()+3);
								event.end = dateInfo.toJSON().substr(0,11)+'23:59:00.000';
								event.allDay = true;
								break;
						}
			            	
						events.push(event);
					});
			        /*var events = data.map(function(event) {
			          return {
						id: 'CAL008',
			            title: event.vacOption,
			            start: event.createDate,
			            end: event.createDate,
			            backgroundColor: '#eb34ab', // 색상 코드 형식을 수정했습니다.
			            extendedProps: {
			              // 추가된 속성들...
			              myEmpNo: event.empNo,
			            }
			          };
			        });*/
					// 필터링을 통해 undefined가 된 요소를 제거합니다.
					events = events.filter(function(event) {
						return event !== undefined;
					});
					successCallback(events);
				},
				error: function() {
					failureCallback('이벤트를 가져오는 도중 오류가 발생했습니다!' + error);
				}
			})
		}
	};
	
	/*	var reserveCalendar = {
		events: function(fetchInfo, successCallback, failureCallback) {
			// 기본적으로 첫 번째 이벤트 소스를 사용합니다.
			$.ajax({
				url: `/schedule/calreservationlistbyno`,
				method: 'POST',
				dataType: 'json',
				traditional: true,
				async: false, //동기
				data: JSON.stringify({ empNo: loginEmpNo }),
				contentType: "application/json",
				 success: function(data) {
					 console.log(data);
			       
					var events = data.map(function(event, i) {
							return {
								id: event.calCode,
								title: event.calSubject,
								start: event.calStartDate,
								end: event.calEndDate,
								backgroundColor: event.calColor,
								extendedProps: {
									content: event.calContent,
									myEmpNo: event.myEmpNo,
									myDeptCode: event.myDeptCode,
									invitationEmpList: event.invitationEmpList,
									important: event.calImportYn,
									status: event.calStatus,
									reminder: event.reminderYn,
									allday: event.calAlldayYn,
									calNo: event.calNo,
								}
							};
					});

					// 필터링을 통해 undefined가 된 요소를 제거합니다.
					events = events.filter(function(event) {
						return event !== undefined;
					});
					successCallback(events);
					console.log(events)
					
				},
				error: function() {
					failureCallback('이벤트를 가져오는 도중 오류가 발생했습니다!' + error);
				}
			})
		}
	};*/
	
	

	/*var companycalendar = {
		events: function(fetchInfo, successCallback, failureCallback) {
			// 기본적으로 첫 번째 이벤트 소스를 사용합니다.
			var calCode = 'CAL003'; // 이 부분에 필요한 calCode 값을 설정해주세요.
			$.ajax({
				url: `/schedule/searchschedule`,
				method: 'POST',
				dataType: 'json',
				traditional: true,
				async: false, //동기
				data: JSON.stringify({ calCode: calCode }),
				contentType: "application/json",
				traditional: true,
				async: false,
				success: function(data) {
					var events = data.map(function(event, i) {
						return {
							id: event.calCode,
							title: event.calSubject,
							start: event.calStartDate,
							end: event.calEndDate,
							backgroundColor: event.calColor,
							extendedProps: {
								content: event.calContent,
								myEmpNo: event.myEmpNo,
								myDeptCode: event.myDeptCode,
								invitationEmpList: event.invitationEmpList,
								important: event.calImportYn,
								status: event.calStatus,
								reminder: event.reminderYn,
								allday: event.calAlldayYn,
								calNo: event.calNo,
							}
						};
					});
					successCallback(events);
				},
				error: function() {
					failureCallback('이벤트를 가져오는 도중 오류가 발생했습니다!' + error);
				}
			})
		}
	};*/
	
	/*var importcalendar = {
		events: function(fetchInfo, successCallback, failureCallback) {
			// 기본적으로 첫 번째 이벤트 소스를 사용합니다.
			var importYn = event.calImportYn; // 이 부분에 필요한 calCode 값을 설정해주세요.
			$.ajax({
				url: `/schedule/searchschedule`,
				method: 'GET',
				dataType: 'json',
				traditional: true,
				async: false, //동기
				contentType: "application/json",
				traditional: true,
				async: false,
				success: function(data) {
					var events = data.map(function(event, i) {
						return {
							id: event.calCode,
							title: event.calSubject,
							start: event.calStartDate,
							end: event.calEndDate,
							backgroundColor: "#ebde34",
							extendedProps: {
								content: event.calContent,
								myEmpNo: event.myEmpNo,
								myDeptCode: event.myDeptCode,
								invitationEmpList: event.invitationEmpList,
								important: event.calImportYn,
								status: event.calStatus,
								reminder: event.reminderYn,
								allday: event.calAlldayYn,
								calNo: event.calNo,
							}
						};
					});
					successCallback(events);
				
				},
				error: function() {
					failureCallback('이벤트를 가져오는 도중 오류가 발생했습니다!' + error);
				}
			})
		}
	};*/















	var calendarEl = document.getElementById('calendar'),
		calendar = new FullCalendar.Calendar(calendarEl, {
			initialView: 'dayGridMonth',
			initialDate: curYear + '-' + curMonth + '-07',
			headerToolbar: {
				left: 'prev,next today',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			themeSystem: 'bootstrap5',
			height: 'parent',
			navLinks: true,
			selectable: true, // 달력 일자 드래그 설정가능
			droppable: true,
			editable: true,
			/*eventResize: function(info) {
    alert(info.event.title + " end is now " + info.event.end.toISOString());

    if (!confirm("is this okay?")) {
      info.revert();
    }
  },
			*/
			locale: 'ko', // 한국어 설정
			select: function(selectionInfo) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
				$('#create_new_event').modal('show');

				var currentDate = new Date();
				var currentHours = ('0' + currentDate.getHours()).slice(-2); // 시간을 두 자리 숫자로 설정
				var currentMinutes = '00'; // 항상 00으로 설정

				var startTime = selectionInfo.startStr + ' ' + currentHours + ':' + currentMinutes;

				// 종료일자에서 하루를 빼기
				var endDate = new Date(selectionInfo.endStr);
				endDate.setDate(endDate.getDate() - 1);
				var endYear = endDate.getFullYear();
				var endMonth = ('0' + (endDate.getMonth() + 1)).slice(-2);
				var endDay = ('0' + endDate.getDate()).slice(-2);
				var endTime = endYear + '-' + endMonth + '-' + endDay + ' ' + currentHours + ':' + currentMinutes;

				$('.cal-event-date-start').val(startTime);
				$('.cal-event-date-end').val(endTime);

				// 달력도 해당 날짜 시각으로 바꾸는 코드 추가
				$('.cal-event-date-start').daterangepicker({
					timePicker: true,
					singleDatePicker: true,
					timePicker24Hour: true,
					timePickerIncrement: 1,
					startDate: startTime,
					locale: {
						format: 'YYYY/MM/DD HH:mm'
					}
				});

				$('.cal-event-date-end').daterangepicker({
					timePicker: true,
					singleDatePicker: true,
					timePicker24Hour: true,
					timePickerIncrement: 1,
					startDate: endTime,
					locale: {
						format: 'YYYY/MM/DD HH:mm'
					}
				});

			},
			/*plugins: [ googleCalendarPlugin ],
			 eventSources: [
    {
      googleCalendarId: {
        id: 'ko.south_korea.official#holiday@group.v.calendar.google.com',
        apiKey: 'AIzaSyDTmzIpCFcBNK5_MAtLBPVD-j7O9mkXb_c'
      },
      color: '#b342f5',
      textColor: 'black'
    }
  ],*/
  		/*eventSources: [ allcalendar, mycalendar, mydeptcalendar, companycalendar
			],*/
			/*		 events: function(info, successCallback, failureCallback) { // ajax 처리로 데이터를 로딩 시킨다. 
							$.ajax({
								url: `/schedule/schedulelistend.do`,
								type: "GET",
								dataType: "JSON",
								traditional: true,
								async: false, //동기
								success: function(data) {
			
									var events = data.map(function(event, i) {
										var yourEmpNoList = event.invitationEmpList
										var yourEmpNameList = event.yourEmpNameList // yourEmpName을 쉼표(,)로 분리하여 리스트로 만듭니다.
										var yourDeptNameList = event.yourDeptNameList // yourDeptName을 쉼표(,)로 분리하여 리스트로 만듭니다.
										return {
											id: event.calCode,
											title: event.calSubject,
											start: event.calStartDate,
											end: event.calEndDate,
											backgroundColor: event.calColor,
											extendedProps: {
												content: event.calContent,   // 추가
												myEmpNo: event.myEmpNo,// 추가
												myDeptCode: event.myDeptCode,
												invitationEmpList: event.invitationEmpList,
												calCode: event.calCode,//추가
												important: event.calImportYn,
												status: event.calStatus,
												reminder: event.reminderYn,
												allday: event.calAlldayYn,
												calNo: event.calNo,
												
											}
			
										};
									});
									successCallback(events); // 로드된 이벤트 데이터를 콜백으로 전달
									console.log(events);
			
			
								},
								error: function(request, status, error) {
									alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
									console.log("code = " + request.status + " message = " + request.responseText + " error = " + error);
								}
							});
						},*/

			eventContent: function(arg) {
				// 이벤트 컨텐츠를 커스텀하게 렌더링하고 싶을 때 사용
				if (arg.event.extendedProps.toHtml) {
					// 커스텀 HTML 렌더링 로직
				} else {
					return true; // 기본 렌더링
				}
				
				  /*if (arg.event.extendedProps.toHtml) {
				    // 커스텀 HTML 렌더링 로직
				    let arrayOfDomNodes = $.parseHTML(arg.event.title);
				    return { domNodes: arrayOfDomNodes };
				  } else {
				    return { html: arg.event.title }; // 기본 렌더링
				  }*/
				
				
			},
			//eventRender: function(info) {
			   /* if(info.event.extendedProps.calImportYn == 'Y'){
			      var titleElement = info.el.querySelector('.fc-event-title');
			      if (timeElement) {
			        titleElement.insertAdjacentHTML('beforebegin', '<i class="fa fa-star yellow-star"></i>');
			      }
			    }*/
   			 //},
			eventClick: function(info, initcount=2) {
				// 이벤트 클릭 시 동작 정의
				targetE = info.event;
				
				//var tabChecklist = document.getElementById('checklistContainer');
	
				if (targetE.id === 'CAL003' && loginAut != 'AUT001') {
				  document.getElementById('checklistContainer').style.visibility = 'hidden';
				  document.getElementById('edit_event').style.visibility = 'hidden';
				  document.getElementById('del_event').style.visibility = 'hidden';
				  document.getElementById('importContainer').style.visibility = 'hidden';
				}else if(targetE.id === 'CAL003' && loginAut == 'AUT001'){ 
				  document.getElementById('checklistContainer').style.visibility = 'hidden';
				  document.getElementById('importContainer').style.visibility = 'hidden';
				}else{
				  document.getElementById('checklistContainer').style.visibility = 'visible';
				  document.getElementById('edit_event').style.visibility = 'visible';
				  document.getElementById('del_event').style.visibility = 'visible';
				}
				
				
				//체크리스트 조회
				$.ajax({
			  		url: contextPath+"/schedule/checkListByCalNo?calNo="+targetE.extendedProps.calNo,
			  		method: "GET",
			  		contentType: 'application/json',
			  	})
			  		.done(function(data) {
			  			//console.log("체크리스트 조회 성공");
			  			
			  	   //체크리스트 조회
			
			  	    const hkChecklist = document.querySelector('#tab_checklist .hk-checklist');  	
			  	  	$("div.hk-checklist>div").remove();
			
					if (data.length > 0) {
			    	// data.checkList 배열을 순회하며 DOM 요소를 생성합니다.
			    	for (let i = 0; i < data.length; i++) {
			        const checklistItem = data[i];
			
			        // 새로운 div.form-check 요소를 생성합니다.
			        const checklistDiv = document.createElement('div');
			        checklistDiv.classList.add('form-check');
			
			        // 새로운 input-hidden 요소를 생성합니다.
			        const hiddenInput = document.createElement('input');
			        hiddenInput.type = 'hidden';
			        hiddenInput.id = 'checkNohidden';
			        hiddenInput.value = checklistItem.calChecklistNo;
			
			        // 새로운 input-checkbox 요소를 생성합니다.
			        const checkboxInput = document.createElement('input');
			        checkboxInput.type = 'checkbox';
			        checkboxInput.classList.add('form-check-input');
			        checkboxInput.id = `customCheckList${i + 2}`;
			        checkboxInput.name = 'checkListBox';
			        checkboxInput.checked = checklistItem.endYn === 'Y';
			
			        // 새로운 label 요소를 생성합니다.
			        const label = document.createElement('label');
			        label.classList.add('form-check-label');
			        label.htmlFor = `customCheckList${i + 2}`;
			        label.innerText = checklistItem.calChecklistContent;
			
			        // 새로운 span 요소를 생성합니다.
			        const span = document.createElement('span');
			        span.classList.add('done-strikethrough');
			
			        // label에 span을 추가합니다.
			        label.appendChild(span);
			
			        // 삭제 링크를 위한 새로운 span 요소를 생성합니다.
			        const deleteLink = document.createElement('span');
			        deleteLink.classList.add('btn', 'btn-xs', 'btn-icon', 'btn-rounded', 'btn-flush-light', 'flush-soft-hover', 'delete-checklist');
			        deleteLink.dataset.checklistNo = checklistItem.calChecklistNo;
			
			        // 새로운 아이콘 span을 생성합니다.
			        const iconSpan = document.createElement('span');
			        iconSpan.classList.add('icon');
			
			        // 새로운 feather-icon span을 생성합니다.
			        const featherIcon = document.createElement('span');
			        featherIcon.classList.add('feather-icon');
			
			        // 새로운 휘더 아이콘 i를 생성합니다.
			        const trashIcon = document.createElement('i');
					trashIcon.classList.add('icon', 'feather-icon');
					trashIcon.dataset.feather = 'trash-2';
			
			        // i를 feather-icon에 추가합니다.
			        featherIcon.appendChild(trashIcon);
			
			        // feather-icon을 icon에 추가합니다.
			        iconSpan.appendChild(featherIcon);
			
			        // icon을 삭제 링크에 추가합니다.
			        deleteLink.appendChild(iconSpan);
			
			        // div.form-check에 input-hidden, input-checkbox, label, 삭제 링크를 추가합니다.
			        checklistDiv.appendChild(hiddenInput);
			        checklistDiv.appendChild(checkboxInput);
			        checklistDiv.appendChild(label);
			        checklistDiv.appendChild(deleteLink);
			
			        // 생성된 DOM 요소를 #tab_checklist .hk-checklist 내에 추가합니다.
			        hkChecklist.insertBefore(checklistDiv, document.querySelector('.add-new-checklist'));
			    }
			    
			    
			}
			feather.replace();
					
			  		})
			  		.fail(function(request, status, error) {
			  			//console.log("일정 상세 조회 실패" + error);
			  		});
					
					//조회 창 날짜 포맷
					function formatDate(date) {
					var formattedDate = new Date(date);
					var year = formattedDate.getFullYear();
					var month = ("0" + (formattedDate.getMonth() + 1)).slice(-2);
					var day = ("0" + formattedDate.getDate()).slice(-2);
					var hours = ("0" + formattedDate.getHours()).slice(-2);
					var minutes = ("0" + formattedDate.getMinutes()).slice(-2);

					return year + '/' + month + '/' + day + ' ' + hours + ':' + minutes;
				};
				
				/*if (sessionStorage.getItem('refreshCalendar') === 'true') {
					    // 캘린더 새로고침 로직 실행
					    // 예: $('#your-calendar-id').fullCalendar('refetchEvents');
					    // 혹은 캘린더 인스턴스에 대한 참조가 있어야 함
					    calendar.refetchEvents();
					    
					    // 새로고침 표시 삭제
					    sessionStorage.removeItem('refreshCalendar');
					  }*/
							
				
				  if (targetE.id === 'CAL008') {
					  if(loginEmpNo === targetE.extendedProps.myEmpNo){
						$('.hk-drawer.calendar-drawer.drawer-right').hide();
						
						 // 캘린더를 새로고침해야 한다는 표시를 sessionStorage에 저장
    					//sessionStorage.setItem('refreshCalendar', 'true')
						
				        window.location.href = contextPath+'/vacation/vacationView';
				        $('#mydeptcalendar').prop('checked', false);
					    $('#vaccalendar').prop('checked', false);
					    $('#myvaccalendar').prop('checked', false);
					    $('#reserveCalendar').prop('checked', false);
				        
		
			        }else{
						$('.hk-drawer.calendar-drawer.drawer-right').hide();
						
						/*document.getElementById('edit_event').style.visibility = 'hidden';
				  		document.getElementById('del_event').style.visibility = 'hidden';
						 document.getElementById('checklistContainer').style.visibility = 'hidden';
				  		 document.getElementById('importContainer').style.visibility = 'hidden';
				  		 
				  		 $('#viewContainer').find('.event-start-date').text("시작 : " + formatDate(targetE.start));
						$('#viewContainer').find('.event-end-date').text("종료 : " + formatDate(targetE.end));
						var content = targetE.extendedProps.content || "내용이 없습니다.";
						$('#viewContainer').find('.event-content').html(content);
						$('#viewContainer').find('.event-code').html(targetE.title);
						$('#inviContainer1').remove();*/
				
						
					}
			    } else if (targetE.id === 'CAL004' || targetE.id === 'CAL005' || targetE.id === 'CAL006') {
					if(loginEmpNo === targetE.extendedProps.myEmpNo){
					$('.hk-drawer.calendar-drawer.drawer-right').hide();
			        window.location.href = contextPath+'/schedule/reservationlistbyno';
			        $('#mydeptcalendar').prop('checked', false);
					    $('#vaccalendar').prop('checked', false);
					    $('#myvaccalendar').prop('checked', false);
					    $('#reserveCalendar').prop('checked', false);
			        
			        
			        //sessionStorage.setItem('refreshCalendar', 'true')
			        
			        }else{
						$('.hk-drawer.calendar-drawer.drawer-right').show();
						document.getElementById('checklistContainer').style.visibility = 'hidden';
				  		document.getElementById('importContainer').style.visibility = 'hidden';
				  		document.getElementById('edit_event').style.visibility = 'hidden';
				  		document.getElementById('del_event').style.visibility = 'hidden';
				  		
				  		$('#viewContainer').find('.event-start-date').text("시작 : " + formatDate(targetE.start));
						$('#viewContainer').find('.event-end-date').text("종료 : " + formatDate(targetE.end));
						var content = targetE.extendedProps.content || "내용이 없습니다.";
						$('#viewContainer').find('.event-content').html(content);
						$('#viewContainer').find('.event-code').html(targetE.title);
						$('#inviContainer1').remove();
				  		
				  		const invitationEmpList = targetE.extendedProps.invitationEmpList;
						$("#inviteContainer>div").first().remove();
						var existingContainer = document.getElementById("someContainer1");
						existingContainer.innerHTML = '';
						$("div[class^='reinvicontainer']").remove();
						
				


				//조회 모달 list만큼 만들어주기
				if (invitationEmpList.length > 0) {
					for (var i = 0; i < invitationEmpList.length; i++) {
						var YourEmpNo = invitationEmpList[i].yourEmpNo;
						var YourEmpName = invitationEmpList[i].yourEmpName;
						var YourDeptName = invitationEmpList[i].yourDeptName;
						var YourDeptCode = invitationEmpList[i].yourDeptCode;
						var InviUseYn = invitationEmpList[i].inviUseYn;
						
						if(InviUseYn == 'Y'){

						var invicon = document.createElement("div");
						invicon.classList.add("d-flex", "flex-wrap");

						var div = document.createElement("div");
						div.classList.add("chip", "chip-primary", "user-chip", "mb-2", "me-2");

						var span1 = document.createElement("span");
						span1.classList.add("avatar");

						var span2 = document.createElement("span");
						span2.classList.add("chip-text");
						span2.innerText = YourDeptName+" "+YourEmpName; // YourEmpName 변수의 값을 "Morgan"으로 설정

						var span3 = document.createElement("span");
						span3.appendChild(span1);
						span3.appendChild(span2);

						div.appendChild(span3);


						existingContainer.appendChild(invicon);
						invicon.appendChild(div);
								}
							}
						}
					}
			    } else {
					$('.hk-drawer.calendar-drawer.drawer-right').show();


				//조회 부분
				
				$('#viewContainer').find('#checkcalNo').val(targetE.extendedProps.calNo);
				
				$('#viewContainer').find('#checklistSpan').html('To-Do-List');
				
				
				$('#viewContainer').find('.event-start-date').text("시작 : " + formatDate(targetE.start));
				$('#viewContainer').find('.event-end-date').text("종료 : " + formatDate(targetE.end));
				var content = targetE.extendedProps.content || "내용이 없습니다.";
				$('#viewContainer').find('.event-content').html(content);
				var type = targetE.id;
				var typeval;
				switch (type) {
					case 'CAL001':
						typeval = "내일정";
						break;
					case 'CAL002':
						typeval = "부서일정";
						break;
					case 'CAL003':
						typeval = "전사일정";
				}

				$('#viewContainer').find('.event-code').html(typeval);

				var importantYn = targetE.extendedProps.important;
				switch (importantYn) {
				    case 'Y':
				        document.querySelector('#event_import').checked = true;
				        break;
				    case 'N':
				        document.querySelector('#event_import').checked = false;
				        break;
				        }

				
				var reminder = targetE.extendedProps.reminder;
				var reminderval;
				switch (reminder) {
					case 'Y':
						reminderval = "시작 30분전 알림 예정입니다";
						break;
					case 'N':
						reminderval = "알림 예정이 없습니다";
						break;
				}
				$('#viewContainer').find('.event-reminder').html(reminderval);


				const invitationEmpList = targetE.extendedProps.invitationEmpList;
				$("#inviteContainer>div").first().remove();
				var existingContainer = document.getElementById("someContainer1");
				existingContainer.innerHTML = '';
				$("div[class^='reinvicontainer']").remove();


				//조회 모달 list만큼 만들어주기
				if (invitationEmpList.length > 0) {
					for (var i = 0; i < invitationEmpList.length; i++) {
						var YourEmpNo = invitationEmpList[i].yourEmpNo;
						var YourEmpName = invitationEmpList[i].yourEmpName;
						var YourDeptName = invitationEmpList[i].yourDeptName;
						var YourDeptCode = invitationEmpList[i].yourDeptCode;
						var InviUseYn = invitationEmpList[i].inviUseYn;
						
						if(InviUseYn == 'Y'){

						var invicon = document.createElement("div");
						invicon.classList.add("d-flex", "flex-wrap");

						var div = document.createElement("div");
						div.classList.add("chip", "chip-primary", "user-chip", "mb-2", "me-2");

						var span1 = document.createElement("span");
						span1.classList.add("avatar");

						var span2 = document.createElement("span");
						span2.classList.add("chip-text");
						span2.innerText = YourDeptName+" "+YourEmpName; // YourEmpName 변수의 값을 "Morgan"으로 설정

						var span3 = document.createElement("span");
						span3.appendChild(span1);
						span3.appendChild(span2);

						div.appendChild(span3);


						existingContainer.appendChild(invicon);
						invicon.appendChild(div);

						}
					}
				}
					
				const invitationEmpListLength = invitationEmpList.length;
				let removedItemsCount = 0; // 삭제된 요소의 수를 추적하는 변수
				shareProjectCount = initcount;
				
				$("div#shareListJob>*").remove();

	
				// 수정 모달 list만큼 만들어주기(부서 직원)
				if (invitationEmpList.length > 0) {
				for (var i = 0; i < invitationEmpListLength; i++) {
				    var YourEmpNo = invitationEmpList[i].yourEmpNo;
				    var YourEmpName = invitationEmpList[i].yourEmpName;
				    var YourDeptName = invitationEmpList[i].yourDeptName;
				    var YourDeptCode = invitationEmpList[i].yourDeptCode;
				    var InviUseYn = invitationEmpList[i].inviUseYn;
						
						if(InviUseYn == 'Y'){
			
				    // 다시 생성
				    let reInviContainer = document.createElement('div');
				    reInviContainer.className = 'reinvicontainer' + (i + 1);
				    reInviContainer.style.display = 'flex';
				    reInviContainer.style.paddingTop = '5px';
				    reInviContainer.style.paddingBottom = '5px';
			
				    let deptContainer = document.createElement('div');
				    deptContainer.className = 'col-sm-5';
				    let empContainer = document.createElement('div');
				    empContainer.className = 'col-sm-5';
			
				    let deptSelect = document.createElement('select');
				    deptSelect.className = 'form-select me-3';
				    deptSelect.name = 'recalDept';
				    deptSelect.id = 'recalDept' + (i + 1);
			
				    let empSelect = document.createElement('select');
				    empSelect.className = 'form-select me-3';
				    empSelect.name = 'recalEmp';
				    empSelect.id = 'recalEmp' + (i + 1);
			
				    deptContainer.appendChild(deptSelect);
				    empContainer.appendChild(empSelect);
			
				    reInviContainer.appendChild(deptContainer);
				    reInviContainer.appendChild(empContainer);
			
				    let someContainer2 = document.getElementById('shareListJob');
				    someContainer2.appendChild(reInviContainer);
			
				    // 추가된 부분: 삭제 버튼 생성 및 이벤트 핸들러 연결
				    let delButton = document.createElement('button');
				    delButton.type = 'button';
				    delButton.className = 'btn btn-light'
				    delButton.style.width = '53px';
					delButton.style.height = '40px';
					delButton.style.fontSize = '0.7rem';
					delButton.style.writingMode = 'horizontal-tb';
				    
				    delButton.textContent = '삭제';
				    delButton.addEventListener('click', function () {
				        // 클릭된 삭제 버튼의 부모 요소인 컨테이너를 삭제
				        reInviContainer.remove();
				        removedItemsCount++;
				        count = invitationEmpListLength - removedItemsCount + 1; // count 업데이트
				    });
			
				    reInviContainer.appendChild(delButton);
			
				    // 나머지 코드는 그대로 유지
			
				    for (var j = 0; j < deptCodes.length; j++) {
				        let deptOption = document.createElement('option');
				        deptOption.value = deptCodes[j];
				        deptOption.text = deptNames[j];
				        deptSelect.appendChild(deptOption);
				    }
			
				    for (var j = 0; j < deptSelect.options.length; j++) {
				        if (deptSelect.options[j].value == YourDeptCode) {
				            deptSelect.options[j].selected = true;
				            break;
				        }
				    }
			
				 // 부서 선택 시 이벤트 핸들러 함수
					function handleDeptSelect() {
						// 선택된 부서의 인덱스를 가져옵니다.
						var selectedDeptIndex = deptSelect.selectedIndex;
			
						// 선택된 부서에 해당하는 사원 이름과 사원 번호를 담을 배열을 초기화합니다.
						var matchingEmpNames = [];
						var matchingEmpNos = [];
			
						// 선택된 부서의 코드를 가져옵니다.
						var selectedDeptCode = deptCodes[selectedDeptIndex];
			
						// 선택된 부서의 코드와 일치하는 사원을 찾아서 배열에 추가합니다.
						for (var k = 0; k < empDeptCodes.length; k++) {
							if (empDeptCodes[k] === selectedDeptCode) {
								matchingEmpNames.push(empNames[k]);
								matchingEmpNos.push(empNos[k]);
							}
						}
			
						// 직원 선택(select) 요소를 초기화합니다.
						empSelect.innerHTML = "";
			
						// 매칭된 직원 이름과 사원 번호를 새로운 옵션으로 추가합니다.
						for (var l = 0; l < matchingEmpNames.length; l++) {
							var empOption = document.createElement("option");
							empOption.value = matchingEmpNos[l];
							empOption.text = matchingEmpNames[l];
							empSelect.appendChild(empOption);
						}
			
						for (var l = 0; l < empSelect.options.length; l++) {
							if (empSelect.options[l].value == YourEmpNo) {
								empSelect.options[l].selected = true;
								break;
							}
						}
					}
			
			
				    handleDeptSelect();
			
				    deptSelect.addEventListener("change", handleDeptSelect);
					}
				}
			}
			
			
				//변경 부분
				$('#modifyContainer').find('#recalno').val(targetE.extendedProps.calNo);
				$('#modifyContainer').find('.event-name').val(targetE.title);
				$('#modifyContainer').find('.event-content').val(targetE.extendedProps.content);
				$('#modifyContainer').find('.cal-event-code').val(targetE.id);

				switch (reminder) {
					case 'Y':
						$('#modifyContainer').find('#reremindercheck').prop('checked', true);
						break;
					case 'N':
						$('#modifyContainer').find('#reremindercheck').prop('checked', false);
						break;
				}


				var allday = targetE.extendedProps.allday;
				switch (allday) {
					case 'Y':
						$('#modifyContainer').find('#realldaycheck').prop('checked', true);
						break;
					case 'N':
						$('#modifyContainer').find('realldaycheck').prop('checked', false);
						break;
				}





				$('#modifyContainer').find('.cal-event-date-start').daterangepicker({
					timePicker: true,
					singleDatePicker: true,
					timePicker24Hour: true,
					timePickerIncrement: 1,
					startDate: targetE.start,
					locale: {
						format: 'YYYY/MM/DD HH:mm'
					}
				});




				$('#modifyContainer').find('.cal-event-date-end').daterangepicker({
					timePicker: true,
					singleDatePicker: true,
					timePicker24Hour: true,
					timePickerIncrement: 1,
					startDate: targetE.end,
					locale: {
						format: 'YYYY/MM/DD HH:mm'
					}
				});

				$('#realldaycheck').on('click', function() {
					var startPicker = $('#modifyContainer').find('.cal-event-date-start').data('daterangepicker');
					var endPicker = $('#modifyContainer').find('.cal-event-date-end').data('daterangepicker');

					if ($(this).is(':checked')) {
						//console.log('종일여부 수정 체크됨');

						var startD = moment(startPicker.startDate);
						startD.set({ hour: 0, minute: 0, second: 0, millisecond: 0 });
						startPicker.setStartDate(startD);

						var endD = moment(endPicker.endDate); // 수정된 부분
						endD.set({ hour: 23, minute: 59, second: 59, millisecond: 999 });
						endPicker.setStartDate(endD);


					} else {
						//console.log('종일여부 수정 체크 해제됨');
						$('#modifyContainer').find('.cal-event-date-start').daterangepicker({
							timePicker: true,
							singleDatePicker: true,
							timePicker24Hour: true,
							timePickerIncrement: 1,
							startDate: targetE.start,
							locale: {
								format: 'YYYY/MM/DD HH:mm'
							}
						});




						$('#modifyContainer').find('.cal-event-date-end').daterangepicker({
							timePicker: true,
							singleDatePicker: true,
							timePicker24Hour: true,
							timePickerIncrement: 1,
							startDate: targetE.end,
							locale: {
								format: 'YYYY/MM/DD HH:mm'
							}
						});

					}
				});







				// 모달 표시 또는 이벤트 상세 처리

				// 모달창 내의 요소에 이벤트의 내용을 채웁니다.
				//수정 닫기 버튼 눌렀을때 그대로 값 설정
				/*document.querySelector('.drawer-edit-close btn-close').addEventListener('click', function() {
					
				}*/
			}
		}
			
		});
	calendar.render();
	
	
	
			//수정 부서 직원 추가 
			function createContainer(index) {
			    let reInviContainer = document.createElement('div');
			    reInviContainer.className = 'reinvicontainer' + index;
			    reInviContainer.style.display = 'flex';
			    reInviContainer.style.paddingTop = '5px';
			    reInviContainer.style.paddingBottom = '5px';
			
			    let deptContainer = document.createElement('div');
			    deptContainer.className = 'col-sm-5';
			    let empContainer = document.createElement('div');
			    empContainer.className = 'col-sm-5';
			
			    let deptSelect = document.createElement('select');
			    deptSelect.className = 'form-select me-3';
			    deptSelect.name = 'recalDept';
			    deptSelect.id = 'recalDept' + index;
			
			    let empSelect = document.createElement('select');
			    empSelect.className = 'form-select me-3';
			    empSelect.name = 'recalEmp';
			    empSelect.id = 'recalEmp' + index;
			
			    for (var j = 0; j < deptCodes.length; j++) {
			        let deptOption = document.createElement('option');
			        deptOption.value = deptCodes[j];
			        deptOption.text = deptNames[j];
			        deptSelect.appendChild(deptOption);
			    }
			    
			    deptSelect.addEventListener("change", function(){
					var selectedDeptIndex = deptSelect.selectedIndex;
			
					// 선택된 부서에 해당하는 사원 이름과 사원 번호를 담을 배열을 초기화합니다.
					var matchingEmpNames = [];
					var matchingEmpNos = [];
		
					// 선택된 부서의 코드를 가져옵니다.
					var selectedDeptCode = deptCodes[selectedDeptIndex];
		
					// 선택된 부서의 코드와 일치하는 사원을 찾아서 배열에 추가합니다.
					for (var k = 0; k < empDeptCodes.length; k++) {
						if (empDeptCodes[k] === selectedDeptCode) {
							matchingEmpNames.push(empNames[k]);
							matchingEmpNos.push(empNos[k]);
						}
					}
		
					// 직원 선택(select) 요소를 초기화합니다.
					empSelect.innerHTML = "";
		
					// 매칭된 직원 이름과 사원 번호를 새로운 옵션으로 추가합니다.
					for (var l = 0; l < matchingEmpNames.length; l++) {
						var empOption = document.createElement("option");
						empOption.value = matchingEmpNos[l];
						empOption.text = matchingEmpNames[l];
						empSelect.appendChild(empOption);
					}
		
				});
			
			    var selectedDeptIndex = deptSelect.selectedIndex;
			    var selectedDeptCode = deptCodes[selectedDeptIndex];
			
			    var matchingEmpNames = [];
			    var matchingEmpNos = [];
			
			    for (var k = 0; k < empDeptCodes.length; k++) {
			        if (empDeptCodes[k] === selectedDeptCode) {
			            matchingEmpNames.push(empNames[k]);
			            matchingEmpNos.push(empNos[k]);
			        }
			    }
			
			    empSelect.innerHTML = "";
			
			    for (var l = 0; l < matchingEmpNames.length; l++) {
			        var empOption = document.createElement("option");
			        empOption.value = matchingEmpNos[l];
			        empOption.text = matchingEmpNames[l];
			        empSelect.appendChild(empOption);
			    }
			
			    deptContainer.appendChild(deptSelect);
			    empContainer.appendChild(empSelect);
			
			    reInviContainer.appendChild(deptContainer);
			    reInviContainer.appendChild(empContainer);
			
			    // 추가된 부분: 삭제 버튼 생성 및 이벤트 핸들러 연결
			    let delButton = document.createElement('button');
			    delButton.type = 'button';
			    delButton.className = 'btn btn-light'
			    delButton.style.width = '53px';
				delButton.style.height = '40px';
				delButton.style.fontSize = '0.7rem';
				delButton.style.writingMode = 'horizontal-tb';
			    delButton.textContent = '삭제';
			    delButton.addEventListener('click', function () {
			        // 클릭된 삭제 버튼의 부모 요소인 컨테이너를 삭제
			        reInviContainer.remove();
			        shareProjectCount--;
			    });
			
			    reInviContainer.appendChild(delButton);
			
			    return reInviContainer;
			}
			
			function updateCount() {
			    shareProjectCount = document.querySelectorAll("[class^='reinvicontainer']").length + 1;
			}
			
			$('#addBtnRe').on('click', function () {
			    if (shareProjectCount <= 5) {
			        let reInviContainer = createContainer(shareProjectCount);
			
			        let someContainer2 = document.querySelector('#shareListJob');
			        someContainer2.appendChild(reInviContainer);
			
			        shareProjectCount++;
			    } else {
			        alert("공유인원은 5명까지 가능합니다.");
			    }
			    updateCount(); // count를 업데이트하는 함수 호출
			});
			
			
	
	
	
	
	
	
	
	
	
	
	


	var targetDrawer = '.hk-drawer.calendar-drawer',
		targetEvent;
	$(document).on("click", ".calendarapp-wrap .fc-daygrid-event", function(e) {
		$(targetDrawer).css({ "border": "none", "box-shadow": "0 8px 10px rgba(0, 0, 0, 0.1)" }).addClass('drawer-toggle');
		$('.calendar-drawer').find('.event-name').text($(this).text());
		return false;
	});
	/*Event Delete*/
	$(document).on("click", '#del_event', function(e) {
		const deleteConfirm = confirm("일정을 삭제하시겠습니까?");
		if (deleteConfirm) {
			$.ajax({
				url: contextPath+"/schedule/deleteschedule",
				method: "POST",
				data: JSON.stringify({ calNo: targetE.extendedProps.calNo }),
				contentType: 'application/json',
			})
				.done(function(result) {
					alert("일정 삭제 성공");
					//	calendar.addEvent(editEvent);
					 // 성공 후 현재 페이지 새로고침
                	//location.reload();
					//calendar.refetchEvents();
					//조회창 없어지게
					$('#vaccalendar').trigger('change');
					$('#myvaccalendar').trigger('change');
					$('.hk-drawer.calendar-drawer.drawer-right').hide();

				})
				.fail(function(request, status, error) {
					alert("일정 삭제 실패" + error);
				});
		} else {
			$(this).closest('.hk-drawer').removeClass('drawer-toggle');
		}
	});

	$(document).on("click", '#edit_event, .drawer-edit-close', function(e) {
		$(targetDrawer + '>div').toggleClass('d-none');
		return false;
	});

	/*Event Edit 수정*/
	document.getElementById('editBtn').addEventListener('click', fn_update);

	function fn_update() {
		setTimeout(function() {
			$('.alert.alert-dismissible .close').addClass('btn-close').removeClass('close');
		}, 100);
		
		//코드로 백그라운드컬러 값 설정
		var recode = $('#modifyContainer').find('#recode').val();
		var rebackgroundColor;

		switch (recode) {
			case "CAL001":
				rebackgroundColor = "#FF1F1F";
				break;
			case "CAL002":
				rebackgroundColor = "#00AD14";
				break;
			case "CAL003":
				rebackgroundColor = "#000000";
				break;
		}

		$('#modifyContainer').find('#rebackgroundColor').val(rebackgroundColor);

		//select empNo를 리스트로 담아줌
		const selectEmps = $('select[name="recalEmp"]');
		const reempList = [];

		selectEmps.each(function() {
			const reempValue = $(this).val();
			reempList.push(reempValue);
		});

		const editEvent = {
			recalno: targetE.extendedProps.calNo,
			retitle: $('#retitle').val(),
			recode: $('#recode').val(),
			reempno: $('#reempno').val(),
			reempList: reempList,
			rebackgroundColor: rebackgroundColor,
			reallday: $('#realldaycheck').is(':checked') ? 'Y' : 'N',
			restart: $('#reStartDate').val(),
			reend: $('#reEndDate').val(),
			recontent: $('#recontent').val(),
			rereminder: $('#reremindercheck').is(':checked') ? 'Y' : 'N'
		};

		$.ajax({
			url: contextPath+"/schedule/updateschedule",
			method: "POST",
			data: JSON.stringify(editEvent),
			contentType: 'application/json',
		})
			.done(function(result) {
				alert("일정 수정 성공");
				calendar.addEvent(editEvent);

				//calendar.refetchEvents();
				$('#vaccalendar').trigger('change');
				$('#myvaccalendar').trigger('change');
				
				
				//location.reload();
				$('.hk-drawer.calendar-drawer.drawer-right').hide();
				
			})
			.fail(function(request, status, error) {
				alert("일정 수정 실패");
			});

		calendar.unselect();

	};
	
	//중요일정으로 변경
	document.querySelector('#event_import').addEventListener('change', function() {
        var importYn = this.checked ? 'Y' : 'N';
        var checkbox = this; // 이벤트 리스너 외부에서 this를 캡처
        
        $.ajax({
			url: contextPath+"/schedule/updateImportYn",
			method: "POST",
			data: JSON.stringify(
				{importYn : importYn,
				calno: targetE.extendedProps.calNo,
				}),
			contentType: 'application/json',
		})
			.done(function(result) {
				checkbox.checked ? alert("중요일정 변경 성공") : alert("중요일정 해제 성공"); // 알림 변경
				location.reload();
				//calendar.addEvent(editEvent);
				//calendar.refetchEvents();
				
				/*var importantYn = result.calImportYn;
				switch (importantYn) {
				    case 'Y':
				      $('#event_import').prop('checked', true);
				        break;
				    case 'N':
				         $('#event_import').prop('checked', false);
				        break;
				        }*/
				
				
			})
			.fail(function(request, status, error) {
				checkbox.checked ? alert("중요일정 변경 실패" + error) : alert("중요일정 해제 실패"+error);
				//alert("중요일정으로 변경 실패" + error);
			});

		calendar.unselect();

	});
        




	/*Event Add*/
	$(document).on("click", "#add_event", function(e) {
		 const selectElements = $('select[name="calEmp"]');
	    let empList = null;
	
	   if (selectElements.length > 0) {
    empList = [];
    selectElements.each(function() {
        const empValue = $(this).val();
        if (empValue) { // empValue가 비어있지 않을 경우에만 empList에 추가
            empList.push(empValue);
        }
    });
    if (empList.length === 0) { // 모든 empValue가 비어있어 empList에 아무 값도 추가되지 않았을 경우 empList를 null로 설정
        empList = null;
    }
} else {
    empList = null; // selectElements.length가 0인 경우 empList를 null로 설정
}

	    
		const addEvent = {
			title: $('.cal-event-name').val(),
			code: $('#cal-event-code').val(),
			empno: $('#cal-event-empno').val(),
			empdeptcode: $('#cal-event-empdeptcode').val(),
			empList: empList, // empList를 addEvent 객체의 속성으로 추가
			backgroundColor: '',
			allday: $('#alldaycheck').is(':checked') ? 'Y' : 'N',
			start: $('#startDate').val(),
			end: $('#endDate').val(),
			content: $('.cal-event-content').val(),
			reminder: $('#remindercheck').is(':checked') ? 'Y' : 'N'
		};

		switch (addEvent.code) {
			case 'CAL001':
				addEvent.backgroundColor = '#FF1F1F';
				break;
			case 'CAL002':
				addEvent.backgroundColor = '#00AD14';
				break;
			case 'CAL003':
				addEvent.backgroundColor = '#000000';
				break;
		};

		$.ajax({
			url: contextPath+"/schedule/insertschedule",
			method: "POST",
			dataType: "json",
			data: JSON.stringify(addEvent),
			contentType: 'application/json'
		})
			.done(function(result) {
				alert("일정 등록 성공");
				calendar.addEvent(addEvent);
				// 일정을 등록한 후에 캘린더를 새로고침하지 않고 변경된 일정이 보이도록 처리합니다.
				//calendar.refetchEvents();
				$('#vaccalendar').trigger('change');
				$('#myvaccalendar').trigger('change');
				
				
				 document.querySelector('.cal-event-code').selectedIndex = "CAL001";
			     document.querySelector('.cal-event-date-start').value = getCurrentDateTime();
			     document.querySelector('.cal-event-date-end').value = getCurrentDateTime();
			     document.getElementById('alldaycheck').checked = false;
			     document.querySelector('.cal-event-content').value = '';
			     document.querySelector('.cal-event-name').value = '';
			     //document.getElementById('reremindercheck').checked = false;
			   	 $("[class$='inviteContainer']:not(:first)").remove();
			     // 첫 번째 항목의 값 초기화
			     $(".inviteContainer:first").find("select").val("");
      
			})
			.fail(function(request, status, error) {
				alert("일정 등록 실패");
			});
		calendar.unselect();

	});

	// 페이지 로딩 완료 후 실행
	$(document).ready(function() {
		// 'mycalendar' 체크박스가 선택되어 있는지 확인
		// 모든 체크박스를 일단 해제
	    //$('#mydeptcalendar').prop('checked', false);
	    //$('#companycalendar').prop('checked', false);
	    //$('#vaccalendar').prop('checked', false);
	    //$('#myvaccalendar').prop('checked', false);
	    //$('#reserveCalendar').prop('checked', false);
	
	    // #mycalendar 체크
	    //$('#mycalendar').prop('checked', true);

		if ($('#mycalendar').is(':checked')) {
			// 선택되어 있으면 캘린더에 이벤트 소스 추가
			calendar.addEventSource(mycalendar);
		}
		/*if ($('#mydeptcalendar').is(':checked')) {
			// 선택되어 있으면 캘린더에 이벤트 소스 추가
			calendar.addEventSource(mycalendar);
		}
		if ($('#companycalendar').is(':checked')) {
			// 선택되어 있으면 캘린더에 이벤트 소스 추가
			calendar.addEventSource(mycalendar);
		}
		if ($('#reserveCalendar').is(':checked')) {
			// 선택되어 있으면 캘린더에 이벤트 소스 추가
			calendar.addEventSource(mycalendar);
		}
		if ($('#vaccalendar').is(':checked')) {
			// 선택되어 있으면 캘린더에 이벤트 소스 추가
			calendar.addEventSource(vaccalendar);
		}
		if ($('#myvaccalendar').is(':checked')) {
			// 선택되어 있으면 캘린더에 이벤트 소스 추가
			calendar.addEventSource(myvacCalendar);
		}
*/
		// 캘린더 렌더링
		calendar.render();
	});

	
	
	//직원검색 일정 찾기
	$(document).ready(function() {
  // 검색 아이콘에 클릭 이벤트 리스너를 바인딩합니다.
  $('#search-icon').on('click', function() {
    // 입력 필드에서 직원 이름을 가져옵니다.
    var empName = $('#searchEmp').val();

   // AJAX 요청을 통해 서버에 검색을 요청합니다.
    $.ajax({
      url: contextPath+'/schedule/searchEmpschedule', // 서버의 검색 엔드포인트 URL
      method: 'POST',
      contentType: 'application/json', // 전송되는 데이터의 형식을 json으로 지정
      data: JSON.stringify({ empName: empName }), // 서버에 보낼 데이터
      beforeSend: function() {
        // 요청을 보내기 전에 로딩 인디케이터를 표시할 수 있습니다.
        $('#schedule-results').html('<div class="loader">검색 중...</div>');
      },
      success: function(data) {
        // 서버로부터 받은 데이터를 이벤트로 변환합니다.
        var events = data.map(function(event) {
          return {
            id: event.calCode,
            title: event.calSubject,
            start: event.calStartDate,
            end: event.calEndDate,
            backgroundColor: event.calColor, // 색상 코드 형식을 수정했습니다.
            extendedProps: {
              // 추가된 속성들...
              content: event.calContent,
              myEmpNo: event.myEmpNo,
              myDeptCode: event.myDeptCode,
              invitationEmpList: event.invitationEmpList,
              calCode: event.calCode,
              important: event.calImportYn,
              status: event.calStatus,
              reminder: event.reminderYn,
              allday: event.calAlldayYn,
              calNo: event.calNo,
            }
          };
        });

        // 캘린더의 이벤트를 업데이트합니다.
        calendar.removeAllEvents();
        calendar.addEventSource(events);
        $('#schedule-results').empty(); // 로딩 인디케이터를 제거합니다.
      },
      error: function(jqXHR, textStatus, errorThrown) {
        // 에러가 발생하면 사용자에게 알립니다.
        $('#schedule-results').html('<div class="error">검색 실패: ' + textStatus + '</div>');
        console.error('검색 실패: ', textStatus, errorThrown);
      }
    });
  });
});
	
	
	$('#reserveCalendar, #vaccalendar, #myvaccalendar, #mycalendar, #mydeptcalendar, #companycalendar').on('change', function() {
		// 체크박스의 id에 따라 이벤트 소스를 설정
		var id;
		var eventSource;
		switch (this.id) {
			case 'mycalendar':
				 eventSource = mycalendar;
				break;
			case 'mydeptcalendar':
				eventSource = mycalendar;
				break;
			case 'companycalendar':
				eventSource = mycalendar;
				break;
			case 'vaccalendar':
				eventSource = mycalendar;
				break;
			case 'reserveCalendar':
				eventSource = mycalendar;
				break;
			case 'myvaccalendar':
				eventSource = mycalendar;
				break;
		}

		// if (this.checked) {
			// 체크박스가 선택되면 이벤트 소스 추가
		//	calendar.addEventSource(eventSource);
		 //} else {
		 	// 체크박스가 해제되면 해당 이벤트 소스에 연결된 모든 일정 삭제
		 	var events = calendar.getEvents();
		 	events.forEach(function(event) {
		 		var eventId = event.id;
		 		if (id == null || event.id === id) {
		 			event.remove();
				}
		 	});
		 	calendar.addEventSource(eventSource);
		 	if($('#vaccalendar').is(':checked')){
				calendar.addEventSource(vacCalendar);
			 }
			 if($('#myvaccalendar').is(':checked')){
				calendar.addEventSource(myvacCalendar);
			 }
			/* if($('#reserveCalendar').is(':checked')){
				calendar.addEventSource(reserveCalendar);
			}*/
		 //}

		// 중복된 일정 숨기기
		var events = calendar.getEvents();
		var eventIds = new Set();
		events.forEach(function(event) {
			var eventNo = event.extendedProps.calNo;
			if (eventNo && eventIds.has(eventNo)) {
				event.remove();
			} else {
				eventIds.add(eventNo);
			}
		});

		// 캘린더 렌더링
		calendar.render();
	});
	
	/*$('#importcalendar').on('change', function() {
		// 체크박스의 id에 따라 이벤트 소스를 설정
		if (this.checked) {
			// 체크박스가 선택되면 이벤트 소스 추가
			calendar.addEventSource(importcalendar);
		} else {
			// 체크박스가 해제되면 해당 이벤트 소스에 연결된 모든 일정 삭제
			var events = calendar.getEvents();
			events.forEach(function(event) {
				var eventId = event.id;
				if (id == null || event.id === id) {
					event.remove();
				}
			});
		}

		// 중복된 일정 숨기기
		var events = calendar.getEvents();
		var eventIds = new Set();
		events.forEach(function(event) {
			var eventNo = event.extendedProps.calNo;
			if (eventNo && eventIds.has(eventNo)) {
				event.remove();
			} else {
				eventIds.add(eventNo);
			}
		});

		// 캘린더 렌더링
		calendar.render();
	});*/
	
	
	
	// 체크리스트 추가
	   var id;
	   var checklistNo;

	   $(document).on("click", ".add-new-checklist", function (e) {
		    var id = uniqId(); // Generate unique ID

		    var checklistItem = $('<div class="form-check">' +
		    	'<input type="hidden" id="checkNohidden" value="">' +
		        '<input type="checkbox" class="form-check-input" name="checkListBox" id="customCheckListAppend_' + id + '">' +
		        '<label class="form-check-label" for="customCheckListAppend_' + id + '">' +
		        '<span class="done-strikethrough"></span>' +
		        '</label>' +
		        '<input class="form-control checklist-input" type="text" placeholder="Add new Item">' +
		        '<a href="#" class="btn btn-xs btn-icon btn-rounded btn-flush-light flush-soft-hover delete-checklist" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete">' +
		        '<span class="icon">' +
		        '<span class="feather-icon">' +
		        '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2">' +
		        '<polyline points="3 6 5 6 21 6"></polyline>' +
		        '<path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>' +
		        '<line x1="10" y1="11" x2="10" y2="17"></line>' +
		        '<line x1="14" y1="11" x2="14" y2="17"></line>' +
		        '</svg>' +
		        '</span>' +
		        '</span>' +
		        '</a>' +
		        '</div>');

		    checklistItem.insertBefore($(this)) // Insert new checklist before the current element
		        .find('input[type="text"]')
		        .on('keypress', function (e) {
		        	
		            if (e.which == 13) { // Enter key pressed
		                e.preventDefault();
		                var checklistValue = $(this).val(); // Save checklist input value

		                // Ajax call
		                $.ajax({
		                    url: contextPath+"/schedule/insertChecklist",
		                    method: "POST",
		                    dataType: "json",
		                    data: JSON.stringify({
		                        checklistValue: checklistValue,
		                        calNo: document.querySelector('#checkcalNo').value, // Set the appropriate value for data.calNo
		                        empNo: loginEmpNo // Set the appropriate value for loginEmpNo
		                    }),
		                    contentType: 'application/json',
		                    success: function (response) {
		                        // Success handling
		                         
		                      var newChecklistItem = $(this).prev().find('input').trigger('focus');

		                  
		                 	// Set the value of #checkNohidden to the response
		                    $('#checkNohidden').val(response);

		                    // Save the value of #checkNohidden in const checklistNo
		                  checklistItem.find('#checkNohidden').val(response);

                     // Save the value of .checkNohidden in const checklistNo
                     const checklistNo = checklistItem.find('#checkNohidden').val();
		                      
		                    },
		                    error: function (error) {
		                        // Error handling
		                        console.error(error);
		                        //삭제..!!
		                    }
		                });
		            }
		        });

		    return false;
		});
		
		//체크리스트 삭제
			$(document).on("click",".delete-checklist",function (e) {
				e.preventDefault();
				
				const checklistNo = $(this).closest('.form-check').find('#checkNohidden').val();
			     
				   $.ajax({
	                   url: contextPath+"/schedule/deleteChecklist",
	                   method: "POST",
	                   dataType: "json",
	                   data: JSON.stringify({
	                       checklistNo: checklistNo
	                   }),
	                   contentType: 'application/json',
	                   success: function (response) {
	                       // 성공 시 처리
	                       $(this).closest('.form-check').remove();

	                   },
	                   error: function (error) {
	                       // 에러 시 처리
	                       console.error(error+"에러"+checklistNo);
	                       //그냥 두기
	                   }
	               });
			});
	   
			//체크리스트 완료 표시 //만든거 바로 안됨
  			$(document).on("change",'input[type="checkbox"][name="checkListBox"]',function (e) {
  				e.preventDefault();
  				
  				const isChecked = $(this).prop('checked');
  				const checklistNo = $(this).closest('.form-check').find('#checkNohidden').val();

  			    var checkUrl = isChecked ? contextPath+"/schedule/doneChecklist" : contextPath+"/schedule/undoneChecklist";
  					
  					   $.ajax({
  		                   url: checkUrl,
  		                   method: "POST",
  		                   dataType: "json",
  		                   data: JSON.stringify({
  		                       checklistNo: checklistNo
  		                   }),
  		                   contentType: 'application/json',
  		                   success: function (response) {
  		                       // 성공 시 처리
  		                       //console.log("체크리스트 완료");
  		                   },
  		                   error: function (error) {
  		                       // 에러 시 처리
  		                       //console.log("체크리스트 완료 실패");
  		                   }
  					})
  			});
	
	
	
	
	
	
	
});







/*Extra Costomization*/
setTimeout(function() {
	$('.fc-header-toolbar').append('<div class="hk-sidebar-togglable"></div>');
	$('.fc-toolbar-chunk:nth-child(3)').append('<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover hk-navbar-togglable" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Collapse"><span class="icon"><span class="feather-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-up"><polyline points="18 15 12 9 6 15"></polyline></svg></span><span class="feather-icon d-none"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg></span></span></a>');
	$('.fc-prev-button,.fc-next-button').addClass('btn-icon btn-flush-dark btn-rounded flush-soft-hover').find('.fa').addClass('icon');
	$('.fc-today-button').removeClass('btn-primary').addClass('btn-outline-light');
}, 120);