<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버십</title>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
		height:500px;
		border-radius: 10px;
		text-align: center;
		padding-top:25px;
		background-color:#f2f7ff; 		
		margin-right:50px;
	}
	
	.gudok {
		font-size: 20px;
	}
	
	.gudok>div {
		float:left;
	}
	
	#member10Text {
		margin-left: 430px;
		font-size: 30px;
	}

	#msYear{
		background-color: rgb(255, 251, 216);
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
	
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/> 

	
	<div class="content">
		<h3 id="member10Text">메디케어 멤버십</h3>
			<br><br><br>
		
		<div class="exGudok">
			<img style="height: 250px; width: 250px;" src="resources/images/gudokP1.PNG" class="gudokP">
			<img style="height: 250px; width: 250px;" src="resources/images/gudokP2.PNG" class="gudokP">
			<img style="height: 250px; width: 250px;" src="resources/images/gudokP3.PNG" class="gudokP">
			<br>
			<p> 
				메디케어 멤버십를 구독해 한달 월 1000원으로 접수, 예약, 비대면진료 서비스를 이용해보세요!
			</p>
		</div>
		
		<br><br>
		<c:choose>
		<c:when test="${ not empty loginUser }">
		<div class="gudok">		
			<div class="msMonth">				
				<img style="height: 400px; width: 498px;" src="resources/images/gudoksagin.jpg">
				<br>						
				<button onclick="kakaopayMonth()" class="buyBtn" >30일 구독</button>			
			</div>
			
			<div class="msMonth" id="msYear">			
				<img style="height: 400px; width: 498px;" src="resources/images/gudokyear.jpg">
				<br>						
				<button onclick="kakaopayYear()" class="buyBtn" >365일 구독</button>			
			</div>
		</div>
		</c:when>
		<c:otherwise>
		<div class="gudok">		
			<div class="msMonth">				
				<img style="height: 400px; width: 498px;" src="resources/images/gudoksagin.jpg">
				<br>						
				<button class="buyBtn" style="width:300px;">로그인 후 이용해주세요!</button>			
			</div>
			
			<div class="msMonth" id="msYear">			
				<img style="height: 400px; width: 498px;" src="resources/images/gudokyear.jpg">
				<br>						
				<button class="buyBtn" style="width:300px;">로그인 후 이용해주세요!</button>			
			</div>
		</div>
		</c:otherwise>
		</c:choose>
		
	</div>
	
	<script>
        
        
         function kakaopayMonth() {
            
			var randomNum = Math.floor(Math.random() * 10001);

            
            IMP.request_pay({ 
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
            	 
               location.href = "membership.mo?memId=${loginUser.memId}";
               
               } else {          
               console.log(rsp.error_msg);
                  
                 
                 
               }
             
            });
         }
    </script>
	
	<script>
	
     
     function kakaopayYear() {
        
		var randomNum = Math.floor(Math.random() * 10001);

        
        IMP.request_pay({ 
           pg: "kakaopay",
           pay_method: "card",
           merchant_uid: randomNum,
           name: "365일 구독권",
           amount: 10000,
           buyer_email: "${ loginUser.email }",
           buyer_name: "${ loginUser.memName }",
           buyer_tel: "${ loginUser.phone }"
        }, function (rsp) { 
           
           if (rsp.success) {
        	 
           location.href = "membershipYear.me?memId=${loginUser.memId}";
           
           } else {          
           console.log(rsp.error_msg);
              
             
             
           }
         
        });
     }
	</script>
	
	</div>
	 
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>
