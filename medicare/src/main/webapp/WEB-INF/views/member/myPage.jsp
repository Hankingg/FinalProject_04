<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
	    width: auto;
		margin-right: 15px;
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
		width: 90px;
	}

	.hpRate p{
		margin-top: 25px;
		font-size: 19px;
		font-weight: bold;
		color: rgb(58, 58, 58);
	}

	/* 삭제 div */
	.hpDel{
		width: 50px;
		float: right;
		padding-top: 17px;
	}
	
	.delBtn{
		width: 50px;
		height: 30px;
		border-radius: 10px;
		border: none;
		background-color: #F96C85;
		color: white;
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
	/* 모달시 처방전 사진 */
	.modalPsImg{
		width: 600px;
		height: 600px;
	}
	
	.myPage-info {
		height: auto;
	}
	
	#myInfoTb input[name=memId], #myInfoTb input[name=memName]{
		background-color: lightgray;
	}

	/* 처방전 모달 */

	.modal2 {
		display: none; 
		position: fixed; 
		z-index: 1; 
		left: 0;
		top: 0;
		width: 100%; 
		height: 100%; 
		background-color: rgba(0,0,0,0.4);
	}

	.modal-content2 {
		background-color: #fefefe;
		padding: 20px;
		border: 1px solid #888;
		border-radius: 5px;
		width: 700px; 
		height: 800px;
		position: fixed; 
		top: 54%; 
		left: 55%;
		transform: translate(-50%, -50%); 
		margin: 0; 
	}

	.close2:hover{
		cursor: pointer;
	}

	#adminMember th,td{		
		text-align:center;
		height:50px;
	}
	
	#adminMember {
	 width:1150px;
	 border:1px solid red;
	}
	
	#inputPwd {
		border: 1px solid rgb(240, 130, 120);
		width : 600px;
		height : 400px;
		border-radius: 10px;
	}
	
	.admin_checkpwd_content {
		margin-left: 420px;
	}
	
	#inputPwd>h4 {
		margin-top: 30px;
	}
	
	
	#selectMember {
		margin-right:120px;
	}
	
	#adminMember {
		text-align:center;
		width:400px;
		height:400px;
		border-radius: 10px;
		padding-top:70px;
	}
	
	#pwdBtn {
		background-color: white;
		border-radius: 10px;
		border-color:rgb(240, 130, 120);
		height:40px;
	}
	
	 #memPwd:focus{
	 		border-color:rgb(240, 130, 120);
	 		border-radius: 10px;              
        }

	/* 택배목록 조회 */
	/* 테이블의 전체적인 스타일 */
	table.list-area {
	width: 80%; /* 테이블 너비 */
	margin: 20px auto; /* 중앙 정렬을 위한 마진 설정 */
	border-collapse: collapse; /* 경계선 겹치게 */
	text-align: center; /* 모든 텍스트 중앙 정렬 */
	background-color: #f8f8f8; /* 배경 색상 */
	}

	/* 테이블 헤더 스타일 */
	table.list-area thead {
	background-color: #007bff; /* 헤더 배경 색상 */
	color: #ffffff; /* 헤더 폰트 색상 */
	}

	/* 테이블 헤더의 셀 스타일 */
	table.list-area th {
	padding: 15px 0; /* 헤더 셀의 상하 패딩 */
	border: 1px solid #dddddd; /* 경계선 색상 */
	}

	/* 테이블 바디의 셀 스타일 */
	table.list-area td {
	padding: 10px 0; /* 바디 셀의 상하 패딩 */
	border: 1px solid #dddddd; /* 경계선 색상 */
	}

	/* 배송조회 버튼 스타일 */
	.deliveryStatusBtn {
	padding: 8px 16px; /* 버튼 내부 여백 */
	font-size: 14px; /* 폰트 크기 */
	color: #ffffff; /* 폰트 색상 */
	background-color: #28a745; /* 배경 색상 */
	border: none; /* 경계선 제거 */
	border-radius: 5px; /* 경계선 둥글게 */
	cursor: pointer; /* 마우스 오버 시 커서 변경 */
	}

	.deliveryStatusBtn:hover {
	background-color: #218838; /* 마우스 오버 시 배경 색상 변경 */
	}

	#hos_wrap {
        display: flex;
        border-right: 1px solid black;
        box-sizing: border-box;
      }
      #hos_wrap > div {
        height: 100%;
      }
      #hos_wrap div {
        border: 0px;
      }

      #hos1 {
        width: 80%;
      }
      #hos2 {
        width: 20%;
      }
      #hos1_1 {
        height: 20%;
      }
      #hos1_1 > div {
        display: inline-block;
        margin-left: 10px;
        margin-top: 10px;
        color: rgb(55, 108, 200);
      }
      #hos1_2 {
        height: 30%;
      }
      #hos1_2 > div {
        display: inline-block;
        margin-top: 6px;
        margin-left: 10px;
        font-size: 20px;
        font-weight: bold;
      }
      #hos1_3 {
        height: 30%;
      }
      #hos1_3 > div {
        display: inline-block;
        margin-left: 10px;
      }
      #hos1_3_1 {
        height: 70%;
      }
      #hos1_3_2 {
        height: 30%;
      }
      #hos1_3_2 > div {
        display: flex;
      }
      #hos1_4 {
        height: 20%;
      }
      #hos1_4 > div {
        display: inline-block;
        width: 40px;
        text-align: center;
        margin-left: 10px;
        margin-top: 3px;
      }

      #hos2_1 {
        height: 30%;
      }
      #hos2_2 {
        height: 70%;
      }
      #hos2_1 p {
        transform: scale(1);
        display: inline-block;
        padding-left: 10px;
        padding-bottom: 20px;
      }
      #hos2_2_1 {
        text-align: center;
        margin-left: 8px;
        margin-top: 70px;
        width: 80%;
        white-space: nowrap;
        font-size: 14px;
      }
      .hos_wrap_jm {
        display: flex;
        height: 150px;
        width: 500px;
        border: 1px solid black;
        border-radius: 10px;
      }
      .hos_wrap_jm > div {
        height: 100%;
      }
      #hos_wrap {
        width: 80%;
      }
      #hos_wrap2 {
        width: 20%;
        padding-left: 20px;
        margin-top: 40px;
      }
	  /* 택배 발송 모달 style */
	  .modal5 {
      display: none; /* 기본적으로 모달을 보이지 않게 함 */
      position: fixed; /* 스크롤 시에도 항상 같은 위치에 표시 */
      z-index: 1; /* 다른 요소보다 위에 표시됨 */
      left: 0;
      top: 0;
      width: 100%; /* 부모 요소인 <body>에 꽉 차도록 너비 설정 */
      height: 100%; /* 뷰포트에 꽉 차도록 높이 설정 */
      overflow: auto; /* 내용이 넘칠 경우 스크롤 가능 */
      background-color: rgba(0,0,0,0.4); /* 반투명 배경 */
   }
   /* Modal content style */
   .modal-content5 {
      background-color: #fefefe;
      position: absolute; /* 절대 위치 지정 */
      top: 20%; /* 위에서부터 10%의 위치에 배치 */
      right: 29%; /* 오른쪽에서부터 10%의 위치에 배치 */
      padding: 20px;
      border: 1px solid #888;
      width: 50%; /* 가로 크기를 50%로 설정하여 작게 표시 */
      max-width: 600px; /* 최대 가로 크기 설정 */
      transform: translateX(0%); /* 필요한 경우 위치 조정 */
   }
   /* Close button style */
   .close5 {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
   }
   .close5:hover,
   .close5:focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
   }
	
	
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="main-panel">
		<div class="content-wrapper" style="background-color: white;">
			<div class="myPage">
				<h2 align="center" style="color: gray;">마이페이지</h2>
				<br>
				<div id="myPage-tab">
				
					<c:choose>
						<c:when test="${ loginUser.memId eq 'admin' }">
							<ul>						
							<li id="info"><a href="myInfo.me" class="tab active">회원관리</a></li>
							<li id="heart"><a onclick="myDiagnosisInfo();" class="tab">진료내역</a></li>
							<li id="review"><a onclick="myReviewList();" class="tab">리뷰 리스트</a></li>
							<li id="delivery"><a onclick="myDeliveryList();" class="tab">택배 리스트</a></li>
							<li id="documents"><a onclick="myDocumentList();" class="tab">문서함</a></li>
							</ul>
						</c:when>
						<c:otherwise> 
							<ul>						
								<li id="info"><a href="myInfo.me" class="tab active">내정보</a></li>
								<li id="heart"><a onclick="myDiagnosisInfo();" class="tab">진료내역</a></li>
								<li id="review"><a onclick="myReviewList();" class="tab">리뷰 리스트</a></li>
								<li id="delivery"><a onclick="myDeliveryList();" class="tab">택배 리스트</a></li>
								<li id="documents"><a onclick="myDocumentList();" class="tab">문서함</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
				
				
				<div class="myPage-info">
				
					<c:choose>
						<c:when test="${ loginUser.memId eq 'admin' }">
							<div id="selectMember" align="center">
								<div id="adminMember">
								<h4 align="center">관리자 비밀번호 입력</h4>
									<br><br><br>
									<form action="moveAdminMemberCheck.me">
										<input id="memPwd" name="memPwd" type="password" style="border-radius:10px;" required>
										<input id="memId" name="memId" type="hidden" value="${ loginUser.memId }">
										<br><br>
										<button id="pwdBtn" type="submit">회원관리 이동</button>
									</form>
								</div>		
							</div>
						</c:when>
						<c:otherwise>					
							<!-- 내 정보 -->
							<div id="myInfo" class="info active">
								<form action="update.me" method="post">
									<table id="myInfoTb">
										<tr>
											<td width="100">아이디</td>
											<c:choose>
												<c:when test="${ loginUser.enrollType eq 'K' }">
													<td colspan="2">
														<input type="text" name="memId" value="카카오계정입니다." readonly>
													</td>
												</c:when>
												<c:when test="${ loginUser.enrollType eq 'N' }">
													<td colspan="2">
														<input type="text" name="memId" value="네이버계정입니다." readonly>
													</td>
												</c:when>
												<c:otherwise>
													<td colspan="2">
														<input type="text" name="memId" value="${ loginUser.memId }" readonly>
													</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<td>이&nbsp;&nbsp;&nbsp;름</td>
											<td colspan="2">
												<input type="text" name="memName" value="${ loginUser.memName }" readonly> 
												<span id="nameMsg" class="message" style="display: none"></span>
											</td>
										</tr>
										<tr>
											<td>닉네임</td>
											<td colspan="2">
												<input type="text" name="nickName" value="${ loginUser.nickName }">
												<span id="nicknameMsg" class="message" style="display: none"></span>
											</td>
										</tr>
										<tr>
											<td>번&nbsp;&nbsp;&nbsp;호</td>
											<td colspan="2">
												<input type="text" name="phone" value="${ loginUser.phone }">
											</td>
										</tr>
										<tr>
											<td>이메일</td>
											<td colspan="2"><input type="text" name="email" value="${ loginUser.email }"></td>
										</tr>
										<tr>
											<td>우편번호</td>
											<td colspan="2">
												<input id="myPostcode" type="text" name="postcode" placeholder="우편번호" value="${ loginUser.postcode }" readonly>
											</td>
										</tr>
										<tr>
											<td>주소</td>
											<td>
												<input id="myAddress" type="text" name="address" value="${ loginUser.address }" style="font-size: 15px;" placeholder="주소를 검색해주세요." readonly>
											</td>
											<td>
												<a onclick="myExecDaumPostcode()" id="addressBtn">주소 검색</a>
											</td>
										</tr>
										<tr>
											<td>상세주소</td>
											<td colspan="2">
												<input id="myDetailAddress" type="text" name="detailAddr" value="${ loginUser.detailAddr }" style="font-size: 15px;">
											</td>
										</tr>
										<tr>
											<td>참고항목</td>
											<td colspan="2">
												<input id="myExtraAddress" type="text" name="extraAddr" placeholder="참고항목" value="${ loginUser.extraAddr } " readonly>
											</td>
										</tr>
									</table>
									<button type="submit" class="btn">회원정보 수정</button>
								</form>
								<a id="leaveBtn" data-toggle="modal" data-target="#deleteForm"
									style="color: rgb(177, 177, 177); cursor: pointer;"> 회원 탈퇴 ></a>
							</div>
						</c:otherwise>
					</c:choose>
					

					<!-- 주소 검색 -->
					<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script>
						function myExecDaumPostcode() {
							new daum.Postcode({
								oncomplete: function(data) {
									// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					
									// 각 주소의 노출 규칙에 따라 주소를 조합한다.
									// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
									var addr = ''; // 주소 변수
									var extraAddr = ''; // 참고항목 변수
					
									//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
									if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
										addr = data.roadAddress;
									} else { // 사용자가 지번 주소를 선택했을 경우(J)
										addr = data.jibunAddress;
									}
					
									// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
									if(data.userSelectedType === 'R'){
										// 법정동명이 있을 경우 추가한다. (법정리는 제외)
										// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
										if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
											extraAddr += data.bname;
										}
										// 건물명이 있고, 공동주택일 경우 추가한다.
										if(data.buildingName !== '' && data.apartment === 'Y'){
											extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
										}
										// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
										if(extraAddr !== ''){
											extraAddr = ' (' + extraAddr + ')';
										}
										// 조합된 참고항목을 해당 필드에 넣는다.
										document.getElementById("myExtraAddress").value = extraAddr;
									
									} else {
										document.getElementById("myExtraAddress").value = '';
									}
					
									// 우편번호와 주소 정보를 해당 필드에 넣는다.
									document.getElementById('myPostcode').value = data.zonecode;
									document.getElementById("myAddress").value = addr;
									// 커서를 상세주소 필드로 이동한다.
									document.getElementById("myDetailAddress").focus();
								}
							}).open();
						}
					</script>
					
					<script>
						function myDiagnosisInfo(){
							$.ajax({
								url:"diagnosis.select",
								data:{memNo:"${ loginUser.memNo }"},
								success:function(data){
									console.log(data);
									
									var value = "";
									for(var i=0; i<data.length;i++){
										value +=  "<div id='hos_wrap' style='width: 400px; height: 130px; margin:auto; margin-top:30px; border:1px solid black; border-radius:15px;'>"
										      + "<div id='hos1'>"
										      +  "<div id='hos1_1'>"
										      +    "<div>"+ data[i].title+" | "+data[i].id+"</div>"
										      +  "</div>"
										      +  "<div id='hos1_2'><div style='white-space:nowrap;'>"+ data[i].hosCode +"</div></div>"
										      +  "<div id='hos1_3'>"
										      +    "<div id='hos1_3_1'> 예약 날짜 :" +data[i].start + "</div>"
										      +    "<br />"
										      +    "<div id='hos1_3_2'> 접수한 날짜 :" + data[i].orderToday + "</div>"
										      +  "</div>"
										      +  "<div id='hos1_4'></div>"
										      +"</div>"
										      +"<div id='hos2'>"
										      +  "<div id='hos2_1' style='background-color: '" + data[i].backgroundColor+"';'>"
										      +    "<p>"+data[i].groupId+"</p>"
										      +  "</div>"
										      +  "<div id='hos2_2'>"
										      +    "<div id='hos2_2_1'></div>"
										      +  "</div>"
										      +"</div>"
										      +"</div>"
										      
									}
									
								      $(".myPage-info").html(value);
								      
								}, error:function(){
									console.log("ajax 통신실패");
								}
							})
						}
					</script>
					

					<script>
						$(function() {
							const tabList = $(".tab");
							const infoList = $(".info");

							tabList.click(function() {
								tabList.removeClass("active");
								infoList.removeClass("active");

								$(this).addClass("active");
								infoList.eq(tabList.index(this)).addClass("active");
							});

						});
						
						
						function myReviewList(){		
							$.ajax({
								url:"myReview.rv",
								data:{memNo: "${loginUser.memNo}",
									  memId: "${loginUser.memId}"},
								success:function(data){

									let value = "";
									let span = "";
									console.log(data);
									if(data.length != 0){
										value += '<div class="myReview" class="info">'
										   	   + '<div class="reviewList">'
										   	   + '<div class="review-div">'
										   	   + '<span>리뷰 총 (' + data.length + '개)</span>';
										   	   
										for(let i in data){
											value += '<div class="myreview">'
												   + '<div class="myreview1">'
												   + '<div class="hpName"><p>' + data[i].hosName + '</p></div>'
												   + '<div class="hpStar"><img src="resources/reviewImg/starHeart/star2.png" class="starImg"></div>'
												   + '<div class="hpRate"><p>' + data[i].rate + '</p></div>';
												   
											if(${loginUser.memNo} == data[i].memNo || "${loginUser.memId}" == "admin"){
											   value += "<div class='hpDel'><button class='delBtn' onclick=\"location.href='delete.rv?revNo=" + data[i].revNo + "'\">삭제</button></div>";
											}
											   
							   				value += '</div>'
												   + '<div class="myreview2">'
												   + '<div class="rvProfile">'
												   + '<div class="nickName"><p>' + data[i].nickName + '</p></div>'
												   + '<div class="profile"><img src="resources/reviewImg/profile/profile1.png" class="profileImg"></div>'
												   + '</div>'
												   + '<div class="rvCont">'
												   + '<p>' + data[i].revContent  + '</p>'
												   + '</div>'
												   + '</div>'
												   + '</div>';
										}
										
											value += '</div>'
												   + '</div>'
												   + '</div>';
									}else{
										value += '<div class="myReview" class="info">'
										   	   + '<div class="reviewList">'
										   	   + '<div class="review-div">'
											   + '<div class="myreview">'
											   + '<div class="myreview1" style="height:130px; text-align:center; padding-top:60px;"><p style="font-size:18px;">작성한 리뷰가 없습니다. 리뷰를 작성해주세요 😊</p></div>'
											   + '</div>'
											   + '</div>'
											   + '</div>'
											   + '</div>';
									}
										
										$(".myPage-info").html(value);

								}, error:function(){
									console.log("내리뷰 목록조회 ajax 통신 실패");
								}
							})
						}

						function myDocumentList(){
							$.ajax({
								url:"selectList.dc",
								data:{memNo : "${ loginUser.memNo }"},
								success:function(list){
									console.log(list);
									let value ="";
									    value += "<h3 style'margin-left: 30px;'>처방전 목록</h3><br><br>"
											   + '<div class="document-outer">';
									for(let i in list){

									value += '<div class="prescription">'
												
											+ '<div class="hosName">'
											+  list[i].memName
											+ "</div>"

											+ '<div class="psDate">'
											+  list[i].dcUploadDate
											+ "</div>"

											+ '<div class="psImgDiv">'
											+ '<img class="psImg" src="'+ list[i].dcChangeName +'">'
											+ "</div>"

											// 모달 추가하는 부분
											+ '<div class="modal2" id="myModal'+ i +'">'
											+   '<div class="modal-content2">'

											+ '<div class="modal-header">'
									        +    '<h3 class="modal-title" style="padding-left:290px">처방전</h3>'
									        +    '<button type="button" class="close" data-dismiss="modal">&times;</button>'
								            + '</div>'

											+ '<div class="modal-body" align="center">'
											+    '<img class="modalPsImg" src="'+ list[i].dcChangeName +'">'	
											+ '</div>'
											+ '<div class="modal-footer">';
											if("${loginUser.mtId}" == "M"){
												value	+=    "<button onclick=\"location.href='selectList.ph?dcNo=" + list[i].dcNo +"'\" type='button' class='btn btn-success dcBtn'>"
														+    '처방전 전송'
														+    '</button>';
											} else if("${loginUser.mtId}" == "P"){
												value	+=    "<button onclick='showDeliveryModal("+ list[i].dcNo +");' type='button' class='btn btn-primary dcBtn'>"
														+    '택배 발송'
														+    '</button>';
											}																
									 value +=     "<button data-dcno='"+ list[i].dcNo +"' type='button' class='btn btn-danger dcBtn deleteBtn'>"
											+    '삭제'
											+    '</button>'
								            + '</div>'


											+   '</div>'
											+ '</div>'	
											// 여기까지 모달부분! 


											+ "</div>";	
									}
									value += "</div>";

									$(".myPage-info").html(value);

									$('.prescription').on('click', function(){
										var modalId = 'myModal' + $(this).index();
										$('#' + modalId).show();
									});

									// 모달 x 버튼 -> 모달 닫기
									$(document).on('click', '.close', function() {
										$(this).closest('.modal2').hide();
									});


								},
								error:function(){
									console.log("문서함조회 ajax호출 실패!");
								}
							})
						}
						
						$('.myPage-info').on('click', '.deleteBtn', function(e){
							e.preventDefault(); // 기본 동작 방지.
							var dcNo = $(this).data('dcno'); // dcNo를 data 속성에서 가져옵니다.

							// alertify.confirm 사용
							alertify.confirm('정말 삭제하시겠습니까?', '삭제시, 처방전을 복구 할 수 없습니다.', function(){
								// 사용자가 '확인'을 클릭했을 때 실행될 로직
								location.href = 'delete.dc?dcNo=' + dcNo; // 삭제 요청을 보냅니다.
							}, function(){
								// 사용자가 '취소'를 클릭했을 때 실행될 로직
								// 필요한 경우 여기에 코드를 추가할 수 있습니다. 예를 들어, 어떤 피드백을 주거나 로깅을 할 수 있습니다.
							}).set('labels', {ok:'확인', cancel:'취소'}); // 버튼 텍스트를 원하는 대로 설정할 수 있습니다.
						});
						

						

						function showDeliveryModal(dcNo) {
							// 모달 HTML 구성
							var modalHTML = `
							<div id="deliveryModal" class="modal5">
								<div class="modal-content5">
									<span class="close5">&times;</span>
									<form id="deliveryForm">
										<label for="courier">택배사:</label>
										<select id="courier" name="courier">
											<option value="롯데택배">롯데택배</option>
											<option value="로젠택배">로젠택배</option>
											<option value="CJ대한통운">CJ대한통운</option>
											<option value="우체국택배">우체국택배</option>
										</select>
										<label for="trackingNumber">운송장 번호:</label>
										<input type="text" id="trackingNumber" name="trackingNumber">
										<input type="submit" value="택배 정보 전송">
									</form>
								</div>
							</div>
							`;
							$("body").append(modalHTML); // body 태그의 끝에 모달 추가
							$("#deliveryModal").show(); // 모달 보이기

							// 모달의 x 버튼 클릭 시 모달 닫기
							$("#deliveryModal .close5").click(function() {
								$("#deliveryModal").remove(); // 모달 제거
								
							});

							// 택배 정보 전송 폼 제출 이벤트
							$("#deliveryForm").submit(function(event) {
								event.preventDefault(); // 폼 기본 제출 동작 방지
								
								// 택배 정보 수집(예: AJAX를 이용하여 서버로 전송)
								var courier = $("#courier").val();
								var trackingNumber = $("#trackingNumber").val();

								$.ajax({
									url:"insert.dl",
									data:{ dcNo : dcNo
									     , courier : courier
										 , billingNo : trackingNumber
										 },
									success:function(result){
										alertify.alert("택배 발송에 성공했습니다.", function() {
											// 'prescription' 클래스를 가진 모든 요소를 대상으로 하여, 해당 dcNo에 해당하는 항목을 찾아서 DOM에서 제거한다.
											$(".prescription").each(function() {
												var currentDcNo = $(this).find(".deleteBtn").data("dcno");
												if(currentDcNo == dcNo){
													$(this).remove(); // 해당 처방전 항목을 찾았다면 DOM에서 제거한다.
												}
											});
										});
									},
									error:function(){
										console.log("택배 발송에 실패하였습니다.")
									}
								})




								

								$('.modal2').hide();
								$("#deliveryModal").remove(); // 정보 전송 후 모달 제거
								
							});
						}


						function showDeliveryModal(dcNo) {
							// 모달 HTML 구성
							var modalHTML = `
							<div id="deliveryModal" class="modal5">
								<div class="modal-content5">
									<span class="close5">&times;</span>
									<form id="deliveryForm">
										<label for="courier">택배사:</label>
										<select id="courier" name="courier">
											<option value="롯데택배">롯데택배</option>
											<option value="로젠택배">로젠택배</option>
											<option value="CJ대한통운">CJ대한통운</option>
											<option value="우체국택배">우체국택배</option>
										</select>
										<label for="trackingNumber">운송장 번호:</label>
										<input type="text" id="trackingNumber" name="trackingNumber">
										<input type="submit" value="택배 정보 전송">
									</form>
								</div>
							</div>
							`;
							$("body").append(modalHTML); // body 태그의 끝에 모달 추가
							$("#deliveryModal").show(); // 모달 보이기

							// 모달의 x 버튼 클릭 시 모달 닫기
							$("#deliveryModal .close5").click(function() {
								$("#deliveryModal").remove(); // 모달 제거
								
							});

							// 택배 정보 전송 폼 제출 이벤트
							$("#deliveryForm").submit(function(event) {
								event.preventDefault(); // 폼 기본 제출 동작 방지
								
								// 택배 정보 수집(예: AJAX를 이용하여 서버로 전송)
								var courier = $("#courier").val();
								var trackingNumber = $("#trackingNumber").val();

								$.ajax({
									url:"insert.dl",
									data:{ dcNo : dcNo
									     , courier : courier
										 , billingNo : trackingNumber
										 },
									success:function(result){
										alertify.alert("택배 발송에 성공했습니다.", function() {
											// 'prescription' 클래스를 가진 모든 요소를 대상으로 하여, 해당 dcNo에 해당하는 항목을 찾아서 DOM에서 제거한다.
											$(".prescription").each(function() {
												var currentDcNo = $(this).find(".deleteBtn").data("dcno");
												if(currentDcNo == dcNo){
													$(this).remove(); // 해당 처방전 항목을 찾았다면 DOM에서 제거한다.
												}
											});
										});
									},
									error:function(){
										console.log("택배 발송에 실패하였습니다.")
									}
								})




								

								$('.modal2').hide();
								$("#deliveryModal").remove(); // 정보 전송 후 모달 제거
								
							});
						}


						function myDeliveryList(){
							$.ajax({
								url:"selectList.dl",
								data:{memNo: "${loginUser.memNo}"},
								success:function(data){
									console.log(data);
									var value = '<div id="myDelivery" class="info">'
											  + '<span>게시판</span> <br />'
											  + '<table class="list-area" align="center" border="1">'
						                      + '<thead>'
											  + '<tr>'
											  + '<th width="100">택배번호</th>'
											  + '<th width="100">택배회사</th>'
											  + '<th width="200">약국 명</th>'
											  + '<th width="200">운송장번호</th>'
											  + '<th width="100">배송조회</th>'
											  + '</tr>'
											  + '</thead>';
									for(var i=0; i<data.length;i++){
										value += '<tbody>'
											  +	'<tr>'
											  + '<td>'+ (i+1) +'</td>'
											  + '<td>'+ data[i].courier +'</td>'
											  + '<td>'+ data[i].memName +'</td>'
											  + '<td>'+ data[i].billingNo +'</td>'
											  + '<td><button class="deliveryStatusBtn">배송조회</button></td>'
											  + '</tr>'
											  + '</tbody>';	
									}
										value += '</table>'
											  +  '</div>';

									$(".myPage-info").html(value);
								},
								error:function(){
									
								}
							})

						}

						$(document).on('click', '.deliveryStatusBtn', function() {
							// 배송 조회 버튼이 속한 행에서 데이터 추출
							var tr = $(this).closest('tr'); // 버튼이 속한 행(tr) 선택
							var invoiceNumber = tr.find('td:eq(3)').text(); // 운송장 번호

							var courierCode = "";
							// var courierCode = tr.find('td:eq(1)').text(); // 택배사 코드
							if(tr.find('td:eq(1)').text() == "롯데택배"){
								courierCode = "08";
							} else if(tr.find('td:eq(1)').text() == "CJ대한통운"){
								courierCode = "04";
							} else if(tr.find('td:eq(1)').text() == "로젠택배"){
								courierCode = "06";
							} else if(tr.find('td:eq(1)').text() == "우체국택배"){
								courierCode = "01";
							}

							window.open('http://info.sweettracker.co.kr/tracking/4?t_key=4EuQNNywElBKav3MX8HYkA&t_code='+ courierCode +'&t_invoice=' + invoiceNumber, 'DeliveryStatusWindow', 'width=600, height=600, left=400, top=200');
						});
						
						

						












					
					 




						
						
						// 이름 실시간 체크
						$("#myInfo input[name=userName]").on(
							"propertychange change paste input",
							function () {
							// 이름: 한글 2자 이상 10자 이내
							const regExp = /^[가-힣]{2,10}$/;

							const msg = $("#nameMsg");

							if (!regExp.test($(this).val())) {
								msg.css("display", "block");
								msg.text("* 이름: 2~10자의 한글만 사용 가능합니다.");
							} else {
								msg.css("display", "none");
								msg.text("");
							}
							}
						);

						// 비밀번호 실시간 체크
						$("input[name=newPwd]").on("propertychange change paste input", function() {
							// 비밀번호: 영문(대소문자 구분), 숫자, 특수문자(!@#$%^&*) 포함 8자 이상 15자 이내
							const regExp = /^[a-zA-Z\d!@#$%^&*]{8,15}$/;

							const msg = $("#newPwdMsg");

							if(!regExp.test($(this).val())) {
								msg.css("display", "block");
								msg.text("* 8~15자의 영문, 숫자, 특수기호(!@#$%^&*)만 사용 가능합니다.");
							} else {
								msg.css("display", "none");
								msg.text("");
							}
						});

						// 비밀번호 확인 실시간 체크
						$("#newPwdCheck").on("propertychange change paste input", function() {
							// 비밀번호 확인: 위에 입력한 비밀번호와 동일한지 확인
							const msg = $("#newPwdCheckMsg");

							if($(this).val() != $("input[name=newPwd]").val()) {
								msg.css("display", "block");
								msg.text("* 입력한 비밀번호와 일치하지 않습니다.");
							} else {
								msg.css("display", "none");
								msg.text("");
							}
						});

						$("#changePwdBtn").on('click', function () {
							$("#changePwdTB input").val("");
							$("#changePwdTB span").text("");
						});

						$("#leaveBtn").on("click", function() {
							$("#leaveMemTB input").val("");
							$("#leaveMemTB span").text("");
						})

						// 개인정보 수정하기 버튼 클릭 시, 유효성 검사
						function validate() {
						const nameInput = $("#myInfo input[name=userName]");
						const nicknameInput = $("#myInfo input[name=nickname]");

						// 이름: 한글 2자 이상 10자 이내
						regExp = /^[가-힣]{2,10}$/;

						msg = $("#nameMsg");

						if (!regExp.test(nameInput.val())) {
							msg.css("display", "block");
							msg.text("* 이름: 2~10자의 한글만 사용 가능합니다.");

							nameInput.select();

							return false;
						}

						// 닉네임: 영문, 한글, 숫자, _ 포함 2자 이상 10자 이내
						regExp = /^[가-힣\w]{2,10}$/;

						msg = $("#nicknameMsg");

						if (!regExp.test(nicknameInput.val())) {
							msg.css("display", "block");
							msg.text("* 2~10자의 영문, 한글, 숫자, 특수문자(_)만 사용 가능합니다.");

							nicknameInput.select();

							return false;
						} else if (msg.text() != "") {
							nicknameInput.select();

							return false;
						}
						}

						// 변경 버튼 클릭 시, 유효성 검사
						function modalValidate() {
						const currentPwdInput = $("input[name=currentPwd");
						const newPwdInput = $("input[name=newPwd]");
						const newPwdCheckInput = $("#newPwdCheck");

						// 현재 비밀번호 : 비어 있으면 안 된다.
						let msg = $("#currentPwdMsg");

						if(currentPwdInput.val() === "") {
							msg.css("display", "block");
							msg.text("* 현재 비밀번호를 입력해주세요.");
							
							currentPwdInput.select();

							return false;
						}

						// 비밀번호: 영문(대소문자 구분), 숫자, 특수문자(!@#$%^&*) 포함 8자 이상 15자 이내
						regExp = /^[a-zA-Z\d!@#$%^&*]{8,15}$/;

						msg = $("#newPwdMsg");

						if(!regExp.test(newPwdInput.val())) {
							msg.css("display", "block");
							msg.text("* 8~15자의 영문, 숫자, 특수기호(!@#$%^&*)만 사용 가능합니다.");

							newPwdInput.select();

							return false;
						}

						// 비밀번호 확인: 위에 입력한 비밀번호와 동일한지 확인
						msg = $("#newPwdCheckMsg");

						if(newPwdCheckInput.val() != newPwdInput.val()) {
							msg.css("display", "block");
							msg.text("* 입력한 비밀번호와 일치하지 않습니다.");

							newPwdCheckInput.select();

							return false;
						}
						}

					</script>
					
					
					
					<!-- 회원 탈퇴시 보여질 Modal -->
					<!-- The Modal -->
					<div class="modal" id="deleteForm">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title">회원 탈퇴</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<!-- Modal body -->
								<div class="modal-body" align="center">

									<b>
										&nbsp;&nbsp;&nbsp;탈퇴 후 복구가 불가능합니다. <br>   
                                   				정말로 탈퇴 하시겠습니까?
                   					</b>
									<br><br>
									<form action="delete.me" method="post">
										
										비밀번호 : 
											&nbsp;&nbsp;&nbsp;
											<input type="hidden" name="memId" value="${ loginUser.memId }">
											<input type="password" name="memPwd" required>
											<button class="btn btn-sm btn-danger" type="submit" style="width: 100px; height: 40px; margin-top: 20px;">탈퇴하기</button>
										
									</form>
								</div>

								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
								</div>

							</div>
						</div>
					</div>

					<!-- 택배 목록 -->
					<div id="myDelivery" class="info" style="display: none;">
						<!-- 게시판 목록-->
						<span>게시판</span> <br />
						<table class="list-area" align="center">
							<thead>
								<tr>
									<th width="100">택배번호</th>
									<th width="200">택배회사</th>
									<th width="350">약국 명</th>
									<th width="100">운송장번호</th>
									<th width="100">배송상태</th>
									<th width="150">배송조회</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>