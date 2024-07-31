$(document).ready(function() {
    $('.reserveStart').on('click', function () {
        // itemName 값을 데이터 속성에서 가져옴
        var itemName = $(this).data('item-name');
        var itemKey = $(this).data('item-key');
        var selectedDate = null;
        var selectedTimes = [];
        var reservationItemsForDay = null;
        var reservedTimes = [];

        // SweetAlert2 모달을 띄우기
        Swal.fire({
            title: '예약하기',
            html: `
                <h4>${itemName}</h4>
                <div id="calendar"></div>
                <div id="timeCheckBox"></div>
            `,
            showCancelButton: true,
            cancelButtonText: '취소',
            confirmButtonText: '예약',
            width: '50%',
            heightAuto: true,
            didOpen: () => {
                // 모달이 열린 후 실행할 코드
                var currentDate = moment().format('YYYY-MM-DD');
                var calendarEl = document.getElementById('calendar');
                var previousDate = null;

                var calendar = new FullCalendar.Calendar(calendarEl, {
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
                        reservationItemsForDay = reservationItems.filter(item => item.itemK == itemKey && item.day == selectedDate);
                        console.log(reservationItemsForDay);
                        // reservationItemsForDay의 모든 예약 시간 범위를 평탄화하여 하나의 배열로 만듭니다.
                        reservedTimes = [];
                        reservationItemsForDay.forEach(item => {
                            const expandedTimes = expandReservedTimes(item.times);
                            reservedTimes = reservedTimes.concat(expandedTimes);
                        });
                        reservedTimes = [...new Set(reservedTimes)].map(Number); // 중복 제거
                        
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
                            /*console.log(index, isReserved);*/
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
                            const selectedTime = parseInt($(this).val());
                            if (selectedTimes.length === 0) {
                                selectedTimes.push(selectedTime);
                            } else if (selectedTimes.length === 1) {
                                const firstSelectedTime = selectedTimes[0];
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
                                    const tempSelectedTimes = [];
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
                        });
                    }
                });

                calendar.render();
                document.querySelector('.fc-toolbar-title').style.fontSize = '18px';
            },
            preConfirm: () => {
                if (!selectedDate || selectedTimes.length === 0) {
                    Swal.showValidationMessage('날짜와 시간을 선택하세요.');
                    return false;
                }
                return new Promise((resolve) => {
                    $.ajax({
                        url: path+'/reservation/insertre',
                        method: 'POST',
                        dataType: 'json',
                        data: JSON.stringify({
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
                            Swal.showValidationMessage('예약에 실패했습니다.');
                            resolve(false);
                        }
                    });
                });
            }
        }).then((result) => {
            if (result.isConfirmed) {
                // 사용자가 '예약' 버튼을 클릭한 경우
                Swal.fire('예약 완료!', '', 'success');
            }
        });

        function expandReservedTimes(times) {
            const expandedTimes = [];
            const startTime = times[0];
            const endTime = times[1];

            for (let i = startTime; i <= endTime; i++) {
                expandedTimes.push(i);
            }

            return expandedTimes;
        }
    });
});
