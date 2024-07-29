<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta charset="UTF-8">

<div class="row">
 <div class="">
   <div class="card card-round">
     <div class="card-header">
       <div class="card-head-row card-tools-still-right">
         <div class="card-title">결재 대기 문서</div>
         <div class="card-tools">
         </div>
       </div>
     </div>
     <div class="card-body p-0">
       <div class="table-responsive">
         <!-- Projects table -->
         <table class="table table-hover align-items-center mb-0" id="waitingTable">
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
              	<td colspan="6">결재 대기 중인 문서가 없습니다</td>
             	</tr>
             </c:if>
             <c:if test="${waitinglist ne null}">
             	<c:forEach items="${waitinglist }" var="l" varStatus="vs">
              <tr class="text-center" id="tablerow" data-doc-id="${l.erDocKey }">
              	<td>${vs.index+1 }</td>
                 <td class="text-muted">${l.erDocSerialKey }</td>
                 <td class=""><c:if test="${l.erDocEmergencyYn eq 'Y'}"><span style="color: red;">[긴급] </span></c:if>${l.erDocTitle }</td>
                	<td>
                		<c:forEach items="${l.approvers }" var="ap">
                			<c:if test="${ap.orderby eq 0 }">
                				<div class="badge badge-count" style="min-width: 60px;">
                   				<small class="">${ap.memberTeamName }</small><br>
                   				<small class="">${ap.memberJobName} ${ap.memberName}</small>
                   			</div>
                			</c:if>
                		</c:forEach>
                	</td>
                 <td class="">
                 	<fmt:formatDate value="${l.erDocCreateDate}" type="date" pattern="yyyy/MM/dd HH:mm:ss"/>
                 </td>
                 <td class="approverNow p-3">
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
</div>