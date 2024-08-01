<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication var="loginMember" property="principal"/>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Kaiadmin - Bootstrap 5 Admin Dashboard</title>
    <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport" />
    <link rel="icon" href="${path}/resources/assets/img/kaiadmin/favicon.ico" type="image/x-icon" />
    <!-- Fonts and icons -->
    <script src="${path}/resources/assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
      WebFont.load({
        google: { families: ["Public Sans:300,400,500,600,700"] },
        custom: {
          families: [
            "Font Awesome 5 Solid",
            "Font Awesome 5 Regular",
            "Font Awesome 5 Brands",
            "simple-line-icons",
          ],
          urls: ["${path}/resources/assets/css/fonts.min.css"],
        },
        active: function () {
          sessionStorage.fonts = true;
        },
      });
    </script>
    <!-- sweetalert2 부트스트랩 -->
    <!-- CSS Files -->
    <link rel="stylesheet" href="${path }/resources/bm/css/bootstrap-4.min.css">
    <link rel="stylesheet" href="${path }/resources/bm/css/fullcalendar.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/kaiadmin.min.css" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="${path}/resources/assets/css/demo.css" />
    <link rel="stylesheet" href="${path }/resources/bm/css/daterangepicker.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<body>
  <div class="wrapper">
 

    <div class="main-panel">
      <!-- header_bar -->
      <%@ include file="/WEB-INF/views/common/header_bar.jsp" %>
      <%@ include file="/WEB-INF/views/admin/adminsidebar.jsp" %>

      <div class="container">
        <div class="page-inner">
			<div class="blogapp-content">
				<div class="blogapp-detail-wrap">
					<header class="blog-header">
						<div class="d-flex align-items-center">
							<a class="blogapp-title link-dark" href="#">
								<h1>예약물 목록</h1>
							</a>
						</div>
						<div class="blog-options-wrap">
							<a
								class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover no-caret flex-shrink-0 d-lg-inline-block d-none"
								href="#" data-bs-toggle="tooltip" data-bs-placement="top"
								title="" data-bs-original-title="Refresh" id="refreshButton"><span class="icon"><span
									class="feather-icon"><i data-feather="refresh-cw"></i></span></span></a>
							<div class="v-separator  d-lg-inline-block d-none"></div>
							<a
								class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover hk-navbar-togglable flex-shrink-0  d-lg-inline-block d-none"
								href="#" data-bs-toggle="tooltip" data-bs-placement="top"
								title="" data-bs-original-title="Collapse"> <span
								class="icon"> <span class="feather-icon"><i
										data-feather="chevron-up"></i></span> <span
									class="feather-icon d-none"><i
										data-feather="chevron-down"></i></span>
							</span>
							</a>
						</div>
						<div class="hk-sidebar-togglable"></div>
					</header>

					<div class="blog-body">
						<button type="button" class="btn btn-primary" id="addReservationItem">예약물등록</button>
							<div class="tab-content">
								<div class="tab-pane fade show active" id="all_post">
									<table id="datable_1" class="table nowrap w-100 mb-5">
										<thead>
											<tr>
												<th>예약물번호</th>
												<th>예약물종류</th>
												<th>예약물이름</th>
												<th>수용인원</th>
												<th>사용가능여부</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty reservations}">
												<c:forEach var="r" items="${reservations}">
													<tr>
														<td>${r.itemKey }</td>
														<td class="mw-250p text-truncate text-high-em"><span>${r.itemType }</span>
														</td>
														<td>
															<div class="media align-items-center">
																<div class="media-head me-2"></div>
																<div class="media-body">
																	<span class="d-block">${r.itemName }</span>
																</div>
															</div>
														</td>
														<td>${r.itemMax }인</td>
														<td>${r.itemUse }</td>
														<td>
															<div class="d-flex align-items-center">
																<div class="dropdown">
																	<button
																		class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover dropdown-toggle no-caret"
																		aria-expanded="false" data-bs-toggle="dropdown">
																		<span class="icon"><span class="feather-icon"><i
																				data-feather="more-vertical"></i></span></span>
																	</button>
																	<div role="menu"
																		class="dropdown-menu dropdown-menu-end">
																		<span class="dropdown-item" id="updateItem"
																			data-itemKey="${r.itemKey}"
																			data-itemType="${r.itemType}"
																			data-itemName="${r.itemName}"
																			data-itemMax="${r.itemMax}"
																			data-itemUse="${r.itemUse}">수정</span>
																		<span class="dropdown-item" id="deleteItem" data-itemKey="${r.itemKey}">삭제</span>
																	</div>
																</div>
															</div>
														</td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-sm-12">
									<div class="float-end text-end">
										<ul
											class="pagination custom-pagination pagination-simple active-theme">
											<li class="paginate_button page-item previous disabled"><a
												href="#" class="page-link"><i
													class="ri-arrow-left-s-line"></i></a></li>
											<li class="paginate_button page-item active"><a
												href="#" class="page-link">1</a></li>
										<!-- 	<li class="paginate_button page-item "><a href="#"
												class="page-link">2</a></li>
											<li class="paginate_button page-item "><a href="#"
												class="page-link">3</a></li> -->
											<li class="paginate_button page-item next"><a href="#"
												class="page-link"><i class="ri-arrow-right-s-line"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
        </div>
      </div>

      <!-- footer -->
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>
  </div>
  
  <script>
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('addReservationItem').addEventListener('click', function() {
        Swal.fire({
            title: '예약물 등록',
            html: `
                <form id="reservationForm">
                    <div class="form-group">
                        <label for="itemName">예약물 이름</label>
                        <input type="text" id="itemName" class="form-control" placeholder="예약물 이름을 입력하세요">
                    </div>
                    <div class="form-group mt-2">
                        <label for="itemType">예약물 종류</label>
                        <select id="itemType" class="form-control">
                            <option value="회의실">회의실</option>
                            <option value="차량">차량</option>
                        </select>
                    </div>
                    <div class="form-group mt-2">
	                    <label for="itemMax">최대 수용 인원</label>
	                    <input type="number" id="itemMax" class="form-control" placeholder="최대 수용 인원을 입력하세요">
	                </div>
                </form>
            `,
            showCancelButton: true,
            confirmButtonText: '등록',
            cancelButtonText: '취소',
            preConfirm: () => {
                const form = document.getElementById('reservationForm');
                const itemName = form.querySelector('#itemName').value;
                const itemType = form.querySelector('#itemType').value;
				const itemMax = form.querySelector('#itemMax').value;
				
                if (!itemName || !itemType || !itemMax) {
                    Swal.showValidationMessage('모든 필드를 입력해주세요.');
                    return false;
                }

                return {
                    itemName: itemName,
                    itemType: itemType,
                    itemMax: itemMax,
                    itemCreator: userName
                };
            }
        }).then((result) => {
            if (result.isConfirmed) {
 				$.ajax({
 					url: '/reservation/insertreservation',
 					method: 'POST',
 					contentType: 'application/json',
 					data: JSON.stringify(result.value),
 					success: function(response){
 						if(response.status === "success")
 						Swal.fire({
                            icon: 'success',
                            title: response.message,
                            showConfirmButton: true,
                            timer: 1500
                        }).then(() =>{
                        	location.reload();
                        })
 					},
 					error: function(xhr, status, error){
 						Swal.fire('등록실패', '서버와의 통신에 실패했습니다.','error');
 						console.error("Error:", error);
 					}
 				})				
            }
        });
    });
});
</script>
 
  <!-- Core JS Files -->
  <%-- <script src="${path}/resources/assets/js/core/jquery-3.7.1.min.js"></script> --%>
 <%--  <script src="${path}/resources/assets/js/core/popper.min.js"></script>
  <script src="${path}/resources/assets/js/core/bootstrap.min.js"></script>
  <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> -->
  <!-- jQuery Scrollbar -->
  <script src="${path}/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
  <!-- Chart JS -->
  <script src="${path}/resources/assets/js/plugin/chart.js/chart.min.js"></script>
  <!-- jQuery Sparkline -->
  <script src="${path}/resources/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>
  <!-- Chart Circle -->
  <script src="${path}/resources/assets/js/plugin/chart-circle/circles.min.js"></script>
  <!-- Datatables -->
  <script src="${path}/resources/assets/js/plugin/datatables/datatables.min.js"></script>
  <!-- Bootstrap Notify -->
  <script src="${path}/resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
  <!-- jQuery Vector Maps -->
  <script src="${path}/resources/assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
  <script src="${path}/resources/assets/js/plugin/jsvectormap/world.js"></script>
  <!-- Sweet Alert -->
  <script src="${path}/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>
  <!-- Kaiadmin JS -->
  <script src="${path}/resources/assets/js/kaiadmin.js"></script>
  <!-- fancy dropdown js --> --%>
  
   <script>
    // JavaScript 내에서 서버에서 전달받은 organlist 데이터를 할당
    var organlist = [
        <c:forEach var="d" items="${organlist}" varStatus="status">
            {
                departmentName: '${d.departmentName}',
                memberlist: [
                    <c:forEach var="memberlist" items="${d.memberlist}" varStatus="memStatus">
                        <c:if test="${memberlist.memberName != loginMember.memberName}">
                        {
                            memberKey: '${memberlist.memberKey}',
                            memberName: '${memberlist.memberName}',
                            jobName: '${memberlist.jobName}'
                        }<c:if test="${!memStatus.last}">,</c:if>
                        </c:if>
                    </c:forEach>
                ]
            }<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];
  </script>
  <script>
  	var userKey = "${loginMember.memberKey}";
  	var userName = "${loginMember.memberName}";
  	var userDeptCode = "${loginMember.departmentKey}";
  </script>
     <script>
        $(document).ready(function() {
            $(document).on('click', '#updateItem', function() {
                const itemKey = $(this).data('itemkey');
                const itemType = $(this).data('itemtype');
                const itemName = $(this).data('itemname');
                const itemMax = $(this).data('itemmax');

                Swal.fire({
                    title: '예약물 수정',
                    html: `
                        <form id="updateForm">
                            <div class="form-group">
                                <label for="updateItemName">예약물 이름</label>
                                <input type="text" id="updateItemName" class="form-control" value="${itemName}" placeholder="자원 이름을 입력하세요">
                            </div>
                            <div class="form-group mt-2">
                                <label for="updateItemType">예약물 종류</label>
                                <select id="updateItemType" class="form-control">
                                    <option value="회의실" \${itemType === '회의실' ? 'selected' : ''}>회의실</option>
                                    <option value="차량" \${itemType === '차량' ? 'selected' : ''}>차량</option>
                                </select>
                            </div>
                            <div class="form-group mt-2">
                                <label for="updateItemMax">최대 수용 인원</label>
                                <input type="number" id="updateItemMax" class="form-control" value="${itemMax}" placeholder="최대 수용 인원을 입력하세요">
                            </div>
                        </form>
                    `,
                    showCancelButton: true,
                    confirmButtonText: '수정',
                    cancelButtonText: '취소',
                    didOpen: () => {
                        // DOM 요소에 접근하여 원래 값을 설정합니다.
                        $('#updateItemName').val(itemName);
                        $('#updateItemType').val(itemType);
                        $('#updateItemMax').val(itemMax);
                    },
                    preConfirm: () => {
                        const itemName = $('#updateItemName').val();
                        const itemType = $('#updateItemType').val();
                        const itemMax = $('#updateItemMax').val();


                        if (!itemName || !itemType || !itemMax) {
                            Swal.showValidationMessage('모든 필드를 입력해주세요.');
                            return false;
                        }

                        if (isNaN(itemMax) || itemMax <= 0) {
                            Swal.showValidationMessage('유효한 최대 수용 인원을 입력해주세요.');
                            return false;
                        }

                        return {
                            itemKey: itemKey,
                            itemName: itemName,
                            itemType: itemType,
                            itemMax: itemMax,
                        };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '/reservation/updatereservation',
                            method: 'POST',
                            contentType: 'application/json',
                            data: JSON.stringify(result.value),
                            success: function(response) {
                                if (response.status === "success") {
                                    Swal.fire({
                                        icon: 'success',
                                        title: response.message,
                                        showConfirmButton: true,
                                        timer: 1500
                                    }).then(() => {
                                        location.reload();
                                    });
                                }
                            },
                            error: function(xhr, status, error) {
                                Swal.fire('수정 실패', '서버와의 통신에 실패했습니다.', 'error');
                                console.error("Error:", error);
                            }
                        });
                    }
                });
            });
        });
        
        $(document).on('click', '#deleteItem', function() {
            const itemKey = $(this).data('itemkey');

            Swal.fire({
                title: '정말 삭제하시겠습니까?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: '삭제',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: '/reservation/deletereservation',
                        method: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify(itemKey),
                        success: function(response) {
                            if (response.status === "success") {
                                Swal.fire({
                                    icon: 'success',
                                    title: response.message,
                                    showConfirmButton: true,
                                    timer: 1500
                                }).then(() => {
                                    location.reload();
                                });
                            }
                        },
                        error: function(xhr, status, error) {
                            Swal.fire('삭제 실패', '서버와의 통신에 실패했습니다.', 'error');
                            console.error("Error:", error);
                        }
                    });
                }
            });
        });
    </script>
  
  
  
  <script src="${path}/resources/bm/js/dropdown-bootstrap-extended.js"></script>
  <script src="${path}/resources/bm/js/color-picker-data.js"></script>
  <script src="${path}/resources/bm/js/moment.min.js"></script>
  <script src="${path}/resources/bm/js/fullcalendar.global.js"></script>
  <script src="${path}/resources/bm/js/index.global.min.js"></script>
  <script src="${path}/resources/bm/js/daterangepicker-data.js"></script>
  <script src="${path}/resources/bm/js/daterangepicker.js"></script>
  <script src="${path}/resources/bm/js/sweetalert2.min.js"></script>

  
 
  
</body>
</html>
