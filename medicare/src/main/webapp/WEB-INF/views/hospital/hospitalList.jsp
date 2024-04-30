<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		.outer>wrap,.map-jm{
			text-align:center;
			margin: auto;
		}
		
		
		#result3{
			z-index: 30; 
			height: 500px; 
			overflow: auto; 
			width: 700px;
			margin:auto;
		}
		
        .wrap{
	        height: 80px;
	        width: 700px;
            margin:auto;
        }
        
        .wrap * {
        text-align: center;
    	}
        
        .wrap>div{
         float:left;
       		height:100%;
        }
        .wrap_1{ width:15%;}
        .wrap_2{ width:25%;}
        .wrap_3{ width:60%;}
        
        .map-jm{
            width: 700px;
            height: 401px;
            margin-top:50px;
        }
        

        #searchBox-jm>div {
            float: left;
        }
         
	      #hos_wrap {
	        margin-top: 10px;
	        display: flex;
	        border-radius: 10px;
	        box-sizing: border-box;
	        border: 1px solid black;
	      }
	      #hos_wrap > div {
	        height: 100%;
	      }
	      #hos_wrap div {
	        border: 0px;
	      }
	
	      #hos1 {
	        width: 80%;
	      }
	      #hos2 {
	        width: 20%;
	      }
	      #hos1_1 {
	        height: 20%;
	      }
	      #hos1_1 > div {
	        display: inline-block;
	        margin-left: 30px;
	        margin-top: 5px;
	        color: green;
	      }
	      #hos1_2 {
	        height: 30%;
	      }
	      #hos1_2 > div {
	        display: inline-block;
	        margin-top: 6px;
	        margin-left: 30px;
	        font-size: 20px;
	        font-weight: bold;
	      }
	      #hos1_3 {
	        height: 30%;
	      }
	      #hos1_3 > div {
	        display: inline-block;
	        margin-left: 30px;
	      }
	      #hos1_3_1 {
	        height: 50%;
	      }
	      #hos1_3_2 {
	        height: 50%;
	      }
	      #hos1_3_2 > div {
	        display: flex;
	      }
	      #hos1_4 {
	        height: 20%;
	      }
	      #hos1_4 > div {
	        display: inline-block;
	        width: 40px;
	        text-align: center;
	        margin-left: 30px;
	        margin-top: 3px;
	      }
	
	      #hos2_1 {
	        height: 30%;
	      }
	      #hos2_2 {
	        height: 70%;
	      }
	      #hos2_1 p {
	        transform: scale(1.5);
	        display: inline-block;
	        padding-left: 40px;
	      }
	      #hos2_2_1 {
	        text-align: center;
	        margin-left: 8px;
	        margin-top: 70px;
	        width: 80%;
	        white-space: nowrap;
	        font-size: 14px;
	      }

    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="outer">
				<div class="wrap">
					<div class="wrap_1">
						<select id="Q1" name="Q1">
					 	  <option class="optionItem" value="">전체</option>
                          <option class="optionItem" value="강남구">강남구</option>
                          <option class="optionItem" value="강동구">강동구</option>
                          <option class="optionItem" value="강북구">강북구</option>
                          <option class="optionItem" value="강서구">강서구</option>
                          <option class="optionItem" value="관악구">관악구</option>
                          <option class="optionItem" value="광진구">광진구</option>
                          <option class="optionItem" value="구로구">구로구</option>
                          <option class="optionItem" value="금천구">금천구</option>
                          <option class="optionItem" value="노원구">노원구</option>
                          <option class="optionItem" value="도봉구">도봉구</option>
                          <option class="optionItem" value="동대문구">동대문구</option>
                          <option class="optionItem" value="동작구">동작구</option>
                          <option class="optionItem" value="마포구">마포구</option>
                          <option class="optionItem" value="서대문구">서대문구</option>
                          <option class="optionItem" value="서초구">서초구</option>
                          <option class="optionItem" value="성동구">성동구</option>
                          <option class="optionItem" value="성북구">성북구</option>
                          <option class="optionItem" value="송파구">송파구</option>
                          <option class="optionItem" value="양천구">양천구</option>
                          <option class="optionItem" value="영등포구">영등포구</option>
                          <option class="optionItem" value="용산구">용산구</option>
                          <option class="optionItem" value="은평구">은평구</option>
                          <option class="optionItem" value="종로구">종로구</option>
                          <option class="optionItem" value="중구">중구</option>
                          <option class="optionItem" value="중랑구">중랑구</option>
						</select>
					</div>
					<div class="wrap_2">
					<select id="dgidIdName">
						<option value="D001">내과</option>
						<option value="D002">소아청소년과</option>
						<option value="D003">신경과</option>
						<option value="D004">정신건강의학과</option>
						<option value="D005">피부과</option>
						<option value="D006">외과</option>
						<option value="D007">흉부외과</option>
						<option value="D008">정형외과</option>
						<option value="D009">신경외과</option>
						<option value="D010">성형외과</option>
						<option value="D011">산부인과</option>
						<option value="D012">안과</option>
						<option value="D013">이비인후과</option>
						<option value="D014">비뇨기과</option>
						<option value="D016">재활의학과</option>
						<option value="D017">마취통증의학과</option>
						<option value="D018">영상의학과</option>
						<option value="D019">치료방사선과</option>
						<option value="D020">임상병리과</option>
						<option value="D021">해부병리과</option>
						<option value="D022">가정의학과</option>
						<option value="D023">핵의학과</option>
						<option value="D024">응급의학과</option>
						<option value="D026">치과</option>
						<option value="D034">구강악안면외과</option>
					</select>
					</div>
					<div class="wrap_3">
						<div id="searchBox-jm">
							<div>
								<input type="text" name="QN" id="QN">
							</div>
							<div>
								<input type="button" value="실행" id="near">
							</div>
						</div>
					</div>
					
					<button id="btn3" style="border:none; background-color:white;">가까운순</button>
				</div>
				<div class="map-jm" >
					<div id="map-jm_1"><img src="${ pageContext.request.contextPath }/resources/images/mapimg.jpg" style="width: 100%; height: 100%; border-radius:30px;"></div>
				</div>
				<div id="result3">

				</div>
				<br> <br> <br> <br> <br> <br> <br>
				<br>

				<script>
		$(function(){
			$("#btn3").click(function(){
				$.ajax({
					url:"hospital.in",
					data:{Q0:$("#Q0").val()
						 ,QD:$("#dgidIdName").val()
						 ,QN:$("#QN").val()},
					success:function(data){
						 
						let value = "";
						
						$(data).find("item").each(function(i, item){
							value += "<div id='hos_wrap' style='width: 600px; height: 150px' onclick='location.href=\"hosDetail.go?hpid=" + $(item).find("hpid").text()+ "\"'>"
							     + "<div id='hos1'>"
							     + "<div id='hos1_1'>"
							     +    "<div>진료중</div>"
							     + "</div>"
							     + "<div id='hos1_2'><div>" + $(item).find("dutyName").text() + "</div></div>"
							     +   "<div id='hos1_3'>"
							     +     "<div id='hos1_3_1'>★5.0</div>"
							     + "<br>"
							     +    "<div id='hos1_3_2'> 552m | 서울 서초구 효령로 | " +$("#dgidIdName").val() + "</div>"
							     +  "</div>"
							     +  "<div id='hos1_4'>"
							     +    "<div style='background-color: rgb(174, 214, 214)'> 접수 </div>"
							     +    "<div style='background-color: rgb(174, 214, 214)'> 예약 </div>"
							     +  "</div>"
							     +"</div>"
							     +"<div id='hos2'>"
							     + "<div id='hos2_1'><p>♡</p></div>"
							     +  "<div id='hos2_2'><div id='hos2_2_1'> 대기없음 </div></div>"
							     +"</div>"
							    +"</div>" 
						})
						
						$("#result3").html(value);
						
					},error:function(){
						console.log("ajax 통신 실패");
					}
					
					
				})
			})
			$("#near").click(function(){
				console.log("여긴 지나는거지?")
				$.ajax({
					url:"nearhos.in",
					success:function(data){
						 console.log("오냐")
						let value = "";
						
						$(data).find("item").each(function(i, item){
							value += "<div id='hos_wrap' style='width: 600px; height: 150px' onclick='location.href=\"hosDetail.go?hpid=" + $(item).find("hpid").text()+ "\"'>"
							     + "<div id='hos1'>"
							     + "<div id='hos1_1'>"
							     +    "<div>진료중</div>"
							     + "</div>"
							     + "<div id='hos1_2'><div>" + $(item).find("dutyName").text() + "</div></div>"
							     +   "<div id='hos1_3'>"
							     +     "<div id='hos1_3_1'>★5.0</div>"
							     + "<br>"
							     +    "<div id='hos1_3_2'> 552m | 서울 서초구 효령로 |  </div>"
							     +  "</div>"
							     +  "<div id='hos1_4'>"
							     +    "<div style='background-color: rgb(174, 214, 214)'> 접수 </div>"
							     +    "<div style='background-color: rgb(174, 214, 214)'> 예약 </div>"
							     +  "</div>"
							     +"</div>"
							     +"<div id='hos2'>"
							     + "<div id='hos2_1'><p>♡</p></div>"
							     +  "<div id='hos2_2'><div id='hos2_2_1'> 대기없음 </div></div>"
							     +"</div>"
							    +"</div>"
						})
						
						$("#result3").html(value);
						
					},error:function(){
						console.log("ajax 통신 실패");
					}
				})
			})
			
			$("")
			
		})
		
	</script>
	<a href="hosDetail.go">sdfs</a>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />
</body>
</html>