<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html lang='ko'>
  <head>
    <meta charset='utf-8' />
    <link rel="stylesheet" href="${path }/resources/bm/css//fullcalendar.min.css" />
    <link rel="stylesheet" href='${path }/resources/bm/css/bootstrap.min.css'/>
    <link rel="stylesheet" href='${path }/resources/bm/css/bootstrap-datetimepicker.min.css' />
    
    
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
   
    
  </head>
  <body>
  	<div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
  		<div class="modal-dialog" role="document">
  			<div class="modal-content">
  				<div class="modal-header">
  					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
  						<span aria-hidden="true">&times;</span>
  					</button>
  					<h4 class="modal-title"></h4>
  				</div>
  				<div class="modal-body">
  					
  					<div class="row">
  						<div class="col-xs-12">
  							<label class="col-xs-4" for="edit-allDay">하루</label>
  							<input class="inputM" type="text" name="edit-title" id="edit-title" required/>
  						</div>
  					</div>
  					<div class="row">
  						<div class="col-xs-12">
  							<label class="col-xs-4" for="edit-start">시작</label>
  							<input class="inputM" type="text" name="edit-start" id="edit-start"/> 							
  						</div>
  					</div>
  					<div>
  						<div class="col-xs-12">
  							<label class="col-xs-4" for="edit-end">끝</label>
  							<input class="inputM" type="text" name="edit-end" id="edit-end"/>
  						</div>					
  					</div>
  					<div class="row">
  						<div class="col-xs-12">
  						
  							<label class="col-xs-4" for="edit-type">구분</label>
  							<select class="inputM" type="text" name="edit-type" id="edit-type">
  								<option value="카테고리1">카테고리1</option>
  								<option value="카테고리2">카테고리2</option>
  								<option value="카테고리3">카테고리3</option>
  								<option value="카테고리4">카테고리4</option>
  								<option value="카테고리5">카테고리5</option>
  							</select>	
  						</div>		
  					</div>
  					<div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputM" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                     </div>
                     <div class="row">
                     	<div class="col-xs-12">
                     		<label class="col-xs-4" for="edit-desc">설명</label>
                     		<textarea rows="4" cols="50" class="inputM" name="edit-desc" id="edit-desc"></textarea>
                     	</div>
                     </div>		
  				</div>
  				<div class="modal-footer">
  					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
  					<button type="button" class="btn btn-primary" id="eventSave">저장</button>
  				</div>
  				<div class="modal-footer">
  					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
  					<button type="button" class="btn btn-danger" id="eventDelete">삭제</button>
  					<button type="button" class="btn btn-primary" id="eventUpdate">저장</button>
  				</div>
  			</div>
  		</div>
  	</div>
  
  	
    <div id='calendar'></div>
    
    <script src="${path }/resources/bm/js/bootstrap.min.js"></script>
    <script src="${path }/resources/bm/js/moment.min.js"></script>
    <script src="${path }/resources/bm/js/fullcalendar.min.js"></script>
    <script src="${path }/resources/bm/js/ko.js"></script>
    
    <script src="${path }/resources/bm/js/calendar.js"></script>
    
  </body>
</html>