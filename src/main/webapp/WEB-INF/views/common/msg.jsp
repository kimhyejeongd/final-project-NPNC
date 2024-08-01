<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시스템메세지</title>
  <!-- SweetAlert2 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.min.css" rel="stylesheet">
  <!-- SweetAlert2 JS -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.2/dist/sweetalert2.all.min.js"></script>
</head>
<body>
	<script>
		/* alert('${msg}');
		location.replace("${pageContext.request.contextPath}${loc}"); */
		 var msg = '${msg}';
        var loc = "${pageContext.request.contextPath}${loc}";

        // SweetAlert2 설정 및 실행
        if (msg === '성공') {
            Swal.fire({
                title: '성공!',
                text: '작업이 성공적으로 완료되었습니다.',
                icon: 'success',
                confirmButtonText: '확인'
            }).then((result) => {
                if (result.isConfirmed) {
                    location.replace(loc);
                }
            });
        } else if (msg === '실패') {
            Swal.fire({
                title: '실패!',
                text: '작업이 실패하였습니다. 다시 시도해주세요.',
                icon: 'error',
                confirmButtonText: '확인'
            }).then((result) => {
                if (result.isConfirmed) {
                    location.replace(loc);
                }
            });
        } else {
            // 기본 alert와 location.replace
            alert(msg);
            location.replace(loc);
        }
		
		
		
	</script>
</body>
</html>