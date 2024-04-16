<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<body>
<div>
		<!-- 룸 아이디 번호를 입력하는 input -->
    <input type="number" id="roomIdInput" />
		<!-- 룸 아이디를 입력후 클릭하는 button -->
    <button type="button" id="enterRoomBtn">enter Room</button>
		<!-- enterRoomBtn 클릭시 나타남, Streams 정보를 담은 Peer 를 웹소켓 ( 시그널링 )   -->
    <button type="button" id="startSteamBtn" style="display: none;">start Streams</button>
</div>
		<!-- 내 웹캠 화면을 보여주는 video html -->
    <video id="localStream" autoplay playsinline controls style="display: none;"></video>
		
		<!-- WebRTC에 연결된 웹캠들이 추가되는 Div  -->
    <div id="remoteStreamDiv">
    </div>
		<!-- webRTC 연결을 위한 js  -->
    <script>
 // let remoteStreamElement = document.querySelector('#remoteStream');
    let localStreamElement = document.querySelector('#localStream');
    const myKey = Math.random().toString(36).substring(2, 11);
    let pcListMap = new Map();
    let roomId;
    let otherKeyList = [];
    let localStream = undefined;
    const startCam = async () =>{
        if(navigator.mediaDevices !== undefined){
            await navigator.mediaDevices.getUserMedia({ audio: true, video : true })
                .then(async (stream) => {
                    console.log('Stream found');
    								//웹캠, 마이크의 스트림 정보를 글로벌 변수로 저장한다.
                    localStream = stream;
                    // Disable the microphone by default
                    stream.getAudioTracks()[0].enabled = true;
                    localStreamElement.srcObject = localStream;
                    // Connect after making sure that local stream is availble
       
                }).catch(error => {
                    console.error("Error accessing media devices:", error);
                });
        }
       
    }
       
    // 소켓 연결
    const connectSocket = async () =>{
        const socket = new SockJS('/signaling');
        stompClient = Stomp.over(socket);
        stompClient.debug = null;
       
        stompClient.connect({}, function () {
            console.log('Connected to WebRTC server');
               
    				//iceCandidate peer 교환을 위한 subscribe
            stompClient.subscribe(`/topic/peer/iceCandidate/${myKey}/${roomId}`, candidate => {
                const key = JSON.parse(candidate.body).key
                const message = JSON.parse(candidate.body).body;
       
    						// 해당 key에 해당되는 peer 에 받은 정보를 addIceCandidate 해준다.
                pcListMap.get(key).addIceCandidate(new RTCIceCandidate({candidate:message.candidate,sdpMLineIndex:message.sdpMLineIndex,sdpMid:message.sdpMid}));
       
            });
       				
    				//offer peer 교환을 위한 subscribe
            stompClient.subscribe(`/topic/peer/offer/${myKey}/${roomId}`, offer => {
                const key = JSON.parse(offer.body).key;
                const message = JSON.parse(offer.body).body;
       						
    						// 해당 key에 새로운 peerConnection 를 생성해준후 pcListMap 에 저장해준다.
                pcListMap.set(key,createPeerConnection(key));
    						// 생성한 peer 에 offer정보를 setRemoteDescription 해준다.
                pcListMap.get(key).setRemoteDescription(new RTCSessionDescription({type:message.type,sdp:message.sdp}));
                //sendAnswer 함수를 호출해준다.
    						sendAnswer(pcListMap.get(key), key);
       
            });
       				
    				//answer peer 교환을 위한 subscribe
            stompClient.subscribe(`/topic/peer/answer/${myKey}/${roomId}`, answer =>{
                const key = JSON.parse(answer.body).key;
                const message = JSON.parse(answer.body).body;
       						
    						// 해당 key에 해당되는 Peer 에 받은 정보를 setRemoteDescription 해준다.
                pcListMap.get(key).setRemoteDescription(new RTCSessionDescription(message));
       
            });
       				
    			  //key를 보내라는 신호를 받은 subscribe
            stompClient.subscribe(`/topic/call/key`, message =>{
    						//자신의 key를 보내는 send
                stompClient.send(`/app/send/key`, {}, JSON.stringify(myKey));
       
            });
       				
    				//상대방의 key를 받는 subscribe
            stompClient.subscribe(`/topic/send/key`, message => {
                const key = JSON.parse(message.body);
       						
    						//만약 중복되는 키가 ohterKeyList에 있는지 확인하고 없다면 추가해준다.
                if(myKey !== key && otherKeyList.find((mapKey) => mapKey === myKey) === undefined){
                    otherKeyList.push(key);
                }
            });
       
        });
    }
       
    let onTrack = (event, otherKey) => {
       
        if(document.getElementById(`${otherKey}`) === null){
            const video =  document.createElement('video');
       
            video.autoplay = true;
            video.controls = true;
            video.id = otherKey;
            video.srcObject = event.streams[0];
       
            document.getElementById('remoteStreamDiv').appendChild(video);
        }
       
        //
        // remoteStreamElement.srcObject = event.streams[0];
        // remoteStreamElement.play();
    };
       
    const createPeerConnection = (otherKey) =>{
        const pc = new RTCPeerConnection();
        try {
            pc.addEventListener('icecandidate', (event) =>{
                onIceCandidate(event, otherKey);
            });
            pc.addEventListener('track', (event) =>{
                onTrack(event, otherKey);
            });
            if(localStream !== undefined){
                localStream.getTracks().forEach(track => {
                    pc.addTrack(track, localStream);
                });
            }
       
            console.log('PeerConnection created');
        } catch (error) {
            console.error('PeerConnection failed: ', error);
        }
        return pc;
    }
       
    let onIceCandidate = (event, otherKey) => {
        if (event.candidate) {
            console.log('ICE candidate');
            stompClient.send(`/app/peer/iceCandidate/${otherKey}/${roomId}`,{}, JSON.stringify({
                key : myKey,
                body : event.candidate
            }));
        }
    };
       
    let sendOffer = (pc ,otherKey) => {
        pc.createOffer().then(offer =>{
            setLocalAndSendMessage(pc, offer);
            stompClient.send(`/app/peer/offer/${otherKey}/${roomId}`, {}, JSON.stringify({
                key : myKey,
                body : offer
            }));
            console.log('Send offer');
        });
    };
       
    let sendAnswer = (pc,otherKey) => {
        pc.createAnswer().then( answer => {
            setLocalAndSendMessage(pc ,answer);
            stompClient.send(`/app/peer/answer/${otherKey}/${roomId}`, {}, JSON.stringify({
                key : myKey,
                body : answer
            }));
            console.log('Send answer');
        });
    };
       
    const setLocalAndSendMessage = (pc ,sessionDescription) =>{
        pc.setLocalDescription(sessionDescription);
    }
       
    //룸 번호 입력 후 캠 + 웹소켓 실행
    document.querySelector('#enterRoomBtn').addEventListener('click', async () =>{
        await startCam();
       
        if(localStream !== undefined){
            document.querySelector('#localStream').style.display = 'block';
            document.querySelector('#startSteamBtn').style.display = '';
        }
        roomId = document.querySelector('#roomIdInput').value;
        document.querySelector('#roomIdInput').disabled = true;
        document.querySelector('#enterRoomBtn').disabled = true;
       
        await connectSocket();
    });
       
    // 스트림 버튼 클릭시 , 다른 웹 key들 웹소켓을 가져 온뒤에 offer -> answer -> iceCandidate 통신
    // peer 커넥션은 pcListMap 으로 저장
    document.querySelector('#startSteamBtn').addEventListener('click', async () =>{
        await stompClient.send(`/app/call/key`, {}, {});
       
        setTimeout(() =>{
       
            otherKeyList.map((key) =>{
                if(!pcListMap.has(key)){
                    pcListMap.set(key, createPeerConnection(key));
                    sendOffer(pcListMap.get(key),key);
                }
       
            });
       
        },1000);
    });
    </script>
    
</body>
</html>