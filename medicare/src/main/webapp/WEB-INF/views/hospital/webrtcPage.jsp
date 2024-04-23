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
<jsp:include page="../common/header.jsp"/>
    <div class="main-panel">
        <div class="content-wrapper" style="background-color: white;">
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
    <br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br>
    
    <!-- Button to Open the Modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
		  처방전 보내기
		</button>
		
		<a href="documentPage.in">처방전 페이지</a>
		<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form action="insertDocument.dc" method="post" enctype="multipart/form-data">
			        <div class="insDocument">
			        	<input type="file" id="upfile" name="upfile">
			        	<input type="text" name="dcReceiverMno">
			        	<input type="hidden" name="dcSenderMno" value="${loginUser.memNo}">
			        </div>
			        <button id="insertDoc">전송</button>
		      	 </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

		
		
		<!-- webRTC 연결을 위한 js  -->
    <script src="${ pageContext.request.contextPath }/resources/js/peerConfig.js"></script>
        
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>