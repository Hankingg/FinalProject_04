<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#diagRoomDiv {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -80%);
	}
	
	#diagRoomDiv>div {
	  float:left;
	}
</style>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="main-panel">
		<div class="content-wrapper">
		<h2 style="color:gray; margin-left:200px; margin-top:100px;">진료 대기실</h2>
		<div style="maring:auto; width:700px; height:150px; border-radius:15px; border:1px solid black; text-align:center; padding-top:30px;" id="diagRoomDiv">
		<p style="font-size:20px;"> ${ h.hosName }병원의 진료실에 오신걸 환영합니다</p> <br>
		
		<div><input type="text" placeholder="진료실 방번호를 입력해주세요" id="roomNum" class="form-control" style="width:400px; height:40px; margin-left:100px;"></div>
		<div><button onclick="return enterRoom();" class="btn btn-primary" style="margin-left:20px;">입장하기</button></div>
		<br><br><br><br>
		<a href="#" data-toggle="tooltip" title="알림으로 온 방번호와 똑같이 입력해주세요!" style="text-decoration:none; color:black; font-size:35px;">⚠</a>
		</div>
		<script>
			$(document).ready(function(){
			  $('[data-toggle="tooltip"]').tooltip();
			});
		</script>
		
		<script>
		
			function enterRoom(){
				location.href="webrtc.go?memId=${memId}&roomNum="+$("#roomNum").val()+"&hosCode=${h.hosCode}";		
				return false;
			}
		</script>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>