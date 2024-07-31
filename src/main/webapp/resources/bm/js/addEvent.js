var selectedMembers = [];
var maxSelection = 5; // 최대 선택 가능한 멤버 수


var newEvent = function(start, end, eventType) {
	console.log(path);
    Swal.fire({
        title: '새 일정 추가',
        html: `
            <div class="form-group">
                <label for="cal-allDay">종일</label>
                <input id="cal-allDay" type="checkbox">
            </div>
            <div class="form-group">
                <label for="cal-title">제목</label>
                <input id="cal-title" type="text" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="cal-start">시작 일시</label>
                <input id="cal-start" type="datetime-local" class="form-control" value="${start}" required>
            </div>
            <div class="form-group">
                <label for="cal-end">종료 일시</label>
                <input id="cal-end" type="datetime-local" class="form-control" value="${end}" required>
            </div>
            <div class="form-group">
                <label for="cal-type">구분</label>
                <select id="cal-type" class="form-control">
                    <option value="1">내일정</option>
                    <option value="2">부서일정</option>
                    <option value="3">전사일정</option>
                </select>
            </div>
            <div class="form-group">
                <div class="btn-group">
                    <button class="btn btn-secondary dropdown-toggle button-margin" type="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
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
                <textarea id="cal-desc" class="form-control" rows="3"></textarea>
            </div>
        `,
        showCancelButton: true,
        confirmButtonText: '저장',
        cancelButtonText: '취소',
        focusConfirm: false,
        didOpen: () => {
			selectedMembers = [];
            if (eventType === '내일정') {
                document.getElementById('cal-type').value = 1;
            } else if (eventType === '부서일정') {
                document.getElementById('cal-type').value = 2;
            } else if (eventType === '전사일정') {
                document.getElementById('cal-type').value = 3;
            }

            window.memberselect = function(memberKey, memberName, jobName) {
                const member = { memberKey, memberName, jobName };
                const memberIndex = selectedMembers.findIndex(m => m.memberKey === memberKey);

                if (memberIndex > -1) {
                    // 이미 선택된 멤버라면 배열에서 제거
                    selectedMembers.splice(memberIndex, 1);
                } else {
                    // 선택된 멤버라면 배열에 추가
                    if (selectedMembers.length >= maxSelection) {
                        alert('최대 5명까지 선택할 수 있습니다.');
                        return;
                    }
                    selectedMembers.push(member);
                }
                updateSelectedMembers();
            };

            // 초기 선택된 멤버 스타일 업데이트
            updateSelectedMembers();
        },
        preConfirm: () => {
            var type = document.getElementById('cal-type').value;
            var backgroundColor = '';
            var title = document.getElementById('cal-title').value;
            var start = document.getElementById('cal-start').value;
            var end = document.getElementById('cal-end').value;
            var allDay = document.getElementById('cal-allDay').checked ? 'Y' : 'N';

            if (!title) {
                Swal.showValidationMessage('제목을 입력해주세요');
                return false;
            }
            if (allDay === 'N' && !start) {
                Swal.showValidationMessage('시작 일시를 입력해주세요');
                return false;
            }
            if (start > end) {
                Swal.showValidationMessage('시작 일시가 종료 일시보다 클 수 없습니다.');
                return false;
            }
            if (allDay === 'Y') {
                start = moment(start).format('YYYY-MM-DD');
                end = moment(end).add(1, 'days').format('YYYY-MM-DD');
            } else {
                start = moment(start).format('YYYY-MM-DD HH:mm');
                end = moment(end).format('YYYY-MM-DD HH:mm');
            }
            switch (type) {
                case '1':
                    backgroundColor = '#4285F4'; //파란색
                    break;
                case '2':
                    backgroundColor = '#0F9D58'; //녹색
                    break;
                case '3':
                    backgroundColor = '#DB4437'; //빨간색
                    break;
                default:
                    backgroundColor = '#000000'; //검정색
                    break;
            }
            return {
                calendarKey: '',
                _id: userKey,
                empNo: userKey,
                empName: userName,
                title: title,
                start: start,
                end: end,
                type: type,
                description: document.getElementById('cal-desc').value,
                backgroundColor: backgroundColor,
                allDay: allDay,
                selectedMembers: selectedMembers.map(member => ({
			        refEmpKey: member.memberKey,
			        refEmpName: member.memberName,
			        refJobName: member.jobName
			    }))
            };
        }
    }).then((result) => {
        if (result.isConfirmed) {
            const { calendarKey, _id, title, start, end, type, description, backgroundColor, allDay,selectedMembers,empNo,empName } = result.value;
            console.log(result.value);
            $.ajax({
                type: "POST",
                url: path+'/calendar/insertcalendar',
                data: JSON.stringify(result.value),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function(response) {
                    if (response.status === "success") {
						 const newEvent = {
                            calendarKey: calendarKey,
                            _id : _id,
                            empNo: empNo,
                            empName: empName,
                            title: title,
                            start: start,
                            end: end,
                            type: type,
                            description: description,
                            backgroundColor: backgroundColor,
                            allDay: allDay === 'Y',
                           
                            selectedMembers: selectedMembers
                        };
                        Swal.fire({
                            icon: 'success',
                            title: response.message,
                            showConfirmButton: true,
                            timer: 1500
                        });
                        result.value.calendarKey = response.calendarKey;
                        calendar.addEvent(newEvent);
                        
                        // 선택된 멤버 초기화
                        selectedMembers = [];
                        updateSelectedMembers();
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: response.message,
                            showConfirmButton: true,
                            timer: 1500
                        });
                    }
                }
            });
        }
    });
};

