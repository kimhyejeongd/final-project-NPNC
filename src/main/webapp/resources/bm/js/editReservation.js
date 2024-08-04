$(document).ready(function() {
    $('.editReservation').on('click', function () {
        var itemName = $(this).data('item-name');
        var itemKey = $(this).data('item-key');
        var calendarKey = $(this).data('calendar-key');
        var start = $(this).data('start-time');
        var end = $(this).data('end-time');

        var selectedDate = null;
        var selectedTimes = [];
        var reservationItem = [];
        var reservedTimes = [];

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
            time.pop();
        }

        // 내 예약정보 가져오기
        var existingReservation = {
            date: $(this).data('date'),
            times: time
        };
        console.log(existingReservation);

        Swal.fire({
            title: '예약 수정하기',
            html: `
                <h4>${itemName}</h4>
                <div id="calendar" ></div>
                <div id="timeCheckBox"></div>
            `,
            showCancelButton: true,
            cancelButtonText: '취소',
            confirmButtonText: '수정',
            width: '50%',
            heightAuto: true,
            didOpen: () => {
                var calendarEl = document.getElementById('calendar');
                var $timeSelector = $('#timeCheckBox');
                var currentDate = moment().format('YYYY-MM-DD');
               var previousDate = existingReservation.date ? moment(existingReservation.date).format('YYYY-MM-DD') : null;
             

                var calendars = new FullCalendar.Calendar(calendarEl, {
                    initialView: 'dayGridMonth',
                    initialDate: currentDate,
                    themeSystem: 'bootstrap5',
                    selectable: true,
                    locale: 'ko',
                    timeZone: 'local',
                    slotMinTime: '09:00:00',
                    slotMaxTime: '18:00:00',
                    weekends: false,
                    fixedWeekCount: false,
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
                   	selectAllow: function(selectInfo) {
						if(moment(selectInfo.start).isBefore(moment(), 'day')){
	                        return false; 
						}
						else{
							return true;
						}
                    },
                    datesSet: function(info) {
                        $(calendarEl).find('.fc-daygrid-day').css('background-color', '#ffffff');
                        $(calendarEl).find('.fc-day-today').css('background-color', '#ffffff');
                          if (previousDate) {
					        $(calendarEl).find(`[data-date="${previousDate}"]`).addClass('highlighted');
					    }
                    },
                    dateClick: function(info) {
					    if (moment(info.date).isBefore(moment(), 'day')) {
                            return;
                       }
                       if (previousDate) {
					        $(calendarEl).find(`[data-date="${previousDate}"]`).removeClass('highlighted');
					    }
					    previousDate = moment(info.date).format('YYYY-MM-DD');
					    $(calendarEl).find(`[data-date="${previousDate}"]`).addClass('highlighted');
                        selectedDate = info.dateStr;

                        reservationItem = reservationItems.filter(item => item.itemK == itemKey && item.day == selectedDate);
                        reservedTimes = [];
                        selectedTimes = [];

                        reservationItem.forEach(item => {
                            const expandedTimes = expandReservedTimes(item.times);
                            reservedTimes = reservedTimes.concat(expandedTimes);
                        });
                        reservedTimes = [...new Set(reservedTimes)].map(Number);

                        generateTimeSlots(selectedDate, reservedTimes, selectedTimes, existingReservation, $timeSelector);
                    }
                });

                calendars.render();

                generateTimeSlots(existingReservation.date, reservedTimes, selectedTimes, existingReservation, $timeSelector);
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
                Swal.fire('예약 수정 완료!', '', 'success');
                setTimeout(() => {
                    window.location.reload();
                }, 3000);
            }
        });

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

        function generateTimeSlots(selectedDate, reservedTimes, selectedTimes, existingReservation, $timeSelector) {

            const timeSlots = [];
            const startTime = moment().startOf('day').add(9, 'hours');
            const endTime = moment().startOf('day').add(18, 'hours');
            const interval = 90;

            for (let time = startTime; time.isBefore(endTime); time.add(interval, 'minutes')) {
                timeSlots.push(time.format('YYYY-MM-DD HH:mm'));
            }

            $timeSelector.empty();
            timeSlots.forEach((slot, index) => {
                const timeDisplayStart = `${slot.substring(11, 16)}`;
                const timeDisplayEnd = moment(slot).add(90, 'minutes').format('HH:mm');
                var isReserved = reservedTimes.includes(index);
                $timeSelector.append(`
                    <label class="selectgroup-item" style="${isReserved ? 'display: none;' : ''}">
                        <input type="checkbox" name="time" value="${index}" class="selectgroup-input"/>
                        <span class="selectgroup-button">
                            <span class="time-label">${timeDisplayStart} - ${timeDisplayEnd}</span>
                        </span>
                    </label>
                `);
            });

            $('input[name="time"]').on('click', function() {
                var selectedTime = parseInt($(this).val());
                handleCheckboxClick(selectedTime, reservedTimes);
            });

	            if (existingReservation && existingReservation.date == selectedDate) {
					console.log('체크');
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

        function handleCheckboxClick(selectedTime, reservedTimes) {
			console.log('들어갈때 : '+selectedTime);
			console.log('들어갈때 : '+selectedTimes);
            if (selectedTimes.length === 0) {
				console.log('로직체크 1단게');
                selectedTimes.push(selectedTime);
            } else if (selectedTimes.length === 1) {
				console.log('로직체크 2단게');
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
                        selectedTimes = [];
                        $('input[name="time"]').each(function() {
                            this.checked = false;
                        });
                    }
                } else if (firstSelectedTime === selectedTime) {
                    selectedTimes.pop();
                    selectedTimes.push(selectedTime);
                }
            } else if (selectedTimes.length >= 2) {
				console.log('로직체크 3단게');
                selectedTimes = [];
                selectedTimes.push(selectedTime);
                $('input[name="time"]').each(function() {
                    this.checked = false;
                    if (parseInt(this.value) === selectedTime) {
                        this.checked = true;
                    }
                });
            }
				console.log('나올떄 : '+selectedTime);
			console.log('나올때 : '+selectedTimes);
        }
    });
});
