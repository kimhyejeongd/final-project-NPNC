<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html lang='ko'>
  <head>
    <meta charset='utf-8' />
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.js'></script>
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
   
  </head>
  <body>
  	<div id="modalTest" style="display: none;">
  		<div id="cont" style="text-align: center;">
			<br>
			<h1>모달테스트</h1>
			시작일 <input type="text" id="schStart" value=""><br>
			종료일 <input type="text" id="schEnd" value=""><br>
			제목 <input type="text" id="schTitle" value=""><br>
			하루종일 <input type="checkbox" id="allDay"><br>
			배경색<input type="color" id="schBColor" value=""><br>
			글자색<input type="color" id="schFColor" value=""><br>
			<button onclick="fCalAdd()">추가</button><br>
			<button onclick="fMClose()">X</button>
  		</div>
  	</div>
  
  	
    <div id='calendar'></div>
    
     <script>
     	const ModalTest = document.querySelector("#modalTest");
     	const calendarEl = document.querySelector("#calendar");
     	const mySchStart = document.querySelector("#schStart");
     	const mySchEnd = document.querySelector("#schEnd");
     	const mySchTitle = document.querySelector("#schTitle");
     	const mySchAllday = document.querySelector("#allDay");
     	const mySchBColor = document.querySelector("#schBColor");
     	const mySchFColor = document.querySelector("#schFColor");
     
     	const headerToolbar = {
     			left: 'prevYear,prev,next,nextYear today',
     			center: 'title',
     			right: 'dayGridMonth,dayGridWeek,timeGridDay'
     	}
     	const calendarOption ={
     			height: '700px', //calendar 높이설정
     			expandRows: true, // 화면에 맞게 높이 재설정
     			slotMinTime: '09:00', //day 캘린더 시작 시간
     			slotMaxTime: '18:00', //day 캘린더 종료 시간
     			//헤더지정
     			headerToolbar: headerToolbar,
     			initialView: 'dayGridMonth', // default: dayGridMonth
     			locale: 'kr', //언어설정
     			selectable: true, //영역 선택
     			selectMirror: true, //오직 TimeGrid view에만 적용됨. default false
     			navLinks: true, //날짜, WeekNumber 클릭 여부, defalut false
     			weekNumbers:true, //WeekNumber 출력여부, default false
     			editable: true, //event(일정)

     			//시작일 및 기간 수정가능여부
     			//eventStartEditable: false,
     			///eventDurationEditable: true
     			dayMaxEventRows: true, //Row높이보다 많으면 +숫자 more 링크 보임!
     			
     			nowIndicator: true
     			/* eventSource: [
     					'/commonEvents.json',
     					'/KVREvents.json',
     					'/SVREvents.json'
     				
     				
     			]     */			
     	};
     	const calendar = new FullCalendar.Calendar(calendarEl, calendarOption);
     	calendar.render();
     
     	calendar.on("eventAdd", info=> console.log("Add:",info));
     	 calendar.on("eventChange", info => console.log("Change:", info));
         calendar.on("eventRemove", info => console.log("Remove:", info));
         calendar.on("eventClick", info => {
             console.log("eClick:", info);
             console.log('Event: ', info.event.extendedProps);
             console.log('Coordinates: ', info.jsEvent);
             console.log('View: ', info.view);
        
             info.el.style.borderColor = 'red';
         });
         calendar.on("eventMouseEnter", info => console.log("eEnter:", info));
         calendar.on("eventMouseLeave", info => console.log("eLeave:", info));
         calendar.on("dateClick", info => console.log("dateClick:", info));
     	calendar.on("select", info => {
              console.log("체크:", info);

              mySchStart.value = info.startStr;
              mySchEnd.value = info.endStr;

              ModalTest.style.display = "block";
          });
     	
     	 function fCalAdd(){
             let event = {
               title: mySchTitle.value,
               start: mySchStart.value,
               end: mySchEnd.value,
               allDay: mySchAllday.checked,
               backgroundColor: mySchBColor.value,
               textColor: mySchFColor.value
             };
             calendar.addEvent(event);
             var inputData={"title":mySchTitle.value,"startd":mySchStart.value,"endd":mySchEnd.value};
             console.log("들어가나요");
             $.ajax({
            	 url: "${path}/calendar/insert.do",
            	 type: "post",
            	 data: JSON.stringify(inputData),
            	 contentType:"application/json;charset=UTF-8",
            	 dataType:"json",
            	 success: function(data){
            		 console.log(data);
            	 }
            	 
             });
             ModalTest.style.display = "none";
           }

           function fMClose() {
             ModalTest.style.display = "none";
           }
     
   
	
    </script>
    
  </body>
</html>