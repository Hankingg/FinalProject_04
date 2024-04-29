<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script src="../../static/fullcalendar-6.0.3/dist/index.global.js"></script>
<link href="${ pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet">
<script src="${ pageContext.request.contextPath }/resources/js/main.js"></script>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
    	var calendarEl = document.getElementById('calendar');

	      var calendar = new FullCalendar.Calendar(calendarEl, {
	        initialView: 'timeGridDay',
	        nowIndicator: true,
	        headerToolbar: {
	          left: 'prev,next today',
	          center: 'title',
	          right: 'dayGridMonth,timeGridDay'
	        },
	        navLinks: true, // can click day/week names to navigate views
	        editable: true,
	        selectable: true,
	        selectMirror: true,
	        dayMaxEvents: true, // allow "more" link when too many events
	        events: function(info, successCallback, failureCallback){
	      	  // ajax 처리로 데이터를 로딩 시킨다.
	      	  $.ajax({
	      		 url:'<c:url value="/selectEventList"/>',
	      		 type:"get",
	      		success: function(data) {
					successCallback(data);
				}
	      	  });
	        },
	        eventClick:function(event) {
	        	$("#calendarModal").modal("show");
	        	$("#calendar_memId").val(event.event.id);
	        	console.log(event)
	        	console.log(event.event.constraint);
	        	if(event.event.borderColor == 'null'){
	        		$("#calendar_symtom").val("작성한 증상이 없습니다");
	        	}else{
	        		$("#calendar_symtom").val(event.event.borderColor);
	        	}
	        	$("#calendar_diaType").val(event.event.title);
	        	$("#calendar_status").val(event.event.groupId);
	        	if(event.event.groupId == '예약대기중'){
	        		
	        		$("#addCalendar").removeAttr('disabled');
	        		$("#sprintSettingModalClose").removeAttr('disabled');
	        		
	        	}else if(event.event.groupId == '진료대기중'){
	        		$("#zoom_alarm").removeAttr('disabled');
	        		$("#zoom").removeAttr('disabled');
	        	}
	        	
	        	$("#addCalendar").click(function(){
					$.ajax({
	    				url:"order.complete",
	    				data:{memNo:event.event.textColor},
	    				success:function(result){
	    					console.log(result);
	    					$(".fc-event").css("backgroundColor","green");
	    					$("#addCalendar").attr('disabled',true);
	    	        		$("#sprintSettingModalClose").attr('disabled',true);
	    	        		$("#zoom_alarm").removeAttr('disabled');
	    	        		$("#zoom").removeAttr('disabled');
	    	        		location.reload();
	    				},error:function(){
	    					console.log("에러");
	    				}
	    			});
				})	
				
				$("#sprintSettingModalClose").click(function(){
					location.href="order.delete?memId="+event.event.constraint;
				});
			
				$("#zoom").click(function(){
					location.href="webrtcRoom.go?memId="+event.event.constraint;
				})
	        		
			}
	      })
	      calendar.render();
    });


    </script>
