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
			
			#hosMapInfo{
				width: 300px;
				height: 50px;
				margin-top: 90px;
				margin-left: 50px;
			}
			
			#hosMapInfo>div{
				float: left;
			}
						
			#hosMapImg{
				width: 40px;
				height: 40px;
				margin-right: 10px;
			}
			
			#kHosPosition span{
				font-size: 20px;
				
			}
			
			#kHosPosition {
				margin-top: 13px;
				margin-left: 10px;
				margin-bottom: 20px;
			}
			
			#kHosList{
				width: 1100px;
				height: 50px;
				margin-left: 50px;
				border-top: 2px solid gray;
				padding-top: 30px;
				margin-bottom: 40px;
				
			}
			
			#kHosList>div{
				float: left;
			}
			
			#kHosList p{
				font-size: 20px;
			}
			
			#kDoctor2Img{
				width: 150px;
				height: 100px;
			}
			
			#kHosTitle{
				margin-left: 30px;
				margin-top: 50px;
				margin-bottom: 30px;
			}
			
			#kHosTitle span{
				font-size: 25px;
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
                        <button id="selectOption" class="label" type="button">지역 선택<img id="downImg" src="resources/kHospital/arrow1.png"></button>
						
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
                     <div class="btnBox">
                     </div>
                  </div>
               </div>
            </div>
			<br><br>
			<div id="hosMapInfo">
				<div id="hosMap">
					<img id="hosMapImg" src="resources/map/map1.png">				
				</div>
				<div id="kHosPosition">
					<span>한의원 위치</span>				
				</div>
			</div>
			
            <div id="map">
               
            </div>
            <br><br><br>
            <div id="kHosList">
            	<div id="kDoctor2">
	            	<img id="kDoctor2Img" src="resources/kHospital/kDoctor8.png">
            	</div>
            	<div id="kHosTitle">
            		<span>주변 한의원 목록</span>
            	</div>
           	</div>
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
            		
					if(navigator.geolocation){
						
						navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
					}else {
						var center = map.getCenter();
						infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px; color:#f00;">Geolocation not supported</h5></div>');
						infowindow.open(map, center);
					}
            		
            	});
            		
            	var map; // 전역변수로 선언
            			
    			var infowindow = new naver.maps.InfoWindow();
    				
    				function onSuccessGeolocation(position){ // 실행할 함수
    					var location = new naver.maps.LatLng(position.coords.latitude,
    														 position.coords.longitude);
    					
    					// 지도 생성
    					map = new naver.maps.Map('map', {
    						center: location,
    						zoom: 14
    					});
    					
    					// 마커 위치

    					var marker = new naver.maps.Marker({
    						position: location,
    						map: map,
    						icon: {
    							url: 'resources/map/person2.png',
    							scaledSize: new naver.maps.Size(40, 40), // 아이콘 사이즈 조정
    							origin: new naver.maps.Point(0, 0),
    							anchor: new naver.maps.Point(11, 35)
    						}
    					});
    				
    					// 한의원 목록 가져오기
    					selectList();	
    				}
    				
    				function onErrorGeolocation(){ // 오류 시 발생될 예외처리용 함수
    					alert("현위치 조회실패");
    					var center = new naver.maps.LatLng(37.3595704, 127.105399);
    					
    					map = new naver.maps.Map('map', {
    						center: center,
    						zoom: 15
    						
    					});
    					/* infowindow.setContent('<div style="padding:20px;">' +
    						'<h5 style="margin-bottom:5px; color:#f00;">현위치 조회 실패!</h5>' + "latitude: " + center.lat() + "<br />longitude:" + center.lng() + '</div>');
    					
    					infowindow.open(map, center); */
    				}

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
		    							
		    							value +=  "<div class='hos_wrap' onclick='location.href=\"detail.kh?hpid=" + $(item).find("hpid").text() + "\"'>"
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
		    								
											// 한의원 위치에 대한 마커 추가
						                    var hosLocation = new naver.maps.LatLng($(item).find("latitude").text(), $(item).find("longitude").text());
						                    var marker = new naver.maps.Marker({
						                        position: hosLocation,
						                        map: map, // map 변수는 전역으로 선언되어야 함
						                        icon: {
						                            url: 'resources/map/pin10.png',
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

											$(marker.getElement()).on('click', function(){
												var hpid = $(item).find("hpid").text();
												location.href = 'detail.kh?hpid=' + hpid;
											});

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
							let first = true;

							if(data != null && $(data).find("item").length > 0){
								// 지도 초기화 및 첫번째 마커 생성
								if(first){
										var initialLocation = new naver.maps.LatLng($(data).find("item:first").find("latitude").text(), $(data).find("item:first").find("longitude").text());
										// 지도 생성
										map = new naver.maps.Map('map', {
											center: initialLocation,
											zoom: 14
										});
										first = false;  // 첫 번째 항목을 처리한 후 false로 설정
									
								}

								$(data).find("item").each(function(i, item){

									// 한의원 위치에 대한 마커 추가
									var hosLocation = new naver.maps.LatLng($(item).find("latitude").text(), $(item).find("longitude").text());
						            
									var marker = new naver.maps.Marker({
										position: hosLocation,
										map: map, // map 변수는 전역으로 선언되어야 함
										icon: {
											url: 'resources/map/pin10.png',
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

									$(marker.getElement()).on('click', function(){
										var hpid = $(item).find("hpid").text();
										location.href = 'detail.kh?hpid=' + hpid;
									});

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

				/* 주소로 좌표 찍는 geocode
				naver.maps.Service.geocode({
					query: "경기도 수원시 장안구 정자동 945"
				}, function(status, response) {
					if (status !== naver.maps.Service.Status.OK) {
						return alert('주소를 지리적 좌표로 변환하는 중 오류가 발생했습니다.');
					}

					var result = response.v2, // 검색 결과의 컨테이너
						items = result.addresses; // 검색 결과의 배열

					var position = new naver.maps.LatLng(items[0].y, items[0].x);

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
							url: 'resources/map/pin3.png',
							scaledSize: new naver.maps.Size(45, 45), // 아이콘 사이즈 조정
							origin: new naver.maps.Point(0, 0),
							anchor: new naver.maps.Point(11, 35)
						}
					};

					var marker = new naver.maps.Marker(markerOptions);
				}); */

				
				
				
				
				/* $(window).on("load", function(){ // 창이 실행되면 현 위치 값 구하는 함수 실행되는 제이쿼리
					if(navigator.geolocation){
						
						navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
					}else {
						var center = map.getCenter();
						infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px; color:#f00;">Geolocation not supported</h5></div>');
						infowindow.open(map, center);
					}
				});
	 */
					
			  </script>
              
           </div>
 
        </div>
        
        
        
        
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>