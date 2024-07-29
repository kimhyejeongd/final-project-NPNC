<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<div class="modal fade" id="deptformModal" tabindex="-1" aria-labelledby="formModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="formModalLabel">부서 수정</h5>
	          <button type="button" class="close" data-dismiss="updatemodal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
        <div class="modal-body">
			<form action="${path}/admin/dept/updatedeptend" method="post">
				 <div class="container">
		          <div class="page-inner">
		            	<div class="form-group">
							<div class="form-group form-inline">
		                          <label
		                            for="deptNameMo"
		                            class="col-md-3 col-form-label"
		                            >부서명</label
		                          >
		                          <div class="col-md-9 p-0">
		                            <input
		                              type="text"
		                              class="form-control input-full"
		                              id="deptNameMo"
		                              name="deptName"
		                              placeholder="부서명"

		                            />
		                          </div>
		               		</div>	
								<input type="hidden" name="deptKey" id="deptKeyMo"/>
		                          <button
					                  type="submit"
					                  class="btn btn-success"
					                  data-color="dark"
					                >수정</button>
		                      </div>
		            
		           </div>
		          </div>
		 
				</form>		
		</div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> 