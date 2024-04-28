<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="main-panel">
		<div class="content-wrapper">
		<div style="maring:auto;">
		xxx병원의 진료실에 오신걸 환영합니다 <br>
		
		<input type="text" placeholder="방번호를 입력해주세요" id="roomNum">		
		<button onclick="return enterRoom();">입장하기</button>
		</div>
		
		<script>
			function enterRoom(){
				location.href="webrtc.go?memNo=${memNo}&roomNum="+$("#roomNum").val();		
				return false;
			}
		</script>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>