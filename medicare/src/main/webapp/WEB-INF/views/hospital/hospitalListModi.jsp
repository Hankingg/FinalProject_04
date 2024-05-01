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
   .wrap_1{ width:15%;}
   .wrap_2{ width:25%;}
   .wrap_3{ width:60%;}
   
   .wrap_3 div{ float:left;}
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
                          <option class="optionItem" value="긂천구">금천구</option>
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
						<option id="D001" value="D001">내과</option>
						<option id="D002" value="D002">소아청소년과</option>
						<option id="D003" value="D003">신경과</option>
						<option id="D004" value="D004">정신건강의학과</option>
						<option id="D005" value="D005">피부과</option>
						<option id="D006" value="D006">외과</option>
						<option id="D007" value="D007">흉부외과</option>
						<option id="D008" value="D008">정형외과</option>
						<option id="D009" value="D009">신경외과</option>
						<option id="D010" value="D010">성형외과</option>
						<option id="D011" value="D011">산부인과</option>
						<option id="D012" value="D012">안과</option>
						<option id="D013" value="D013">이비인후과</option>
						<option id="D014" value="D014">비뇨기과</option>
						<option id="D016" value="D016">재활의학과</option>
						<option id="D017" value="D017">마취통증의학과</option>
						<option id="D018" value="D018">영상의학과</option>
						<option id="D019" value="D019">치료방사선과</option>
						<option id="D020" value="D020">임상병리과</option>
						<option id="D021" value="D021">해부병리과</option>
						<option id="D022" value="D022">가정의학과</option>
						<option id="D023" value="D023">핵의학과</option>
						<option id="D024" value="D024">응급의학과</option>
						<option id="D026" value="D026">치과</option>
						<option id="D034" value="D034">구강악안면외과</option>
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
            $(document).ready(function() {
                if ("${typeNum}" != null) {
                    $("#" + "${typeNum}").prop("selected", true);
                }
                
                $("#near").click();
            });
			
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
			
       		// 현위치 찍기
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
		
			}
		
		function onErrorGeolocation(){ // 오류 시 발생될 예외처리용 함수
			alert("현위치 조회실패");
			var center = new naver.maps.LatLng(37.3595704, 127.105399);
			
			map = new naver.maps.Map('map', {
				center: center,
				zoom: 15
				
			});
		
		}
            	
    			$("#near").click(function(){
    				$.ajax({
    					url:"nearhos.in",
    					data:{Q1:$("#Q1").val()
   						 ,QD:$("#dgidIdName").val()
   						 ,QN:$("#QN").val()},
    					success:function(data){
    						let value = "";
    						let first = true;
    						
    						 var selectedValue = $('#dgidIdName').val();

    		    				// Find the option element with the corresponding value
    		    				var selectedOption = $('#dgidIdName option[value="' + selectedValue + '"]');

    		    				// Get the text content of the selected option
    		    				var selectedOptionText = selectedOption.text();
    		    				
    							// 지도 초기화 및 첫번째 마커 생성
								if(first){
									var initialLocation = new naver.maps.LatLng(data[0].hosLatitude, data[0].hosLongitude);
									// 지도 생성
									map = new naver.maps.Map('map', {
										center: initialLocation,
										zoom: 14
									});
									first = false;  // 첫 번째 항목을 처리한 후 false로 설정
									
								}

    		    				
							$.each(data, function(i, data) {
    							// 한의원 위치에 대한 마커 추가
								var hosLocation = new naver.maps.LatLng(data.hosLatitude, data.hosLongitude);
					            
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
									+ '<h4>' + data.hosName + '</h4>'
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
									
									location.href = 'hosDetail.go?hpid=' + data.hosCode + "&distance=" + data.distance + "&dot=" + selectedOptionText;
								});
								
								let formattedDistance = data.distance >= 1000 ? (Math.round(data.distance / 100) / 10) + " km" : data.distance + " m";
    							
    							value += "<div id='hos_wrap' style='width: 600px; height: 150px' onclick='location.href=\"hosDetail.go?hpid=" + data.hosCode + "&distance=" + formattedDistance + "\"'>"
    							     + "<div id='hos1'>"
    							     + "<div id='hos1_1'>"
    							     +    "<div>진료중</div>"
    							     + "</div>"
    							     + "<div id='hos1_2'><div>" + data.hosName + "</div></div>"
    							     +   "<div id='hos1_3'>"
    							     +     "<div id='hos1_3_1'> 별점 : "+ data.reviewAvg +"점 </div>"
    							     + "<br>"
    							     +    "<div id='hos1_3_2'> " + formattedDistance +" | "+ extractSubstringUpToThirdSpace(data.hosAddress) + " | " + selectedOptionText + "</div>"
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
    						
    						$("#result").html(value);
    						
    					},error:function(){
    						console.log("ajax 통신 실패");
    					}
    				})
    			})
    			
    			
    			function extractSubstringUpToThirdSpace(str) {
    			    let count = 0;
    			    for (let i = 0; i < str.length; i++) {
    			        if (str[i] === ' ') {
    			            count++;
    			            if (count === 3) {
    			                return str.substring(0, i);
    			            }
    			        }
    			    }
    			    return str; // If there are less than three spaces, return the original string
    			}
   			</script>
   			
           </div>
        </div>
        
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>