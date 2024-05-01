<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

  .outer{
    width: 1200px;
    height: auto;
    border: 2px solid #F96C85;
    border-radius: 10px;
    padding-left: 50px;
    padding-top: 50px;
    padding-bottom: 30px;
  }

  /* 병원 이름 */
  .mName {
    font-size: 30px;
    font-weight: 600;
  }

  .listBack{
  	margin-left: 750px;
  }
  
  .listBtn{
  	border: none;
  	border-radius: 10px;
  	width: 90px;
  	height: 40px;
  	background-color: #F96C85;
  	color: white;
  	font-weight: 100;
  }

  /* 진료 정보 */
  .diagnosis {
    font-size: 25px;
    font-weight: 600;

  }

  /* 진료 상태 */
  .diagnosisStatus {
    width: 300px;
    font-size: 22px;
  }

  /* 진료 시간 */
  .diagnosisTime{
    font-size: 20px;
    margin-top: 10px;
  }

  /* 지도 */
  #map {
    width: 1100px;
    height: 600px;
    border-radius: 10px;
    border: 1px solid gray;
    margin-top: 20px;
  }

  /* 거리 */
  .distance {
    margin-left: 0px
  }

  .distance p {
    font-size:20px;
    font-weight: bold;
    margin-top: 10px;
  }

  /* 탭 메뉴들 */
  .mInfo{
   border-bottom: 3px solid lightgray;
   height: 40px;
  }

  .mInfo button{
    border: none;
    background-color: #F5F7FF;
    width: 150px;
    height: 70px;
    font-size: 20px;
    font-weight: 600;
  }

  #info-tab {
    width: 1100px;
		height: 40px;
		border-bottom: 3px solid lightgray;
	}

	#info-tab ul {
		margin: 0;
		padding: 0;
		height: 100%;
	}

	#info-tab ul li {
		list-style-type: none;
		float: left;
		width: 220px;
		height: 100%;
		text-align: center;
		line-height: 40px;
    margin-right: 50px;
	}

  #info-tab ul li a {
		width: 100%;
		height: 100%;
		display: block;
		text-decoration: none;
		color: gray;
		font-size: 20px;
		cursor: pointer;
	}

	#info-tab ul li a.active {
		border-radius: 5px 5px 0px 0px;
		background-color: #F96C85;
		color: white;
	}

	#info-tab ul li a:hover {
		border-radius: 5px 5px 0px 0px;
		background-color: #F96C85;
		color: white;
	}

  /* 진료 시간 */
  .infoStatus {
    width: 1100px;
    font-size: 20px;
    border-bottom: 3px solid lightgray;
    padding-bottom: 20px;
  }

  /* 진료시간 디테일 */
  .infoDetail {
    margin-top: 20px;
    margin-left: 20px;
    font-size: 16px;
    color: rgb(58, 58, 58);
    line-height: 30px;
  }

  .infoMap {
    width: 1100px;
    font-size: 20px;
    border-bottom: 3px solid lightgray;
    padding-top: 20px;
    padding-bottom: 20px;
  }

  .mapDetail{
    margin-top: 20px;
    padding-left: 20px;
  }

  /* 전화번호 */
  .infoPhone{
    width: 1100px;
    font-size: 20px;
    border-bottom: 3px solid lightgray;
  }

  .phoneDetail button{
    margin-left: 850px;
  }
  
  .phoneDetail{
    margin-top: 20px;
    padding-left: 20px;
    padding-bottom: 30px;
  }

  .hDetail2 button {
    margin-left: 10px;
    width: 100px;
    height: 40px;
    border-radius: 5px;
  }

  #strNum {
    color: red;
  }

  /* 최근 본 병원 */
  #recentView{
    width: 300px;
    height: 2000px;
    border: 2px solid gray;
    margin-left: 50px;
    border-radius: 10px;
  }

  #recentView p {
    font-size: 20px;
    font-weight: 500;
    text-align: center;
    margin-top: 30px;
    
  }

  .content-wrapper>div{
    float: left;
  }

  /* 리뷰 스타일 */

  #hsp-review{
    width: 1100px;
    margin-bottom: 50px;
  }

  #hspReview{
		width: 900px;
		height: 250px;
		border: 2px solid #F96C85;
		border-radius: 10px;
		margin: 50px 150px;
	}

	#hspReview1{
		width: 900px;
		height: 50px;
	}

	#hspReview1>div{
		float: left;
		height: 50px;
	}
  
  /* 리뷰리스트 span */
	#review-div span {
    display: block;
    margin-top: 70px;
    margin-right: 30px;
    margin-left: 150px;
    text-align: left;
    font-weight: 600;
    font-size: 20px;
    color: gray;
	}

  /* 리뷰더보기 div */
  #moreReview{
    display: flex;
    justify-content: center;
    margin-bottom: 50px;
  }

  /* 리뷰더보기버튼 */
  #moreReviewBtn{
    width: 500px;
    height: 50px;
    border-radius: 10px;
    color: #F96C85;
    background-color: white;
    border: 1px solid #F96C85;
    font-size: 18px;
    font-weight: bold;
    
  }

  /* 리뷰더보기버튼 아이콘 */
  #moreBtnImg{
    width: 30px;
    height: 30px;
    margin: 0px 10px;
  }

  /* 병원이름 */
	.hpName{
		width: auto;
		margin-right: 30px;
		margin-left: 30px;
	}

	.hpName p{
		margin-top: 25px;
		margin-left: 30px;
		font-size: 20px;
		font-weight: bold;
		color: rgb(58, 58, 58);
		
	}

	/* 별 이미지 */
	#hpStar{
		width: 35px;
		padding-top: 17px;
    margin-left: 15px;
	}

	/* 별점 */
	#hpRate{
		width: 30px;
	}

	#hpRate p{
		margin-top: 25px;
		font-size: 19px;
		font-weight: bold;
		color: rgb(58, 58, 58);
	}

	/* 하트 */
	#hpHeart{
		width: 50px;
		float: right;
		padding-top: 17px;
    cursor: pointer;
	}

	#starImg, #heartImg{
		width: 25px;
		height: 25px;
		margin-top: 3px;
	}

  /* 리뷰 큰 div */
	#hspReview2{
		width: 900px;
		height: 200px;
		
	}

	#hspReview2>div{
		float: left;
		
	}

	/* 리뷰 닉네임, 프로필사진 감싼 div */
	#rvProfile{
		width: 100px;
    margin-left: 30px;
	}

	#rvProfile>div{
		width: 100%;
	}

	#nickName{
		height: 50px;
		margin-left: 20px;
		margin-top: 15px;
		color: gray;
	}

	#nickName>p{
		text-align: center;
		padding-top: 15px;
		font-size: 20px;
		font-weight: bold;
	}
	/* 리뷰 프로필 이미지 담긴 div */
	#profile{
		height: 100px;
		margin-left: 20px;
		padding-left: 2px;
	}

	/* 리뷰프로필 이미지 */
	#profileImg{
		width: 90px;
		height: 90px;
	}

	#rvCont{
		width: 560px;
		height: 160px;
		border-radius: 10px;
		margin-left: 50px;
		margin-top: 15px;
		padding-top: 20px;
		padding-left: 15px;
		padding-right: 15px;
		background-color: rgb(242, 242, 242);
	}
	
	#rvCont>p{
		font-size:16px;
	}
	
	#rvCont>div{
		float: left;
	}
	
	#rvInsertBtn{
		width: 100px;
	    height: 50px;
	    border-radius: 10px;
	    margin-top: 70px;
	    margin-left: 30px;
	    border: none;
	    background-color: #f96c85;
	    color: white;
	}
	
	#rvText{
		padding-top: 10px;
		padding-left: 10px;
		border-radius:10px;
		
	}
	
	#rvRate{
		padding-top: 24px;
	}

  /* 주소 복사 버튼 */
  #addressCopy{
    border-radius: 10px;
    font-size: 15px;
    padding: 10px 10px;
    margin-left: 15px;
    border: none;
    background-color: lightgray;
    color: rgb(58, 58, 58);

  }

  /* 전화번호 복사버튼 */
  #phoneCopy{
    border-radius: 10px;
    font-size: 15px;
    padding: 10px 10px;
    margin-left: 15px;
    border: none;
    background-color: lightgray;
    color: rgb(58, 58, 58);
  }

  #graph{
    width: 700px;
    height: 300px;
    border: 2px solid gray;
    border-radius: 10px;
    margin-left: 250px;
    margin-top: 50px;
  }

  #graphImg{
    width: 90%;
    height: 90%;
  }

  /* 접수하기 */
  #hspReceive{
    border: 1px solid red;
    border-bottom: 3px solid gray;
    width: 1000px;
    height: 600px;
    margin: auto;
    margin-bottom: 50px;

  }

  /* 예약하기 */
  #hspReserv{
    border: 1px solid red;
    border-bottom: 3px solid gray;
    width: 1000px;
    height: 600px;
    margin: auto;
    margin-bottom: 50px;
  }
  
  .hosImg{
			width: 30px;
			height: 30px;
			margin-right: 10px;
  }

	.hosDiv>div{
		float:left;
	}
	
	.hosDiv{
		height: 30px;
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
	
	.infoEtc {
	    width: 1100px;
	    font-size: 20px;
	    border-bottom: 3px solid lightgray;
	    padding-bottom: 20px;
  	}
	
	.hpEtc {
	    margin-top: 20px;
	    margin-left: 20px;
	    font-size: 16px;
	    color: rgb(58, 58, 58);
  	}

	
</style>
</head>

<body>
   <jsp:include page="../common/header.jsp"/>
    <div class="main-panel">
        <div class="content-wrapper">
            <br><br><br>
            <div class="outer">
            	<div class="hosDiv">
	            	<div class="hosImgDiv">
	            		<img class="hosImg" src="resources/map/hos3.png">
	            	</div>
	                <div class="mName">          
	                  
	                </div>
	                <div class="listBack">
	                	<button class="listBtn" onclick="location.href='list.kh'">목록으로</button>
	                </div>
                </div>
                <br>
                <div class="diagnosis">
                  <div class="diagnosisStatus"></div> 
                  <div class="diagnosisTime"></div> 
                </div>
                <br>

                <div id="map">
                  
                </div>

                <br><br><br>
                
                <div id="info-tab">
                  <ul>
                    <li id="info"><a class="tab active " id="scrollInfo">병원정보</a></li>
                    <li id="review"><a class="tab">리뷰</a></li>
                    <!-- <li id="receive"><a class="tab">접수하기</a></li>
                    <li id="reservation"><a class="tab">예약하기</a></li> -->
                  </ul>
                </div>
                <br><br>
                <div class="infoStatus">
                  <strong>진료시간</strong>
                  <div class="infoDetail">
                      
                  </div>
                </div>
                
                <br>
                <div class="infoMap">
                  <strong>위치</strong>
                  <div class="mapDetail">
                    <span></span>
                    <button id="addressCopy">주소복사</button>
                  </div>
                </div>
                  <br><br>
                  <div class="infoPhone">
                    <strong>전화번호</strong>
                    <div class="phoneDetail">
                      <span></span>
                      <button id="phoneCopy">전화번호 복사</button>
                    </div>
                  </div>
                  <br><br>
                  <div class="infoEtc">
                  	 <strong>기타사항</strong>
                  	 <div class="hpEtc">

                  	 </div>
                  </div>
                  <br><br>
                  
                  <!-- 리뷰 -->
                  <div id="hsp-review" class="info">
                    <div id="reviewList">
                      <div id="review-div">
                        <span></span>

                        <!-- 리뷰 작성 -->
                        <div id="hspReview">
                          <div id="hspReview1">
                            <div class="hpName"></div>
                            <div id="hpStar"><img src="resources/reviewImg/starHeart/star2.png" id="starImg"></div>
                            <div id="rvRate">
                            	<select id="rate">
                            		<option selected>5</option>
                            		<option>4</option>
                            		<option>3</option>
                            		<option>2</option>
                            		<option>1</option>
                            	</select>
                            </div>
                          </div>
                          <div id="hspReview2">
                            <div id="rvProfile">
                              <div id="nickName">
                              	<c:if test="${ not empty loginUser }">
	                              	<p>${ loginUser.nickName }</p>
                              	</c:if>
                              </div>
                              <div id="profile"><img src="resources/reviewImg/profile/profile1.png" id="profileImg"></div>
                            </div>
                            <div id="rvCont">
                              <div id="rvContent">
                              	<c:choose>
                              		<c:when test="${ empty loginUser }">
                              			<textarea id="rvText" rows="5" cols="55" placeholder="리뷰 작성은 로그인 후 이용가능한 서비스입니다!" readonly></textarea>
                              		</c:when>
                              		<c:otherwise>
		                              	<textarea id="rvText" rows="5" cols="55" placeholder="리뷰를 작성해주세요 😄"></textarea>
                              		</c:otherwise>
                              	</c:choose>
                              </div>
                              
                            </div>
                            <div>
                            	<c:choose>
                            		<c:when test="${ empty loginUser }">
                            			<button id="rvInsertBtn" disabled>등록</button>
                            		</c:when>
                            		<c:otherwise>
		                              	<button id="rvInsertBtn">등록</button>
                            		</c:otherwise>
                            	</c:choose>
                            </div>
                          </div>
                        </div>
                        
                        <!-- 리뷰 목록 -->
                        <div id="review_wrap">
	                        
                        </div>
                        
                      </div>
                    </div>
                  </div> 
            </div>  
            <script>

                $(function(){
                	reviewGet();
                	// 상세정보 조회 ajax 시작
                	$.ajax({
                		url:"selectDetailInfo.kh",
                		data:{hpid:"${hpid}"},
                		success:function(data){
                			
                		  let name = "";
	                      let phone = "";
	                      let time = "";
	                      let todayTime = "";
	                      let address = "";
	                      let onOff = "";
                          let etc = "";
                          
                      var now = new Date();
                      var currentHour = now.getHours();
                      var currentMinute = now.getMinutes();
                      var currentTime = currentHour * 100 + currentMinute; // 현재시간!!

                      $(data).find("item").each(function(i, item){
                        name += $(item).find("dutyName").text()
                        phone += $(item).find("dutyTel1").text()
                        address += $(item).find("dutyAddr").text()
                        etc += $(item).find("dutyEtc").text()
                        var position = new naver.maps.LatLng($(item).find("wgs84Lat").text(), $(item).find("wgs84Lon").text());
		
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
                            url: 'resources/map/pin10.png',
                            scaledSize: new naver.maps.Size(45, 45), // 아이콘 사이즈 조정
                            origin: new naver.maps.Point(0, 0),
                            anchor: new naver.maps.Point(11, 35)
                        }
                    };

                    var marker = new naver.maps.Marker(markerOptions);
                    
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
    
                        // 진료시간에 : 넣기 
                        function formatTime(time) {
                            return time.substring(0, 2) + " : " + time.substring(2);
                        }

                        // 휴진은 빨간색으로
                        function formatClosed(day) {
                            return "<span style='color: red;'>" + day + " 휴진</span><br>";
                        }

                        if($(item).find("dutyTime1s").text() != ""){
                            time += "월요일 " + formatTime($(item).find("dutyTime1s").text()) + " ~ " + formatTime($(item).find("dutyTime1c").text()) + "<br>";
                        }else{
                            time += formatClosed("월요일");
                        }

                        if($(item).find("dutyTime2s").text() != ""){
                            time += "화요일 " + formatTime($(item).find("dutyTime2s").text()) + " ~ " + formatTime($(item).find("dutyTime2c").text()) + "<br>";
                        }else{
                            time += formatClosed("화요일");
                        }

                        if($(item).find("dutyTime3s").text() != ""){
                            time += "수요일 " + formatTime($(item).find("dutyTime3s").text()) + " ~ " + formatTime($(item).find("dutyTime3c").text()) + "<br>";
                        }else{
                            time += formatClosed("수요일");
                        }

                        if($(item).find("dutyTime4s").text() != ""){
                            time += "목요일 " + formatTime($(item).find("dutyTime4s").text()) + " ~ " + formatTime($(item).find("dutyTime4c").text()) + "<br>";
                        }else{
                            time += formatClosed("목요일");
                        }

                        if($(item).find("dutyTime5s").text() != ""){
                            time += "금요일 " + formatTime($(item).find("dutyTime5s").text()) + " ~ " + formatTime($(item).find("dutyTime5c").text()) + "<br>";
                        }else{
                            time += formatClosed("금요일");
                        }

                        if($(item).find("dutyTime6s").text() != ""){
                            time += "토요일 " + formatTime($(item).find("dutyTime6s").text()) + " ~ " + formatTime($(item).find("dutyTime6c").text()) + "<br>";
                        }else{
                            time += formatClosed("토요일");
                        }

                        if($(item).find("dutyTime7s").text() != ""){
                            time += "일요일 " + formatTime($(item).find("dutyTime7s").text()) + " ~ " + formatTime($(item).find("dutyTime7c").text()) + "<br>";
                        }else{
                            time += formatClosed("일요일");
                        }

                        if($(item).find("dutyTime8s").text() != ""){
                            time += "공휴일 " + formatTime($(item).find("dutyTime8s").text()) + " ~ " + formatTime($(item).find("dutyTime8c").text());
                        }else{
                            time += formatClosed("공휴일");
                        }

                        // 오늘 진료시간
                        switch(new Date().getDay()){
                            case 0 : 
                                if($(item).find("dutyTime7s").text() == ""){
                                    todayTime += "<span style='color: red;'>일요일 영업안함</span>";
                                    onOff += "⚫ 영업안함";
                                }else{
                                    todayTime += "오늘(일요일) " + formatTime($(item).find("dutyTime7s").text())
                                                + " ~ " + formatTime($(item).find("dutyTime7c").text());
                                    checkBusinessHours("dutyTime7s", "dutyTime7c");            
                                }
                                break;
                            case 1 : 
                                if($(item).find("dutyTime1s").text() == ""){
                                    todayTime += "<span style='color: red;'>월요일 영업안함</span>";
                                    onOff += "⚫ 영업안함";
                                }else{
                                    todayTime += "오늘(월요일) " + formatTime($(item).find("dutyTime1s").text())
                                                + " ~ " + formatTime($(item).find("dutyTime1c").text());
                                    checkBusinessHours("dutyTime1s", "dutyTime1c");
                                }
                                break;
                            case 2 : 
                                if($(item).find("dutyTime2s").text() == ""){
                                    todayTime += "<span style='color: red;'>화요일 영업안함</span>";
                                    onOff += "⚫ 영업안함";
                                }else{
                                    todayTime += "오늘(화요일) " + formatTime($(item).find("dutyTime2s").text())
                                                + " ~ " + formatTime($(item).find("dutyTime2c").text());
                                    checkBusinessHours("dutyTime2s", "dutyTime2c");
                                }
                                break;
                            case 3 : 
                                if($(item).find("dutyTime3s").text() == ""){
                                    todayTime += "<span style='color: red;'>수요일 영업안함</span>";
                                    onOff += "⚫ 영업안함";
                                }else{
                                    todayTime += "오늘(수요일) " + formatTime($(item).find("dutyTime3s").text())
                                                + " ~ " + formatTime($(item).find("dutyTime3c").text());
                                    checkBusinessHours("dutyTime3s", "dutyTime3c");
                                }
                                break;
                            case 4 : 
                                if($(item).find("dutyTime4s").text() == ""){
                                    todayTime += "<span style='color: red;'>목요일 영업안함</span>";
                                    onOff += "⚫ 영업안함";
                                }else{
                                    todayTime += "오늘(목요일) " + formatTime($(item).find("dutyTime4s").text())
                                                + " ~ " + formatTime($(item).find("dutyTime4c").text());
                                    checkBusinessHours("dutyTime4s", "dutyTime4c");
                                }
                                break;  
                            case 5 : 
                                if($(item).find("dutyTime5s").text() == ""){
                                    todayTime += "<span style='color: red;'>금요일 영업안함</span>";
                                    onOff += "⚫ 영업안함";
                                }else{
                                    todayTime += "오늘(금요일) " + formatTime($(item).find("dutyTime5s").text())
                                                + " ~ " + formatTime($(item).find("dutyTime5c").text());
                                    checkBusinessHours("dutyTime5s", "dutyTime5c");
                                }
                                break;   
                            case 6 : 
                                if($(item).find("dutyTime6s").text() == ""){
                                    todayTime += "<span style='color: red;'>토요일 영업안함</span>";
                                    onOff += "⚫ 영업안함";
                                }else{
                                    todayTime += "오늘(토요일) " + formatTime($(item).find("dutyTime6s").text())
                                                + " ~ " + formatTime($(item).find("dutyTime6c").text());
                                    checkBusinessHours("dutyTime6", "dutyTime6c");
                                }
                                break;
                            default : 
                                if($(item).find("dutyTime8s").text() == ""){
                                    todayTime += "<span style='color: red;'>공휴일 영업안함</span>";
                                    onOff += "⚫ 영업안함";
                                }else{
                                    todayTime += "오늘(공휴일) " + formatTime($(item).find("dutyTime8s").text())
                                                + " ~ " + formatTime($(item).find("dutyTime8c").text());
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

	                              
                      })
                               
                        $(".mName").html(name);
                      	$(".hpName").html('<p>' + name + '</p>');
                        $(".phoneDetail span").html(phone);
                        $(".mapDetail span").html(address);
                        $(".infoDetail").html(time);
                        $(".diagnosisTime").html(todayTime);
                        $(".diagnosisStatus").html(onOff);
                        
                        if(etc != ""){
	                        $(".hpEtc").html(etc);
                        	
                        }else{
                        	$(".hpEtc").html("기타사항 없음");
                        }
                               
                		}, error:function(){
                			console.log("상세정보 조회 ajax 통신 실패");
                		}
                	})
                  // 상세정보 ajax 끝
                  
                  // 리뷰 조회
                  function reviewGet(){
                		
	                  $.ajax({
		          			url:"review.get",
		          			data:{
		          				 hosCode:"${ hpid }"
		          				 },
		          			success:function(data){
		          					
		          					let value = "";
		          					if(data.length > 0){
	
			          					for(let i in data){
			               					value += "<div id='hspReview'>"
			               						   +  "<div id='hspReview1'>"
				         	                       +   "<div class='hpName'></div>"
				         	                       +   "<div id='hpStar'><img src='resources/reviewImg/starHeart/star2.png' id='starImg'></div>"
				         	                       +   "<div id='hpRate'><p>"+ data[i].rate + "</p></div>"
												   +  "</div>"
				         	                       +  "<div id='hspReview2'>"
				         	                       +  "<div id='rvProfile'>"
				         	                       +     "<div id='nickName'><p>"+data[i].nickName   +"</p></div>"
				         	                       +     "<div id='profile'><img src='resources/reviewImg/profile/profile1.png' id='profileImg'></div>"
				         	                       +    "</div>"
				         	                       +    "<div id='rvCont'>"
				         	                       +     "<p>"+ data[i].revContent
				         	                       +     "</p>"
				         	                       +   "</div>"
				         	                       +  "</div>"
				         	                       + "</div>";
			          					}
		                       		}else {
		                       			value += "<div id='hspReview'>"
		                       					+ "<p style='text-align:center; font-size:17px; margin-top: 100px;'>등록된 리뷰가 없습니다.<br><br> 리뷰를 등록해주시면 많은 도움이 됩니다😄</p>"
		                       					+ "</div>";
		                       			
		                       		}		  
		          							  $("#review-div span").html("리뷰 ( 총 " + data.length + "개 )");
		                	                  $("#review_wrap").html(value);     
	                       			}, error:function(){
	                       				console.log("ajax 통신실패");
	                       			}
	                       			
	                       		})
                	}
                  
                  // 리뷰 등록
                  $("#rvInsertBtn").click(function(){
						
             			$.ajax({
                 			url:"review.in",
                 			data:{
                 				memNo:"${ loginUser.memNo }",
                 				revContent:$("#rvText").val(),
                 				hosCode:"${ hpid }",
                 				rate:$("#rate").val()
                 				 },
                 			success:function(data){
               					
               					let value = "";
               					for(let i in data){
							
               						value += "<div id='hspReview'>"
                						   +  "<div id='hspReview1'>"
			       	                       +   "<div class='hpName'></div>"
			       	                       +   "<div id='hpStar'><img src='resources/reviewImg/starHeart/star2.png' id='starImg'></div>"
			       	                       +   "<div id='hpRate'><p>"+ data[i].rate + "</p></div>"
			       	                       +   "</div>"
			       	                       +   "<div id='hspReview2'>"
			       	                       +   "<div id='rvProfile'>"
			       	                       +   "<div id='nickName'><p>${ loginUser.memName }</p></div>"
			       	                       +   "<div id='profile'><img src='resources/reviewImg/profile/profile1.png' id='profileImg'></div>"
			       	                       +   "</div>"
			       	                       +   "<div id='rvCont'>"
			       	                       +   "<p>"+ data[i].revContent
			       	                       +   "</p>"
			       	                       +   "</div>"
			       	                       +   "</div>"
			       	                       +   "</div>";
               					}
      	                 	 $("#review_wrap").html(value);
      	                 	 $("#rvText").val("");
      	                 	 reviewGet();
      	                 	 
                 			}, error:function(){
                 				console.log("리뷰 등록 ajax 통신실패");
                 			}
                 			
                 		})
             		})


                  // 주소 복사
                  $('#addressCopy').click(function() {
                    var address = $('.mapDetail span').text();
                    var tempInput = $('<input>');
                    $('body').append(tempInput);
                    tempInput.val(address).select();
                    document.execCommand('copy');
                    tempInput.remove();
                    alertify.alert('한의원 주소 복사', '주소가 복사되었습니다.');
                  });

                 // 전화번호 복사
                 $('#phoneCopy').click(function() {
                    var address = $('.phoneDetail span').text();
                    var tempInput = $('<input>');
                    $('body').append(tempInput);
                    tempInput.val(address).select();
                    document.execCommand('copy');
                    tempInput.remove();
                    alertify.alert('한의원 전화번호 복사', '전화번호가 복사되었습니다.');
                 });
                	
                	
                  // 탭 클릭시 해당 div로 스크롤 이동
                  $("#scrollInfo").on('click', function(){
                    event.preventDefault(); // 기본 동작 방지
                    // 이동할 대상 div 요소 선택자
                    var targetDiv = document.getElementById("scrollInfo");

                    // 대상 div 요소로 스크롤 이동
                    targetDiv.scrollIntoView({ behavior: 'smooth' });
                  });

                  $("#review").on('click', function(){
                    event.preventDefault(); // 기본 동작 방지
                    // 이동할 대상 div 요소 선택자
                    var targetDiv = document.getElementById("hsp-review");

                    // 대상 div 요소로 스크롤 이동
                    targetDiv.scrollIntoView({ behavior: 'smooth' });
                  });

                })

                
            </script>
            <div id="recentView">
              <p>최근 본 의료기관</p>
            </div>
        </div>
    
        <jsp:include page="../common/footer.jsp"/>

</body>
</html>