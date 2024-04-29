<%@page import="com.kh.medicare.hospital.model.vo.Hospital"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% Hospital h = (Hospital)session.getAttribute("hospital");   %>
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
    padding-top: 30px;
  }

  /* 병원 이름 */
  .mName {
    font-size: 30px;
    font-weight: 600;
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
    width: 200px;
    height: 500px;
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
    border-bottom: 3px solid gray;
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
	#hpName{
		width: 180px;
	}

	#hpName p{
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
		width: 600px;
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
		width: 600px;
		height: 150px;
		border-radius: 10px;
		margin-left: 50px;
		margin-top: 15px;
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
    height: 100px;
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
	
#rvCont>div{
	float:left;
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

</style>
</head>
<body>

<jsp:include page="../common/header.jsp"/>
    <div class="main-panel">
        <div class="content-wrapper">
            <br><br><br>
            <div class="outer">
                <div class="mName">   
                	${ h.hosName }
                </div>
                <br>
                <div class="diagnosis">
                  <div class="diagnosisStatus"></div> 
                  <div class="diagnosisTime"></div> 
                </div>
                <br>
                <div class="distance">
                  <p>현 위치와의 거리 : ${ distance }m | ${ dot } </p>
                </div>   
                <div id="map">
                  
                </div>
               
                
                <br><br><br>
                
                <div id="info-tab">
                  <ul>
                    <li id="info"><a class="tab active " id="scrollInfo">병원정보</a></li>
                    <li id="review"><a class="tab">리뷰</a></li>
                    <li id="receive"><a class="tab">접수하기</a></li>
                    <li id="reservation"><a class="tab">예약하기</a></li>
                  </ul>
                </div>
                <br><br>
                <div class="infoStatus">
                  <strong>진료시간</strong>
                  <div class="infoDetail">
                  </div>
                </div>
                
                <br>
                <script>
                $(document).ready(function(){
                    var elementIds = ["${ h.hosStMon }", "${ h.hosCtMon }", "${ h.hosStTue }", "${ h.hosCtTue }", "${ h.hosStWen }", "${ h.hosCtWen }", "${ h.hosStThu }", "${ h.hosCtThu }", "${ h.hosStFri }", "${ h.hosCtFri }", "${ h.hosStSat }", "${ h.hosCtSat }", "${ h.hosStSun }", "${ h.hosCtSun }", "${ h.hosStHol }" , "${ h.hosCtHol }"];
                    var elementIdss = [];
					var value = "";
                    // Define the convertToTime function
                    function convertToTime(value) {
                        if (value.length === 3) {
                            return value.substring(0, 1) + ":" + value.substring(1);
                        } else if (value.length === 4) {
                            return value.substring(0, 2) + ":" + value.substring(2);
                        } else {
                            return "1";
                        }
                    }

                    // Loop through the array and update the value of each element
                    for (var i = 0; i < elementIds.length; i++) {
                        // Check if the element exists before updating its value
                        var convertedTime = convertToTime(elementIds[i]);
                        elementIdss.push(convertedTime); // Push the converted time into the elementIdss array
                        console.log(elementIdss[i]); // Log the array after the loop
                    }

                
                    
                    value += "<div>" 
                    if(elementIdss[0] != 0 && elementIdss[0] != "1" && elementIdss[1] != 0 && elementIdss[1] != "1"){
                    value += "월:" + elementIdss[0] + "~" + elementIdss[1] + "<br>" 
                    }else{
                    	value+= "월 : 휴진" + "<br>"
                    }
                    if(elementIdss[2] != 0 && elementIdss[2] != "1" && elementIdss[3] != 0 && elementIdss[3] != "1"){
                    value += "화:" + elementIdss[2] + "~" + elementIdss[3] + "<br>" 
                    }else{
                    	value+= "화 : 휴진" + "<br>"
                    }
                    if(elementIdss[4] != 0 && elementIdss[4] != "1" && elementIdss[5] != 0 && elementIdss[5] != "1"){
                    value += "수:" + elementIdss[4] + "~" + elementIdss[5] + "<br>" 
                    }else{
                    	value+= "수 : 휴진" + "<br>"
                    }
                    if(elementIdss[6] != 0 && elementIdss[6] != "1" && elementIdss[7] != 0 && elementIdss[7] != "1"){
                    value += "목:" + elementIdss[6] + "~" + elementIdss[7] + "<br>" 
                    }else{
                    	value+= "목 : 휴진" + "<br>"
                    }
                    if(elementIdss[8] != 0 && elementIdss[8] != "1" && elementIdss[9] != 0 && elementIdss[9] != "1"){
                    value += "금:" + elementIdss[8] + "~" + elementIdss[9] + "<br>"
                    }else{
                    	value+= "금 : 휴진" + "<br>"
                    }
                    if(elementIdss[10] != 0 && elementIdss[10] != "1" && elementIdss[11] != 0 && elementIdss[11] != "1"){
                    value += "토:" + elementIdss[10] + "~" + elementIdss[11] + "<br>"
                    }else{
                    	value+= "토 : 휴진" + "<br>"
                    }
                    if(elementIdss[12] != 0 && elementIdss[12] != "1" && elementIdss[13] != 0 && elementIdss[13] != "1"){
                    value += "일:" + elementIdss[12] + "~" + elementIdss[13] + "<br>"
                    }else{
                    	value+= "일 : 휴진" + "<br>"
                    }
                    if(elementIdss[14] != 0 && elementIdss[14] != "1" && elementIdss[15] != 0 && elementIdss[15] != "1"){
                    value += "공휴일:"+ elementIdss[13] + "~" + elementIdss[14] + "<br>";
                    }else{
                    	value+= "공유일 : 휴진"
                    }
                    value+= "</div>"

                $(".infoDetail").html(value);
                    
                });
                </script>
                
                <div class="infoMap">
                  <strong>위치</strong>
                  <div class="mapDetail">
                    <span></span>
                    ${ h.hosAddress }
                    <button id="addressCopy">주소복사</button>
                  </div>
                </div>
                  <br><br>
                  <div class="infoPhone">
                    <strong>전화번호</strong>
                    <div class="phoneDetail">
                      <span></span>
                      ${ h.hosTel }
                      <button id="phoneCopy">전화번호 복사</button>
                    </div>
                  </div>
                  <!-- 리뷰 -->
                  <div id="hsp-review" class="info">
                    <div id="reviewList" >
                      <div id="review-div">
                        <span>리뷰 ( 총 23개 )</span>
                        
                        <div id="graph">
                            <img id="graphImg" src="resources/reviewImg/4.png">
                        </div>
                        
                        <div> <!-- 글작성 -->
                        	<div id="hspReview">
	                          <div id="hspReview1">
	                            <div id="hpName"><p>${ h.hosName }</p></div>
	                            <div id="hpStar"><img src="resources/reviewImg/starHeart/star2.png" id="starImg"></div>
	                            <div id="hpRate"><p id="hPtag">3.5</p></div>
	                            <div id="hpHeart"><img src="resources/reviewImg/starHeart/heart-black2.png" id="heartImg"></div>
	                          </div>
	                          <div id="hspReview2">
	                            <div id="rvProfile">
	                              <div id="nickName"><p>
	                              <c:if test="${ not empty loginUser }">
	                              	${ loginUser.memName }
	                              </c:if>
	                              <c:if test="${ empty loginUser }">
	                              	로그인 후 <br> 사용가능
	                              </c:if>
	                              
	                              </p></div>
	                              <div id="profile"><img src="resources/reviewImg/profile/profile1.png" id="profileImg"></div>
	                            </div>
	                            <div id="rvCont">
	                              <div id="rvCont_1"><textarea id="rvCont_area" rows="5" cols="50" style="border-radius:15px;"></textarea></div>
	                            </div>
	                              <div id="rvCont_2" style="margin-top:40px; "><button id="reviewBtn" style="border:0px; border-radius: 15px; height:80px; width:50px; background-color: #f2c9d2; color:white;">등록</button></div>
	                          </div>
	                        </div>
                        </div>
                        
                        <script>
                        	$(document).ready(function(){
                        		
                        		var position = new naver.maps.LatLng(${h.hosLatitude}, ${h.hosLongitude});
                        		
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
                                    + '<h4>${h.hosName}</h4>'
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
                        		
                        		$.ajax({
                        			url:"review.get",
                        			data:{
                        				 hosCode:"${ h.hosCode }"
                        				 },
                        			success:function(data){
                        					console.log(data)
                        					
                        					let value = "";
                        					for(let i in data){
                        						
                        					
	                           					value += "<div id='hspReview'>"
	                           						   +  "<div id='hspReview1'>"
			                	                       +   "<div id='hpName'><p>${ h.hosName }</p></div>"
			                	                       +   "<div id='hpStar'><img src='resources/reviewImg/starHeart/star2.png' id='starImg'></div>"
			                	                       +   "<div id='hpRate'><p>"+ data[i].rate + "</p></div>"
			                	                       +   "<div id='hpHeart'><img src='resources/reviewImg/starHeart/heart-black2.png' id='heartImg'></div>"
			                	                       +  "</div>"
			                	                       +  "<div id='hspReview2'>"
			                	                       +  "<div id='rvProfile'>"
			                	                       +     "<div id='nickName'><p>"+data[i].memNo+"</p></div>"
			                	                       +     "<div id='profile'><img src='resources/reviewImg/profile/profile1.png' id='profileImg'></div>"
			                	                       +    "</div>"
			                	                       +    "<div id='rvCont'>"
			                	                       +     "<p>"+ data[i].revContent
			                	                       +     "</p>"
			                	                       +   "</div>"
			                	                       +  "</div>"
			                	                       + "</div>"
                        					
                        					}
		                	                  $("#review_wrap").html(value);     
                        			}, error:function(){
                        				console.log("ajax 통신실패");
                        			}
                        			
                        		})
                        	});
                        	</script>
                        	<script>
                        
                        	$(function(){
                        		$("#reviewBtn").click(function(){
                        			$.ajax({
                            			url:"review.in",
                            			data:{
                            				memNo:${ loginUser.memNo },
                            				revContent:$("#rvCont_area").val(),
                            				 hosCode:"${ h.hosCode }",
                            				 rate:$("#hPtag").text()
                            				 },
                            			success:function(data){
                            					console.log(data)
                            					
                            					let value = "";
                            					for(let i in data){
                            						
                            					
		                           					value += "<div id='hspReview'>"
		                           						   +  "<div id='hspReview1'>"
				                	                       +   "<div id='hpName'><p>${ h.hosName }</p></div>"
				                	                       +   "<div id='hpStar'><img src='resources/reviewImg/starHeart/star2.png' id='starImg'></div>"
				                	                       +   "<div id='hpRate'><p>"+ data[i].rate + "</p></div>"
				                	                       +   "<div id='hpHeart'><img src='resources/reviewImg/starHeart/heart-black2.png' id='heartImg'></div>"
				                	                       +  "</div>"
				                	                       +  "<div id='hspReview2'>"
				                	                       +  "<div id='rvProfile'>"
				                	                       +     "<div id='nickName'><p>${ loginUser.memName }</p></div>"
				                	                       +     "<div id='profile'><img src='resources/reviewImg/profile/profile1.png' id='profileImg'></div>"
				                	                       +    "</div>"
				                	                       +    "<div id='rvCont'>"
				                	                       +     "<p>"+ data[i].revContent
				                	                       +     "</p>"
				                	                       +   "</div>"
				                	                       +  "</div>"
				                	                       + "</div>"
                            					
                            					}
			                	                  $("#review_wrap").html(value);     
                            			}, error:function(){
                            				console.log("ajax 통신실패");
                            			}
                            			
                            		})
                        		})
                        		
                        	});
                        </script>
                        
                        <div id="review_wrap" style="z-index:30;overflow: scroll; height:700px; ">
	                        <div id="hspReview">
	                          <div id="hspReview1">
	                            <div id="hpName"><p>하늘피부과</p></div>
	                            <div id="hpStar"><img src="resources/reviewImg/starHeart/star2.png" id="starImg"></div>
	                            <div id="hpRate"><p>3.5</p></div>
	                            <div id="hpHeart"><img src="resources/reviewImg/starHeart/heart-black2.png" id="heartImg"></div>
	                          </div>
	                          <div id="hspReview2">
	                            <div id="rvProfile">
	                              <div id="nickName"><p>정밍</p></div>
	                              <div id="profile"><img src="resources/reviewImg/profile/profile1.png" id="profileImg"></div>
	                            </div>
	                            <div id="rvCont">
	                              <p> 이 피부과 진짜 추천이에여!! <br>
	                                완전 물광피부 됐어요 친구도 추천해줄라구요~
	                              </p>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <div id="moreReview">
	                          <!-- <button id="moreReviewBtn"><img id="moreBtnImg" src="resources/mainIcon/menu1.png">리뷰 더보기</button> -->
	                          <button id="moreReviewBtn"><img id="moreBtnImg" src="resources/mainIcon/menu2.png">리뷰 더보기</button>
	                          <!-- <button id="moreReviewBtn"><img id="moreBtnImg" src="resources/mainIcon/menu3.png">리뷰 더보기</button> -->
	                          
	                        </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div id="hspReceive">
                    접수하기 화면
                    <a href="order.go">접수하기</a>
                    
						
                  
					</div>
                  
                  
            </div>    
            <script>



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

                  $("#receive").on('click', function(){
                    event.preventDefault(); // 기본 동작 방지
                    // 이동할 대상 div 요소 선택자
                    var targetDiv = document.getElementById("hspReceive");

                    // 대상 div 요소로 스크롤 이동
                    targetDiv.scrollIntoView({ behavior: 'smooth' });
                  });

                  $("#reservation").on('click', function(){
                    event.preventDefault(); // 기본 동작 방지
                    // 이동할 대상 div 요소 선택자
                    var targetDiv = document.getElementById("hspReserv");

                    // 대상 div 요소로 스크롤 이동
                    targetDiv.scrollIntoView({ behavior: 'smooth' });
                  });

                

                
            </script>
            <div id="recentView">
              <p>최근 본 의료기관</p>
            </div>
        </div>
    	
        <jsp:include page="../common/footer.jsp"/>


</body>
</html>