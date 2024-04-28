<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	
	
	#livemap1 {
		background-color:#FF4747;
		border-radius: 8px;
		color:white;
		border: none;
		height:30px;
		margin-left:450px;
	}
	
	#livemap2 {
		background-color:#FF4747;
		border-radius: 8px;
		color:white;
		border: none;
		height:30px;
		margin-left:450px;
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
	
	<select id="location2">
		<option value="강남구">강남구</option>
		<option value="강서구">강서구</option>
		<option value="강동구">강동구</option>
		<option value="서초구">서초구</option>
		<option value="노원구">노원구</option>
		<option value="중구">중구</option>
		<option value="용산구">용산구</option>
		<option value="마포구">마포구</option>
		<option value="성북구">성북구</option>
		<option value="성동구">성동구</option>
		<option value="광진구">광진구</option>
	</select>
	<input type="button" value="조회" id="btn3">
	</div>
	
	<br><br>

	<div id="result">
		
	</div>
	
	<button onclick=popup1() id="livemap1">실시간 도로상황 보러가기</button>
	<button onclick=popup2() id="livemap2">실시간 도로상황 보러가기</button>
	
	<script>
	
	function popup1(){
	
		let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1100, height=900, top=8000,left=650";
		
		window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010264&cctvname=%25EC%259D%25B4%25ED%2599%2594%25EC%2582%25AC%25EA%25B1%25B0%25EB%25A6%25AC&kind=Seoul&cctvip=null&cctvch=52&id=133&cctvpasswd=null&cctvport=null&minX=126.89776319515302&minY=37.51425838136302&maxX=127.07180331819578&maxY=37.595206045808325", "_blank", options);
	}
	
	function popup2(){
		
		let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1100, height=900, top=8000,left=650";
		
		window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010264&cctvname=%25EC%259D%25B4%25ED%2599%2594%25EC%2582%25AC%25EA%25B1%25B0%25EB%25A6%25AC", "_blank", options);
	}
	
	
	$(function(){			
	    // 페이지 로드 시 AJAX 요청 보내기
	    function sendAjaxRequest() {
	        $.ajax({
	            url:"emer.do",
	            data:{location1:$("#location1").val(), location2:$("#location2").val()},
	            success:function(data){
	                
	                let bodyTr = "";
	                $(data).find("item").each(function(i, item){
	                    bodyTr  += "<tr id='emList'>"	                    	
	                            + "<th width='200' id='ulh'>기관명</th>"
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
	                	   success:function(result){
	                		   
	                 			
	                		   
	                		   $(result).find("item").each(function(i, item){
	                			   console.log($(item).find("wgs84Lat").text());
	                			   console.log($(item).find("wgs84Lon").text());
	                		   })
	                		   
	                		   
	                	   //let bodyTr2 = "";
	   	                   //$(data).find("item").each(function(i, item)
	                		   
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
	    
	    setInterval(sendAjaxRequest, 100000);
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
                        + "<th width='200' id='ulh'>기관명</th>"
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
			                });
			                $("#result").html(bodyTr);
			            },
			            error: function() {
			                console.log("응급실 아작스 통신실패");
			            }
			        });
			    }
    
				    // Trigger the AJAX request when the page loads
				    sendAjaxRequest();
				    
				    // Trigger the AJAX request when the button is clicked
				    $("#btn3").click(function() {
				        sendAjaxRequest();
				    });
				});

	   
	
	   
	   

	</script>
	</div>
	

</body>
</html>