<style>
	.myPage {
		width: 1200px;
		margin: auto;
		margin-top: 110px;
		margin-bottom: 50px;
	}

	#myPage-tab {
		height: 40px;
		border-bottom: 1px solid lightgray;
	}

	#myPage-tab ul {
		margin: 0;
		padding: 0;
		height: 100%;
	}

	#myPage-tab ul li {
		list-style-type: none;
		float: left;
		width: 220px;
		height: 100%;
		text-align: center;
		margin-left:150px;
		line-height: 40px;
	}

	.myPage-info{
		padding-top: 50px;
	}

	#heart {
		margin-left: 20px;
	}

	#heart, #review, #delivery {
		margin-right: 20px;
	}

	#myPage-tab ul li a {
		width: 100%;
		height: 100%;
		display: block;
		text-decoration: none;
		color: gray;
		font-size: 20px;
		cursor: pointer;
	}

	#myPage-tab ul li a.active {
		border-radius: 5px 5px 0px 0px;
		background-color: #F96C85;
		color: white;
	}

	#myPage-tab ul li a:hover {
		border-radius: 5px 5px 0px 0px;
		background-color: #F96C85;
		color: white;
	}

	#myInfo {
		text-align: center;
	}

	#myInfo table {
		margin: auto;
		margin-top: 50px;
		margin-bottom: 30px;
		color: gray;
		font-size: 17px;
	}

	#myInfo table td {
		height: 58px;
	}

	#myInfo p {
		display: inline;
		color: black;
	}

	#myInfo table span {
		display: block;
		/* color: black; */
		text-align: left;
		padding-left: 10px;
	}

	#myInfo input {
		width: 300px;
		height: 45px;
		margin: 5px;
		border-radius: 5px;
		border: 1px solid gray;
		padding-left: 10px;
	}

	#myInfo input[name=address]{
		width: 210px;
		height: 45px;
	}

	/* 배송지 등록 버튼 */
	#addressBtn {
		color: white;
		float: right;
		font-size: 16px;
		width: 90px;
		height: 40px;
		background-color: #F96C85;
		border-radius: 15px;
		margin: auto;
		line-height: 40px;
		cursor: pointer;
		text-decoration: none;
		border: none;
	}

	/* 비밀번호 변경, 회원정보 수정 버튼 */
	#myInfo button {
		margin-left: 60px;
		color: #F96C85;
		background-color: none;
		border: none;
	}

	#leaveBtn {
		float: right;
		font-size: 13px;
	}

	#changePwdTB, #leaveMemTB {
		margin: auto;
	}

	#leaveMem .modal-header>h4 {
		padding-left: 190px;
		color: red;
	}

	.btn {
		background-color: none;
	}

	#leaveMem .modal-body>span {
		display: block;
		text-align: center;
	}

	.modal-body button {
		display: block;
		margin: auto;
		/* margin-top: 20px; */
		margin-bottom: 10px;
	}

	.message {
		color: red;
		font-size: 13px;
		font-weight: bold;
	}

	.myReview{
		height:auto;
	}

	/* 리뷰리스트 span */
	.review-div span {
	display: block;
	margin-top: 50px;
	margin-right: 30px;
	text-align: right;
	font-weight: 600;
    font-size: 18px;
    color: gray;
	}

	/* 리뷰리스트 */
	.reviewList{
		width: 1000px;
		margin: auto;
		display: flex;
		justify-content: center;
		height: auto;
	}

	.review-div{
		width: 800px;
		height: auto;
	}

	.myreview{
		width: 600px;
		height: auto;
		border: 2px solid #F96C85;
		border-radius: 10px;
		margin: 50px 100px;
	}

	.myreview1{
		width: 600px;
		height: 50px;
	}

	.myreview1>div{
		float: left;
		height: 50px;
	}

	/* 병원이름 */
	.hpName{
		width: 180px;
	}

	.hpName p{
		margin-top: 25px;
		margin-left: 15px;
		font-size: 20px;
		font-weight: bold;
		color: rgb(58, 58, 58);
		
	}

	/* 별 이미지 */
	.hpStar{
		width: 35px;
		padding-top: 17px;
	}

	/* 별점 */
	.hpRate{
		width: 300px;
	}

	.hpRate p{
		margin-top: 25px;
		font-size: 19px;
		font-weight: bold;
		color: rgb(58, 58, 58);
	}

	/* 하트 */
	.hpHeart{
		width: 50px;
		float: right;
		padding-top: 17px;
	}

	.starImg, .heartImg{
		width: 25px;
		height: 25px;
		margin-top: 3px;
	}

	/* 리뷰 큰 div */
	.myreview2{
		width: 600px;
		height: 200px;
		
	}

	.myreview2>div{
		float: left;
		
	}

	/* 리뷰 닉네임, 프로필사진 감싼 div */
	.rvProfile{
		width: 100px;
	}

	.rvProfile>div{
		width: 100%;
	}

	.nickName{
		height: 50px;
		margin-left: 20px;
		margin-top: 15px;
		color: gray;
	}

	.nickName>p{
		text-align: center;
		padding-top: 15px;
		font-size: 20px;
		font-weight: bold;
	}
	/* 리뷰 프로필 이미지 담긴 div */
	.profile{
		height: 100px;
		margin-left: 20px;
		padding-left: 2px;
	}

	/* 리뷰프로필 이미지 */
	.profileImg{
		width: 90px;
		height: 90px;
	}

	.rvCont{
		width: 400px;
		height: 150px;
		border-radius: 10px;
		margin-left: 35px;
		margin-top: 15px;
		padding-top: 40px;
		padding-left: 15px;
		background-color: rgb(242, 242, 242);
		

	}

	.document-outer>div{
		float: left;
	}

	.document-outer{
		margin-left: 30px;
	}

	/* 처방전 */
	.prescription{
		width: 350px;
		height: 480px;
		border: 1px solid gray;
		border-radius: 10px;
		padding: 15px;
		margin-right: 30px;
		margin-bottom: 30px;

	}

	.hosName{
		font-size: 20px;
		text-align: center;
		margin-top: 10px;
	}

	.psDate{
		text-align: right;
	}

	/* 처방전 사진 */
	.psImg{
		width: 300px;
		height: 400px;
		margin-left: 10px;
	}
	
	.myPage-info {
		height: auto;
	}
	
	#myInfoTb input[name=memId], #myInfoTb input[name=memName]{
		background-color: lightgray;
	}
	
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="main-panel">
		<div class="content-wrapper" style="background-color: white;">
			<div id='calendar'></div>
			<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정 정보</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">회원 정보</label>
                        <input type="text" class="form-control" id="calendar_memId" name="calendar_memId" readonly>
                        <label for="taskId" class="col-form-label">증상</label>
                        <input type="text" class="form-control" id="calendar_symtom" name="calendar_symtom" readonly>
                        <label for="taskId" class="col-form-label">진료 형태</label>
                        <input type="text" class="form-control" id="calendar_diaType" name="calendar_diaType" readonly>
                        <label for="taskId" class="col-form-label">진료 상태</label>
                        <input type="text" class="form-control" id="calendar_status" name="calendar_status" readonly>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="addCalendar" disabled>예약 확정</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose" disabled>예약 취소</button>
                    <button type="button" class="btn btn-outline-warning" data-dismiss="modal" id="zoom_alarm" disabled>알림</button>
                    <button type="button" class="btn btn-outline-primary" id="zoom" disabled>화상채팅</button>
                </div>
    
            </div>
        </div>
    </div>
		</div>
		
	<jsp:include page="../common/footer.jsp" />
</body>
</html>