function editEvent(event) {
    // Edit event logic here
};

function generateAccordionHTML(organlist) {
    var html = '';
    organlist.forEach(function(d, index) {
        html += `
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse${index}" aria-expanded="true" aria-controls="panelsStayOpen-collapse${index}">   
                        ${d.departmentName} 
                    </button>
                </h2>
                <div id="panelsStayOpen-collapse${index}" class="accordion-collapse collapse">
                    <div class="accordion-body" style="padding: 0!important;">
                        <div class="list-group">
                            ${generateMemberListHTML(d.memberlist)}
                        </div>
                    </div>
                </div>
            </div>
        `;
    });
    return html;
}

// 함수를 사용하여 memberlist HTML 생성
function generateMemberListHTML(memberlist) {
    var html = '';
    memberlist.forEach(function(member) {
        html += `
            <a href="javascript:memberselect(${member.memberKey},'${member.memberName}','${member.jobName}')" class="list-group-item list-group-item-action" id="member-${member.memberKey}">&emsp;${member.memberName} &nbsp; ${member.jobName}</a>
        `;
    });
    return html;
}

// 멤버 선택 함수
function memberselect(memberKey, memberName, jobName) {
    const member = { memberKey, memberName, jobName };
    const memberIndex = selectedMembers.findIndex(m => m.memberKey === memberKey);

    if (memberIndex > -1) {
        // 이미 선택된 멤버라면 배열에서 제거
        selectedMembers.splice(memberIndex, 1);
    } else {
        // 선택된 멤버라면 배열에 추가
        if (selectedMembers.length >= maxSelection) {
            alert('최대 5명까지 선택할 수 있습니다.');
            return;
        }
        selectedMembers.push(member);
    }
    updateSelectedMembers();
}

function updateSelectedMembers() {
    const selectedMembersContainer = document.getElementById('selected-members');
    selectedMembersContainer.innerHTML = selectedMembers.map(m => `${m.memberName} (${m.jobName})`).join(', ');

    // 선택된 멤버의 리스트 아이템 스타일 업데이트
    organlist.forEach(department => {
        department.memberlist.forEach(member => {
            const memberElement = document.getElementById(`member-${member.memberKey}`);
            if (memberElement) {
                if (selectedMembers.find(m => m.memberKey === member.memberKey)) {
                    memberElement.classList.add('selected-member');
                } else {
                    memberElement.classList.remove('selected-member');
                }
            }
        });
    });
}