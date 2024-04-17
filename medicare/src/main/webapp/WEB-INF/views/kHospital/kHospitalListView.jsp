<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .outer>.wrap, #map{
      text-align:center;
   }
   .outer{
      border: 2px solid #f96c85;
      border-radius: 10px;
      width: 1200px;
      height: auto;
      margin-left: 100px;
   }
   
   #result{
      z-index: 30; 
      height: auto; 
      width: 1000px;
      margin:auto;
      border-top: 2px solid gray;
      padding-top: 50px;
   }

   #result>p{
      font-size: 20px;
      font-weight: bold;
   }
   
   .wrap{
      margin: auto;
	  padding-left: 50px;
   }
   
   .wrap * {
      text-align: center;
   }
   
   .wrap>div{
      float:left;
   }

   .wrap_0{
		width: 100px;
		height: 100px;
		margin-right: 30px;
		margin-bottom: 30px;
	}
	
   .wrap_1{ 
		width:300px;
		margin-left: 85px;
		margin-top: 35px;
	}

	.wrap_1>p{
      font-size: 28px;
      font-weight: border;
      padding-top: 15px;
	  margin-right: 40px;
   }

   .wrap_2{
		width:250px;
		margin-top: 37px;
	}

   .wrap_3{
		width:340px;
		margin-top: 35px;
	}

   

   input[type=text] {
      width: 250px;
      height: 32px;
      font-size: 15px;
      border: 0;
      border-radius: 15px;
      /* outline: none; */
      background-color: rgb(233, 233, 233);
   }
   select {
      width: 150px;
      height: 32px;
      font-size: 15px;
      /* border: 0; */
      border-radius: 15px;
      background-color: rgb(233, 233, 233);
   }
   .optionItem:hover{
      background-color: #f96c85;
   }

   /* #btn{
		width: 40px;
		height: 30px;
    	border: 0px;
    	border-radius: 10px;
    	background-color: rgb(233, 233, 233);

   } */

   #searchBtn{
	cursor: pointer;
   }

   .btnBox{
      padding-left: 10px;
      padding-top: 3px;
   }
   
   #map{
      width: 1000px;
      height: 600px;
      margin-top:50px;
      border: 1px solid gray;
      border-radius: 20px;
   }

   #searchBox>div {
      float: left;
   }

    /* 여기부터 검색 결과창 관련 css */
   .hos_wrap {
      margin-top: 20px;
      display: flex;
      border-radius: 10px;
      box-sizing: border-box;
      border: 2px solid gray;
      width: 1000px;
      height: 200px;
      padding-top: 30px;
	  cursor: pointer;
   }
   .hos_wrap > div {
      height: 100%;
   }
   .hos_wrap div {
      border: 0px;
   }

   .hos1 {
      width: 80%;
   }
   .hos2 {
      width: 20%;
   }
   .hos1_1 {
      height: 20%;
	  margin-bottom: 10px;

   }
   .hos1_1 > div {
      display: inline-block;
      margin-left: 30px;
   }
   .hos1_2 {
      height: 30%;
	  margin-bottom: 20px;

   }
   .hos1_2 > div {
      margin-top: 6px;
      margin-left: 30px;
      font-weight: bold;
   }
   .hos1_3 {
      height: 30%;
   }
   .hos1_3 > div {
      display: inline-block;
      margin-left: 30px;
   }
   .hos1_3_1 {
      height: 50%;
	  font-size: 17px;
	  margin-top: 10px;
   }
   .hos1_3_1 > div {
      display: flex;
   }

   /* 지역선택 리스트 css */

   .selectBox * { box-sizing: border-box; }
   .selectBox {
		position: relative;
		width: 200px;
		height: 35px;
		border-radius: 4px;
		border: 2px solid lightcoral;
		cursor: pointer;
   }

   /* .selectBox:after {
		content: '';
		display: block; 
		width: 2px;
		height: 100%; 
		position: absolute; 
		top: 0; 
		right: 35px;
		background: lightcoral;
   } */

   .selectBox .label {
		display: flex;
		align-items: center;
		width: inherit;
		height: inherit;
		border: 0 none;
		outline: 0 none;
		padding-left: 15px;
		background: transparent;
		cursor: pointer;
   }

   .selectBox .optionList {
		position: absolute; 
		top: 28px;
		left: 0;
		width: 100%;
		background: #f399ab;
		color: #fff;
		list-style-type: none;
		padding: 0;
		border-radius: 6px;
		overflow: hidden;
		max-height: 0;
		transition: .3s ease-in;
	}

	.optionList{
		margin-top: 5px;
		position: relative;
		z-index: 1;
	}

   .selectBox.active .optionList {
  	 max-height: 1000px;
   }

   .selectBox .optionItem {
		border-bottom: 1px dashed rgb(170, 72, 105);
		padding: 5px 15px 5px;
		transition: .1s;
   }

   .selectBox .optionItem:hover {
		background-color: #e68095;
   		color: white;
   }

   .selectBox .optionItem:last-child {
   		border-bottom: 0 none;
   }

   /* 스크롤 커스텀 */
   .selectBox .optionList::-webkit-scrollbar {width: 6px;}
   .selectBox .optionList::-webkit-scrollbar-track {background: transparent; }
   .selectBox .optionList::-webkit-scrollbar-thumb {background: #303030; border-radius: 45px;}
   .selectBox2.optionList::-webkit-scrollbar-thumb:hover {background: #303030;}

   /* 지도 */
  	#map {
		width: 1100px;
		height: 600px;
		border-radius: 10px;
		border: 1px solid gray;
		margin-top: 50px;
		margin: auto;
  	}

	.hosName{
		font-size: 20px;
	}

	.hosPhone{
		padding-top: 5px;
		font-size: 16px;
		margin-bottom: 20px;
	}

	.phoneImg{
		width: 25px;
		height: 25px;
		margin-right: 10px;
	}

	/* 한의사 이미지 */
	#kDoctor{
		width: 200px;
		height: 100px;
	}

	.distance1{
		color: #f96c85;
	}

	#searchImg{
		width: 20px;
		height: 20px;
		position: relative;
		left: 1px;
		top: -1px;
	}

	.searchDiv>div{
		float: left;
	}
	

	/* 검색창 스타일 */
	        /* 검색창 div id="header_2" class="sc-cmfmEs leAvxd"
	            그안에 div class="sc-UFtxY OqZgF Input__Wrap" */
	        /* input 클래스 : sc-hnmMDg bccLDB Search__Input */
	        /* button 클래스 : sc-jPQLIr gZgnOG search */
	        .leAvxd {  
					padding-left: 300px;
					padding-top: 80px;  
	                }
	
	        .OqZgF {
	                border: 2px solid lightcoral;
	                position: relative;
	                box-sizing: border-box;
	                display: grid;
	                grid-auto-flow: column;
	                grid-auto-columns: auto 18px 22px;
	                gap: 20px;
	                -webkit-box-align: center;
	                align-items: center;
	                width: 300px;
	                height: 40px;
	                padding-right: 20px;
	                border-radius: 21px;
	                background-color: rgb(245, 245, 245); 
	            }
	
	        .bccLDB {
	            display: block;
	            max-width: 72.5%;
	            width: 100%;
	            height: 30px;
	            margin-left: 24px;
	            padding: 0px 0px 2px;
	            background-color: transparent;
	            outline: transparent;
	            border: transparent;
	            font-size: 0.9375rem;
	            line-height: 1.3125rem;
	            letter-spacing: -0.0469rem;
	            color: rgb(32, 32, 32);
	            padding-top: 6px;
	        }
	
	        input {
	                text-rendering: auto;
	                color: fieldtext;
	                letter-spacing: normal;
	                word-spacing: normal;
	                line-height: normal;
	                text-transform: none;
	                text-indent: 0px;
	                text-shadow: none;
	                display: inline-block;
	                text-align: start;
	                appearance: auto;
	                -webkit-rtl-ordering: logical;
	                cursor: text;
	                background-color: field;
	                margin: 0em;
	                padding: 1px 0px;
	                border-width: 2px;
	                border-style: inset;
	                border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
	                border-image: initial;
	                padding-block: 1px;
	                padding-inline: 2px;
	            }
				
	        /* 검색버튼 */
	        .gZgnOG {
	                    width: 22px;
	                    height: 22px;
	                    background-image: url(https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/web/react_components/SearchQueryInput/search.png);
	                    background-size: 100%;
	                }
	                
	        * {
	            letter-spacing: -.0437rem;
	            outline: none;
	        }
	        
	        button {
	                background-color: transparent;
	                border: transparent;
	                cursor: pointer;
	            }
	
			#downImg{
				width: 20px;
				height: 20px;
				margin-left: 90px;
				margin-top: -2px;
			}
