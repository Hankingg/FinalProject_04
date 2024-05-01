<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<meta charset="UTF-8">
	<title>Chating</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px;
		}

		#container{
			margin-left: 400px;
		}
		.container h2{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #f96c85;
			border-left: 3px solid #f96c85;
			margin-bottom: 20px;
		}
		
		.chating{
			background-color: rgb(243, 243, 243);
			width: 660px;
			height: 650px;
			overflow: auto;
			margin-bottom: 20px;
			padding-top: 50px;
			padding-left: 30px;
			padding-right: 30px;
			border-radius: 10px;			
		}
		
		.myChat{
			text-align: right;
			margin-left: auto;
		}
		
		.chating .me {
		    margin-left: auto;
		    padding: 8px;
		    border-radius: 10px;
		    display: inline-block;
		    text-align: left;
		    max-width: 400px;
		    word-wrap: break-word;
		    margin-right: 3px;
    		margin-top: 7px;
            background-color: white;
    		color: #f96c85;

    	}

    	.otChat{
    		text-align: left;
			margin-right: auto;
    	}
    	
		.chating .other{
			margin-right: auto;
			margin-left: 3px;
		    padding: 8px;
		    border-radius: 10px;
		    display: inline-block;
		    max-width: 400px;
		    word-wrap: break-word;
    		margin-top: 7px;
            background-color: #f96c85;
    		color: white;
		}
		.chating .start{
			color: #f96c85;
			text-align: center;
		}
		.chating .exit{
			color: red;
			text-align: center;
		}
		
		#yourMsg{
			display: none;
		}
		
		#userName{
			margin-left: 10px;
			margin-right: 10px;
		}
		
		#startBtn{
			width: 200px;
			height: 50px;
			border: none;
			border-radius: 10px;
			background-color: #f96c85;
			color: white;
			font-size: 18px;
		}
		
		#chatRoomIn{
			display: flex;
			justify-content: center;
			margin-right: 430px;
		}
		
		#sendBtn{
			width: 80px;
			height: 40px;
			border: none;
			border-radius: 10px;
			background-color: #f96c85;
			color: white;
		}
		
		#chatting{
			margin-left: 10px;
			margin-right: 10px;
			width: 550px;
			height: 50px;
			border-radius: 10px;
			border: 2px solid #f96c85;
			padding-left: 10px;
		}
		
		.chat-sender{
			font-size: 15px;
		}
		
		.chat-time{
			margin-right: 10px;
			margin-left: 10px;
			font-size: 13px;
		}
		
		.profile{
			width: 55px;
			height: 50px;
			margin-right: 5px;
		}
		
		.chatCont>div{
			/* float: left; */
			display: inline-block;
		}
		
	</style>
</head>

<script type="text/javascript">
	var ws;
	
	let sock1 = new SockJS("http://192.168.20.28:8008/medicare/webSocket-ws");
	sock1.onmessage = onMessage;
	sock1.onclose = onClose;
	
	$(document).ready(function(){
		$("#chatting").keypress(function(event){
			// 엔터키 눌렸는지 확인. 13 : 엔터키
			if(event.which == 13){
				sendMessage();
				event.preventDefault(); // 기본 이벤트(엔터키 입력시 개행)방지
			}
		})
	})
	
	function formatTime(date) {
	    var hours = date.getHours();
	    var minutes = date.getMinutes();
	    var ampm = hours >= 12 ? '오후' : '오전';
	    hours = hours % 12;
	    hours = hours ? hours : 12; // 0 시간을 12로 변경
	    minutes = minutes < 10 ? '0' + minutes : minutes; // 분을 두 자리 숫자로 포맷
	
	    var strTime = ampm + ' ' + hours + ':' + minutes;
	    return strTime;
	}
	
	var now = new Date();
	var formattedTime = formatTime(now);
	
	function sendMessage(){
		var chatMessage = $("#chatting").val().trim();
		var now = new Date();
		
		var message = {
			sender: "${loginUser.nickName}",
			content: chatMessage,
			timestamp: formatTime(now)
		};
		sock1.send(JSON.stringify(message));
		$("#chatting").val("").focus();
		
	}
	
	function onMessage(msg){
		var data = msg.data;
		var message = JSON.parse(data);
		
		var value = "";
		
			// 일반 채팅 메세지일 경우
			if(message.sender == "${loginUser.nickName}"){
				value += "<div class='myChat'>"
					   + "<span class='chat-sender'>" + message.sender + "</span><br>"
					   + "<div class='chatCont'>"
					   + "<div><span class='chat-time'>" + message.timestamp + "</span></div>"
					   + "<div class='me'>" + message.content + "</div>"
					   + "</div>"
					   + "</div><br>";
			}else{
				value += "<div class='otChat'>"
					   + "<span class='chat-sender'>" + message.sender + "</span><br>"
					   + "<div class='chatCont'>"
					   + "<div><img class='profile' src='resources/reviewImg/profile/profile1.png'></div>"
					   + "<div class='other'>" + message.content + "</div>"
					   + "<div><span class='chat-time'>" + message.timestamp + "</span></div>"
					   + "</div>"
					   + "</div><br>";
			}

		$("#chating").append(value);
	}
	
	function onClose(evt){
		 $("#chating").append("<p class='exit'>[${loginUser.nickName}]님이 퇴장하였습니다.</p>");
	}

	function chatIn(){
			$("#chatRoomIn").hide();
			$("#chating").append("<p class='start'>[${loginUser.nickName}]님이 입장하였습니다.</p>");
			$("#yourMsg").show();
			$("#chatting").focus();
	}
	
</script>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="main-panel">
        <div class="content-wrapper">
			<div id="container" class="container">
				<h2>문의하기</h2>
				<input type="hidden" id="sessionId" value="">
				
				<div id="chating" class="chating">
				</div>
				
				<div id="chatRoomIn">
					<button onclick="chatIn()" id="startBtn">채팅방 입장하기</button>
				</div>
				<div id="yourMsg">
					<table class="inputTable">
						<tr>
							<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
							<th><button onclick="sendMessage()" id="sendBtn">전송</button></th>
						</tr>
					</table>
				</div>
			</div>
		</div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>
