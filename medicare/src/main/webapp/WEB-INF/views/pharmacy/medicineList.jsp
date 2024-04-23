<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.main-panel div{
	border: 1px solid red;
}

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
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	 <div class="main-panel">
        <div class="content-wrapper" style="background-color: white;">
        	<h2>일반의약품 구매하기</h2>
        	<div class="outer">
        		
			
			<button data-toggle="modal" data-target="#selectDelivery">배송정보조회하기</button>
			<button onclick="selectList();">처방전 조회</button>	


			<div id="myDocument" class="info">
				
			</div>
			
			<script>
				function selectList(){
					$.ajax({
						url:"selectList.dc",
						data:{memNo : "${ loginUser.memNo }"},
						success:function(list){
							console.log(list);
							let value ="";
							for(let i in list){
								value += "<h3 style'margin-left: 30px;'>처방전 목록</h3>"
									+ "<br><br>"
									+ '<div class="document-outer">'

									+	'<div class="prescription">'
										
									+ '<div class="hosName">'
									+			list[i].memName
									+ "</div>"

									+ '<div class="psDate">'
									+  list[i].dcUploadDate
									+ "</div>"

									+ '<div class="psImgDiv">'
									+ '<img class="psImg" src="resources/images/prescription1.jpg">'
									+ "</div>"

									+ "</div>"	

									+ "</div>"
							}
							$("#myDocument").html(value);


						},
						error:function(){
							console.log("문서함조회 ajax호출 실패!");
						}
					})
				}


			</script>


        	
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
							  <label for="t_key">API key</label>
							  <input type="text" class="form-control" id="t_key" name="t_key" placeholder="제공받은 APIKEY">
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
			<button onclick="requestPay();">결제하기</button>
        	
        </div>
    <jsp:include page="../common/footer.jsp"/>

	<script>

			// var IMP = window.IMP;
			IMP.init("imp31344878");

			function requestPay() {
				// IMP.request_pay(param, callback) 결제창 호출
				var randomnum = Math.floor(Math.random() * 10001);
				
				IMP.request_pay({ // param
					pg: "html5_inicis",
					pay_method: "card",
					merchant_uid: randomnum,
					name: "타이래놀",
					amount: 4900,
					buyer_email: "gildong@gmail.com",
					buyer_name: "홍길동",
					buyer_tel: "010-4242-4242",
					buyer_addr: "서울특별시 강남구 신사동",
					buyer_postcode: "01181"
				}, function (rsp) { // callback
					if (rsp.success) {
						// 결제 성공 시 로직,
						console.log("아오성공");
					} else {
						// 결제 실패 시 로직,
						console.log("아오실패");
						console.log(rsp.error_msg);
					}
				});
			}
	</script>
</body>
</html>