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
	margin-top: 80px;
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
	margin-bottom: 50px;
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
	color: #F96C85;
	margin: 0px 20px;
	float: right;
	font-size: 16px;
	width: 150px;
	height: 50px;
	background-color: lightgray;
	border-radius: 15px;
	margin: auto;
	line-height: 50px;
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
	margin-top: 20px;
	margin-bottom: 10px;
}

.message {
	color: red;
	font-size: 13px;
	font-weight: bold;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="myPage">
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
						<form action="" method="post">
							<table>
								<tr>
									<td width="100">아이디</td>
									<td><input type="text" value="" disabled></td>
								</tr>
								<tr>
									<td>이&nbsp;&nbsp;&nbsp;름</td>
									<td><input type="text" name="userName" value=""> <span
										id="nameMsg" class="message" style="display: none"></span></td>
								</tr>
								<tr>
									<td>닉네임</td>
									<td><input type="text" name="nickname" value=""> <span
										id="nicknameMsg" class="message" style="display: none"></span>
									</td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><input type="text" value="" disabled></td>
								</tr>
								<tr>
									<td>배송지</td>
									<td><input type="text" value="서울특별시"
										style="font-size: 15px;"></td>
								</tr>
								<tr>
									<td colspan="2"><a href="enrollForm.dv" id="addressBtn">배송지 등록</a></td>
								</tr>
							</table>
							<button type="button" class="btn" id="changePwdBtn"
								data-toggle="modal" data-target="#changePwd">비밀번호 변경</button>
							<button type="submit" class="btn">회원정보 수정</button>
						</form>
						<a id="leaveBtn" data-toggle="modal" data-target="#leaveMem"
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
												<td width="120">현재 비밀번호</td>
												<td width="210"><input type="password"
													name="currentPwd"> <span id="currentPwdMsg"
													class="message" style="display: none"></span></td>
											</tr>
											<tr>
												<td>새 비밀번호</td>
												<td><input type="password" name="newPwd"> <span
													id="newPwdMsg" class="message" style="display: none"></span>
												</td>
											</tr>
											<tr>
												<td>새 비밀번호 확인</td>
												<td><input type="password" id="newPwdCheck"> <span
													id="newPwdCheckMsg" class="message" style="display: none"></span>
												</td>
											</tr>
										</table>
										<button class="btn btn-sm btn-secondary" type="submit"
											onclick="return modalValidate();">변경</button>
									</form>
								</div>

								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">Close</button>
								</div>

							</div>
						</div>
					</div>

					<!-- The Modal -->
					<div class="modal" id="leaveMem">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title">회원 탈퇴</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<!-- Modal body -->
								<div class="modal-body">
									<span style="color: red;">* 탈퇴하고자 한다면, 비밀번호를 입력해주세요.</span>
									<form action="" method="post">
										<input type="hidden" name="memNo" value="">
										<table id="leaveMemTB">
											<tr>
												<td width="100">비밀번호</td>
												<td width="210"><input type="password" name="userPwd">
												</td>
											</tr>
											<button class="btn btn-sm btn-danger" type="submit">탈퇴하기</button>
										</table>
									</form>
								</div>

								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-danger"
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
						<span>리뷰리스트</span>
						<div></div>
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