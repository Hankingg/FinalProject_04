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
	
	#heart,
	#review {
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
	
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="main-panel">
        <div class="content-wrapper">
        	<div class="myPage">
				<div id="myPage-tab">
					<ul>
						<li id="info">
							<a class="tab active">내정보</a>
						</li>
						<li id="heart">
							<a class="tab">좋아요 리스트</a>
						</li>
						<li id="review">
							<a class="tab">내가 쓴 리뷰</a>
						</li>
						<li id="delivery">
							<a class="tab">택배 목록</a>
						</li>
					</ul>
				</div>
				<div class="myPage-info">
					<!-- 내 정보 -->
					<div id="myInfo" class="info active">
						<form action="" method="post">
							<table>
								<tr>
									<td width="100">아이디</td>
									<td>
										<input type="text" value="<%= loginUser.getMemId() %>" disabled>
									</td>
								</tr>
								<tr>
									<td>이&nbsp;&nbsp;&nbsp;름</td>
									<td>
										<input type="text" name="userName" value="<%= loginUser.getMemName() %>">
										<span id="nameMsg" class="message" style="display: none"></span>
									</td>
								</tr>
								<tr>
									<td>닉네임</td>
									<td>
										<input type="text" name="nickname" value="<%= loginUser.getNickname() %>" oninput="nickCheck();">
										<span id="nicknameMsg" class="message" style="display: none"></span>
									</td>
								</tr>
								<tr>
									<td>이메일</td>
									<td>
										<input type="text" value="<%= loginUser.getEmail() %>" disabled>
									</td>
								</tr>
								<tr>
									<td>거주지</td>
									
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>