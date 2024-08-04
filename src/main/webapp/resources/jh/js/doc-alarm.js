/**
 * 전자문서 알람 관련 내용
 */
/* 타입 , 알람 , 수신인, 메세지  */
function refererAlarmSend(reMemberKey1, memberKey, memberName, jobName){
 console.log('참조인 알람 send');
	stompClient.send("/pub/msg/"+reMemberKey1,{},
		JSON.stringify({
			
			alarmType : 'DocReferer',
			alarmPath : 'document/list/referer/reference',
			alarmSendMember : memberKey,
			alarmReMember : reMemberKey1,
			alarmDate : new Date().toISOString(),
			memberName: memberName,
			jobName : jobName
			
			
		})
			
	);
	  
}

function nextAproverAlarmSend(reMemberKey1, memberKey, memberName, jobName){
 console.log('결재자 알람 send');
	stompClient.send("/pub/msg/"+reMemberKey1,{},
		JSON.stringify({
			
			alarmType : 'DocAprover',
			alarmPath : 'document/list/approver/waiting',
			alarmSendMember : memberKey,
			alarmReMember : reMemberKey1,
			alarmDate : new Date().toISOString(),
			memberName: memberName,
			jobName : jobName
			
			
		})
			
	);
	  
}