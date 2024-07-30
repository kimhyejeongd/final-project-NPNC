
	 $(document).ready(function(){
         $('#endAttendanceBtn').click(function(){
             $.ajax({
                 type: 'POST',
                 url: '${path}/attendance/endattendance',
                 success: function(response) {
                     var message = response.msg;
                     var attendanceEnd = response.attendanceEnd;
                     alert(message);
                     $('#endAttendanceBtn').hide();
                     $('#attendanceEndResult').html('퇴근 시간 : ' + attendanceEnd);
                 },
                 error: function(xhr, status, error) {
                     alert('퇴근 처리에 실패하였습니다.');
                 }
             });
         });
     }); 
	 
	 $(document).ready(function(){
         $('#startAttendanceBtn').click(function(){
             $.ajax({
                 type: 'POST',
                 url: '${path}/attendance/startattendance',
                 success: function(response) {
                     var message = response.msg;
                     var attendanceStart = response.attendanceStart;
                     alert(message);
                     $('#startAttendanceBtn').hide();
                     $('#attendanceResult').html('출근 시간 : ' + attendanceStart);
                 },
                 error: function(xhr, status, error) {
                     alert('출근 처리에 실패하였습니다.');
                 }
             });
         });
     }); 