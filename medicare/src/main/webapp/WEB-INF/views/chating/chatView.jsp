<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 채팅</title>
</head>
<body>
    <input type="text" placeholder="메시지를 입력하세요." class="content">
    <button type="button" value="전송" class="sendBtn" onclick="sendMsg()">전송</button>

    <div>
        <span>메세지</span>
        <div class="chatArea"></div>
    </div>

    <script>
     	var stompClient = null;
		
     	function connect(){
     		var socket = new SockJS('/ws'); // WebSocket 서버의 엔드포인트 주소
     		stompClient = Stomp.over(socket);
            stompClient.connect({}, function(frame) {
                console.log('연결 성공');
                stompClient.subscribe('/topic/messages', function(message) {
                    showMessage(JSON.parse(message.body));
                });
            });
     	}
     	
     	function showMessage(message) {
            var chatArea = document.getElementById('chatArea');
            var p = document.createElement('p');
            p.textContent = message;
            chatArea.appendChild(p);
        }
        
        function sendMsg(){
            var content = document.getElementById('content');
			stompClient.send("/app/chat", {}, content.value);
			content.value = "";
        }
        
        connect();
        
    </script>
</body>
</html>