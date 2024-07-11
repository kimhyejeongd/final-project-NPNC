<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
  <head>
  	<meta charset="UTF-8">
  	
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
    </script>
     <!-- Sweet Alert -->
    <script src="${path}/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>
    <!-- 모달 스타일  -->
	<style>
			h2{
    			text-align: center;
			}
			.modal_btn {
			    display: block;
			    margin: 40px auto;
			    padding: 10px 20px;
			    background-color: royalblue;
			    border: none;
			    border-radius: 5px;
			    color: #fff;
			    cursor: pointer;
			    transition: box-shadow 0.2s;
			}
			.modal_btn:hover {
			    box-shadow: 3px 4px 11px 0px #00000040;
			}
			
			/*모달 팝업 영역 스타일링*/
			.modal {
			/*팝업 배경*/
				display: none; /*평소에는 보이지 않도록*/
			    position: absolute;
			    top:0;
			    left: 0;
			    width: 100%;
			    height: 100vh;
			    overflow: hidden;
			    background: rgba(0,0,0,0.5);
			}
			.modal .modal_popup {
			/*팝업*/
			    position: absolute;
			    top: 50%;
			    left: 50%;
			    transform: translate(-50%, -50%);
			    padding: 20px;
			    background: #ffffff;
			    border-radius: 20px;
			}
			.modal .modal_popup .close_btn {
			  /*   display: block; */
			    padding: 10px 20px;
			    background-color: rgb(116, 0, 0);
			    border: none;
			    border-radius: 5px;
			    color: #fff;
			    cursor: pointer;
			    transition: box-shadow 0.2s;
			}
			.modal.on {
			    display: block;
			}
	
	</style>
	<style>
	.button-margin{
		margin-right:20px;
	}
	.badge-margin{
		margin-right:17px;
	}
	.namebox{
/* 		display: flex;
		flex-direction: row; */
		/* flex-wrap: wrap; */
		 
	}
	</style>
    <!-- CSS Files -->
    <link rel="stylesheet" href="${path}/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${path}/resources/assets/css/kaiadmin.min.css" />

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="${path}/resources/assets/css/demo.css" />
  </head>
  <body>
    <div class="wrapper">
      <!-- Sidebar -->
      <div class="sidebar" data-background-color="dark">
        <div class="sidebar-logo">
          <!-- Logo Header -->
          <div class="logo-header" data-background-color="dark">
            <a href="index.html" class="logo">
              <img
                src="${path}/resources/assets/img/KakaoTalk_Photo_2024-07-08-14-27-11.png"
                alt="navbar brand"
                class="navbar-brand"
                height="90"
              />
            </a>
            <div class="nav-toggle">
              <button class="btn btn-toggle toggle-sidebar">
                <i class="gg-menu-right"></i>
              </button>
              <button class="btn btn-toggle sidenav-toggler">
                <i class="gg-menu-left"></i>
              </button>
            </div>
            <button class="topbar-toggler more">
              <i class="gg-more-vertical-alt"></i>
            </button>
          </div>
          <!-- End Logo Header -->
        </div>
        <div class="sidebar-wrapper scrollbar scrollbar-inner">
          <div class="sidebar-content">
            <ul class="nav nav-secondary">
            
              <li class="nav-section">
                <span class="sidebar-mini-icon">
                  <i class="fa fa-ellipsis-h"></i>
                </span>
                <h4 class="text-section" style="font-size: 20px; color: white;">쪽지</h4>
              </li>
              <li class="nav-item">
                <a data-bs-toggle="collapse" href="#base">
                  <i class="fas fa-layer-group"></i>
                  <p>받은 쪽지함</p>
                </a>
               
              </li>
              <li class="nav-item">
                <a data-bs-toggle="collapse" href="#sidebarLayouts">
                  <i class="fas fa-th-list"></i>
                  <p>보낸 쪽지함</p>
                </a>
                
              </li>
              
             
              
            
              
            
            </ul>
          </div>
        </div>
      </div>
      <!-- End Sidebar -->

      <div class="main-panel">
        <!-- header_bar  -->
          <%@ include file="/WEB-INF/views/common/header_bar.jsp" %>
       

        <div class="container">
          <div class="page-inner">
            <div
              class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
            >
              <div>
                <h3 class="fw-bold mb-3">받은쪽지함</h3>
                <h6 class="op-7 mb-2">총 93건의 쪽지가 있습니다.</h6>
              </div>
              <div class="ms-md-auto py-2 py-md-0">
               <button type="button" class="modal_btn btn btn-label-info btn-round me-2">쪽지 발송</button>
                
                <a href="#" class="btn btn-primary btn-round">전체 쪽지 발송</a>
                <!-- <a href="javascript:openOrgan();" class="btn btn-primary btn-round">조직도 예시</a> -->
              </div>
            </div>
          	<div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <h4 class="card-title">Basic</h4>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table
                        id="basic-datatables"
                        class="display table table-striped table-hover"
                      >
                        <thead>
                          <tr>
                            <th>Number</th>
                            <th>보낸이</th>
                            <th>Detail</th>
                            <th>Date</th>
                            
                          </tr>
                        </thead>
                       
                        <tbody id="pagingtbody">
                      <c:forEach var="d" items="${notelist}">
           	    			<tr>
           	  					<th>${d.postMsgKey}<p>
           	  					<th>${d.memberKey}<p>
           	  					<th>${d.postMsgDetail}<p>
           	  					<th>${d.postMsgTime}<p>
           	  				</tr>
          		 	  </c:forEach>
          		 	
                        </tbody>
                        
                      </table>
                      <div id="pageBarList">${pageBar}</div>
                      <!-- <button type="button" onclick="paging();"> 에이작스 test </button> -->
                    </div>
                  </div>
                </div>
              </div>
              <div class="modal">
				    <div class="modal_popup">
				         <div>
				         <%--   	  <c:forEach var="d" items="${AllMemberList}">
				           	    <input type="radio"  name="reMemberKey1" value="${d.memberKey }">
				           	  	<p>${d.memberKey}<p>
				           	  </c:forEach>  --%>
				           		    <div class="form-group">
				           		    <div class="btn-group">
									  <button class="btn btn-secondary dropdown-toggle button-margin" type="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
									    받는이
									  </button>
									  <div class="namebox" style="width:410px; ">
										<!--  <span class="badge badge-info  badge-margin">이성록 사원</span>
										<span class="badge badge-info  badge-margin">이성록 사원</span>
										<span class="badge badge-info  badge-margin">이성록 사원</span>
										<span class="badge badge-info  badge-margin">이성록 사원</span>
										<span class="badge badge-info  badge-margin">이성록 사원</span>
										
										<span class="badge badge-info  badge-margin">이성록 사원</span>
										<span class="badge badge-info  badge-margin">이성록 사원</span>
										<span class="badge badge-info  badge-margin">이성록 사원</span>
										<span class="badge badge-info  badge-margin">이성록 사원</span>
										<span class="badge badge-info  badge-margin">이성록 사원</span>  -->
										</div>								
									  <ul class="dropdown-menu" style="width: 300px !important; height: 400px !important; overflow-y: auto;"">
												<div class="accordion" id="accordionPanelsStayOpenExample">
														<c:forEach var="d" items="${organlist}" varStatus="status">
														
															<div class="accordion-item">
															    <h2 class="accordion-header">
															      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse${status.index}" aria-expanded="true" aria-controls="panelsStayOpen-collapse${status.index}">
															     
															      
															        ${d.departmentName} 
															      </button>
															    </h2>
												    			<div id="panelsStayOpen-collapse${status.index}" class="accordion-collapse collapse">
															      <div class="accordion-body" style='padding: 0!important;'>
															         <div class="list-group" >
														 				<c:forEach var="memberlist" items="${d.memberlist}">
																		  <a href="javascript:memberselect(${memberlist.memberKey},'${memberlist.memberName}','${memberlist.jobName}')" class="list-group-item list-group-item-action">&emsp;${memberlist.memberName} &nbsp; ${memberlist.jobName}</a>
																		  
														  				</c:forEach>
																	</div>
															      </div>
															    </div>
															</div>
														
														
														</c:forEach>	
													</div> 
											
									  </ul>
									</div>
				           		    </div>
				           		    <div class="form-group">
			                          <div class="input-group">
			                            <span class="input-group-text">제목</span>
			                            <textarea
			                              class="form-control"
			                              aria-label="With textarea"
			                              id=""
			                              rows="1" cols="50"
			                            ></textarea>
			                          </div>
                    			   </div>		
								   <div class="form-group">
			                          <div class="input-group">
			                            <span class="input-group-text">내용</span>
			                            <textarea
			                              class="form-control"
			                              aria-label="With textarea"
			                              id="postMsgDetail"
			                              rows="8" cols="50"
			                            ></textarea>
			                          </div>
                    			   </div>		           	   
								 <div class="form-group">
								<button class="btn btn-primary" style="margin-right: 10px; onclick="notego();">전송</button>
								<button class="btn btn-primary btn-border close_btn" onclick="notego();">닫기</button>
								</div>
				          </div>
				    </div>
			  </div>
			
			<script>
		  
		    </script>
          	<script>
          	
          	const modal = document.querySelector('.modal');
          	const modalOpen = document.querySelector('.modal_btn');
          	const modalClose = document.querySelector('.close_btn');

          	//열기 버튼을 눌렀을 때 모달팝업이 열림
          	modalOpen.addEventListener('click',function(){
          	  	//'on' class 추가
          	    modal.classList.add('on');
          	});
          	//닫기 버튼을 눌렀을 때 모달팝업이 닫힘
          	modalClose.addEventListener('click',function(){
          	    //'on' class 제거
          	    modal.classList.remove('on');
          	});
          	/* 쪽지 발송 발송 멤버 추가 로직 */
            function memberselect(memberKey,memberName,jobName){
      			var namebox=document.getElementsByClassName("namebox");
      			var children = namebox[0].children;
      			let count=0;
				if( children.length>0){
					for(let i=0; i<children.length;i++){
						if(children[i].id==memberKey){
							children[i].remove();
				            //namebox[0].removeChild(children[i]);
							count++;
						}
					}
					if(count==0&&children.length<10){
					  var newElement=document.createElement("span");
		                newElement.classList.add("badge");
		                newElement.classList.add("badge-info");
		                newElement.classList.add("badge-margin");
		                newElement.classList.add("badge-margin");
		                newElement.id=memberKey;
		                newElement.textContent=memberName+' '+jobName;
		                namebox[0].appendChild(newElement);
					}else if(children.length>=10){
						console.log(children.length);
					    //== Class definition
					      var SweetAlert2Demo = (function () {
					        //== Demos
					        var initDemos = function () {
					          
					            swal("최대 발송 인원을 초과하였습니다!", "쪽지 발송 인원은 10명 이하여야 합니다.", {
					              icon: "error",
					              buttons: {
					                confirm: {
					                  className: "btn btn-danger",
					                },
					              },
					            });
					          
					        };
					
					        return {
					          //== Init
					          init: function () {
					            initDemos();
					          },
					        };
					      })();
					
					      //== Class Initialization
					      jQuery(document).ready(function () {
					        SweetAlert2Demo.init();
					      });
						
					}
					
				}else {
					  var newElement=document.createElement("span");
		                newElement.classList.add("badge");
		                newElement.classList.add("badge-info");
		                newElement.classList.add("badge-margin");
		                newElement.classList.add("badge-margin");
		                newElement.id=memberKey;
		                newElement.textContent=memberName+' '+jobName;
		                
		                namebox[0].appendChild(newElement);
		                console.log(children.length+"오보다 작으면에 빠졌나?");
				}
              
            	

      		}


            function notego(){

 	           
	            var selectedRadio = document.getElementsByName('reMemberKey1');
	            var reMemberKey1=null;
	            	  for(let i=0; i<selectedRadio.length;i++){
	                        if(selectedRadio[i].checked){
	                              var reMemberKey1=selectedRadio[i].value;  
	                         }
	                  }
				
	            // 나머지 인풋 값들을 가져옴
	            var memberKey = document.getElementById('memberKey').value;
	            var postMsgDetail = document.getElementById('postMsgDetail').value;

		    	$.ajax({
		    		url : '${path}/notewrite',
		    		type : 'POST',
		    		data : {
		    			"reMemberKey" : reMemberKey1,
		    			"memberKey" : memberKey,
		    			"postMsgDetail" : postMsgDetail
		    			
		    		},
		    		success : function(){
		    			alert('성공');
		    				
		    			/* send(reMemberKey1, memberKey); */
		    		}
		    	});
		    	 modal.classList.remove('on');
		    }
          	
          	
          	
          	
          		function openOrgan(){
          		/* 	var url = "${path}/organ";
                    var windowName = "newWindow";
                    var windowFeatures = "width=400px,height=600, resizable=no";

                     window.open(url, windowName, windowFeatures);
                      */
                     var popupWindow= window.open('${path}/organ', 'newWindow', 'resizable');
					 popupWindow.resizeTo(400, 600);
						popupWindow.onresize = (_=>{
						    popupWindow.resizeTo(400,600);
						});	
	          			
          		}
          	
          		function openNoteWrite(){
          		/*     var url = "${path}/notewrite3";
                    var windowName = "newWindow";
                    var windowFeatures = "width=800,height=600, resizable=no";
 */
 				 	var popupWindow= window.open('${path}/notewrite3', 'newWindow', 'resizable, left=300, top=300');
						 popupWindow.resizeTo(400, 600);
							popupWindow.onresize = (_=>{
							    popupWindow.resizeTo(400,600);
							});	
			
							
          		}
          		
          		function fn_paging(pageNo){
					$.ajax({
						url : '${path}/notepaging',
						type : 'POST',
						data : {cPage : pageNo},
						success : function(response){
							var tbody=$('#pagingtbody');
							tbody.empty();
						  	 console.log(response.notepagelist);

						  $.each(response.notepagelist, function(index, item) {
				                    var row = `<tr>
				                        <td>\${item.postMsgKey}</td>
				                        <td>\${item.memberKey}</td>
				                        <td>\${item.postMsgDetail}</td>
				                        <td>\${item.postMsgTime}</td>
				                    </tr>`;
				                    tbody.append(row);
				                }); 
						  	var pageBarList=$('#pageBarList');
						  	pageBarList.empty();
						  	pageBarList.append(response.pagebar);
						    
						}
					});
          			
          		}	
          	
          	</script>
          
            
          </div>
        </div>

        <!-- footer -->
          <%@ include file="/WEB-INF/views/common/footer.jsp" %>
      </div>

      <!-- Custom template | don't include it in your project! -->
      <div class="custom-template">
        <div class="title">Settings</div>
        <div class="custom-content">
          <div class="switcher">
            <div class="switch-block">
              <h4>Logo Header</h4>
              <div class="btnSwitch">
                <button
                  type="button"
                  class="selected changeLogoHeaderColor"
                  data-color="dark"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="blue"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="purple"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="light-blue"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="green"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="orange"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="red"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="white"
                ></button>
                <br />
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="dark2"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="blue2"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="purple2"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="light-blue2"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="green2"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="orange2"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="red2"
                ></button>
              </div>
            </div>
            <div class="switch-block">
              <h4>Navbar Header</h4>
              <div class="btnSwitch">
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="dark"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="blue"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="purple"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="light-blue"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="green"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="orange"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="red"
                ></button>
                <button
                  type="button"
                  class="selected changeTopBarColor"
                  data-color="white"
                ></button>
                <br />
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="dark2"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="blue2"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="purple2"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="light-blue2"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="green2"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="orange2"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="red2"
                ></button>
              </div>
            </div>
            <div class="switch-block">
              <h4>Sidebar</h4>
              <div class="btnSwitch">
                <button
                  type="button"
                  class="changeSideBarColor"
                  data-color="white"
                ></button>
                <button
                  type="button"
                  class="selected changeSideBarColor"
                  data-color="dark"
                ></button>
                <button
                  type="button"
                  class="changeSideBarColor"
                  data-color="dark2"
                ></button>
              </div>
            </div>
          </div>
        </div>
        <div class="custom-toggle">
          <i class="icon-settings"></i>
        </div>
      </div>
      <!-- End Custom template -->
    </div>
    <!--   Core JS Files   -->
    <script src="${path}/resources/assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="${path}/resources/assets/js/core/popper.min.js"></script>
    <%-- <script src="${path}/resources/assets/js/core/bootstrap.min.js"></script> --%>
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

   

    <!-- Kaiadmin JS -->
    <script src="${path}/resources/assets/js/kaiadmin.js"></script>

    <!-- Kaiadmin DEMO methods, don't include it in your project! -->
    <script src="${path}/resources/assets/js/setting-demo.js"></script>
    <script src="${path}/resources/assets/js/demo.js"></script>
    <script>
      $("#lineChart").sparkline([102, 109, 120, 99, 110, 105, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#177dff",
        fillColor: "rgba(23, 125, 255, 0.14)",
      });

      $("#lineChart2").sparkline([99, 125, 122, 105, 110, 124, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#f3545d",
        fillColor: "rgba(243, 84, 93, .14)",
      });

      $("#lineChart3").sparkline([105, 103, 123, 100, 95, 105, 115], {
        type: "line",
        height: "70",
        width: "100%",
        lineWidth: "2",
        lineColor: "#ffa534",
        fillColor: "rgba(255, 165, 52, .14)",
      });
    </script>
  </body>
</html>
