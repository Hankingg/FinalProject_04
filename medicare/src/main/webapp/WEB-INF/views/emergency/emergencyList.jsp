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
	
	}

	#result {
		margin-left: 50px;
	}
	
	#result th, td {
		text-align:center;
	}

	#result th {
		background-color:  rgb(240, 130, 120);
	}
	
	#er td {
		background-color:  rgb(240, 130, 120);
	}
	
	#emList {
		border:1px solid black;	
	}

	
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div class="content">
	<h2 align="center">응급실 실시간</h2>
	<div id="selectArea" align="center">
	<select id="location1">
		<option>서울특별시</option>		
	</select>
	
	<select id="location2">
		<option>강남구</option>
		<option>강서구</option>
		<option>강동구</option>
		<option>서초구</option>
		<option>노원구</option>
		<option>중구</option>
		<option>용산구</option>
		<option>마포구</option>
		<option>성북구</option>
		<option>성동구</option>
		<option>광진구</option>
	</select>
	<input type="button" value="조회" id="btn3">
	</div>
	
	<br><br>

	<div id="result">
		
	</div>
	
	<script>
	$(function(){			
		// 페이지 로드 시 AJAX 요청 보내기
		$.ajax({
			url:"emer.do",
			data:{location1:$("#location1").val(), location2:$("#location2").val()},
			success:function(data){
						
				let bodyTr = "";
				$(data).find("item").each(function(i, item){
					bodyTr  += "<tr id='emList'>"
							+ "<th width='200' id='ulh'>기관명</th>"
							+ "<th width='100'>응급실</th>"
							+ "<th width='100'>수술실</th>"						                    
	                        + "<th width='100'>일반중환자</th>"
	                        + "<th width='100'>입원실</th>"	                                      
	                        + "<th width='150'>구급차가용여부</th>"	                       
	                        + "<th width='100'>소아</th>"	                                         
	                        + "<th width='150' id='urh'>응급실전화</th>"                        
							+ "</tr>"						
							+ "<tr id='er'>"
                            + "<td id='uld'>" + $(item).find("dutyName").text() + "</td>"   
                            + "<td>" + $(item).find("hvec").text() + "</td>"   
                            + "<td>" + $(item).find("hvoc").text() + "</td>"                                                            
                            + "<td>" + $(item).find("hvicc").text() + "</td>"
                            + "<td>" + $(item).find("hvgc").text() + "</td>"                                                           
                            + "<td>" + $(item).find("hvamyn").text() + "</td>"                            
                            + "<td>" + $(item).find("hv10").text() + "</td>"                                                             
                            + "<td id='urd'>" + $(item).find("dutyTel3").text() + "</td>"                                                
                            + "</tr>"
							+ "<tr style='height:30px;'>"
							+ "<td colspan=11>" + "</td>"
							+ "</tr>"
							
				
				});
								 
				
				$("#result").html(bodyTr);								 
			},
			error:function(){
				console.log("응급실 아작스 통신실패");
			}
		});
	});
	
	
	 $(function(){         
	      $("#btn3").click(function(){
	         $.ajax({
	            url:"emer.do",
	            data:{location1:$("#location1").val(), location2:$("#location2").val()},
	            success:function(data){
	            console.log(data);
	               // console.log($(data).find("row"))
	               
	               let $table = $("<table border='1'></table>");
	               let $thead = $("<thead></thead>");
	               let headTr = "<tr>"                                       
				            	   + "<th>입력일시</th>"
								   + "<th>응급실</th>"
								   + "<th>수술실</th>"						
			                       + "<th>신생중환자</th>"                     
			                       + "<th>일반중환자</th>"
			                       + "<th>입원실</th>"	                                      
			                       + "<th>구급차가용여부</th>"	                       
			                       + "<th>VENTI(소아)</th>"
			                       + "<th>인큐베이터(보육기)</th>"
			                       + "<th>기관명</th>"
			                       + "<th>응급실전화</th>"                    
	                          + "</tr>";
	                        
	                        $thead.html(headTr); 
	                        
	                         let $tbody = $("<tbody></tbody>");
	                         let bodyTr = "";
	                         $(data).find("item").each(function(i, item){
	                           bodyTr += "<tr>"                                                
			                        	   + "<td>" + $(item).find("hvidate").text() + "</td>"   
			                               + "<td>" + $(item).find("hvec").text() + "</td>"   
			                               + "<td>" + $(item).find("hvoc").text() + "</td>"                                
			                               + "<td>" + $(item).find("hvncc").text() + "</td>"                                
			                               + "<td>" + $(item).find("hvicc").text() + "</td>"
			                               + "<td>" + $(item).find("hvgc").text() + "</td>"                                                           
			                               + "<td>" + $(item).find("hvamyn").text() + "</td>"                            
			                               + "<td>" + $(item).find("hv10").text() + "</td>"   
			                               + "<td>" + $(item).find("hv11").text() + "</td>"                                 
			                               + "<td>" + $(item).find("dutyName").text() + "</td>"   
			                               + "<td>" + $(item).find("dutyTel3").text() + "</td>"                              
	                                 + "</tr>"                         
	                         })
	                         
	                         $tbody.html(bodyTr);
	                         
	                         /*
	                         $table.append($thead, $tbody);
	                         $table.appendTo("#result2");
	                         */
	                         
	                        $("#result").html($table.append($thead, $tbody));                         
	            },
	            error:function(){
	               console.log("응급실 아작스 통신실패");
	            }
	            
	         })
	      })         
	   })

	</script>
	</div>
	

</body>
</html>