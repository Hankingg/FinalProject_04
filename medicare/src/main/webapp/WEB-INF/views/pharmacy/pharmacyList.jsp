<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#map{
		text-align:center;
		margin: auto;
	}
	.outer{
		border: 2px solid rgb(140, 192, 81);
		border-radius: 10px;
		width: 1200px;
		height: auto;
		margin-left: 100px;
	}
	
	/* .outer div{
		border: 1px solid red;
	} */
	
	#result{
		z-index: 30; 
		height: auto; 
		/* overflow: auto;  */
		width: 1000px;
		margin:auto;
		border-top: 1px solid gray;
		padding-top: 50px;
	}

	#result>p{
		font-size: 20px;
		font-weight: bold;
	}
	
	.wrap{
		/* width: 900px; */
		margin-left: 100px;
	}
	
	.wrap * {
		text-align: center;
	}
	
	.wrap>div{
		float:left;
	}
	.wrap_0{ width: 120px; height: 120px;}
	.wrap_0 img{width: 140px; height: 100px;}
	.wrap_1{ width:250px; padding-top: 30px;}
	.wrap_2{ width:200px; padding-top: 38px;}
	.wrap_3{ width:340px; padding-top: 38px;}
	.wrap_1>p{
		font-size: 24px;
		font-weight: border;
		padding-top: 15px;
	}
	input[type=text] {
		width: 250px;
		height: 32px;
		font-size: 15px;
		border: 0;
		border-radius: 15px;
		/* outline: none; */
		background-color: rgb(205, 228, 180);
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

	#btn{
		border: 0px;
		border-radius: 10px;
		background-color: rgb(205, 228, 180);
		width: 50px;
		height: 32px;
	}

	#btn:hover{
		background-color: rgb(187, 228, 180);
	}
	.btnBox{
		padding-left: 15px;
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

	.listView{
		width: 1000px;
		margin: auto;
	}

	.listView>p{
		font-size: 20px;
		font-weight: bold;
	}

	 /* 여기부터 검색 결과창 관련 css */
	/* .hos_wrap2{
		border-radius: 10px;
		box-sizing: border-box;
		border: 1px solid gray;
		width: 90px;
		margin-left: 800px;
		text-align: center;
	} */

	.hosOuter>div{
		height: 100%;
		float: left;
	}


	.hos_wrap {
		margin-top: 10px;
		display: flex;
		border-radius: 10px;
		box-sizing: border-box;
		border: 1px solid gray;
		width: 1000px;
		height: 200px;
	}
	.hos_wrap:hover{
		cursor: pointer;
		background-color: rgb(220, 220, 220)
	}
	
	.hos_wrap > div {
		width: 100%;
	}
	.hos_wrap div {
		border: 0px;
	}

	.hos1 {
		height: 80%;
	}
	.hos2 {
		height: 20%;
	}
	.hos1_1 {
		height: 20%;
	}
	.hos1_1 > span {
		display: inline-block;
		margin-left: 30px;
		margin-top: 10px;
		color: green;
	}

	.onOffDiv{
		margin-left: 30px;
		margin-top: 10px;
	}

	.hos1_2 {
		height: 30%;
	}
	.hos1_2 > div {
		/* display: inline-block; */
		margin-top: 10px;
		margin-left: 30px;
		font-size: 25px;
		font-weight: bold;
	}

	.hos1_2 span{
		font-size: 15px;
	}

	.hos1_3 {
		height: 30%;
		margin-top: 50px;
		font-size: 18px;
	}
	.hos1_3 > div {
		display: inline-block;
		margin-left: 30px;
	}
	.hos1_3_1 {
		height: 50%;
	}
	.hos1_3_1 > div {
		display: flex;
	}

	/* 지역선택 리스트 css */

	.selectBox * { box-sizing: border-box;}
	.selectBox {
		position: relative;
		width: 180px;
		height: 35px;
		border-radius: 4px;
		border: 2px solid rgb(64, 163, 47);
		background-size: 20px;
		cursor: pointer;
	}

	.selectBox:after {
		content: '';
		display: block; 
		width: 2px;
		height: 100%; 
		position: absolute; 
		top: 0; 
		right: 35px;
		background: white;
	}

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
		background: rgb(121, 207, 159);
		color: #fff;
		list-style-type: none;
		padding: 0;
		border-radius: 6px;
		overflow: hidden;
		max-height: 0;
		transition: .3s ease-in;
	}

	.selectBox.active .optionList {
		max-height: 1000px;
	}

	.selectBox .optionItem {
		border-bottom: 1px dashed rgb(64, 163, 47);
		padding: 5px 15px 5px;
		transition: .1s;
	}

	.selectBox .optionItem:hover {
		background: rgb(60, 179, 113);
	}

	.selectBox .optionItem:last-child {
		border-bottom: 0 none;
	}

	.optionList{
		margin-top: 5px;
		position: relative;
		z-index: 1;
	}

	#downImg{
		width: 20px;
		height: 20px;
		margin-left: 70px;
	}

	/* 스크롤 커스텀 */
	.selectBox .optionList::-webkit-scrollbar {width: 6px;}
	.selectBox .optionList::-webkit-scrollbar-track {background: transparent; }
	.selectBox .optionList::-webkit-scrollbar-thumb {background: #303030; border-radius: 45px;}
	.selectBox2.optionList::-webkit-scrollbar-thumb:hover {background: #303030;}


	.phoneImg{
		width: 20px;
		height: 20px;
		margin-right: 10px;
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

	.submitBtn{
		width: 100px;
		height: 40px;
		border: none;
		border-radius: 10px;
		float: right;
		margin-right: 30px;
		margin-top: 40px;
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
					<div class="wrap_0">
						<img src="resources/mainIcon/pharmacymain2rm.png">
					</div>
					<div class="wrap_1"><p>서울특별시 약국 검색</p></div>
					<div class="wrap_2">

						<div class="box">
							<div class="selectBox">
							   <button id="selectOption" class="label" type="button">지역 선택 <img id="downImg" src="resources/mainIcon/downgreen.png"></button>
							   
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
							<div>
								<input type="text" name="QN" id="QN" placeholder="약국 이름으로 검색해보세요.">
							</div>
							<div class="btnBox">
								<input type="button" value="검색" id="btn">
							</div>
						</div>
					</div>
				</div>
				<div id="map" >
					
				</div>
				<br><br><br>
				<div class="listView"><p>약국목록</p></div>
				<div id="result">
					<p>내 주변 약국을 검색해보세요!</p>
				</div>
				<br> <br> <br> <br> <br>
			
        		
        	</div>
        	
        </div>

		<script>

			$(function(){

				if(navigator.geolocation){
						
					navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
				}else {
					var center = map.getCenter();
					infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px; color:#f00;">Geolocation not supported</h5></div>');
					infowindow.open(map, center);
				}

			})

			var map; // 전역변수로 선언
            			
			var infowindow = new naver.maps.InfoWindow();
			
			function onSuccessGeolocation(position){ // 실행할 함수
				var location = new naver.maps.LatLng(position.coords.latitude,
														position.coords.longitude);
				
				// 지도 생성
				map = new naver.maps.Map('map', {
					center: location,
					zoom: 15
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

				selectFirstList();
			}

			function onErrorGeolocation(){ // 오류 시 발생될 예외처리용 함수
				alert("현위치 조회실패");
				var center = new naver.maps.LatLng(37.3595704, 127.105399);
				
				map = new naver.maps.Map('map', {
					center: center,
					zoom: 15
					
				});
			
			}

			function selectFirstList(){
				$.ajax({
                     url:"selectFirstList.ph",
                     success:function(data){
                        
                      let itemArr = $(data).find("item");
                      
                      let value = "";
					  let ViewName = "약국목록 (가장 가까운 약국으로 보여드려요!)";
                      
                      itemArr.each(function(i, item){
                        console.log($(item).find("hpid").text())

						value += "<div class='hos_wrap' onclick='location.href=\"selectDetail.ph?hpid=" + $(item).find("hpid").text() + "\"'>"
                                 +   "<div class='hos1'>"
                                 +     "<div class='hos1_1'>"           
                                 +       "<span>현 위치와의 거리 : " + $(item).find("distance").text() + "(km)</span>"
								 +		"<button type='button' class='submitBtn'>처방전 전송</button>"
                                 +     "</div>"
                                 +     "<div class='hos1_2'>"
                                 +       "<div>" + $(item).find("dutyName").text() + " <span>💊</span></div>"
                                 +       "<div class='hosPhone'> <img class='phoneImg' src='resources/icon/phone5.png'><span>" + $(item).find("dutyTel1").text() + "</span></div>"
                                 +     "</div>"
                                 +     "<div class='hos1_3'>"
                                 +       "<div class='hos1_3_1'>" + $(item).find("dutyAddr").text() + "</div>"
                                 +     "</div>"
                                 +   "</div>"
                                 + "</div>";

							  
								

								// 한의원 위치에 대한 마커 추가
								var hosLocation = new naver.maps.LatLng($(item).find("latitude").text(), $(item).find("longitude").text());
								var marker = new naver.maps.Marker({
									position: hosLocation,
									map: map, // map 변수는 전역으로 선언되어야 함
									icon: {
										url: 'resources/map/phar1.png',
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
									location.href = 'selectDetail.ph?hpid=' + hpid;
								});
					  	

                      })

                         $("#result").html(value);
						 $(".listView p").text(ViewName);
                      
                     }, error:function(){
                        console.log("약국 목록조회 ajax 통신 실패!");
                     }
                  })
			}


			// 검색결과
			$("#btn").click(function(){
				$.ajax({
					url:"pharmacyListAPI.do",
					data:{Q1:$("#selectOption").text()
						 ,QN:$("#QN").val()},
					success:function(data){
						 
						let value = "";
						let first = true;
						
						// 현재시간!!
						var now = new Date();
						var currentHour = now.getHours();
						var currentMinute = now.getMinutes();
						var currentTime = currentHour * 100 + currentMinute; 

						let ViewName = "약국목록 검색결과";
							
					if(data != null){
						// 지도 초기화 및 첫번째 마커 생성
						if(first){
							var initialLocation = new naver.maps.LatLng($(data).find("item:first").find("wgs84Lat").text(), $(data).find("item:first").find("wgs84Lon").text());
							// 지도 생성
							map = new naver.maps.Map('map', {
								center: initialLocation,
								zoom: 14
							});
							first = false;  // 첫 번째 항목을 처리한 후 false로 설정
							
						}
						
						$(data).find("item").each(function(i, item){
							
							// 한의원 위치에 대한 마커 추가
							var hosLocation = new naver.maps.LatLng($(item).find("wgs84Lat").text(), $(item).find("wgs84Lon").text());
				            
							var marker = new naver.maps.Marker({
								position: hosLocation,
								map: map, // map 변수는 전역으로 선언되어야 함
								icon: {
									url: 'resources/map/phar1.png',
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
								location.href = 'selectDetail.ph?hpid=' + hpid;
							});
							
							let onOff = "";

							value += "<div class='hos_wrap' onclick='location.href=\"selectDetail.ph?hpid=" + $(item).find("hpid").text() + "\"'>"
							     + "<div class='hos1'>"
							     + "<div class='hos1_1'>";

									// 오늘 진료시간
									switch(new Date().getDay()){
                                            case 0 : 
                                                if($(item).find("dutyTime7s").text() == ""){
                                                    onOff += "⚫ 영업안함";
                                                }else{
                                                    checkBusinessHours("dutyTime7s", "dutyTime7c");            
                                                }
                                                break;
                                            case 1 : 
                                                if($(item).find("dutyTime1s").text() == ""){
                                                    onOff += "⚫ 영업안함";
                                                }else{
                                                    checkBusinessHours("dutyTime1s", "dutyTime1c");
                                                }
                                                break;
                                            case 2 : 
                                                if($(item).find("dutyTime2s").text() == ""){
                                                    onOff += "⚫ 영업안함";
                                                }else{
                                                    checkBusinessHours("dutyTime2s", "dutyTime2c");
                                                }
                                                break;
                                            case 3 : 
                                                if($(item).find("dutyTime3s").text() == ""){
                                                    onOff += "⚫ 영업안함";
                                                }else{
                                                    checkBusinessHours("dutyTime3s", "dutyTime3c");
                                                }
                                                break;
                                            case 4 : 
                                                if($(item).find("dutyTime4s").text() == ""){
                                                    onOff += "⚫ 영업안함";
                                                }else{
                                                    checkBusinessHours("dutyTime4s", "dutyTime4c");
                                                }
                                                break;  
                                            case 5 : 
                                                if($(item).find("dutyTime5s").text() == ""){
                                                    onOff += "⚫ 영업안함";
                                                }else{
                                                    checkBusinessHours("dutyTime5s", "dutyTime5c");
                                                }
                                                break;   
                                            case 6 : 
                                                if($(item).find("dutyTime6s").text() == ""){
                                                    onOff += "⚫ 영업안함";
                                                }else{
                                                    checkBusinessHours("dutyTime6", "dutyTime6c");
                                                }
                                                break;
                                            default : 
                                                if($(item).find("dutyTime8s").text() == ""){
                                                    onOff += "⚫ 영업안함";
                                                }else{
                                                    checkBusinessHours("dutyTime8s", "dutyTime8c");
                                                }
                                                break;
                                        }
                                        
                                        function checkBusinessHours(startTimeClass, endTimeClass) {
                                            var startTime = $(item).find(startTimeClass).text();
                                            var endTime = $(item).find(endTimeClass).text();
         
                                            if(currentTime >= startTime && currentTime <= endTime) {
                                                onOff += "🟢 영업중";
                                            } else {
                                                onOff += "🔴 영업종료";
                                            }
                                        }
                         value   += "<div class='onOffDiv'>"+ onOff + "</div>"
						   		 + "</div>"
								 +     "<div class='hos1_2'>"
                                 +       "<div>" + $(item).find("dutyName").text() + " <span>💊</span></div>"
                                 +       "<div class='hosPhone'> <img class='phoneImg' src='resources/icon/phone5.png'><span>" + $(item).find("dutyTel1").text() + "</span></div>"
                                 +     "</div>"
                                 +     "<div class='hos1_3'>"
                                 +       "<div class='hos1_3_1'>" + $(item).find("dutyAddr").text() + "</div>"
                                 +     "</div>"
							     +"</div>"
							     +"</div>";
						})
					} else{
						value += "<div id='hos_wrap' style='width: 600px; height: 150px'>";
							   + "<p style='font-size=20px'>검색 결과가 없습니다.</p>"
							   + "</div>";
					}
						$("#result").html(value);
						$(".listView p").text(ViewName);
						
					},error:function(){
						console.log("ajax 통신 실패");
					}
				})
			})


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
        
        
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>