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