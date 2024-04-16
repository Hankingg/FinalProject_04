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
      margin: auto;
   }
   .outer{
      border: 2px solid #f96c85;
      border-radius: 10px;
      width: 1200px;
      height: 2000px;
      margin-left: 100px;
   }
   
   #result{
      z-index: 30; 
      height: 800px; 
      overflow: auto; 
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
      height: 50px;
      width: 900px;
      margin:auto;
   }
   
   .wrap * {
      text-align: center;
   }
   
   .wrap>div{
      float:left;
       height:50px;
   }
   .wrap_1{ width:250px;}
   .wrap_2{ width:200px; padding-top: 8px;}
   .wrap_3{ width:340px; padding-top: 8px;}
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

   #btn{
      border: 0px;
      border-radius: 15px;
      background-color: rgb(233, 233, 233);
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
      width: 800px;
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
      font-size: 20px;
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
   }
   .hos1_3_1 > div {
      display: flex;
   }

   /* 지역선택 리스트 css */

   .selectBox * { box-sizing: border-box; }
   .selectBox {
		position: relative;
		width: 150px;
		height: 35px;
		border-radius: 4px;
		border: 2px solid lightcoral;
		background: url('https://freepikpsd.com/media/2019/10/down-arrow-icon-png-7-Transparent-Images.png') calc(100% - 7px) center no-repeat;
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
		background: lightcoral;
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
		background: lightcoral;
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
		border-bottom: 1px dashed rgb(170, 72, 72);
		padding: 5px 15px 5px;
		transition: .1s;
   }

   .selectBox .optionItem:hover {
   		background: rgb(175, 93, 93);
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

	#hosPhone{
		padding-top: 5px;
		font-size: 15px;
	}

	#phoneImg{
		width: 20px;
		height: 20px;
		margin-right: 10px;
		
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
               <div class="wrap_1"><p>한의원 목록</p></div>
               <div class="wrap_2">

            	<div class="box">
                     <div class="selectBox">
                        <button id="selectOption" class="label" type="button">지역 선택</button>
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
                        <input type="text" name="QN" id="QN" placeholder="지역, 한의원 이름으로 검색해보세요">
                     </div>
                     <div class="btnBox">
                        <input type="button" value="검색" id="btn">
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
			
            	$(function(){
            		$.ajax({
            			url:"selectList.kh",
            			success:function(data){
            				
            				let itemArr = $(data).find("item");
    						
    						let value = "";
    						
    						itemArr.each(function(i, item){
    							
    							value += "<div class='hos_wrap' onclick='location.href=\"detail.kh?hpid=" + $(item).find("hpid").text() + "\"'>"
    										+ "<div class='hos1'>"
											+ "<div class='hos1_1'>"
											+ "<div> 🟢 영업중</div>"
											+ "</div>"
											+ "<div class='hos1_2'>"
										 	+ "<div>" + $(item).find("dutyName").text() + "</div>"
											+ "<div id='hosPhone'> <img id='phoneImg' src='resources/icon/phone5.png'>" + $(item).find("dutyTel1").text() + "</div>"
											+ "</div>"
											+ "<div class='hos1_3'>"
											+ "<div class='hos1_3_1'>" + $(item).find("dutyAddr").text() + "</div>"
											+ "</div>"
											+ "</div>"
											+ "</div>";
    						})

    							$("#result").html(value);
    						
            			}, error:function(){
            				console.log("한의원 목록조회 ajax 통신 실패!");
            			}
            		})

            	})

            	// 지역, 이름 검색결과 이동 
				$(".hos_wrap").click(function(){
					$.ajax({
					url:"detail.kh",
					data:{Q1:$("#selectOption").text()
						, QN:$("#QN").val()},
					success:function(data){
						
						let value = "";
						
					if(data != null){
						$(data).find("item").each(function(i, item){
							value += "<div class='hos_wrap'>"
								+ "<div class='hos1'>"
								+ "<div class='hos1_1'>"
								+    "<div>영업중 | 영업종료</div>"
								+ "</div>"
								+ "<div class='hos1_2'><div>" + $(item).find("dutyName").text() + "</div></div>"
								+   "<div class='hos1_3'>"
								+    "<div class='hos1_3_1'> xxx(m) | "+ $(item).find("dutyAddr").text() +" | </div>"
								+  "</div>"
								+"</div>"
								+"</div>"
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
              
              <button onclick="location.href='detail.kh'">상세페이지 버튼</button>
           </div>
           
           
           
           
        
        </div>
        
        
        
        
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>