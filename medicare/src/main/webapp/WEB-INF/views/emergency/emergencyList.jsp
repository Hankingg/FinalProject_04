<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	.content {
		margin-top: 50px;
		margin-left: 150px;
	}

	#result {
		margin-left: 50px;
	}
	
	#result th, td {
		text-align:center;
		color:black;
		
	}

	#result th {
		background-color: white;
		border-top: 1px solid rgb(240, 130, 120);
		border-left: 1px solid rgb(240, 130, 120);
		border-right: 1px solid rgb(240, 130, 120);
		padding-top: 15px;
				
	}
	
	#result td {
		border-bottom: 1px solid rgb(240, 130, 120);
		border-left: 1px solid rgb(240, 130, 120);
		border-right: 1px solid rgb(240, 130, 120);
		padding-bottom: 15px;
	}
	
	#er td {
		background-color: white;
		margin-top:10px;
	}
	
	
	
	#emList {
		border:1px solid black;	
		border: 1px solid rgb(240, 130, 120);
	}
	
	#ulh {
		border-top-left-radius: 10px;
	}
	
	#urh {
		border-top-right-radius: 10px;
	}
	
	#uld {
		border-bottom-left-radius: 10px;
	}
	
	#urd {
		border-bottom-right-radius: 10px;
	}
	
	.noLine {
		border-color: white;
	}
	
	.noLine1 {
		border-color: white;
	}
	
	.noLine2 {
		border-color: white;
	}
	
	
	.livemap1 {
		background-color:#FF4747;
		border-radius: 8px;
		color:white;
		border: none;
		height:30px;
		margin-left:450px;
	}
	
	.livemap2 {
		display :block;
		background-color:rgb(240, 130, 120);
		border-radius: 8px;
		color:white;
		border: 1px solid ;
		height:50px;
		margin-left:380px;
		margin-bottom:20px;
	}

	#liveBtn {
		height:120px;			
	}
	
	#popup1 {
		height:50px;
		margin-left:50px;
	}
	
	#map{
      width: 1000px;
      height: 600px;
      margin-top:20px;
      margin-bottom:20px;
      border: 1px solid gray;
      border-radius: 20px;
      margin-left: 120px;
   	}
   	
   	/* 지도 호버시 정보창 */
	.infoWindow{
		width: auto;
		height: 40px;
		text-align:center;
		border-radius: 10px;
		border: 2px solid #f96c85;
		font-size: 15px;
		padding-top: 7px;
		padding-right: 15px;
		background-color: white;
		
	} 
	 
	.infoWindow>div{
		float: left;
	}
   	
   	.hosName{
		margin-top: 5px;
		margin-bottom: 10px;
	}

	.hosImg{
		width: 25px;
		height: 25px;
		margin-left: 10px;
		margin-right: 8px;
	}
 
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div class="content">
	<h2 align="center">🚨응급실 실시간🚨</h2>
	<div id="selectArea" align="center">
	<select id="location1">
		<option>서울특별시</option>		
	</select>
	
	<select id="location2" onchange="liveButton()">
		<option value="강남구" seleted>강남구</option>
		<option value="강서구">강서구</option>
		<option value="강동구">강동구</option>
		<option value="서초구">서초구</option>
		<option value="노원구">노원구</option>
		<option value="중구">중구</option>
		<option value="용산구">용산구</option>
		<option value="성북구">성북구</option>
		<option value="성동구">성동구</option>
		<option value="광진구">광진구</option>
		<option value="관악구">관악구</option>
		<option value="구로구">구로구</option>
		<option value="금천구">금천구</option>
		<option value="도봉구">도봉구</option>
		<option value="동대문구">동대문구</option>
		<option value="동작구">동작구</option>
		<option value="서대문구">서대문구</option>
		<option value="송파구">송파구</option>
		<option value="양천구">양천구</option>
		<option value="영등포구">영등포구</option>
		<option value="은평구">은평구</option>
		<option value="종로구">종로구</option>
		<option value="중랑구">중랑구</option>
	</select>
	<input type="button" value="조회" id="btn3">
	</div>
	
	<br>
	
	<div id="map">
	
	</div>
	 
	<button id="popup1" onclick=popup1() class="livemap2">실시간 전체 도로상황 보러가기</button>
	
	<div id="result">
		
	</div>
	
	<br>
	 	  
	<div id="liveBtn">	 	
        <!-- 강남구 -->
        <button id="popup6" onclick=popup6() class="livemap2">연세대학교 세브란스병원(강남) 근처 실시간 도로상황 보러가기</button>
        <button id="popup7" onclick=popup7() class="livemap2">삼성서울병원(강남) 근처 실시간 도로상황 보러가기</button>	     
	</div>
	
	<form action="chatForm.ch">채팅
		<input type="hidden" value="${ loginUser.memId }" name="memId">
		<button>채팅</button>
	</form> 
	
	<script>	
	
	function liveButton() {
	    var location = document.getElementById("location2").value;
	    var liveBtnDiv = document.getElementById("liveBtn");
	    
	    
	    liveBtnDiv.innerHTML = "";
	    
	  
	    switch(location) {
	        case "강남구":	        	
	            addButton("연세대학교 세브란스병원(강남) 근처 실시간 도로상황 보러가기", "popup6");
	            addButton("삼성서울병원(강남) 근처 실시간 도로상황 보러가기", "popup7");
	            break;
	        case "강서구":
	        	addButton("이화여자대학교의과대학부속서울병원 근처 실시간 도로상황 보러가기", "popup12");
	        	addButton(" 근처 실시간 도로상황 보러가기", "popup13");
	            break;
	        case "강동구":       
	            addButton("강동경희대학병원 근처 실시간 도로상황 보러가기", "popup4");
	            addButton("성심의료재단 강동성심병원 근처 실시간 도로상황 보러가기", "popup8");
	            addButton("한국보훈복지의료재단 중앙보훈병원 근처 실시간 도로상황 보러가기", "popup9");
	            break;
	        case "광진구":      
	            addButton("혜민병원병원 근처 실시간 도로상황 보러가기", "popup10");
	            addButton("건국대학교병원 근처 실시간 도로상황 보러가기", "popup11");
	            break;
	     	       
	        case "종로구":   
	            addButton("세란병원 근처 실시간 도로상황 보러가기", "popup2");
	            addButton("강북삼성병원 근처 실시간 도로상황 보러가기", "popup3");
	            addButton("서울대학병원 근처 실시간 도로상황 보러가기", "popup5");
	            break;	       
	        default:	 		        		           		
	            break;
	    }
	}

	
	function addButton(text, id) {
	    var button = document.createElement("button");
	    button.textContent = text;
	    button.setAttribute("id", id);
	    button.setAttribute("onclick", id + "()");
	    button.classList.add("livemap2");
	    var liveBtnDiv = document.getElementById("liveBtn");
	    liveBtnDiv.appendChild(button);
	}
	
	
	function popup1(){
		
		let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
		
		window.open("http://www.utic.go.kr/etc/telMap.do?key=NMmkVM1ukPmnoSzZyfEYj5aCLaHFdgiy2znTVHU2f5Ggd05KbqM3ufP25oe77Slbp9i4a4vYM7T33oYDL2Q", "_blank", options);
	}
	
	function popup2(){
		
		let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
		
		window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010076&cctvname=%25EB%258F%2585%25EB%25A6%25BD%25EB%25AC%25B8&kind=Seoul&cctvip=null&cctvch=51&id=15&cctvpasswd=null&cctvport=null&minX=126.94410006399322&minY=37.56324774352138&maxX=126.97553570901468&maxY=37.58100359683157", "_blank", options);
	}
	
	
	
	function popup3(){
		
		let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
		
		window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010278&cctvname=%25EC%25A0%2595%25EB%258F%2599&kind=Seoul&cctvip=null&cctvch=53&id=300&cctvpasswd=null&cctvport=null&minX=126.95101742867895&minY=37.55624077315048&maxX=126.98553033334291&maxY=37.57523930076997", "_blank", options);
					
	}
	
	function popup4(){
			
			let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
			
			window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010094&cctvname=%25EB%25AA%2585%25EC%259D%25BCE%25EB%25A7%2588%25ED%258A%25B8&kind=Seoul&cctvip=null&cctvch=52&id=232&cctvpasswd=null&cctvport=null&minX=127.11790246719123&minY=37.53436282792721&maxX=127.18516165450215&maxY=37.56558893015956", "_blank", options);
		}
	
	function popup5(){
		
		let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
		
		window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010241&cctvname=%25EC%259B%2590%25EB%2582%25A8R&kind=Seoul&cctvip=null&cctvch=53&id=284&cctvpasswd=null&cctvport=null&minX=126.97797631672101&minY=37.561041038888504&maxX=127.0370176547663&maxY=37.58902177718967", "_blank", options);
	}
	
	function popup6(){
		
		let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
		
		window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010008&cctvname=%25EA%25B0%2595%25EB%2582%25A8%25EC%2584%25B8%25EB%25B8%258C%25EB%259E%2580%25EC%258A%25A4&kind=Seoul&cctvip=null&cctvch=52&id=186&cctvpasswd=null&cctvport=null&minX=127.03572291787675&minY=37.483382393745046&maxX=127.05652699427756&maxY=37.50166744174406", "_blank", options);
	}
	
	function popup7(){
		
		let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
		
		window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010265&cctvname=%25EC%259D%25BC%25EC%259B%2590%25ED%2584%25B0%25EB%2584%2590&kind=Seoul&cctvip=null&cctvch=52&id=238&cctvpasswd=null&cctvport=null&minX=127.05547677945165&minY=37.476575825915944&maxX=127.12267417458094&maxY=37.50783250609512", "_blank", options);
	}

	
	function popup8(){
		
		let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
		
		window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010051&cctvname=%25EA%25B8%25B8%25EB%258F%2599%25EC%2582%25AC%25EA%25B1%25B0%25EB%25A6%25AC&kind=Seoul&cctvip=null&cctvch=51&id=130&cctvpasswd=null&cctvport=null&minX=127.11495628320093&minY=37.52460802377302&maxX=127.15930785578796&maxY=37.54754253305119", "_blank", options);
	}
	
	function popup9(){
		
		let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
		
		window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=E970015&cctvname=%25EC%2583%259D%25ED%2583%259C%25EA%25B3%25B5%25EC%259B%2590&kind=EC&cctvip=null&cctvch=52&id=235&cctvpasswd=null&cctvport=null&minX=127.10380410359154&minY=37.5109956711721&maxX=127.19188120513532&maxY=37.55063094912717", "_blank", options);
	}
	
	function popup10(){
		
		let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
		
		window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010268&cctvname=%25EC%259E%25A0%25EC%258B%25A4%25EB%258C%2580%25EA%25B5%2590%25EB%25B6%2581%25EB%258B%25A8&kind=Seoul&cctvip=null&cctvch=52&id=202&cctvpasswd=null&cctvport=null&minX=127.0478390302516&minY=37.51609760375363&maxX=127.12652312346707&maxY=37.551995716917325", "_blank", options);
	}
	
	function popup11(){
		
		let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
		
		window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010198&cctvname=%25EC%2596%25B4%25EB%25A6%25B0%25EC%259D%25B4%25EB%258C%2580%25EA%25B3%25B5%25EC%259B%2590%25EC%2597%25AD&kind=Seoul&cctvip=null&cctvch=51&id=124&cctvpasswd=null&cctvport=null&minX=127.03437926668727&minY=37.51931042759038&maxX=127.13013541894327&maxY=37.560245083469056", "_blank", options);
	}
	
	function popup12(){
		
		let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
		
		window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010104&cctvname=%25EB%25B0%259C%25EC%2582%25B0%25EC%2597%25AD&kind=Seoul&cctvip=null&cctvch=51&id=102&cctvpasswd=null&cctvport=null&minX=126.81432261957629&minY=37.54418152551521&maxX=126.85863103850137&maxY=37.56720339247953", "_blank", options);
	}
	
	$(document).ready(function(){
        // 저장된 값이 있는지 확인합니다.
        var selectedLocation = localStorage.getItem("selectedLocation");
        if(selectedLocation !== null) {
            // 저장된 값이 있다면 해당 옵션을 선택합니다.
            $("#location2").val(selectedLocation);
        }
        
        // 조회 버튼 클릭 시 선택된 값을 저장합니다.
        $("#btn3").click(function(){
            var selectedLocation = $("#location2").val();
            localStorage.setItem("selectedLocation", selectedLocation);
        });
    });
	
	
	
	$(function() {
		
		var map;
		sendAjaxRequest();
	 	setInterval(sendAjaxRequest, 1000);
	 	
	    // Function to send AJAX request and update the result
	    function sendAjaxRequest() {
	        $.ajax({
	            url: "emer.do",
	            data: {
	                location1: $("#location1").val(),
	                location2: $("#location2").val()
	            },
	            success: function(data) {
	                let bodyTr = "";
	
	                $(data).find("item").each(function(i, item) {
	      
	                    bodyTr += "<tr id='emList'>"
	                        + "<th width='300' id='ulh'>기관명</th>"
	                        + "<th width='120'>응급실</th>"
	                        + "<th width='100'>수술실</th>"
	                        + "<th width='100'>일반중환자</th>"
	                        + "<th width='100'>입원실</th>"
	                        + "<th width='150'>구급차가용여부</th>"
	                        + "<th width='100'>소아</th>"
	                        + "<th width='150' id='urh'>응급실전화</th>"
	                        + "</tr>"
	                        + "<tr id='er'>"
	                        + "<td id='uld'>" + $(item).find("dutyName").text() + "</td>"
	                        + "<td>" + ($(item).find("hvec").text() < 0 ? "대기자  : " + $(item).find("hvec").text().substring(1) + "명" + "</td>" : $(item).find("hvec").text() + "</td>")
	                        + "<td>" + $(item).find("hvoc").text() + "</td>"
	                        + "<td>" + $(item).find("hvicc").text() + "</td>"
	                        + "<td>" + $(item).find("hvgc").text() + "</td>"
	                        + "<td>" + $(item).find("hvamyn").text() + "</td>"
	                        + "<td>" + $(item).find("hv10").text() + "</td>"
	                        + "<td id='urd'>" + $(item).find("dutyTel3").text() + "</td>"
	                        + "</tr>"
	                        + "<tr class='noLine' style='height:30px;>"
	                        + "<td class='noLine' colspan=11>" + "</td>"
	                        + "</tr>";
	                        
	                    
		                   $.ajax({
		                	   url:"hospitalInfo.em",
		                	   data:{hpid:$(item).find("hpid").text()},
		                	   success:function(data){
		                		   
		                		   var items = $(data).find("item");
	
		                               // 첫 번째 아이템의 위도와 경도로 지도 중심 설정
		                               var firstItem = $(items[0]);
		                               var firstLat = firstItem.find("wgs84Lat").text();
		                               var firstLon = firstItem.find("wgs84Lon").text();
		                               var firstPosition = new naver.maps.LatLng(firstLat, firstLon);
	
		                               // 지도 생성
		                               map = new naver.maps.Map('map', {
		                                   center: firstPosition,
		                                   zoom: 14
		                               });
	 
		                		   items.each(function(i, item){
		                			  
		                			   var lat = $(item).find("wgs84Lat").text();
		                               var lon = $(item).find("wgs84Lon").text();
		                               var position = new naver.maps.LatLng(lat, lon);
		           		            
		           					   var marker = new naver.maps.Marker({
			           						position: position,
			           						map: map, // map 변수는 전역으로 선언되어야 함
			           						icon: {
			           							url: 'resources/map/pin2.png',
			           							scaledSize: new naver.maps.Size(40, 40)
			           						}
		           						});
		           		                 
		           					/* 마커 호버시 정보창 내용 */
		           					var content = '<div class="infoWindow">'
		           						+ '<div class="hosImgDiv">'
		           						+ '<img class="hosImg" src="resources/map/hos3.png">'
		           						+ '</div>'
		           						+ '<div class="hosName">'
		           						+ '<h4>' + $(item).find("dutyName").text() + '</h4>'
		           						+ '</div>'
		           						+ '</div>';
		           					
		           					/* 마커 호버시 정보창 */
		           					var infoWindow = new naver.maps.InfoWindow({
		           						content: content,
		           						maxWidth: 'auto',
		           						maxHeight: 40,						                        
		           						borderWidth: 0,
		           						borderRadius: '10',
		           						backgroundColor: 'transparent',
		           						disableAnchor: true,
		           					});
	
		           					// 마커에 마우스 진입 이벤트
		           					marker.addListener('mouseover', function() {
		           						infoWindow.open(map, marker);
		           					});
	
		           					// 마커에서 마우스가 벗어난 경우 정보창 닫기
		           					marker.addListener('mouseout', function() {
		           						infoWindow.close();
		           					});
	
		                		   })
		                	   }
		                 });
	
				                });
				                $("#result").html(bodyTr);
				            },
				            error: function() {
				                console.log("응급실 아작스 통신실패");
				            }
				        });
				    }
	    
					    $("#btn3").click(function() {
					        sendAjaxRequest();
					        
					    });
					});

	</script>

	</div>
	

</body>
</html>