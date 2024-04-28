<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="${ pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet">
<script src="${ pageContext.request.contextPath }/resources/js/main.js"></script>

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
			<div class="myPage">
				<h2 align="center" style="color: gray;">마이페이지</h2>
				<br>
				<div id="myPage-tab" >
					<ul>
						<li id="info"><a href="doctorMyPage.in" class="tab active">내정보</a></li>
						<li id="review"><a onclick="myReviewList();" class="tab">내가 쓴 리뷰</a></li>
						<li id="documents"><a onclick="doctorPage();" class="tab">일정 관리</a></li>
					</ul>
				</div>
				<div class="myPage-info">
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
					<!-- 주소 검색 -->
					<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
								data:{memNo: "${loginUser.memNo}"},
								success:function(data){

									let value = "";
									let span = "";
									value += '<div class="myReview" class="info">'
									   	   + '<div class="reviewList">'
									   	   + '<div class="review-div">'
									   	   + '<span>리뷰 총 (' + data.length + '개)</span>';
									   	  
									for(let i in data){
										value += '<div class="myreview">'
											   + '<div class="myreview1">'
											   + '<div class="hpName"><p>' + data[i].hosName + '</p></div>'
											   + '<div class="hpStar"><img src="resources/reviewImg/starHeart/star2.png" class="starImg"></div>'
											   + '<div class="hpRate"><p>' + data[i].rate + '</p></div>'
											   + '<div class="hpHeart"><img src="resources/reviewImg/starHeart/heart-black2.png" class="heartImg"></div>'
											   + '</div>'
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
										
										$(".myPage-info").html(value);

								}, error:function(){
									console.log("내리뷰 목록조회 ajax 통신 실패");
								}
							})
						}
						
						function doctorPage(){
							location.href="calenderPage.in";
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

					<!-- 좋아요 리스트 -->
					<div id="myMark" class="info" style="display: none;">
						<span>좋아요 리스트입니당</span>
						<table id="rest-table" align="center"></table>
					</div>

					<!-- <div id="myReview" class="info">
					   <div id="reviewList">
					   	  <div id="review-div">
					   	  	  <span></span>
					   	  </div>
					   </div>
					</div> -->
					
					<!-- 택배 목록 -->
					<div id="myDelivery" class="info" style="display: none;">
						<!-- 게시판 목록-->
						<span>게시판</span> <br />
						<table class="list-area" align="center">
							<thead>
								<tr>
									<th width="100">작성번호</th>
									<th width="200">게시판유형</th>
									<th width="350">제목</th>
									<th width="100">작성자</th>
									<th width="100">조회수</th>
									<th width="150">작성일자</th>
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