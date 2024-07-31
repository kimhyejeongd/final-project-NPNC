var currentEvent;
// 사용자 정보 (로그인한 사용자 정보)
var currentUser = {
    empNo: userKey, // 현재 사용자의 고유 식별자
    empName : userName
};

var editEvent = function(event) {

    selectedMembers = event.extendedProps.selectedMembers.map(member => ({
        memberKey: member.refEmpNo,
        memberName: member.refEmpName,
        jobName: member.refJobName
    }));
    currentEvent = event;
    //참조인은 수정불가, 예약은 예약페이지에서만 수정가능
    var isCreator = (event.extendedProps.empNo == currentUser.empNo && event.extendedProps.type != '4');


    // 각 입력 필드에 이벤트 정보 설정
    var start = moment(event.start).format('YYYY-MM-DD HH:mm');
    var end = moment(event.end).format('YYYY-MM-DD HH:mm');

    // 수정 모달 창 열기
    Swal.fire({
        title: '일정 수정',
        html: `
            <div class="form-group">
                <label for="cal-allDay">종일</label>
                <input id="cal-allDay" type="checkbox" ${!isCreator ? 'disabled' : ''}>
            </div>
            <div class="form-group">
                <label for="cal-title">제목</label>
                <input id="cal-title" type="text" class="form-control" required ${!isCreator ? 'disabled' : ''}>
            </div>
            <div class="form-group">
                <label for="cal-start">시작 일시</label>
                <input id="cal-start" type="datetime-local" class="form-control" required ${!isCreator ? 'disabled' : ''}>
            </div>
            <div class="form-group">
                <label for="cal-end">종료 일시</label>
                <input id="cal-end" type="datetime-local" class="form-control" required ${!isCreator ? 'disabled' : ''}>
            </div>
            <div class="form-group">
                <label for="cal-type">구분</label>
                <select id="cal-type" class="form-control" ${!isCreator ? 'disabled' : ''}>
                    <option value="1">내일정</option>
                    <option value="2">부서일정</option>
                    <option value="3">전사일정</option>
                </select>
            </div>
            <div class="form-group">
                <div class="btn-group">
                    <button class="btn btn-secondary dropdown-toggle button-margin" type="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false" ${!isCreator ? 'disabled' : ''}>
                        참조인
                    </button>
                    <ul class="dropdown-menu" style="width: 300px !important; height: 400px !important; overflow-y: auto;">
                        <div class="accordion" id="accordionPanelsStayOpenExample">
                            ${generateAccordionHTML(organlist)}
                        </div>
                    </ul>
                </div>
            </div>
            <div class="form-group">
                <label for="selected-members">선택된 참조인</label>
                <div id="selected-members" class="form-control" style="height:auto;"></div>
            </div>
            <div class="form-group">
                <label for="cal-desc">설명</label>
                <textarea id="cal-desc" class="form-control" rows="3" ${!isCreator ? 'disabled' : ''}></textarea>
            </div>
        `,
        showCloseButton: true,
        showCancelButton: isCreator,
        cancelButtonText: '삭제',
        confirmButtonText: isCreator ? '수정' : '닫기',
        showConfirmButton: true,
        focusConfirm: false,
        customClass: {
            content: 'text-start',
            cancelButton: 'btn btn-danger'
        },
        didOpen: () => {
            // 모달이 열린 후 실행할 코드
            document.getElementById('cal-title').value = event.title;
            document.getElementById('cal-start').value = start;
            document.getElementById('cal-end').value = end;
            document.getElementById('cal-type').value = event.extendedProps.type;
            document.getElementById('cal-desc').value = event.extendedProps.description;
            if(event.allDay === true) {
                document.getElementById('cal-allDay').checked = true;
            } else {
                document.getElementById('cal-allDay').checked = false;
            }
            updateSelectedMembers();
        }
    }).then((result) => {
        if (result.isConfirmed && isCreator) {
            // 수정된 값 가져오기
            var updatedEvent = {
                _id: event._id, // 이벤트의 고유 식별자
                title: document.getElementById('cal-title').value,
                start: document.getElementById('cal-start').value,
                end: document.getElementById('cal-end').value,
                type: document.getElementById('cal-type').value,
                description: document.getElementById('cal-desc').value,
                allDay: document.getElementById('cal-allDay').checked ? 'Y' : 'N',
                selectedMembers: selectedMembers.map(member => ({
                    refEmpNo: member.memberKey,
                    refEmpName: member.memberName,
                    refJobName: member.jobName
                })),
                calendarKey: event.extendedProps.calendarKey
            };
            if (updatedEvent.allDay === 'Y') {
                updatedEvent.start = moment(updatedEvent.start).format('YYYY-MM-DD');
                updatedEvent.end = moment(updatedEvent.end).add(1, 'days').format('YYYY-MM-DD');
            } else {
                updatedEvent.start = moment(updatedEvent.start).format('YYYY-MM-DD HH:mm');
                updatedEvent.end = moment(updatedEvent.end).format('YYYY-MM-DD HH:mm');
            }

            // 여기서 Ajax 요청을 통해 서버에 수정된 이벤트 정보 전송
            $.ajax({
                type: "POST",
                url: path+"/calendar/updatecalendar.do",
                data: JSON.stringify(updatedEvent),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function(response) {
                    if (response.status === "success") {
                        // FullCalendar에서 이벤트 업데이트
                        const calendarEvent = calendar.getEvents().find(e => e.extendedProps.calendarKey === updatedEvent.calendarKey);
                        if (calendarEvent) {
                            calendarEvent.setProp('title', updatedEvent.title);
                            calendarEvent.setStart(updatedEvent.start);
                            calendarEvent.setEnd(updatedEvent.end);
                            calendarEvent.setExtendedProp('description', updatedEvent.description);
                            calendarEvent.setExtendedProp('type', updatedEvent.type);
                            calendarEvent.setExtendedProp('allDay', updatedEvent.allDay);
                            selectedMembers = [];
                            updateSelectedMembers();
                        }
                        Swal.fire({
					        icon: 'success',  // 성공을 나타내는 아이콘
					        title: '완료',
					        text: response.message,
					        confirmButtonText: '확인'
				        });
				        setTimeout(() => {
			                window.location.reload();
			            }, 3000); // 3초 후 새로고침
                    } else {
                        alert(response.message);
                    }
                },
                error: function(xhr, status, error) {
                    alert('오류가 발생했습니다: ' + error);
                }
            });
        } else if(result.dismiss === Swal.DismissReason.cancel) {
            deleteEvent();
        }
    });
};

var deleteEvent = function() {
    Swal.fire({
        title: '일정을 삭제하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '확인',
        cancelButtonText: '취소'
    }).then((result) => {
        if (result.isConfirmed) {
            if(currentEvent) {
                var events = calendar.getEvents();
                events.forEach((ev) => {
                    if(ev.extendedProps.calendarKey == currentEvent.extendedProps.calendarKey) {
                        ev.remove();
                    }
                });
            }
            // 삭제 시
            var calKey = currentEvent.extendedProps.calendarKey;
            $.ajax({
                type: "POST",
                url: path+"/calendar/deletecalendar",
                data: JSON.stringify(calKey),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function(response) {
                    if (response.status === "success") {
                        Swal.fire({
                            icon: 'success',
                            title: response.message,
                            showConfirmButton: true,
                            timer: 1500
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: response.message,
                            showConfirmButton: true,
                            timer: 1500
                        });
                    }
                },
                error: function(error) {
                    Swal.fire({
                        icon: 'error',
                        title: '오류가 발생했습니다: ' + error,
                        showConfirmButton: true,
                        timer: 1500
                    });
                }
            });
        }
    });
}