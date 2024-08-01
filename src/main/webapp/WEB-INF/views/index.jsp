<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Kaiadmin - Bootstrap 5 Admin Dashboard</title>
    <meta
      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
      name="viewport"
    />
    <link
      rel="icon"
      href="${path}/resources/assets/img/kaiadmin/favicon.ico"
      type="image/x-icon"
    />

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
      
      sessionStorage.setItem("path", "${path}"); 
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${path }/resources/bm/css/bootstrap-4.min.css">
    <link rel="stylesheet" href="${path }/resources/bm/css/fullcalendar.css">
    <link rel="stylesheet" href="${path}/resources/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/kaiadmin.min.css" />
     <link rel="stylesheet" href="${path }/resources/bm/css/daterangepicker.css">
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="${path}/resources/assets/css/demo.css" />
    
  </head>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 

<style>
#calendar-container {
  width: 100%;
  height: 100%; /* 화면 전체 높이 사용 */
  position: relative; /* 자식 요소의 절대 위치 지정에 필요 */
  overflow: hidden; /* 자식 요소가 넘칠 경우 스크롤바 제거 */
}

/* 캘린더의 크기를 부모 요소에 맞게 설정 */
#calendar {
  width: 100%;
  height: 100%; /* 부모 요소의 높이와 맞추기 */
}
	     .main-header {
		    background: #fff;
		    min-height: 60px;
		    width:100%;
		    position: static;
		    z-index: 1001
		}
		.container{
			height: 100%;
			/* background-color: aquamarine; */
       		max-width: 1800px;
			
		}
		.firstwidget{
			display: flex;
			flex-direction: row;
			flex-wrap: noWrap;
       	
		}
		.firstwidget>div{
			margin-right: 30px;
		}
		 .pagination-container {
            display: flex;
            justify-content: center; /* Flexbox를 사용하여 중앙으로 정렬 */
           /*  margin-top: 20px; /* 위쪽 여백 추가 (선택사항) */ */
        }
        /* 전자결재 위젯 css */
    	#tablerow:hover{
    		cursor: pointer; 
    	}
    	.truncate {
		    overflow: hidden;
		    white-space: nowrap;
		    text-overflow: ellipsis;
		}
	</style>	
  <body>
               <%@ include file="/WEB-INF/views/common/header_bar.jsp" %>

        <div class="container">
          <div class="page-inner">
          
           
          
            <div class="firstwidget">
             <div class="col-md-6" style="width: 26%; height: 470px;">
                <div class="card bg-primary-gradient">
                  <div class="card-header">
                    <h4 class="card-title" style="color: white;">출/퇴근 버튼</h4>
                  </div>
                  <div class="card-body">
					<div>
						<div>
							<!-- clock widget start -->
							<script type="text/javascript"> var css_file=document.createElement("link"); css_file.setAttribute("rel","stylesheet"); css_file.setAttribute("type","text/css"); css_file.setAttribute("href","https://s.bookcdn.com//css/cl/bw-cl-180x170r4.css?v=0.0.1"); document.getElementsByTagName("head")[0].appendChild(css_file); </script> <div id="tw_14_2058017150"><div style="width:145px; height:50px; margin: 0 auto;"><a href="https://booked.kr/time/seoul-18406">서울특별시</a><br/></div></div> <script type="text/javascript"> function setWidgetData_2058017150(data){ if(typeof(data) != 'undefined' && data.results.length > 0) { for(var i = 0; i < data.results.length; ++i) { var objMainBlock = ''; var params = data.results[i]; objMainBlock = document.getElementById('tw_'+params.widget_type+'_'+params.widget_id); if(objMainBlock !== null) objMainBlock.innerHTML = params.html_code; } } } var clock_timer_2058017150 = -1; widgetSrc = "https://widgets.booked.net/time/info?ver=2;domid=593;type=14;id=2058017150;scode=;city_id=;wlangid=24;mode=2;details=0;background=ffffff;border_color=ffffff;color=e6e6e6;add_background=ffffff;add_color=e6e6e6;head_color=ffffff;border=0;transparent=0"; var widgetUrl = location.href; widgetSrc += '&ref=' + widgetUrl; var wstrackId = ""; if (wstrackId) { widgetSrc += ';wstrackId=' + wstrackId + ';' } var timeBookedScript = document.createElement("script"); timeBookedScript.setAttribute("type", "text/javascript"); timeBookedScript.src = widgetSrc; document.body.appendChild(timeBookedScript); </script>
							<!-- clock widget end -->
						</div>
						<div>
							<div id="attendanceResult" style="margin-top:20px;">
								<button id="startAttendanceBtn" style="display: ${not empty checkStartTime ? 'none' : 'inline'};" class="btn btn-dark btn-round">
										출근
								</button>
								<c:if test="${not empty checkStartTime}">
									출근 시간 : ${checkStartTime.substring(9, 17)}  
								</c:if>	
							</div>
							<div id="attendanceEndResult" style="margin-top:20px;">
								<button id="endAttendanceBtn" style="display: ${not empty checkEndTime ? 'none' : 'inline'};"  class="btn btn-dark btn-round">
									퇴근
								</button>
								<c:if test="${not empty checkEndTime}">
									퇴근 시간 : ${checkEndTime.substring(9, 17)}  
								</c:if>
							</div>	
						</div>
					</div>
                   
                  </div>
                </div>
              </div>
            <div class="col-md-6"  style="width: 30%;">
                <div class="card" style="height: 470px;">
                  <div class="card-header">
                    <div class="card-head-row card-tools-still-right">
                      <div class="card-title">금주의 일정</div>
                    </div>
                  </div>
                  <div class="card-body">
                    <ol class="activity-feed">
                      <li class="feed-item feed-item-secondary">
                        <time class="date" datetime="9-25">Sep 25</time>
                        <span class="text">Responded to need
                          <a href="#">"Volunteer opportunity"</a></span>
                      </li>
                      <li class="feed-item feed-item-success">
                        <time class="date" datetime="9-24">Sep 24</time>
                        <span class="text">Added an interest
                          <a href="#">"Volunteer Activities"</a></span>
                      </li>
                      <li class="feed-item feed-item-info">
                        <time class="date" datetime="9-23">Sep 23</time>
                        <span class="text">Joined the group
                          <a href="single-group.php">"Boardsmanship Forum"</a></span>
                      </li>
                      <li class="feed-item feed-item-warning">
                        <time class="date" datetime="9-21">Sep 21</time>
                        <span class="text">Responded to need
                          <a href="#">"In-Kind Opportunity"</a></span>
                      </li>
                      <li class="feed-item feed-item-danger">
                        <time class="date" datetime="9-18">Sep 18</time>
                        <span class="text">Created need
                          <a href="#">"Volunteer Opportunity"</a></span>
                      </li>
                      <li class="feed-item">
                        <time class="date" datetime="9-17">Sep 17</time>
                        <span class="text">Attending the event
                          <a href="single-event.php">"Some New Event"</a></span>
                      </li>
                    </ol>
                  </div>
                </div>
              </div>
               <div class="col-md-7"  style="width: 40%;">
                <div class="card" style="height: 470px;">
                  <div class="card-body">
                  	<div id="calendar-container">
                  		<div id="calendar"></div>
                  	</div>
                  </div>
                </div>
              </div>
               <!-- 여기다 first 위젯 박스 -->
              </div>
             <div class="col-md-8" style="width: 100%;">
                <div class="card card-round" style="height: 470px;">
                  <div class="card-header">
                    <div class="card-head-row card-tools-still-right">
                      <div class="card-title">전자결재 현황</div>
                      <div class="card-tools">
                      	<div class="selectgroup selectgroup-secondary selectgroup-pills">
                            <label class="selectgroup-item">
                              <input type="radio" name="icon-input" value="1" class="selectgroup-input" checked>
                              <span class="selectgroup-button selectgroup-button-icon" id="btnInProgress">진행 문서</span>
                            </label>
                            <label class="selectgroup-item">
                              <input type="radio" name="icon-input" value="4" class="selectgroup-input">
                              <span class="selectgroup-button selectgroup-button-icon" id="btnPending">결재 대기 문서</span>
                            </label>
                          </div>
                      </div>
                    </div>
                  </div>
                  <div class="card-body p-0">
                    <div class="table-responsive">
                      <!-- Projects table -->
                      <table class="table table-hover align-items-center mb-0" id="inproTable" style="width: 100%;">
			            <thead class="thead-light">
			              <tr class="text-center">
			              	<!-- <th><input type="checkbox"></th> -->
			                <th scope="col" class="">#</th>
			                <th scope="col" class="">등록 번호</th>
			                <th scope="col" class="">문서 제목</th>
			                <th scope="col" class="">상신 일자</th>
			                <th scope="col" class="">결재 현황</th>
			              </tr>
			            </thead>
			            <tbody>
			              <c:if test="${empty doclist}">
			               <tr class="text-center">
			               	<td class="truncate"  colspan="5">진행 중인 문서가 없습니다</td>
			              	</tr>
			              </c:if>
			              <c:if test="${doclist ne null}">
			              	<c:forEach items="${doclist }" var="l" varStatus="vs" begin="0" end="4">
			               <tr class="text-center" id="tablerow" data-doc-id="${l.erDocKey }">
			               	<td class="truncate" >${vs.index+1 }</td>
			                  <td class="truncate text-muted">${l.erDocSerialKey }</td>
			                  <td class="truncate"><c:if test="${l.erDocEmergencyYn eq 'Y'}"><span style="color: red;">[긴급] </span></c:if>${l.erDocTitle }</td>
			                  <td class="truncate">
			                  	<fmt:formatDate value="${l.erDocCreateDate}" type="date" pattern="yyyy/MM/dd HH:mm:ss"/>
			                  </td>
			                  <td class="truncate approverNow p-3">
			                  	<c:forEach items="${l.approvers }" var="ap">
			                  		<c:if test="${ap.state eq '승인' }">
			                  			<div class="badge badge-success" style="min-width: 60px;">
			                  				<small class="">${ap.memberTeamName }</small><br>
			                  				<small class="">${ap.memberJobName} ${ap.memberName}</small>
			                  			</div>
			                  		</c:if>
			                		<c:if test="${ap.state eq '대기' }">
			                  			<div class="badge badge-count" style="min-width: 60px;">
			                  				<small class="">${ap.memberTeamName }</small><br>
			                  				<small class="">${ap.memberJobName} ${ap.memberName}</small>
			                  			</div>
			                  		</c:if>
			                		<c:if test="${ap.state eq '읽음' }">
			                  			<div class="badge badge-info" style="min-width: 60px;">
			                  				<small class="">${ap.memberTeamName }</small><br>
			                  				<small class="">${ap.memberJobName} ${ap.memberName}</small>
			                  			</div>
			                  		</c:if>
			                		<c:if test="${ap.state eq '보류' }">
			                  			<div class="badge badge-danger" style="min-width: 60px;">
			                  				<small class="">${ap.memberTeamName }</small><br>
			                  				<small class="">${ap.memberJobName} ${ap.memberName}</small>
			                  			</div>
			                  		</c:if>
			                  		<c:if test="${ap.state eq '반려' }">
			                  			<div class="badge badge-danger" style="min-width: 60px;">
			                  				<small class="">${ap.memberTeamName }</small><br>
			                  				<small class="">${ap.memberJobName} ${ap.memberName}</small>
			                  			</div>
			                 		</c:if>
			                    </c:forEach>
			                  </td>
			                </tr>
			                </c:forEach>
			               </c:if>
			            </tbody>
			          </table>
			          <!-- 결재 대기 문서 -->
			          <table class="table table-hover align-items-center mb-0" id="waitingTable" style="display: none; width: 100%;">
				           <thead class="thead-light">
				             <tr class="text-center">
				             	<!-- <th><input type="checkbox"></th> -->
				               <th scope="col" class="">#</th>
				               <th scope="col" class="">등록 번호</th>
				               <th scope="col" class="">문서 제목</th>
				               <th scope="col" class="">상신인</th>
				               <th scope="col" class="">상신 일자</th>
				               <th scope="col" class="">결재 현황</th>
				             </tr>
				           </thead>
				           <tbody>
				             <c:if test="${empty waitinglist}">
				              <tr class="text-center">
				              	<td class="truncate"  colspan="6">결재 대기 중인 문서가 없습니다</td>
				             	</tr>
				             </c:if>
				             <c:if test="${waitinglist ne null}">
				             	<c:forEach items="${waitinglist }" var="l" varStatus="vs" begin="0" end="4">
				              <tr class="text-center" id="tablerow" data-doc-id="${l.erDocKey }">
				              	<td class="truncate" >${vs.index+1 }</td>
				                 <td class="truncate text-muted">${l.erDocSerialKey }</td>
				                 <td class="truncate"><c:if test="${l.erDocEmergencyYn eq 'Y'}"><span style="color: red;">[긴급] </span></c:if>${l.erDocTitle }</td>
				                	<td class="truncate" >
				                		<c:forEach items="${l.approvers }" var="ap">
				                			<c:if test="${ap.orderby eq 0 }">
				                				<div class="badge badge-count" style="min-width: 60px;">
				                   				<small class="">${ap.memberTeamName }</small><br>
				                   				<small class="">${ap.memberJobName} ${ap.memberName}</small>
				                   			</div>
				                			</c:if>
				                		</c:forEach>
				                	</td>
				                 <td class="truncate">
				                 	<fmt:formatDate value="${l.erDocCreateDate}" type="date" pattern="yyyy/MM/dd HH:mm:ss"/>
				                 </td>
				                 <td class="truncate approverNow p-3">
				                 	<c:forEach items="${l.approvers }" var="ap">
				                 		<c:if test="${ap.state eq '승인' }">
				                   			<div class="badge badge-success" style="min-width: 60px;">
				                   				<small class="">${ap.memberTeamName }</small><br>
				                   				<small class="">${ap.memberJobName} ${ap.memberName}</small>
				                   			</div>
				                   		</c:if>
				                 		<c:if test="${ap.state eq '대기' }">
				                   			<div class="badge badge-count" style="min-width: 60px;">
				                   				<small class="">${ap.memberTeamName }</small><br>
				                   				<small class="">${ap.memberJobName} ${ap.memberName}</small>
				                   			</div>
				                   		</c:if>
				                 		<c:if test="${ap.state eq '읽음' }">
				                   			<div class="badge badge-info" style="min-width: 60px;">
				                   				<small class="">${ap.memberTeamName }</small><br>
				                   				<small class="">${ap.memberJobName} ${ap.memberName}</small>
				                   			</div>
				                   		</c:if>
				                 		<c:if test="${ap.state eq '보류' }">
				                   			<div class="badge badge-danger" style="min-width: 60px;">
				                   				<small class="">${ap.memberTeamName }</small><br>
				                   				<small class="">${ap.memberJobName} ${ap.memberName}</small>
				                   			</div>
				                   		</c:if>
				                   		<c:if test="${ap.state eq '반려' }">
				                   			<div class="badge badge-danger" style="min-width: 60px;">
				                   				<small class="">${ap.memberTeamName }</small><br>
				                   				<small class="">${ap.memberJobName} ${ap.memberName}</small>
				                   			</div>
				                		</c:if>
				                   </c:forEach>
				                 </td>
				               </tr>
				               </c:forEach>
				              </c:if>
				            </tbody>
				          </table>
                    </div>
                  </div>
                </div>
              </div>
            
             
               <!--  <div class="row row-card-no-pd">
              <div class="col-12 col-sm-6 col-md-6 col-xl-3">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <div>
                        <h6><b>Todays Income</b></h6>
                        <p class="text-muted">All Customs Value</p>
                      </div>
                      <h4 class="text-info fw-bold">$170</h4>
                    </div>
                    <div class="progress progress-sm">
                      <div class="progress-bar bg-info w-75" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="d-flex justify-content-between mt-2">
                      <p class="text-muted mb-0">Change</p>
                      <p class="text-muted mb-0">75%</p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-12 col-sm-6 col-md-6 col-xl-3">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <div>
                        <h6><b>Total Revenue</b></h6>
                        <p class="text-muted">All Customs Value</p>
                      </div>
                      <h4 class="text-success fw-bold">$120</h4>
                    </div>
                    <div class="progress progress-sm">
                      <div class="progress-bar bg-success w-25" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="d-flex justify-content-between mt-2">
                      <p class="text-muted mb-0">Change</p>
                      <p class="text-muted mb-0">25%</p>
                    </div>
                  </div>
                </div>
              </div> -->
              <!-- <div class="col-12 col-sm-6 col-md-6 col-xl-3">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <div>
                        <h6><b>New Orders</b></h6>
                        <p class="text-muted">Fresh Order Amount</p>
                      </div>
                      <h4 class="text-danger fw-bold">15</h4>
                    </div>
                    <div class="progress progress-sm">
                      <div class="progress-bar bg-danger w-50" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="d-flex justify-content-between mt-2">
                      <p class="text-muted mb-0">Change</p>
                      <p class="text-muted mb-0">50%</p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-12 col-sm-6 col-md-6 col-xl-3">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <div>
                        <h6><b>New Users</b></h6>
                        <p class="text-muted">Joined New User</p>
                      </div>
                      <h4 class="text-secondary fw-bold">12</h4>
                    </div>
                    <div class="progress progress-sm">
                      <div class="progress-bar bg-secondary w-25" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="d-flex justify-content-between mt-2">
                      <p class="text-muted mb-0">Change</p>
                      <p class="text-muted mb-0">25%</p>
                    </div>
                  </div>
                </div>
              </div>
            </div> -->
                <div class="card">
                  <div class="card-header">
                    <div class="card-title">금주의 게시물</div>
                  </div>
                  <div class="card-body">
                    
                    <table class="table table-head-bg-primary mt-4">
                      <thead>
                        <tr>
                          <th scope="col">NUMBER</th>
                          <th scope="col">TITLE</th>
                          <th scope="col">WRITER</th>
                          <th scope="col">DATE</th>
                          <th scope="col">VIEWS</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>1</td>
                          <td>Mark</td>
                          <td>Otto</td>
                          <td>@mdo</td>
                          <td>@mdo</td>
                        </tr>
                        <tr>
                          <td>2</td>
                          <td>Jacob</td>
                          <td>Thornton</td>
                          <td>@fat</td>
                          <td>@mdo</td>
                        </tr>
                        <tr>
                          <td>2</td>
                          <td>Jacob</td>
                          <td>Thornton</td>
                          <td>@fat</td>
                          <td>@mdo</td>
                        </tr>
                         <tr>
                         <td>2</td>
                          <td>Jacob</td>
                          <td>Thornton</td>
                          <td>@fat</td>
                          <td>@mdo</td>
                        </tr>
                         <tr>
                          <td>2</td>
                          <td>Jacob</td>
                          <td>Thornton</td>
                          <td>@fat</td>
                          <td>@mdo</td>
                        </tr>
                        
                      </tbody>
                      
                    </table>
                    <div div class="pagination-container">
                  	  <ul class="pagination"><li class="paginate_button page-item previous disabled" id="basic-datatables_previous"><a href="#" aria-controls="basic-datatables" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item active"><a href="#" aria-controls="basic-datatables" data-dt-idx="1" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item "><a href="#" aria-controls="basic-datatables" data-dt-idx="2" tabindex="0" class="page-link">2</a></li><li class="paginate_button page-item "><a href="#" aria-controls="basic-datatables" data-dt-idx="3" tabindex="0" class="page-link">3</a></li><li class="paginate_button page-item "><a href="#" aria-controls="basic-datatables" data-dt-idx="4" tabindex="0" class="page-link">4</a></li><li class="paginate_button page-item "><a href="#" aria-controls="basic-datatables" data-dt-idx="5" tabindex="0" class="page-link">5</a></li><li class="paginate_button page-item "><a href="#" aria-controls="basic-datatables" data-dt-idx="6" tabindex="0" class="page-link">6</a></li><li class="paginate_button page-item next" id="basic-datatables_next"><a href="#" aria-controls="basic-datatables" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li></ul>
                  	</div>
                  </div>
                </div>
          </div>
        </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
       

    
    <!--   Core JS Files   -->
    <script src="${path}/resources/assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="${path}/resources/assets/js/core/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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

    <!-- Google Maps Plugin -->
    <script src="${path}/resources/assets/js/plugin/gmaps/gmaps.js"></script>

    <!-- Sweet Alert -->
    <script src="${path}/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

    <!-- Kaiadmin JS -->
    <script src="${path}/resources/assets/js/kaiadmin.min.js"></script>
    <script src="${path}/resources/bm/js/dropdown-bootstrap-extended.js"></script>
  <script src="${path}/resources/bm/js/fullcalendar.global.js"></script>
   <script src="${path}/resources/bm/js/index.global.min.js"></script>
     <script src="${path}/resources/bm/js/daterangepicker-data.js"></script>
     <script src="${path}/resources/bm/js/moment.min.js"></script>
  <script src="${path}/resources/bm/js/daterangepicker.js"></script>
     <script src="${path}/resources/js/index.js"></script>
    <!-- 출퇴근버튼 js -->
    <%-- <script src="${path}/resources/assets/ws/attendance.js"></script>  --%>
    
    <script>
				//근태 출퇴근 버튼
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
    </script>
    <script>
 	const path = "${path}";
  </script>
   
  </body>
</html>
