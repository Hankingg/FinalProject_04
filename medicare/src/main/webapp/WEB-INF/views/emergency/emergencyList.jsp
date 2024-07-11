<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응급실</title>
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
		
		background-color:rgb(240, 130, 120);
		border-radius: 8px;
		color:white;
		border: 1px solid ;
		height:50px;		
		margin-bottom:20px;
	}
	
	#liveBtn {
		height:400px;				
		text-align: center;
		width:1120px;
		margin-left: 50px;
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
 
	#btn3 {
		background-color: rgb(240, 130, 120);
		border-radius: 8px;
		color:white;
		border:1px solid rgb(240, 130, 120);
	}
	
	.selectArea {
		margin-right:200px;
	}
	
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	 <div class="main-panel">
        <div class="content-wrapper" style="background-color: white;">
	
	<div class="content">
	<h2 class="selectArea" align="center">🚨응급실 실시간🚨</h2>
	<div class="selectArea" align="center">
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
	
	</div>
	<jsp:include page="../common/footer.jsp"/>
	
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
	        	addButton("부민병원 근처 실시간 도로상황 보러가기", "popup13");
	            break;
	        case "강동구":       
	            addButton("강동경희대학병원 근처 실시간 도로상황 보러가기", "popup4");
	            addButton("성심의료재단 강동성심병원 근처 실시간 도로상황 보러가기", "popup8");
	            addButton("한국보훈복지의료재단 중앙보훈병원 근처 실시간 도로상황 보러가기", "popup9");
	            break;
	        case "서초구":
	        	addButton("학교법인가톨릭학원가톨릭대학교서울성모병원 근처 실시간 도로상황 보러가기", "popup14");
	            break;
	        case "노원구":
	        	addButton("한국원자력의학원원자력병원 근처 실시간 도로상황 보러가기", "popup15");
	        	addButton("한국원자력의학원원자력병원(화랑사거리) 근처 실시간 도로상황 보러가기", "popup16");
	        	addButton("인제대학교상계백병원(중계역) 근처 실시간 도로상황 보러가기", "popup17");
	        	addButton("인제대학교상계백병원(노원역) 근처 실시간 도로상황 보러가기", "popup18");
	        	addButton("노원을지대학교병원 근처 실시간 도로상황 보러가기", "popup19");
	        case "중구":
	        	addButton("국립중앙의료원 근처 실시간 도로상황 보러가기", "popup20");	        	
	            break;
	        case "용산구":
	        	addButton("순천향대서울병원 근처 실시간 도로상황 보러가기", "popup21");	        	
	            break; 
	        case "성북구":
	        	addButton("고려대학교 안암병원 근처 실시간 도로상황 보러가기", "popup22");	        	
	            break;
	        case "성동구":
	        	addButton("한양대학교병원 근처 실시간 도로상황 보러가기", "popup23");	        	
	            break;    
	        case "광진구":      
	            addButton("혜민병원병원 근처 실시간 도로상황 보러가기", "popup10");
	            addButton("건국대학교병원 근처 실시간 도로상황 보러가기", "popup11");
	            break;
	        case "관악구":      
	            addButton("에이치플러스양지병원 근처 실시간 도로상황 보러가기", "popup24");	            
	            break;
	        case "구로구":      
	            addButton("구로성심병원 근처 실시간 도로상황 보러가기", "popup25");
	            addButton("고려대학교의과대학부속구로병원 근처 실시간 도로상황 보러가기", "popup26");	
	            break;
	        case "금천구":      
	            addButton("희명병원 근처 실시간 도로상황 보러가기", "popup27");	            
	            break;
	        case "도봉구":      
	            addButton("의료법인한전의료재단한일병원 근처 실시간 도로상황 보러가기", "popup28");	            
	            break;
	        case "동대문구":      
	            addButton("경희대학교병원 근처 실시간 도로상황 보러가기", "popup29");	
	            addButton("삼육서울병원 근처 실시간 도로상황 보러가기", "popup30");	
	            addButton("서울특별시동부병원 근처 실시간 도로상황 보러가기", "popup31");	
	            addButton("서울성심병원 근처 실시간 도로상황 보러가기", "popup32");	
	            break;  
	        case "동작구":      
	            addButton("서울특별시 보라매병원 근처 실시간 도로상황 보러가기", "popup33");	
	            addButton("중앙대학교병원 근처 실시간 도로상황 보러가기", "popup34");		            	
	            break; 
	        case "서대문구":      
	            addButton("연세대학교의과대학 세브란스병원 근처 실시간 도로상황 보러가기", "popup35");	
	            addButton("의료법인동신의료재단 동신병원 근처 실시간 도로상황 보러가기", "popup36");		            	
	            break;
	        case "송파구":      
	            addButton("경찰병원 근처 실시간 도로상황 보러가기", "popup37");	
	            addButton("재단법인아산사회복지재단 서울아산병원(올림픽대교-잠실철교) 근처 실시간 도로상황 보러가기", "popup38");
	            addButton("재단법인아산사회복지재단 서울아산병원(올림픽대교-남단) 근처 실시간 도로상황 보러가기", "popup39");
	            break;
	        case "양천구":      
	            addButton("홍익병원 근처 실시간 도로상황 보러가기", "popup40");	
	            addButton("서울특별시서남병원 근처 실시간 도로상황 보러가기", "popup41");
	            addButton("이화여자대학교의과대학부속목동병원 근처 실시간 도로상황 보러가기", "popup42");
	            break;
	        case "영등포구":      
	            addButton("여의도성모병원 근처 실시간 도로상황 보러가기", "popup43");	
	            addButton("명지성모병원 근처 실시간 도로상황 보러가기", "popup44");
	            addButton("대림성모병원 근처 실시간 도로상황 보러가기", "popup45");
	            addButton("한림대학교강남성심병원 근처 실시간 도로상황 보러가기", "popup46");
	            addButton("성애의료재단성애병원 근처 실시간 도로상황 보러가기", "popup47");
	            break; 
	        case "은평구":      
	            addButton("가톨릭대학교 은평성모병원 근처 실시간 도로상황 보러가기", "popup48");	
	            addButton("의료법인청구성심병원 근처 실시간 도로상황 보러가기", "popup49");	          
	            break;    
	        case "종로구":   
	            addButton("세란병원 근처 실시간 도로상황 보러가기", "popup2");
	            addButton("강북삼성병원 근처 실시간 도로상황 보러가기", "popup3");
	            addButton("서울대학병원 근처 실시간 도로상황 보러가기", "popup5");
	            break;
	        case "중랑구":   
	            addButton("의료법인풍산의료재단동부제일병원 근처 실시간 도로상황 보러가기", "popup50");
	            addButton("녹색병원 근처 실시간 도로상황 보러가기", "popup51");
	            addButton("서울특별시서울의료원 근처 실시간 도로상황 보러가기", "popup52");
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
	
	
	$(function(){			
	    function sendAjaxRequest() {
	        $.ajax({
	            url:"emer.do",
	            data:{location1:$("#location1").val(), location2:$("#location2").val()},
	            success:function(data){
	                
	                let bodyTr = "";
	                $(data).find("item").each(function(i, item){
	                    bodyTr  += "<tr id='emList'>"	                    	
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
	                            + "<td>" + ($(item).find("hvec").text() < 0 ? "대기자  : " + $(item).find("hvec").text().substring(1) + "명" + "</td>" : "잔여 : " + $(item).find("hvec").text() + "</td>") 
	                            + "<td>" + ($(item).find("hvoc").text() < 0 ? "대기자  : " + $(item).find("hvoc").text().substring(1) + "명" + "</td>" : "잔여 : " + $(item).find("hvoc").text() + "</td>")                                                             
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
	                	   success:function(result){
	                		   
	                 			
	                		   
	                		   $(result).find("item").each(function(i, item){
	                			  
	                		   })
	                		 	                		   
	                	   }
	                	   
	                 });        
	                    
	                  
	                });
	                
	                $("#result").html(bodyTr);								 
	            },
	            error:function(){
	                console.log("응급실 아작스 통신실패");
	            }
	        });
	    }
	    
	  
	    sendAjaxRequest();
	    
	    setInterval(sendAjaxRequest, 1000);
	});

	
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
                        + "<td>" + ($(item).find("hvoc").text() < 0 ? "대기자  : " + $(item).find("hvoc").text().substring(1) + "명" + "</td>" : "잔여 : " + $(item).find("hvoc").text() + "</td>")
                        + "<td>" + $(item).find("hvicc").text() + "</td>"
                        + "<td>" + $(item).find("hvgc").text() + "</td>"
                        + "<td>" + $(item).find("hvamyn").text() + "</td>"
                        + "<td>" + $(item).find("hv10").text() + "</td>"
                        + "<td id='urd'>" + $(item).find("dutyTel3").text() + "</td>"
                        + "</tr>"
                        + "<tr class='noLine' style='height:30px;>"
                        + "<td class='noLine' colspan=11>" + "</td>"
                        + "</tr>";
			                });
			                $("#result").html(bodyTr);
			            },
			            error: function() {
			                console.log("응급실 아작스 통신실패");
			            }
			        });
			    }
    
				    sendAjaxRequest();
				   
				    $("#btn3").click(function() {
				        sendAjaxRequest();
				        
				    });
				});

	   
	
	   
	   

	</script>

	</div>
	

</body>
</html>
