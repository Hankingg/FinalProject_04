<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.content {
		margin-top: 80px;
		margin-left: 200px;
	}
	
	.buyBtn {
		background-color:rgb(240, 130, 120);
		border-radius: 10px;
		border: none;
		color:white;
		margin-top:20px;
		width:200px;
		height:35px;
		
	}
	
	.msMonth {
		border: 1px solid lightgray;
		width:500px;
		height:200px;
		border-radius: 10px;
		text-align: center;
		padding-top:25px;
				
		margin-right:50px;
		background-color: rgb(255, 251, 216);
	}
	
	.gudok {
		font-size: 20px;
	}
	
	.gudok>div {
		float:left;
	}
	
	.member10Text {
		margin-left: 430px;
		font-size: 30px;
	}

	.msYear{
		background-color:#f2f7ff; 
	}
	
	.exGudok {
		width:900px;
		margin-left:130px;
	}
	
	.exGudok p {
		font-size: 20px;
		margin-top:20px;
		color:gray;
	}
	
	.gudokP {
		margin-right:15px;
	}
	
	#krm_Info {
		margin-top:20px;
	}
	
	#ch_Info {
		margin-top:20px;
	}
	
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
		<div class="main-panel">
		<div class="content-wrapper" style="background-color: white;">
		
	<div class="content">
		<h3 class="member10Text">메디케어 커뮤니티</h3>
		
		<br><br>
		
		<div class="gudok">		
			<div class="msMonth">				
				<h3>병원정보 공유방</h3>	
				<br>						
				<form action="hInfoChat.ch">
					<input type="hidden" value="${ loginUser.memId }" name="memId">
					
					<button class="buyBtn">채팅입장</button>
				</form>				
			</div>
			
			<div class="msMonth" class="msYear" style="background-color: #f2f7ff;">
				<h3>약국정보 공유방</h3>	
				<br>		
				<form action="chatForm.ch">
					<input type="hidden" value="${ loginUser.memId }" name="memId">
					
					<button class="buyBtn">채팅입장</button>
				</form>			
			</div>
		</div>		
	</div>
	
	
	
	<div class="content">		
		<div class="gudok">		
			<div class="msMonth" id="krm_Info" style="background-color: #ff9fb0;">				
				<h3>한의원 정보 공유방</h3>	
				<br>						
				<form action="khInfoChat.ch">
					<input type="hidden" value="${ loginUser.memId }" name="memId">
					
					<button class="buyBtn">채팅입장</button>
				</form>				
			</div>
			
			<div class="msMonth" class="msYear" id="ch_Info" style="background-color: rgb(170, 255, 170);">
				<h3>우리아이 의료정보 공유방</h3>	
				<br>		
				<form action="cInfoChat.ch">
					<input type="hidden" value="${ loginUser.memId }" name="memId">
					
					<button class="buyBtn">채팅입장</button>
				</form>			
			</div>
		</div>		
	</div>
		
		
	</div>
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>