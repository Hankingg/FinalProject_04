<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer{
	height : 800px;
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
        	
        	<div class="outer">
        		
				
        		<button onclick="requestPay();">결제하기</button>
        	
        	
        	
        	</div>
        	
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
					console.log("아오성공");
						
						// 결제 성공 시 로직,
						
					} else {
					console.log("아오실패ㅔ");
					console.log(rsp.error_msg);
						
						// 결제 실패 시 로직,
						
					}
				});
			}
	</script>
</body>
</html>