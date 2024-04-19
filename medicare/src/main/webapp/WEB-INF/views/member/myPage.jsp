<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
	.myPage {
		width: 1000px;
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
		margin-left: 40px;
	}

	#heart, #review {
		margin-right: 40px;
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
		font-size: 18px;
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

	#myInfo input:disabled {
		background-color: lightgray;
	}

	/* 배송지 등록 버튼 */
	#addressBtn {
		color: white;
		margin: 0px 20px;
		float: right;
		font-size: 16px;
		width: 150px;
		height: 50px;
		background-color: #F96C85;
		border-radius: 15px;
		margin: auto;
		line-height: 50px;
		cursor: pointer;
		text-decoration: none;
		border: none;
		margin-top: 20px;
		margin-right: 10px;
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

	/* 리뷰리스트 span */
	#review-div span {
	display: block;
	margin-top: 50px;
	margin-right: 30px;
	text-align: right;
	font-weight: 600;
    font-size: 18px;
    color: gray;
	}

	/* 리뷰리스트 */
	#reviewList{
		width: 1000px;
		margin: auto;
		display: flex;
		justify-content: center;
		height: 1300px;
	}

	#review-div{
		width: 800px;
		height: 500px;
	}

	#myreview{
		width: 600px;
		height: 250px;
		border: 2px solid #F96C85;
		border-radius: 10px;
		margin: 50px 100px;
	}

	#myreview1{
		width: 600px;
		height: 50px;
	}

	#myreview1>div{
		float: left;
		height: 50px;
	}

	/* 병원이름 */
	#hpName{
		width: 180px;
	}

	#hpName p{
		margin-top: 25px;
		margin-left: 15px;
		font-size: 20px;
		font-weight: bold;
		color: rgb(58, 58, 58);
		
	}

	/* 별 이미지 */
	#hpStar{
		width: 35px;
		padding-top: 17px;
	}

	/* 별점 */
	#hpRate{
		width: 300px;
	}

	#hpRate p{
		margin-top: 25px;
		font-size: 19px;
		font-weight: bold;
		color: rgb(58, 58, 58);
	}

	/* 하트 */
	#hpHeart{
		width: 50px;
		float: right;
		padding-top: 17px;
	}

	#starImg, #heartImg{
		width: 25px;
		height: 25px;
		margin-top: 3px;
	}

	/* 리뷰 큰 div */
	#myreview2{
		width: 600px;
		height: 200px;
		
	}

	#myreview2>div{
		float: left;
		
	}

	/* 리뷰 닉네임, 프로필사진 감싼 div */
	#rvProfile{
		width: 100px;
	}

	#rvProfile>div{
		width: 100%;
	}

	#nickName{
		height: 50px;
		margin-left: 20px;
		margin-top: 15px;
		color: gray;
	}

	#nickName>p{
		text-align: center;
		padding-top: 15px;
		font-size: 20px;
		font-weight: bold;
	}
	/* 리뷰 프로필 이미지 담긴 div */
	#profile{
		height: 100px;
		margin-left: 20px;
		padding-left: 2px;
	}

	/* 리뷰프로필 이미지 */
	#profileImg{
		width: 90px;
		height: 90px;
	}

	#rvCont{
		width: 400px;
		height: 150px;
		border-radius: 10px;
		margin-left: 35px;
		margin-top: 15px;
		padding-top: 40px;
		padding-left: 15px;
		background-color: rgb(242, 242, 242);
		

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
					<ul>
						<li id="info"><a class="tab active">내정보</a></li>
						<li id="heart"><a class="tab">좋아요 리스트</a></li>
						<li id="review"><a class="tab">내가 쓴 리뷰</a></li>
						<li id="delivery"><a class="tab">택배 목록</a></li>
					</ul>
				</div>
				<div class="myPage-info">
					<!-- 내 정보 -->
					<div id="myInfo" class="info active">
						<form action="update.me" method="post">
							<table>
								<tr>
									<td width="100">아이디</td>
									<td>
										<input type="text" name="memId" value="${ loginUser.memId }" readonly>
									</td>
								</tr>
								<tr>
									<td>이&nbsp;&nbsp;&nbsp;름</td>
									<td>
										<input type="text" name="memName" value="${ loginUser.memName }" readonly> 
										<span id="nameMsg" class="message" style="display: none"></span>
									</td>
								</tr>
								<tr>
									<td>닉네임</td>
									<td>
										<input type="text" name="nickName" value="${ loginUser.nickName }">
										<span id="nicknameMsg" class="message" style="display: none"></span>
									</td>
								</tr>
								<tr>
									<td>번&nbsp;&nbsp;&nbsp;호</td>
									<td>
										<input type="text" name="phone" value="${ loginUser.phone }">
									</td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><input type="text" name="email" value="${ loginUser.email }"></td>
								</tr>
								<tr>
									<td>주소</td>
									<td>
										<input type="text" name="address" value="${ loginUser.address }" style="font-size: 15px;">
									</td>
								</tr>
								<tr>
									<td>상세주소</td>
									<td>
										<input type="text" name="detailAddr" value="${ loginUser.detailAddr }" style="font-size: 15px;">
									</td>
								</tr>
								<tr>
									<td colspan="2"><a href="enrollForm.dv" id="addressBtn">주소 수정</a></td>
								</tr>
							</table>
							<button type="button" class="btn" id="changePwdBtn"
								data-toggle="modal" data-target="#changePwd">비밀번호 변경</button>
							<button type="submit" class="btn">회원정보 수정</button>
						</form>
						<a id="leaveBtn" data-toggle="modal" data-target="#deleteForm"
							style="color: rgb(177, 177, 177); cursor: pointer;"> 회원 탈퇴 ></a>
					</div>

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
							
							$("#info").click(function(){
								$(".myPage-info").html($("#myInfo").html());
								$("#myInfo").css("display", "block");
							});
							
							$("#heart").click(function(){
								$(".myPage-info").html($("#myMark").html());
								console.log($(".myPage-info").html());
								$("#myInfo").css("display", "block");
							});
							
						    $("#review").click(function(){
						    	$(".myPage-info").html($("#myReview").html());
								$("#myInfo").css("display", "block");
						    });
						    
						    $("#delivery").click(function(){
						    	$(".myPage-info").html($("#myDelivery").html());
								$("#myInfo").css("display", "block");
						    });
						    
							/*
							$("#info").click(myInfoList);
							$("#heart").click(heartList);
						    $("#review").click(reviewList);
						    $("#delivery").click(deliveryList);
						    */
						});
						

						/* function myInfoList(){
							$(".myPage-info").html($("#myInfo").html());
						}
						
						function heartList() {
							$(".myPage-info").html($("#myMark").html());
						}

						function reviewList() {
							$(".myPage-info").html($("#myReview").html());
						}

						function deliveryList() {
							$(".myPage-info").html($("#myDelivery").html());
						} */
						
					</script>

					<!-- 비밀번호 변경 Modal -->
					<!-- The Modal -->
					<div class="modal" id="changePwd">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title">비밀번호 변경하기</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<!-- Modal body -->
								<div class="modal-body">
									<form action="" method="post">
										<input type="hidden" name="memNo" value="">
										<table id="changePwdTB">
											<tr>
												<td width="160">현재 비밀번호</td>
												<td width="210">
													<input type="password" name="currentPwd">
													
													<span id="currentPwdMsg" class="message" style="display: none"></span>
												</td>
											</tr>
											<tr>
												<br><br>
												<td>변경할 비밀번호</td>
												<td>
													<input type="password" name="newPwd">
													<span id="newPwdMsg" class="message" style="display: none"></span>
												</td>
											</tr>
											<tr>
												<td>변경할 비밀번호 확인</td>
												<td><input type="password" id="newPwdCheck"> 
													<span id="newPwdCheckMsg" class="message" style="display: none"></span>
												</td>
											</tr>
										</table>
										<button class="btn btn-warning" type="submit" onclick="return modalValidate();" style="margin-top: 20px;">변경</button>
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

					<!-- 내가 쓴 리뷰 -->
					<div id="myReview" class="info" style="display: none;">
						<div id="reviewList">
							<div id="review-div">
								<span>리뷰(총 23개)</span>
								<div id="myreview">
									<div id="myreview1">
										<div id="hpName"><p>하늘피부과</p></div>
										<div id="hpStar"><img src="resources/reviewImg/starHeart/star2.png" id="starImg"></div>
										<div id="hpRate"><p>3.5</p></div>
										<div id="hpHeart"><img src="resources/reviewImg/starHeart/heart-black2.png" id="heartImg"></div>
									</div>
									<div id="myreview2">
										<div id="rvProfile">
											<div id="nickName"><p>정밍</p></div>
											<div id="profile"><img src="resources/reviewImg/profile/profile1.png" id="profileImg"></div>
										</div>
										<div id="rvCont">
											<p> 이 피부과 진짜 추천이에여!! <br>
												완전 물광피부 됐어요 친구도 추천해줄라구요~
											</p>
										</div>
									</div>
								</div>
								<div id="myreview">
									<div id="myreview1">
										<div id="hpName"><p>하얀이비인후과</p></div>
										<div id="hpStar"><img src="resources/reviewImg/starHeart/star2.png" id="starImg"></div>
										<div id="hpRate"><p>4</p></div>
										<div id="hpHeart"><img src="resources/reviewImg/starHeart/heart-full.png" id="heartImg"></div>
									</div>
									<div id="myreview2">
										<div id="rvProfile">
											<div id="nickName"><p>정밍</p></div>
											<div id="profile"><img src="resources/reviewImg/profile/profile1.png" id="profileImg"></div>
										</div>
										<div id="rvCont">
											<p> 비염 때문에 이비인후과 자주가는데
												약도 잘들고 의사쌤 완전 친절하세요!!!!
											</p>
										</div>
									</div>
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