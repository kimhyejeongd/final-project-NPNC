<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.modalDetailGo{}
	.modalDetailGo:hover {
            cursor: pointer; /* 커서를 포인터로 변경 */
        }
	
	/* 즐겨찾기에서 커서를 포인터로 변경*/
	.fa-star {
		cursor: pointer;
	}
	
	.noteSearchBar{
	
	}
	
	.noteTableFooter{
		display: flex;
		justify-content: center; /* 수평 중앙 정렬 */
		align-items: center; /* 수직 중앙 정렬 (선택 사항) */
		
	}
	

	#deleteButton {
	    margin-right: auto; /* 왼쪽으로 정렬 */
	}

	#pageBarList {
	    margin-left: auto; /* 오른쪽으로 정렬 */
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
			  
              <li class="nav-item" >
                <a data-bs-toggle="collapse" href="${path}/notehome">
                  <i class="fas fa-file-upload"></i>
                  <p>받은 쪽지함</p>
                </a>
               
              </li>
              <li class="nav-item">
                <a data-bs-toggle="collapse" href="${path}/sendNoteHome">
                  <i class="fas fa-file-download"></i>
                  <p>보낸 쪽지함</p>
                </a>
                
              </li>
			 
			   <li class="nav-item">
                  <a data-bs-toggle="collapse" href="${path}/noteSendMe">
                    <i class="fas fa-street-view"></i>
                    <p>내게 쓴 메일함</p>
                  </a>
                  
                </li>
				<li class="nav-item">
	                <a data-bs-toggle="collapse" href="${path}/noteBookMark">
					  <i class="fas fa-folder-open"></i>
	                  <p>즐겨찾기</p>
	                  <span class="caret"></span>
	                </a>
	                <div class="collapse" id="base">
	                  <ul class="nav nav-collapse">
	               
	                    <li>
	                      <a href="components/avatars.html">
	                        <span class="sub-item">Avatars</span>
	                      </a>
	                    </li>
	                    <li>
	                      <a href="components/buttons.html">
	                        <span class="sub-item">Buttons</span>
	                      </a>
	                    </li>
	                    <li>
	                      <a href="components/gridsystem.html">
	                        <span class="sub-item">Grid System</span>
	                      </a>
	                    </li>
	                    <li>
	                      <a href="components/panels.html">
	                        <span class="sub-item">Panels</span>
	                      </a>
	                    </li>
	                    <li>
	                      <a href="components/notifications.html">
	                        <span class="sub-item">Notifications</span>
	                      </a>
	                    </li>
	                    <li>
	                      <a href="components/sweetalert.html">
	                        <span class="sub-item">Sweet Alert</span>
	                      </a>
	                    </li>
	                    <li>
	                      <a href="components/font-awesome-icons.html">
	                        <span class="sub-item">Font Awesome Icons</span>
	                      </a>
	                    </li>
	                    <li>
	                      <a href="components/simple-line-icons.html">
	                        <span class="sub-item">Simple Line Icons</span>
	                      </a>
	                    </li>
	                    <li>
	                      <a href="components/typography.html">
	                        <span class="sub-item">Typography</span>
	                      </a>
	                    </li>
	                  </ul>
	                </div>
	              </li>       
				 <li class="nav-item">
	                 <a data-bs-toggle="collapse" href="#trash">
						<i class="fas fa-trash-alt"></i>
	                   <p>휴지통</p>
	                   <span class="caret"></span>
	                 </a>
	                 <div class="collapse" id="trash">
	                   <ul class="nav nav-collapse">
	                
	                     <li>
	                       <a href="components/avatars.html">
	                         <span class="sub-item">받은 메일함</span>
	                       </a>
	                     </li>
	                     <li>
	                       <a href="components/buttons.html">
	                         <span class="sub-item">보낸 메일함</span>
	                       </a>
	                     </li>
	                     <li>
	                       <a href="components/gridsystem.html">
	                         <span class="sub-item">내게 쓴 메일함</span>
	                       </a>
	                     </li>
	                     
	                     
	                   </ul>
	                 </div>
	               </li>
              
            
            </ul>
          </div>
        </div>
      </div>
	  <script>
         document.addEventListener("DOMContentLoaded", function() {
             document.querySelectorAll('.nav-item').forEach(function(li) {
                 li.addEventListener('click', function() {
                     var anchor = li.querySelector('a');
                     if (anchor) {
                         window.location.href = anchor.href;
                     }
                 });
             });
         });
	     </script>
      <!-- End Sidebar -->

      <div class="main-panel">
        <!-- header_bar  -->
          <%@ include file="/WEB-INF/views/common/header_bar.jsp" %>
       
		
        <div class="container">
          <div class="page-inner">
          <input type="hidden" name="hiddenField" id="memberKey" value="${loginMember.memberKey}">
          
            <div
              class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
            >
              <div>
                <h3 class="fw-bold mb-3">받은쪽지함</h3>
                <h6 class="op-7 mb-2" id="noteTotalData">총 ${totalData}건의 쪽지가 있습니다.</h6>
              </div>
              <div class="ms-md-auto py-2 py-md-0">
               <button type="button" class="modal_btn btn btn-label-info btn-round me-2">쪽지 발송</button>
               <button type="button" class="modal_btn btn btn-primary btn-round">전체 쪽지 발송</button> 
                <!-- <a href="javascript:openOrgan();" class="btn btn-primary btn-round">조직도 예시</a> -->
              </div>
            </div>

          	<div class="col-md-12">
                <div class="card">
                  <div class="card-header">
					<div class="noteSearchBar">
						<nav class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex" style="width: 25%;">
							<select id="searchCheck" name="searchCheck">
						           <option value="name">이름</option>
						           <option value="title">제목</option>
													           
							</select>
					        <div class="input-group">
					          <div class="input-group-prepend">
					            <button type="button" class="btn btn-search pe-1" onclick="searchNoteKeyword();">
					              <i class="fa fa-search search-icon"></i>
					            </button>
					          </div>
							 
					          <input
					            type="text"
					            placeholder=""
					            class="form-control"
								id="searchNoteBarText"
					          />
					        </div>
							<script>
								function searchNoteKeyword(){
									var selectBox = document.getElementById('searchCheck');
							        var selectedValue = selectBox.options[selectBox.selectedIndex].value;
									var searchNoteBarText = document.getElementById('searchNoteBarText');
									
								    if(searchNoteBarText.value==""){
										var SweetAlert2Demo = (function () {
									        //== Demos
									        var initDemos = function () {
									          
												swal("검색창이 비어있습니다.", "기본 화면으로 돌아갑니다.", {
												          icon: "info",
												          buttons: {
												            confirm: {
												              className: "btn btn-info",
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
										fn_paging(1);			
										
									}else if(searchNoteBarText.value!=""){
										fn_paging2(1);
									}
									
								}
								
							</script>
							
					    </nav>
					</div>	
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table
                        id="basic-datatables"
                        class="display table table-striped table-hover"
                      >
                        <thead>
                          <tr>
                          	<th> 
                          		<input type="checkbox" id="deleteCheckAll" value="">
                          			전체선택 
                          
                          	</th>
                            <th>즐겨찾기</th>
                            <th>보낸이</th>
                            <th>title</th>
                            <th>Date</th>
                            
                          </tr>
                        </thead>
                       
                        <tbody id="pagingtbody">
                      <c:forEach var="d" items="${notelist}" varStatus="status">
						<tr>
       	    				<th><input type="checkbox" name="deleteCheck" value="${d.postMsgRecKey}"></th>
       	  					<th>
								<c:choose>
									<c:when test="${d.bookMarkStatus=='N'}">
								 		<i class="far fa-star bookmarkN" data-key="${d.postMsgRecKey}"></i>
								 	</c:when>
									<c:otherwise>
										<i class="fas fa-star bookmarkY" data-key="${d.postMsgRecKey}"></i>

									</c:otherwise>	
								</c:choose>	
							<p>
       	  					<th>${d.memberName} ${d.jobName}<p>
       	  					<th class="modalDetailGo" onclick="modalDetailGo(${d.postMsgRecKey},${d.memberKey})">${d.postMsgTitle}<p>
       	  					<th>${d.formattedPostMsgTime}<p>
       	  				</tr>
          		 	  </c:forEach>
          		 	
                        </tbody>
                        
                      </table>
                      <div class="noteTableFooter">
	                      <div id="deleteButton"> 
	                      	  	<button class="btn btn-info" onclick="deleteSendGo();">삭제하기</button>
	                      </div>
	                      <div id="pageBarList">${pageBar}</div>
                      </div>
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
									  <ul class="dropdown-menu" style="width: 300px !important; height: 400px !important; overflow-y: auto;">
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
			                              id="postMsgTitle"
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
                    			   <div class="input-group-prepend" style="padding:0px;">
										<button type="button" class="btn btn-outlime-primary" id="addFileButton" >
				                		추가
				                		</button>
										<button type="button" class="btn btn-outlime-primary" id="delFileButton" >
				                		삭제
				                		</button>
				                	</div>
				                	<div class="form-group">
				                	<form id="fileInputsContainer">
				                	<div id="basicFileForm" class="input-group mb-3" style="padding:0px;">
				                	 
						                <div class="input-group-prepend" style="padding:0px;">
						                	<span class="input-group-text1">첨부파일1</span>
						                </div>
						                <div class="custom-file">
						               
						                    <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple >
						                
						                </div>
						                 
						                
						            </div>
						            </form>
						            </div>
                    			   </div>         	   
								 <div class="form-group">
							
								<button class="btn btn-primary" style="margin-right: 10px;" onclick="notego();">전송</button>
								<button class="btn btn-primary btn-border close_btn" >닫기</button>
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
				           		   <h2>전체 쪽지</h2>
				           	</div>   
				           		    <div class="form-group">
			                          <div class="input-group">
			                            <span class="input-group-text">제목</span>
			                            <textarea
			                              class="form-control"
			                              aria-label="With textarea"
			                              id="postMsgTitleAll"
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
			                              id="postMsgDetailAll"
			                              rows="8" cols="50"
			                            ></textarea>
			                          </div>
                    			   </div>	
                    			   <div class="form-group">
                    			   		<div class="input-group-prepend" style="padding:0px;">
					                		<button type="button" class="btn btn-outlime-primary" onclick="fn_addFile2();">
					                			추가
					                		</button>
					                		<button type="button" class="btn btn-outlime-primary" onclick="fn_delFile2();">
					                			삭제
					                		</button>
				                		</div>
                    			   </div>
                    			   <div class="form-group">
				                	<form id="fileInputsContainer2">
				                	<div id="basicFileForm2" class="input-group mb-3" style="padding:0px;">
				                
						                <div class="input-group-prepend" style="padding:0px;">
						                	<span class="input-group-text2">첨부파일1</span>
						                </div>
						            	 <div class="custom-file">
						               
						                    <input type="file" class="custom-file-input" name="upFile2" id="upFile1" multiple >
						                    
						                </div>
						                 
						                
						            </div>
						            </form>
						            </div>	           	   
								 <div class="form-group">
								<button class="btn btn-primary" style="margin-right: 10px;" onclick="noteAllgo();">전송</button>
								<button class="btn btn-primary btn-border close_btn" >닫기</button>
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
				           	    <div class="namebox" >
				           		  <!--  <h2>전체 쪽지</h2> -->
				           		</div>
				           	</div>   
				           		    <div class="form-group">
			                          <div class="input-group">
			                            <span class="input-group-text">제목</span>
			                            <textarea
			                              class="form-control"
			                              aria-label="With textarea"
			                              id="postMsgTitleRecOne"
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
			                              id="postMsgDetailRecOne"
			                              rows="8" cols="50"
			                            ></textarea>
			                          </div>
                    			   </div>	
                    			   <div class="form-group" id="downloadButtonBox">
                    			   	
                    			   </div>	           	   
								 <div class="form-group">
								<button class="btn btn-primary" style="margin-right: 10px;" onclick="noteAllgo();">전송</button>
								<button class="btn btn-primary btn-border close_btn" >닫기</button>
								</div>
				          </div>
				    </div>
			  </div>
			
			<!-- 첨부파일 -->
			 <script>
			 /* 개별발송 파일 추가 로직*/
			 $(document).ready(function() {
	 		     const addDelFunction = (function() {
	 		         let count = 2;
	 		         const addFileform = () => {
	 		             if (count <= 5) {
	 		                 const fileForm = $("#basicFileForm").clone(true);
	 		                 fileForm.find("span.input-group-text1").text("첨부파일" + count);
	 		                 fileForm.find("input[type=file]").attr("id", "upFile" + count).val("");
	 		                 fileForm.appendTo("#fileInputsContainer");
	 		                 count++;
	 		             } else {
	 		                 alert("첨부파일은 5개까지 가능합니다");
	 		             }
	 		         };
	 		         const delFileform = () => {
	 		             if (count != 2) {
	 		                 $("#fileInputsContainer").children().last().remove();
	 		                 count--;
	 		             }
	 		         };
	 		         return { addFileform, delFileform };
	 		     })();
	 		     const fn_addFile = addDelFunction.addFileform;
	 		     const fn_delFile = addDelFunction.delFileform;
	 		     // 이벤트 핸들러를 추가하려면 여기에 추가하세요
	 		     $("#addFileButton").on("click", fn_addFile);
	 		     $("#delFileButton").on("click", fn_delFile);
	 		 });	
		    	
		    /* 전체발송 파일 추가 로직  */
		    const addDelFunction2=(function(){
		    		let count=2;
		    		const addFileform2=()=>{
		    			if(count<=5){
		    				const fileForm=$("#basicFileForm2").clone(true);
		    				fileForm.find("span.input-group-text2").text("첨부파일"+count);
		    				fileForm.find("input[type=file]").attr("id","upFile"+count).val("");
		    				
		    				/* $("textarea[name=boardContent]").before(fileForm); */
		    				   fileForm.appendTo("#fileInputsContainer2");
		    				count++;
		    			}else{
		    				alert("첨부파일은 5개까지 가능합니다");
		    			}
		    		}
		    		
		    		const delFileform2=()=>{
		    			if(count!=2){
		    				$("#fileInputsContainer2").children().last().remove();
		    				count--;
		    			}
		    			
		    		}
		    		return {addFileform2,delFileform2};
		    	})();
		    	const fn_addFile2=addDelFunction2.addFileform2;
		    	const fn_delFile2=addDelFunction2.delFileform2;
		    	
		    	
		    	
		    </script>
          	<script>
          	
          	const modal = document.querySelectorAll('.modal');
            const modalButtons = document.querySelectorAll('.modal_btn');
          	const modalCloses = document.querySelectorAll('.close_btn');
		
          	//열기 버튼을 눌렀을 때 모달팝업이 열림
          	   modalButtons.forEach((button, index) => {
		            button.addEventListener('click', function() {
		                // 인덱스 출력
		                console.log('Modal button index:', index);
		
		                // 'on' 클래스 추가
		                modal[index].classList.add('on');
		            });
		        });
          	
          	modalCloses.forEach((button, index) => {
	            button.addEventListener('click', function() {
	                // 인덱스 출력
	                console.log('Modal button index:', index);
	
	                // 'on' 클래스 추가
	                modal[index].classList.remove('on');
	            });
	        });
          	
         	/* 체크되어있는 체크박스의 값을 구해오는 로직 */
          	function deleteSendGo(){
			
          		 var checkboxes = document.querySelectorAll('input[name="deleteCheck"]');
          		 let checkDeleteValue=[];
           	    for (var checkbox of checkboxes) {
           	        
           	        
           	        if(checkbox.checked){
           	        	checkDeleteValue.push(checkbox.value);
           	        }
           	    }
	            var memberKey = document.getElementById('memberKey').value;
			

				$.ajax({
					url : '${path}/noteRecDelete',
					type : 'POST',
					data : {checkDeleteValue : checkDeleteValue,
							memberKey : memberKey
							},
					success : function(response){
						fn_paging(1);
					    
					}
				});
           	    
          	}
         	
         	/* 전체 선택 누르면 각 체크박스 돌아가는 로직 */
          	document.getElementById('deleteCheckAll').addEventListener('change', function() {
          	    var checkboxes = document.querySelectorAll('input[name="deleteCheck"]');
          	    for (var checkbox of checkboxes) {
          	        checkbox.checked = this.checked;
          	    }
          	});
          	
          	
          	/* 받은 쪽지 조회 함수 */
          	function modalDetailGo(postMsgRecKey,memberKey){
          		console.log(postMsgRecKey,memberKey);
          		$.ajax({
					url : '${path}/noteSelectOne',
					type : 'POST',
					data : {postMsgRecKey : postMsgRecKey,
							memberKey: memberKey
							},
					success : function(response){
						
		      			var namebox=document.getElementsByClassName("namebox");
						var downloadButtonBox= document.getElementById("downloadButtonBox");
						
						namebox[1].innerHTML="";
						downloadButtonBox.innerHTML="";
						
						var recMember=response.recMember;
						if(recMember.length>10){
							namebox[1].innerHTML='<h2>전체 쪽지<h2>';
						}else{
							for(let i=0;i<recMember.length;i++){
								 var newElement=document.createElement("span");
					                newElement.classList.add("badge");
					                newElement.classList.add("badge-info");
					                newElement.classList.add("badge-margin");
					                newElement.classList.add("badge-margin");
					                newElement.id=recMember[i].memberKey;
					                newElement.textContent=recMember[i].memberName+' '+recMember[i].jobName;
					                namebox[1].appendChild(newElement);
	
							}
						}
						var files= response.files;
						if(files.length>0){
						
							for(let i=0;i<files.length;i++){
								 var newElement=document.createElement("button");
					                newElement.classList.add("btn");
					                newElement.classList.add("btn-success");
					                
					               	newElement.textContent=files[i].postMessageFileOri;
					                
					               	newElement.onclick = function() {
					                     fn_download(files[i].postMessageFileOri,files[i].postMessageFilePost);
					                };
					               	
					               	
					                downloadButtonBox.appendChild(newElement);
	
							}
						}
			            
 					
				        $('#postMsgTitleRecOne').val(response.postMsgTitle);

				        $('#postMsgDetailRecOne').val(response.postMsgDetail);
				     
										    
						modal[2].classList.add('on');
					}
				});
          	}
          	
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
		               	newElement.setAttribute('name', 'reMemberKey1');

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
		               	newElement.setAttribute('name', 'reMemberKey1');
		                newElement.id=memberKey;
		                newElement.textContent=memberName+' '+jobName;
		                
		                namebox[0].appendChild(newElement);
		                console.log(children.length+"오보다 작으면에 빠졌나?");
				}
              
            	

      		}
			
          	/* 타입 , 알람 , 수신인, 메세지  */
         	function send(reMemberKey1, memberKey){
   		   	 console.log('send보내짐');
   		   		stompClient.send("/pub/msg/"+reMemberKey1,{},
   		   			JSON.stringify({
						
						alarmType : 'Note',
						alarmPath : 'notein',
		   				alarmSendMember : memberKey,
						alarmReMember : reMemberKey1,
						alarmDate : new Date().toISOString()
						
   		   				
   		   				
   		   			})
   		   				
   		   		);
		   		  
   		   	}
			
			<!--전체 알람 함수-->
			function sendAll(alarmSendMember){
					   	 console.log('send보내짐');
						 
					   		stompClient.send("/pub/all",{},
					   			JSON.stringify({
									alarmType : 'Note',
									alarmPath : 'notein',
					   				alarmSendMember : alarmSendMember,
									alarmDate : new Date().toISOString()
					   			})
					   				
					   		);
			}  
        	
         	/* 파일 다운로드 버튼 로직 */
          	function fn_download(ori,post){
          		location.assign("${path}/note/filedownload?oriname="+ori+"&rename="+post);
          	}
        	
            function notego(){
            	
            	var formData = new FormData();
            	var upFiles = document.getElementsByName('upFile');
				
            	for (var i = 0; i < upFiles.length; i++) {
            		   var fileList = upFiles[i].files;
            		    for (var j = 0; j < fileList.length; j++) {
            		        formData.append('upFile', fileList[j]);
            		    }

            	}
 	           
	            var selectedRadio = document.getElementsByName('reMemberKey1');
	            var reMemberKey1=[];
	            	  for(let i=0; i<selectedRadio.length;i++){
	                       
	                              reMemberKey1.push( selectedRadio[i].id);  
	                         
	                  }
				console.log(reMemberKey1);
	            // 나머지 인풋 값들을 가져옴
	            var memberKey = document.getElementById('memberKey').value;
	            console.log(memberKey);
	            var postMsgDetail = document.getElementById('postMsgDetail').value;
	            console.log(postMsgDetail);
				var postMsgTitle =document.getElementById('postMsgTitle').value;
				console.log(postMsgTitle);
				
				
				formData.append('reMemberKey',JSON.stringify(reMemberKey1));
				
				formData.append('memberKey', memberKey);
				formData.append('postMsgDetail', postMsgDetail);
				formData.append('postMsgTitle', postMsgTitle);
				
				formData.forEach((value, key) => {
				    console.log(key, value);
				});

		    	$.ajax({
		    		url : '${path}/notewrite',
		    		type : 'POST',
		    		data :
			    		/* 	"reMemberKey" : reMemberKey1,
			    			"memberKey" : memberKey,
			    			"postMsgTitle" : postMsgTitle,
			    			"postMsgDetail" : postMsgDetail, */
		    			formData,
		    	    processData: false, // 필수 항목
		    	    contentType: false, // 필수 항목
		    		success : function(){
		    			alert('성공');
		    			for (let i=0; i<reMemberKey1.length;i++)	{
		    				send(reMemberKey1[i], memberKey);
		    			}
		    			
		    			/* send(reMemberKey1, memberKey); */
		    		}
		    	});
		    	modal[0].classList.remove('on');
	      		var namebox=document.getElementsByClassName("namebox");
	      	 	document.getElementById('postMsgDetail').value='';
	      		document.getElementById('postMsgTitle').value='';
		    	namebox[0].innerHTML = '';
		    }
          	
            function noteAllgo(){

            	
            	var formData = new FormData();
            	var upFiles = document.getElementsByName('upFile2');
				console.log(upFiles);
            	for (var i = 0; i < upFiles.length; i++) {
            		   var fileList = upFiles[i].files;
            		    for (var j = 0; j < fileList.length; j++) {
            		        formData.append('upFile', fileList[j]);
            		    }

            	}
	          
	            // 나머지 인풋 값들을 가져옴
	            var memberKey = document.getElementById('memberKey').value;
	            console.log(memberKey);
	            var postMsgDetail = document.getElementById('postMsgDetailAll').value;
	            console.log(postMsgDetail);
				var postMsgTitle =document.getElementById('postMsgTitleAll').value;
				console.log(postMsgTitle);
				
				formData.append('memberKey', memberKey);
				formData.append('postMsgDetail', postMsgDetail);
				formData.append('postMsgTitle', postMsgTitle);
				
				
		    	$.ajax({
		    		url : '${path}/noteAllwrite',
		    		type : 'POST',
		    		data : 
		    			
		    		formData,
		    		processData: false, // 필수 항목
			    	contentType: false, 
		    		success : function(){
		    			alert('성공');
						sendAll(memberKey);

		    			/* send(reMemberKey1, memberKey); */
		    		}
		    	});
		    	
		    	document.getElementById('postMsgDetailAll').value='';
	      		document.getElementById('postMsgTitleAll').value='';
		    	 modal[1].classList.remove('on');
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
          		
				//기본 페이징처리 
          		function fn_paging(pageNo){
    	            var memberKey = document.getElementById('memberKey').value;

					$.ajax({
						url : '${path}/notepaging',
						type : 'POST',
						data : {cPage : pageNo,
								memberKey: memberKey
								},
						success : function(response){
							var tbody=$('#pagingtbody');
							tbody.empty();
						  var noteTotalData=document.getElementById('noteTotalData');
						  noteTotalData.innerHTML="총 "+response.totalData+"건의 쪽지가 있습니다.";
						  $.each(response.notepagelist, function(index, item) {
							
							if(item.bookMarkStatus=="N"){

				                    var row = `<tr>
										<th><input type="checkbox" name="deleteCheck" value="\${item.postMsgRecKey}"></th>

										<th>
											<i class="far fa-star bookmarkN" data-key="\${item.postMsgRecKey}"></i>
										<p>
										<th>\${item.memberName} \${item.jobName}<p>
				                        <th class="modalDetailGo" onclick="modalDetailGo(\${item.postMsgRecKey},\${item.memberKey})">\${item.postMsgTitle}</p>
				                        <th>\${item.formattedPostMsgTime}<p>
				                    </tr>`;
				                  	  tbody.append(row);
									  
							}else if(item.bookMarkStatus=="Y"){
									var row = `<tr>
				                    	<th><input type="checkbox" name="deleteCheck" value="\${item.postMsgRecKey}"></th>
										<th>
											<i class="fas fa-star bookmarkY" data-key="\${item.postMsgRecKey}"></i>
										<p>
										<th>\${item.memberName} \${item.jobName}<p>
				                        <th class="modalDetailGo" onclick="modalDetailGo(\${item.postMsgRecKey},\${item.memberKey})">\${item.postMsgTitle}</p>
				                        <th>\${item.formattedPostMsgTime}<p>
										</tr>`;
					                  	  tbody.append(row);	
						  	}
		                  }); 
						  	var pageBarList=$('#pageBarList');
						  	pageBarList.empty();
						  	pageBarList.append(response.pagebar);
						    
						}
					});
          			
          		}	
				
				//제목과 이름으로 페이징처리
				function fn_paging2(pageNo){
					var memberKey = document.getElementById('memberKey').value;
					
					var selectBox = document.getElementById('searchCheck');
			        var selectedValue = selectBox.options[selectBox.selectedIndex].value;
				
					var searchNoteBarText = document.getElementById('searchNoteBarText');
														
					$.ajax({
										url : '${path}/notepagingParam',
										type : 'POST',
										data : {cPage : pageNo,
												memberKey: memberKey,
												paramKeyword : selectedValue, 
												nameOrTitle : searchNoteBarText.value
												},
										success : function(response){
											var tbody=$('#pagingtbody');
											tbody.empty();
										  var noteTotalData=document.getElementById('noteTotalData');
										  noteTotalData.innerHTML="총 "+response.totalData+"건의 쪽지가 있습니다.";
										  $.each(response.notepagelist, function(index, item) {
											if(item.bookMarkStatus=="N"){

								                    var row = `<tr>
														<th><input type="checkbox" name="deleteCheck" value="\${item.postMsgRecKey}"></th>

														<th>
															<i class="far fa-star bookmarkN" data-key="\${item.postMsgRecKey}"></i>
														<p>
														<th>\${item.memberName} \${item.jobName}<p>
								                        <th class="modalDetailGo" onclick="modalDetailGo(\${item.postMsgRecKey},\${item.memberKey})">\${item.postMsgTitle}</p>
								                        <th>\${item.formattedPostMsgTime}<p>
								                  		</tr>`;
								                    	tbody.append(row);
															  
													}else if(item.bookMarkStatus=="Y"){
														var row = `<tr>
								                    	<th><input type="checkbox" name="deleteCheck" value="\${item.postMsgRecKey}"></th>
														<th>
															<i class="fas fa-star bookmarkY" data-key="\${item.postMsgRecKey}"></i>
														<p>
														<th>\${item.memberName} \${item.jobName}<p>
								                        <th class="modalDetailGo" onclick="modalDetailGo(\${item.postMsgRecKey},\${item.memberKey})">\${item.postMsgTitle}</p>
								                        <th>\${item.formattedPostMsgTime}<p>
														</tr>`;
									                  	tbody.append(row);	
												  	}
								                }); 
										  	var pageBarList=$('#pageBarList');
										  	pageBarList.empty();
										  	pageBarList.append(response.pagebar);
										    
										}
									});
				}
				
          	
          	</script>
			<script>
			// 즐겨찾기 추가 로직
		
					
					$(document).on('click', '.bookmarkN', function() {
					          const postMsgRecKey = $(this).data('key');
					          var memberKey = $('#memberKey').val();
							  var starElement = $(this);
					          $.ajax({
					              url: '${path}/noteBookMarkInsert',
					              type: 'POST',
					              data: {
					                  postMsgRecKey: postMsgRecKey,
					                  memberKey: memberKey
					              },
					              success: function(response) {
					                starElement.removeClass('far').addClass('fas'); 
									
									var SweetAlert2Demo = (function () {
								        //== 검색창이 비어있습니다 얼럿창
								        var initDemos = function () {
								          
											swal("즐겨찾기에 추가되었습니다.", "", {
											          icon: "success",
											          buttons: {
											            confirm: {
											              className: "btn btn-info",
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
					          });
					      });
					
					
					// 즐겨찾기 삭제 로직
				
					
					$(document).on('click', '.bookmarkY', function() {
				          const postMsgRecKey = $(this).data('key');
				          var memberKey = $('#memberKey').val();
						  var starElement = $(this);
				          $.ajax({
				              url: '${path}/noteBookMarkDelete',
				              type: 'POST',
				              data: {
				                  postMsgRecKey: postMsgRecKey,
				                  memberKey: memberKey
				              },
				              success: function(response) {
				                starElement.removeClass('fas').addClass('far'); 
								
								var SweetAlert2Demo = (function () {
									//== 검색창이 비어있습니다 얼럿창
							        var initDemos = function () {
							          
									swal("즐겨찾기에 삭제되었습니다.", "", {
									          icon: "success",
									          buttons: {
									            confirm: {
									              className: "btn btn-info",
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
				          });
				      });
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