</style>
</head>
<body>
   <jsp:include page="../common/header.jsp"/>
    <div class="main-panel">
        <div class="content-wrapper" style="background-color: white;">
           
           <div class="outer">
            <br><br><br><br>
            <div class="wrap">
				<div class="wrap_0"><img id="kDoctor" src="resources/kHospital/kDoctor9.png"></div>
               <div class="wrap_1"><p>서울특별시 한의원 목록</p></div>
               <div class="wrap_2">

            	<div class="box">
                     <div class="selectBox">
                        <button id="selectOption" class="label" type="button">지역 선택<img id="downImg" src="resources/kHospital/down1.png"></button>
						
                        <ul class="optionList">
                          <li class="optionItem">전체</li>
                          <li class="optionItem">강남구</li>
                          <li class="optionItem">강동구</li>
                          <li class="optionItem">강북구</li>
                          <li class="optionItem">강서구</li>
                          <li class="optionItem">관악구</li>
                          <li class="optionItem">광진구</li>
                          <li class="optionItem">구로구</li>
                          <li class="optionItem">금천구</li>
                          <li class="optionItem">노원구</li>
                          <li class="optionItem">도봉구</li>
                          <li class="optionItem">동대문구</li>
                          <li class="optionItem">동작구</li>
                          <li class="optionItem">마포구</li>
                          <li class="optionItem">서대문구</li>
                          <li class="optionItem">서초구</li>
                          <li class="optionItem">성동구</li>
                          <li class="optionItem">성북구</li>
                          <li class="optionItem">송파구</li>
                          <li class="optionItem">양천구</li>
                          <li class="optionItem">영등포구</li>
                          <li class="optionItem">용산구</li>
                          <li class="optionItem">은평구</li>
                          <li class="optionItem">종로구</li>
                          <li class="optionItem">중구</li>
                          <li class="optionItem">중랑구</li>
                        </ul>
                     </div>
                </div>

               </div>
               <div class="wrap_3">
                  <div id="searchBox">
					<div class="sc-UFtxY OqZgF Input__Wrap">
						<input id="QN" class="sc-hnmMDg bccLDB Search__Input" placeholder="한의원 이름으로 검색해보세요" name="keyword">
						<button id="searchBtn" class="sc-jPQLIr gZgnOG search" type="submit" aria-label="검색하기 버튼"></button>
					</div>
                     <!-- <div class="searchDiv">
                        <div><input type="text" name="QN" id="QN" placeholder="한의원 이름으로 검색해보세요"></div>
						<div id="btn"> <img id="searchImg" src="resources/icon/search1.png"></div>
                     </div> -->
                     <div class="btnBox">
                     </div>
                  </div>
               </div>
            </div>
			<br><br>
            <div id="map">
               
            </div>
            <br><br><br>
            <div id="result">
               
            </div>
            <br> <br> <br> <br> <br> <br> <br>
            <br>

            <script>

            /* 현재 시간 */
            var now = new Date();
            var currentHour = now.getHours();
            var currentMinute = now.getMinutes();
            var currentTime = currentHour * 100 + currentMinute;
            
            	$(function(){
            		selectList();
            	})
            	
            	function selectList(){

	            	$.ajax({
	            			url:"selectList.kh",
	            			success:function(data){
	            				
	            				let itemArr = $(data).find("item");
	    						let value = "";
	    						let distance = "";
	    						
	    						itemArr.each(function(i, item){
									
	    							if($(item).find("dutyDiv").text() == "G"){
	    							
			    						distance = $(item).find("distance").text();
		    							
		    							value += "<div class='hos_wrap' onclick='location.href=\"detail.kh?hpid=" + $(item).find("hpid").text() + "\"'>"
		    										+ "<div class='hos1'>"
													+ "<div class='hos1_1'>";
													
													if(distance < 1 ){
														hosDistance = distance * 1000 + "m";
													}else {
														hosDistance = distance + "km"
													}
													
											value	+= "<div class='hosDistance'><span class='distance1'>현위치와의 거리 : " + hosDistance + "</span></div>"
													+ "</div>"
													+ "<div class='hos1_2'>"
												 	+ "<div class='hosName'>" + $(item).find("dutyName").text() + "</div>"
													+ "<div class='hosPhone'> <img class='phoneImg' src='resources/icon/phone5.png'>" + $(item).find("dutyTel1").text() + "</div>"
													+ "</div>"
													+ "<div class='hos1_3'>"
													+ "<div class='hos1_3_1'>" + $(item).find("dutyAddr").text() + "</div>"
													+ "</div>"
													+ "</div>"
													+ "</div>";
		    							}
	    							})
	
	    							$("#result").html(value);
	    							
	            			}, error:function(){
	            				console.log("한의원 목록조회 ajax 통신 실패!");
	            			}
	            		})
            		}
            		
            	// 이름 검색결과 이동 
				$("#searchBtn").click(function(){
					$.ajax({
						url:"search.kh",
						data:{Q1:$("#selectOption").text()
							, QN:$("#QN").val()},
						success:function(data){
							
							let value = "";
							
							if(data != null){
								$(data).find("item").each(function(i, item){
									let onOff = "";
									
									value += "<div class='hos_wrap' onclick='location.href=\"detail.kh?hpid=" + $(item).find("hpid").text() + "\"'>"
											+ "<div class='hos1'>"
											+ "<div class='hos1_1'>";
										
									// 오늘 진료시간
	    	                        switch(new Date().getDay()){
	    	                            case 0 : 
	    	                                if($(item).find("dutyTime7s").text() == ""){
	    	                                    onOff += "⚫ 진료안함";
	    	                                }else{
	    	                                    checkBusinessHours("dutyTime7s", "dutyTime7c");            
	    	                                }
	    	                                break;
	    	                            case 1 : 
	    	                                if($(item).find("dutyTime1s").text() == ""){
	    	                                    onOff += "⚫ 진료안함";
	    	                                }else{
	    	                                    checkBusinessHours("dutyTime1s", "dutyTime1c");
	    	                                }
	    	                                break;
	    	                            case 2 : 
	    	                                if($(item).find("dutyTime2s").text() == ""){
	    	                                    onOff += "⚫ 진료안함";
	    	                                }else{
	    	                                    checkBusinessHours("dutyTime2s", "dutyTime2c");
	    	                                }
	    	                                break;
	    	                            case 3 : 
	    	                                if($(item).find("dutyTime3s").text() == ""){
	    	                                    onOff += "⚫ 진료안함";
	    	                                }else{
	    	                                    checkBusinessHours("dutyTime3s", "dutyTime3c");
	    	                                }
	    	                                break;
	    	                            case 4 : 
	    	                                if($(item).find("dutyTime4s").text() == ""){
	    	                                    onOff += "⚫ 진료안함";
	    	                                }else{
	    	                                    checkBusinessHours("dutyTime4s", "dutyTime4c");
	    	                                }
	    	                                break;  
	    	                            case 5 : 
	    	                                if($(item).find("dutyTime5s").text() == ""){
	    	                                    onOff += "⚫ 진료안함";
	    	                                }else{
	    	                                    checkBusinessHours("dutyTime5s", "dutyTime5c");
	    	                                }
	    	                                break;   
	    	                            case 6 : 
	    	                                if($(item).find("dutyTime6s").text() == ""){
	    	                                    onOff += "⚫ 진료안함";
	    	                                }else{
	    	                                    checkBusinessHours("dutyTime6", "dutyTime6c");
	    	                                }
	    	                                break;
	    	                            default : 
	    	                                if($(item).find("dutyTime8s").text() == ""){
	    	                                    onOff += "⚫ 진료안함";
	    	                                }else{
	    	                                    checkBusinessHours("dutyTime8s", "dutyTime8c");
	    	                                }
	    	                                break;
	    	                        }
	    	                        
	    	                        function checkBusinessHours(startTimeClass, endTimeClass) {
	    	                            var startTime = $(item).find(startTimeClass).text();
	    	                            var endTime = $(item).find(endTimeClass).text();
	
	    	                            if(currentTime >= startTime && currentTime <= endTime) {
	    	                                onOff += "🟢 진료중";
	    	                            } else {
	    	                                onOff += "🔴 진료종료";
	    	                            }
	    	                        }
									
									
	    	                        value	+= "<div>"+ onOff + "</div>"
											+ "</div>"
											+ "<div class='hos1_2'>"
										 	+ "<div>" + $(item).find("dutyName").text() + "</div>"
											+ "<div class='hosPhone'> <img class='phoneImg' src='resources/icon/phone5.png'>" + $(item).find("dutyTel1").text() + "</div>"
											+ "</div>"
											+ "<div class='hos1_3'>"
											+ "<div class='hos1_3_1'>" + $(item).find("dutyAddr").text() + "</div>"
											+ "</div>"
											+ "</div>"
											+ "</div>";
								})
								
							} else{
									value += "<div id='hos_wrap' style='width: 800px; height: 200px'>";
											+ "<p style='font-size=20px'>검색 결과가 없습니다.</p>"
											+ "</div>";
							}
								$("#result").html(value);

						},error:function(){
							console.log("ajax 통신 실패");
						}

					})
				})
				
				// 지역 선택
				const label = document.querySelector('.label');
				const options = document.querySelectorAll('.optionItem');
				// 클릭한 옵션의 텍스트를 라벨 안에 넣음
				const handleSelect = function(item) {
				label.innerHTML = item.textContent;
				label.parentNode.classList.remove('active');
				}
				// 옵션 클릭시 클릭한 옵션을 넘김
				options.forEach(function(option){
				option.addEventListener('click', function(){handleSelect(option)})
				})
				// 라벨을 클릭시 옵션 목록이 열림/닫힘
				label.addEventListener('click', function(){
				if(label.parentNode.classList.contains('active')) {
					label.parentNode.classList.remove('active');
				} else {
					label.parentNode.classList.add('active');
				}
				});

   			</script>
            

			<script>

				naver.maps.Service.geocode({
					query: "경기도 수원시 장안구 정자동 945"
				}, function(status, response) {
					if (status !== naver.maps.Service.Status.OK) {
						return alert('주소를 지리적 좌표로 변환하는 중 오류가 발생했습니다.');
					}

					var result = response.v2, // 검색 결과의 컨테이너
						items = result.addresses; // 검색 결과의 배열

					var position = new naver.maps.LatLng(parseFloat(items[0].y), parseFloat(items[0].x));

					// 지도 생성
					var map = new naver.maps.Map('map', {
						center: position,
						zoom: 18
					});

					// 마커 위치
					var markerOptions = {
						position: position,
						map: map,
						icon: {
							url: 'resources/logo/logo-mini.png',
							scaledSize: new naver.maps.Size(45, 45), // 아이콘 사이즈 조정
							origin: new naver.maps.Point(0, 0),
							anchor: new naver.maps.Point(11, 35)
						}
					};

					var marker = new naver.maps.Marker(markerOptions);
				});

			  </script>
              
           </div>
 
        </div>
        
        
        
        
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>