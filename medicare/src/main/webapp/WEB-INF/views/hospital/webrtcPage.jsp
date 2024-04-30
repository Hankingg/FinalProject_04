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

<style>
	#streamWrap{
		display:flex;
	}
	
	#remoteStreamDiv{
		margin-left: 100px;
	}
	
	.main-panel * {
		margin:auto;
	}
	
</style>
</head>
<body>
<div>
<jsp:include page="../common/header.jsp"/>
    <div class="main-panel">
        <div class="content-wrapper" style="background-color: white;">
		<!-- 룸 아이디 번호를 입력하는 input -->
			
		    <input type="hidden" id="roomIdInput" value="${ roomNum }"/>
				<!-- 룸 아이디를 입력후 클릭하는 button -->
				<div >
				    <button type="button" id="enterRoomBtn" class="btn btn-success" style="margin-left:50px;">입장 확인</button>
						<!-- enterRoomBtn 클릭시 나타남, Streams 정보를 담은 Peer 를 웹소켓 ( 시그널링 )   -->
				    <button type="button" id="startSteamBtn" class="btn btn-info" disabled>화상채팅 연결하기</button>
			    </div>
			</div>
				<!-- 내 웹캠 화면을 보여주는 video html -->
			<div>
				<div style="margin-left:300px;">의사화면&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 환자화면</div>
				<div id="streamWrap" style=" width:1500px; height:600px;">
					<div id="localStreamDiv" style=" width:700px; height:100%;">
				    	<video id="localStream" autoplay playsinline controls  style=" width:100%; height:100%;"></video>
				    </div>
						<!-- WebRTC에 연결된 웹캠들이 추가되는 Div  -->
				    <div id="remoteStreamDiv" style="border:1px solid black; width:700px; height:100%;">
				    
				    </div>
			    </div>
		    </div>
    <br><br><br>
    	<div style="display:flex;">
    		<button class="btn btn-danger" id="closeOrder" style="margin-left:100px;" onclick="showDiagBtn();" disabled>종료</button>
	    <!-- Button to Open the Modal -->
	    	<c:if test="${ loginUser.mtId == 'H' }">
				<button type="button" id="diagBtn" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style=" margin-left:30px;" disabled>
				  처방전 보내기
				</button>
			</c:if>
		</div>
		
		<script>
			function showDiagBtn() {
				$.ajax({
					url:"order.finish",
					data:{memNo:"${memNo}",
						  hosCode:"${hosCode}"},
					success:function(data){
						alert("진료가 종료되었습니다.");
					    $("#diagBtn").css("visibility", "visible");
					}, error:function(){
						
					}
				})
			}
			$("#startSteamBtn").click(function(){
				$("#closeOrder").attr("disabled",false);
			})
			
			$("#closeOrder").click(function(){
				$("#diagBtn").attr("disabled", false);
			})
		</script>
		<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">처방전 보내기</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form action="insertDocument.dc" method="post" enctype="multipart/form-data">
			        <div class="insDocument">
			        	받는 사람 : <input type="text" name="dcReceiverMno" id="dcReceiverMno" value="" readonly> <br><br>
			        	보내는 병원 : <input type="text" name="dcSenderMno" value="${loginUser.memNo}" readonly><br><br>
			        	처방전 : <input type="file" id="upfile" name="upfile"> 
			        </div>
			        <br> <br>
			        <button id="insertDoc" class="btn btn-primary">전송</button>
		      	 </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

		<script>
			$(function(){
				console.log("${memId}");
				$.ajax({
					url:"select.memId",
					data:{memId:"${memId}"},
					success:function(data){
						console.log(data);
						$("#dcReceiverMno").val(data.memNo);
					},error:function(){
						console.log("ajax 통신 실패");
					}
				})
			})
		</script>
		
		<!-- webRTC 연결을 위한 js  -->
    <script src="${ pageContext.request.contextPath }/resources/js/peerConfig.js"></script>
        
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>