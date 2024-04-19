<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style type="text/css">
	.content {
		margin-top: 50px;
		margin-left: 600px;
	}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/> 

	
	<div class="content">
		<h3 align="center">멤버10구매</h3>
			<br>
		
		<div class="msMonth">월간 이용권 	
			<br>						
			<button onclick="kakaopayMonth()">구매하기</button>			
		</div>
		
		
		<br><br>
		
		<div class="msYear">연간 이용권 
			<br>					
			<button onclick="kakaopay()">구매하기</button>	
		</div>
	</div>
	
	<script>
         // var IMP = window.IMP;
         IMP.init("imp36818141");
         
        
         function kakaopayMonth() {
            // IMP.request_pay(param, callback) 결제창 호출
			var randomNum = Math.floor(Math.random() * 10001);

            
            IMP.request_pay({ // param
               pg: "kakaopay",
               pay_method: "card",
               merchant_uid: randomNum,
               name: "30일 구독권",
               amount: 1000,
               buyer_email: "${ loginUser.email }",
               buyer_name: "${ loginUser.memName }",
               buyer_tel: "${ loginUser.phone }"
            }, function (rsp) { 
               
               if (rsp.success) {
            	 
               alert("결제 성공!");
               
               location.href = "membership.mo?memId=${loginUser.memId}";
               
               } else {          
               console.log(rsp.error_msg);
                  
                 
                 
               }
             
            });
         }
    </script>
	
</body>
</html>