
/**
 * 채팅서버 기능 응용 알람 시스템  
 * 
 */
//ws : http프로토콜
//wss : https 프로토콜

 const server=new WebSocket("ws://localhost:8080/alarm");
 server.onopen=(response)=>{
	const msg=new Message("open",loginId);
	//console.log(msg);
	server.send(msg.convert());
 }
 
 /**
  * 
  *  cSession.sendMessage(new TextMessage(message));
  * 는 WebSocket을 통해 클라이언트에게 메시지를 보내는 것입니다. 
  * WebSocket은 연결이 활성화되어 있을 때 클라이언트가 메시지를 받을 준비가 되어 있으면 
  * 자동으로 onmessage 이벤트 핸들러를 호출하여 해당 메시지를 처리합니다. 
  * 여기서 몇 가지 중요한 포인트를 설명드리겠습니다:
  * WebSocket 연결 유지: sendMessage를 호출할 때마다, 만약 해당 클라이언트의 WebSocket 연결이 활성화되어 있고, 
  * 네트워크 통신이 원활하다면, 메시지는 클라이언트에게 성공적으로 전송됩니다.
  * onmessage 이벤트: 클라이언트 측에서는 WebSocket 객체의 
  * onmessage 이벤트 핸들러를 등록하여 서버로부터 오는 모든 메시지를 처리할 수 있습니다. 
  * 예를 들어, 이전에 보여드린 코드인 server.onmessage = (response) => { ... }에서 클라이언트는 
  * 이 이벤트 핸들러를 사용하여 서버에서 오는 모든 메시지를 받아 처리합니다. 
  * 메시지 수신 시간: WebSocket은 실시간 양방향 통신을 지원하기 때문에, 
  * 클라이언트에서는 서버가 메시지를 보내기만 하면, 
  * 그 즉시 onmessage 이벤트가 발생하여 메시지를 수신하고 처리할 수 있습니다.
  * 연결 상태 관리: WebSocket 연결이 끊어지지 않고 활성 상태를 유지하는 한, 
  * 클라이언트는 언제든지 메시지를 받을 수 있습니다. 연결이 끊어진 경우에는 이후 메시지를 받지 못하게 됩니다. 
  * 이런 경우 일반적으로 클라이언트 측에서 다시 연결을 시도하거나 사용자에게 알리는 등의 추가적인 처리가 필요합니다.
  * 따라서 cSession.sendMessage(new TextMessage(message));를 통해 보낸 메시지는 
  * 클라이언트 측에서 WebSocket을 통해 실시간으로 처리될 수 있으며, 이는 WebSocket의 주요 장점 중 하나입니다.
  * 
  */
 
 
 server.onmessage=(response)=>{
	const receiveMsg=Message.deconvert(response.data);
	switch(receiveMsg.type){
		case "open" :  alertMessage(receiveMsg); break; // 새로운 사람이 왔을 때
		case "msg" : messagePrint(receiveMsg); break; // 메세지가 왔을 때
		case "attend" : addAttend(receiveMsg); break; 
		case "close" : alertMessage(receiveMsg); break;
		
		
	}
 }
 
 const addAttend=(msg)=>{
	const clients=JSON.parse(msg.msg);
	const $attendContainer=document.querySelector("#attendContainer");
	$attendContainer.innerHTML="";
	const $ul=document.createElement("ul");
	$ul.classList.add("listcontainer");
	clients.map(e=>{
		const $li=document.createElement("li");
		$li.innerText=e;
		$li.classList.add("listfont");
		return $li;
	}).forEach(e=>{
		$ul.appendChild(e);
	});
	$attendContainer.appendChild($ul);
 }
 
 const messagePrint=(msg)=>{
	const $div=document.createElement("div");
	const $profile=document.createElement("img");
	$profile.setAttribute("src",`${path}/resources/images/logo-spring.png`);
	$profile.style.width="50px";
	$profile.style.height="50px";
	$profile.style.borderRadius="100px";
	$div.appendChild($profile);
	//보낸 사람 태그 생성
	const $sender=document.createElement("sup");
	$sender.innerText=msg.sender;
	//메세지 출력 태그
	const $content=document.createElement("span");
	$content.innerText=msg.msg;
	
	$div.appendChild($sender);
	$div.appendChild($content);
	//메세지 컨테이너 디자인하기
	$div.classList.add("msgcontainer");
	if(msg.sender==loginId){
		$div.classList.add("right");
	}else{
		$div.classList.add("left");
	}
	document.querySelector("#chattingcontent").appendChild($div);
	
 }
 
 
 
 const sendMessage=()=>{
	const inputData=document.querySelector("#msg").value;
	if(inputData.length>0){
		const msgObj=new Message("msg",loginId,"","",inputData).convert();
		server.send(msgObj);
	}else{
		alert("메세지를 입력하세요!");
		document.querySelector("#msg").focus();	
	}
 }
 
 const alertMessage=(msg)=>{
	const $container=$("<div>").addClass("alertContainer");
	const status=msg.type=="open"?"접속":"퇴장";
	const $content=$("<h4>").text(`${msg.sender}님이 ${status}하셨습니다.`);
	$container.append($content);
	$("#chattingcontent").append($container);
	
 }
 
 class Message{
	constructor(type="",sender="",receiver="",room="",msg=""){
		this.type=type;
		this.sender=sender;
		this.receiver=receiver;
		this.room=room;
		this.msg=msg;
	}
	
	convert(){
		return JSON.stringify(this);
	}
	
	static deconvert(data){
		return JSON.parse(data);
	}
	
 }