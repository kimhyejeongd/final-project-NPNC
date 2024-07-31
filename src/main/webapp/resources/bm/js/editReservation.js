$(document).ready(function() {
    $('.editReservation').on('click', function () {
        // itemName 값을 데이터 속성에서 가져옴
        var itemName = $(this).data('item-name');
        var itemKey = $(this).data('item-key');
        var calendarKey = $(this).data('calendar-key'); // `calendarKey` 값을 data 속성에서 가져옵니다.
        var start = $(this).data('start-time');
        var end = $(this).data('end-time');
        console.log(start);
        
        var selectedDate = null;
        var selectedTimes = [];
        var reservationItem = null;
        var reservedTimes = null;
        
        const startTimeMapping = {
            '09:00:00': 0,
            '10:30:00': 1,
            '12:00:00': 2,
            '13:30:00': 3,
            '15:00:00': 4,
            '16:30:00': 5
        };
        const endTimeMapping = {
            '10:30:00': 0,
            '12:00:00': 1,
            '13:30:00': 2,
            '15:00:00': 3,
            '16:30:00': 4,
            '18:00:00': 5
        };
        const startTime = start.substring(11, 19);
        const endTime = end.substring(11, 19);
        
        function getStartTimeIndex(timeStr) {
            return startTimeMapping[timeStr] !== undefined ? startTimeMapping[timeStr] : null;
        }
        function getEndTimeIndex(timeStr) {
            return endTimeMapping[timeStr] !== undefined ? endTimeMapping[timeStr] : null;
        }
        const time = [getStartTimeIndex(startTime), getEndTimeIndex(endTime)];
        if (time[0] === time[1]) {
            console.log(time);
            time.pop();
        }
        console.log(time);
        
        // 내 예약정보가져오기
        var existingReservation = {
            date: $(this).data('date'),
            times: time
        };
        console.log(existingReservation);

        // SweetAlert2 모달을 띄우기
        Swal.fire({
            title: '예약 수정하기',
            html: `
                <h4>${itemName}</h4>
                <div id="calendar"></div>
                <div id="timeCheckBox"></div>
            `,
            showCancelButton: true,
            cancelButtonText: '취소',
            confirmButtonText: '수정',
            width: '50%',
            heightAuto: true,
            didOpen: () => {
                // 모달이 열린 후 실행할 코드
                var currentDate = moment().format('YYYY-MM-DD');
                var calendarEl = document.getElementById('calendar');
                var previousDate = null;

                var calendars = new FullCalendar.Calendar(calendarEl, {
                    initialView: 'dayGridMonth',
                    initialDate: currentDate, // 유효한 날짜로 초기화
                    themeSystem: 'bootstrap5',
                    selectable: true,
                    locale: 'ko',
                    timeZone: 'local',
                    slotMinTime: '09:00:00',
                    slotMaxTime: '18:00:00',
                    weekends: false,
                    views: {
                        timeGridWeek: {
                            slotMinTime: '09:00:00',
                            slotMaxTime: '18:00:00'
                        },
                        timeGridDay: {
                            slotMinTime: '09:00:00',
                            slotMaxTime: '18:00:00'
                        }
                    },
                    headerToolbar: {
                        left: 'prev',
                        center: 'title',
                        right: 'next'
                    },
                    datesSet: function(info) {
                        // 모든 날짜의 배경색을 기본 색으로 설정
                        $(calendarEl).find('.fc-daygrid-day').css('background-color', '#ffffff'); // 기본 색상

                        // 오늘 날짜의 배경색을 기본 색상으로 설정
                        $(calendarEl).find('.fc-day-today').css('background-color', '#ffffff'); // 기본 색상
                    },
                    displayEventTime: false,
                    dateClick: function(info) {
                        if (previousDate) {
                            // 이전에 하이라이트된 날짜를 원래대로 되돌리기
                            $(previousDate).removeClass('highlighted');
                        }
                        // 현재 클릭한 날짜에 하이라이트 추가
                        previousDate = info.dayEl;
                        $(previousDate).addClass('highlighted');
                        selectedDate = info.dateStr;
                        reservationItem = reservationItems.filter(item => item.itemK == itemKey && item.day == selectedDate);
                        reservedTimes = [];
                        selectedTimes = [];
                        
                        // reservationItemsForDay의 모든 예약 시간 범위를 평탄화하여 하나의 배열로 만듭니다.
                        reservationItem.forEach(item => {
                            const expandedTimes = expandReservedTimes(item.times);
                            reservedTimes = reservedTimes.concat(expandedTimes);
                        });
                        reservedTimes = [...new Set(reservedTimes)].map(Number); // 중복 제거 및 숫자로 변환
                        
                        console.log(reservationItem);
                        console.log(reservedTimes);
                        
                        const timeSlots = [];
                        const startTime = moment().startOf('day').add(9, 'hours'); // 오전 9시
                        const endTime = moment().startOf('day').add(18, 'hours'); // 오후 6시
                        const interval = 90; // 90분

                        // 시간 슬롯을 1시간 30분 간격으로 생성
                        for (let time = startTime; time.isBefore(endTime); time.add(interval, 'minutes')) {
                            timeSlots.push(time.format('YYYY-MM-DD HH:mm'));
                        }

                        const $timeSelector = $('#timeCheckBox');
                        $timeSelector.empty();
                        timeSlots.forEach((slot, index) => {
                            const timeDisplayStart = `${slot.substring(11, 16)}`;
                            const timeDisplayEnd = moment(slot).add(90, 'minutes').format('HH:mm');
                            // 현재 날짜/시간에 예약되어있으면, 선택하지 못하게 분기처리
                            var isReserved = reservedTimes.includes(index);
                            console.log(index, isReserved);
                            $timeSelector.append(`
                                <label class="selectgroup-item" style= "${isReserved ? 'display: none;' : ''}">
                                    <input type="checkbox" name="time" value="${index}" class="selectgroup-input"/>
                                    <span class="selectgroup-button">
                                        <span class="time-label">${timeDisplayStart} - ${timeDisplayEnd}</span>
                                    </span>
                                </label>
                            `);
                        });

                        $('input[name="time"]').on('click', function() {
                            var selectedTime = parseInt($(this).val());
                            if (selectedTimes.length === 0) {
                                selectedTimes.push(selectedTime);
                            } else if (selectedTimes.length === 1) {
                                var firstSelectedTime = selectedTimes[0];
                                if (firstSelectedTime > selectedTime) {
                                    selectedTimes.pop();
                                    selectedTimes.push(selectedTime);
                                    $('input[name="time"]').each(function() {
                                        this.checked = false;
                                        if (parseInt(this.value) === selectedTime) {
                                            this.checked = true;
                                        }
                                    });
                                } else if (firstSelectedTime < selectedTime) {
                                    var tempSelectedTimes = [];
                                    let hasConflict = false;
                                    for (let i = firstSelectedTime; i <= selectedTime; i++) {
                                        tempSelectedTimes.push(i);
                                        if (reservedTimes.includes(i)) {
                                            hasConflict = true;
                                            break;
                                        }
                                    }
                                    if (!hasConflict) {
                                        selectedTimes.push(selectedTime);
                                        $('input[name="time"]').each(function() {
                                            if (parseInt(this.value) >= selectedTimes[0] && parseInt(this.value) <= selectedTimes[1]) {
                                                this.checked = true;
                                            }
                                        });
                                    } else {
                                        selectedTimes = []; // 선택 초기화
                                        $('input[name="time"]').each(function() {
                                            this.checked = false;
                                        });
                                    }
                                } else if (firstSelectedTime === selectedTime) {
                                    selectedTimes.pop();
                                }
                            } else if (selectedTimes.length === 2) {
                                selectedTimes.pop();
                                selectedTimes.pop();
                                selectedTimes.push(selectedTime);
                                $('input[name="time"]').each(function() {
                                    this.checked = false;
                                    if (parseInt(this.value) === selectedTime) {
                                        this.checked = true;
                                    }
                                });
                            }
							console.log(selectedTimes);
                        });

                        // 내 기존 예약 시간이 있으면 체크
                        if (existingReservation && existingReservation.date == selectedDate) {
                           let startTime = existingReservation.times[0];
                            if (existingReservation.times.length > 1) {
                                let endTime = existingReservation.times[1];
                               for (let time = startTime; time <= endTime; time++) {
									selectedTimes.push(time);
									reservedTimes = reservedTimes.filter(t => t !== time);
                                    $(`input[name="time"][value="${time}"]`).closest('label').css('display', 'inline-block');
                                    $(`input[name="time"][value="${time}"]`).prop('checked', true);
                               }
                            } else {
								selectedTimes.push(startTime);
								reservedTimes = reservedTimes.filter(t => t !== startTime);
                                $(`input[name="time"][value="${startTime}"]`).closest('label').css('display', 'inline-block');
                                $(`input[name="time"][value="${startTime}"]`).prop('checked', true);
                            }
                        }
                    }
                });

                calendars.render();
                document.querySelector('.fc-toolbar-title').style.fontSize = '18px';

                // 예약 수정 시 기존 예약이 있을 경우 해당 날짜로 이동하고 클릭
                if (existingReservation) {
                    setTimeout(() => {
                        calendars.gotoDate(existingReservation.date); // 날짜로 이동
                        $(calendarEl).find(`.fc-daygrid-day[data-date="${existingReservation.date}"]`).trigger('click'); // 날짜 클릭 시뮬레이션
                    }, 100);
                }
            },
            preConfirm: () => {
                if (!selectedDate || selectedTimes.length === 0) {
                    Swal.showValidationMessage('날짜와 시간을 선택하세요.');
                    return false;
                }
                return new Promise((resolve) => {
                    $.ajax({
                        url: path + '/reservation/updateReItem',
                        method: 'POST',
                        dataType: 'json',
                        data: JSON.stringify({
                            calendarKey: calendarKey,
                            memberKey: userKey,
                            itemKey: itemKey,
                            itemName: itemName,
                            date: selectedDate,
                            time: selectedTimes
                        }),
                        contentType: "application/json; charset=utf-8",
                        success: (response) => {
                            resolve(response);
                        },
                        error: (xhr, status, error) => {
                            Swal.showValidationMessage('예약 수정에 실패했습니다.');
                            resolve(false);
                        }
                    });
                });
            }
        }).then((result) => {
            if (result.isConfirmed) {
                // 사용자가 '수정' 버튼을 클릭한 경우
                Swal.fire('예약 수정 완료!', '', 'success');
                setTimeout(() => {
                    window.location.reload();
                }, 3000); // 3초 후 새로고침
            }
        });
    });

    // 시간을 확장하여 예약 시간을 평탄화하는 함수
    function expandReservedTimes(times) {
        if (times.length === 1) {
            return [times[0]];
        } else {
            const expanded = [];
            for (let i = times[0]; i <= times[1]; i++) {
                expanded.push(i);
            }
            return expanded;
        }
    }
});

