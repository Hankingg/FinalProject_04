<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* .main-panel div{
	border: 1px solid red;
} */

.outer{
		border: 2px solid rgb(140, 192, 81);
		border-radius: 10px;
		width: 1300px;
		height: 1000px;
		margin-left: 100px;
}

.document-outer>div{
		float: left;
	}

.document-outer{
		margin-left: 30px;
}

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
	.psImg{
		width: 300px;
		height: 400px;
		margin-left: 10px;
	}


</style>
<!-- 아임포트 라이브러리 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<!-- sockjs 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">

<!-- Option 1: Bootstrap Bundle with Popper (Bootstrap JS + Popper.js) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	 <div class="main-panel">
        <div class="content-wrapper" style="background-color: white;">
        	<h2>일반의약품 구매하기</h2>
        	<div class="outer">
        		
			
			
			<button onclick="selectList();">처방전 조회</button>

				 <!-- 택배 목록 -->
				<div id="myDelivery" class="info">
					<!-- 게시판 목록-->
					<span>게시판</span> <br />
					<table class="list-area" align="center" border="1">
						<thead>
							<tr>
								<th width="100">택배번호</th>
								<th width="100">택배회사</th>
								<th width="200">약국 명</th>
								<th width="200">운송장번호</th>
								<th width="100">배송조회</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>롯데택배</td>
								<td>일번지약국</td>
								<td>123015481249</td>
								<td><button>조회</button></td>
							</tr>
						</tbody>
					</table>
				</div>

	
			<!-- <div id="msgStack"></div>	 -->





			<!-- <div class="toast" role="alert" aria-live="assertive"  aria-atomic="true">
				<div class="toast-header">
				  <strong class="mr-auto">Bootstrap</strong>
				  <small>11 mins ago</small>
				  <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				  </button>
				</div>
				<div class="toast-body">
				  Hello, world! This is a toast message.
				</div>
			</div> -->



			<!-- 메시지 보내기 모달 버튼 -->
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#sendMessageModal">
				메시지 보내기
			</button>
			
			<!-- 메시지 보내기 모달 -->
			<div class="modal fade" id="sendMessageModal" tabindex="-1" role="dialog" aria-labelledby="sendMessageModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
					<h5 class="modal-title" id="sendMessageModalLabel">메시지 보내기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="닫기">
						<span aria-hidden="true">&times;</span>
					</button>
					</div>
					<div class="modal-body">
					<!-- 메시지 입력 폼 -->
					<form>
						<div class="form-group">
						<label for="target">대상</label>
						<input type="text" class="form-control" id="target" placeholder="대상 ID 또는 이름">
						</div>
						<div class="form-group">
						<label for="content">내용</label>
						<textarea class="form-control" id="content" rows="3"></textarea>
						</div>
					</form>
					</div>
					<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="notifySendBtn">보내기</button>
					</div>
				</div>
				</div>
			</div>
				
			</div>
			
			<script>
				$('#notifySendBtn').click(function(e){
					let modal = $('.modal-content').has(e.target);
					let target = modal.find('#target').val();
					let content = modal.find('#content').val();

					
						// 소켓에 전달되는 메시지
						// 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
						socket.send("삼성병원," + target + "," + "비대면 진료가 시작되었습니다. 클릭 후 입장해주세요, asdfsdf");	
						modal.find('.modal-body textarea').val('');	// textarea 초기화
				});
			</script>

			<!-- <script>
				$(document).ready(function(){
					// 웹소켓 연결
					sock = new SockJS("<c:url value='/echo-ws'/>");
					socket = sock;

					// 데이터를 전달 받았을 때
					sock.onmessage = function(evt){
						onMessage(evt);
						// localStorage에 데이터 저장
						saveData(evt.data);
					};

					// 페이지 로드 시 localStorage에서 데이터 로드
					loadDataAndDisplay();
				});

				// toast 생성 및 추가
				function onMessage(evt){
					var data = evt.data;
					displayToast(data);
				};

				function displayToast(data) {
					let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
					toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
					toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
					toast += "<span aria-hidden='true'>&times;</span></button>";
					toast += "</div> <div class='toast-body'>" + data + "</div></div>";
					$("#msgStack").append(toast); // msgStack div에 생성한 toast 추가
					$(".toast").toast({"animation": true, "autohide": false});
					$('.toast').toast('show');
				}

				function saveData(data){
					// 현재 저장된 데이터를 배열로 가져옴
					var messages = JSON.parse(localStorage.getItem("messages")) || [];
					messages.push(data);
					localStorage.setItem("messages", JSON.stringify(messages));
				}

				function loadDataAndDisplay(){
					var messages = JSON.parse(localStorage.getItem("messages")) || [];
					messages.forEach(function(message){
						displayToast(message);
					});
				} -->
			</script>

        	<button data-toggle="modal" data-target="#selectDelivery">배송정보조회하기</button>

			<!-- The Modal -->
			<div class="modal" id="selectDelivery">
				<div class="modal-dialog">
				   <div class="modal-content">

					  <!-- Modal Header -->
					  <div class="modal-header">
						 <h4 class="modal-title">운송장번호로 조회하기</h4>
						 <button type="button" class="close" data-dismiss="modal">&times;</button>
					  </div>

					  <!-- Modal body -->
					  <div class="modal-body">
						<form action="http://info.sweettracker.co.kr/tracking/5" method="post" target="_blank">
							<div class="form-group">
							  <input type="hidden" class="form-control" id="t_key" name="t_key" value="4EuQNNywElBKav3MX8HYkA">
							</div>
							<div class="form-group">
							  <label for="t_code">택배사 코드</label>
							  <input type="text" class="form-control" name="t_code" id="t_code" placeholder="택배사 코드">
							</div>
							<div class="form-group">
							  <label for="t_invoice">운송장 번호</label>
							  <input type="text" class="form-control" name="t_invoice" id="t_invoice" placeholder="운송장 번호">
							</div>
							<button type="submit" class="btn btn-default">조회하기</button>
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
		

				
				
				
        	</div>
        	
        </div>
		

    <jsp:include page="../common/footer.jsp"/>



	
</body>
</html>