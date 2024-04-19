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
		padding-top: 40px;
		padding-left: 15px;
		background-color: rgb(242, 242, 242);
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


</style>
</head>
<body>

<jsp:include page="../common/header.jsp"/>
    <div class="main-panel">
        <div class="content-wrapper">
            <br><br><br>
            <div class="outer">
                <div class="mName">   
                	${ hospital.hosName }
                </div>
                <br>
                <div class="diagnosis">
                  <div class="diagnosisStatus"></div> 
                  <div class="diagnosisTime"></div> 
                </div>
                <br>
                <div class="distance">
                  <p>885m | 이비인후과 </p>
                </div>   
                <div id="map">
                  
                </div>
               
                <script>
				  
                  naver.maps.Service.geocode({
                      query: "경기도 수원시 장안구 정자동 945"
                  }, function(status, response) {
                	  console.log("${ h.hName }")
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
                              url: 'resources/logo/logo-mini.png',
                              scaledSize: new naver.maps.Size(45, 45), // 아이콘 사이즈 조정
                              origin: new naver.maps.Point(0, 0),
                              anchor: new naver.maps.Point(11, 35)
                          }
                      };

                      var marker = new naver.maps.Marker(markerOptions);
                  });

                </script>
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
                  <!-- 리뷰 -->
                  <div id="hsp-review" class="info">
                    <div id="reviewList">
                      <div id="review-div">
                        <span>리뷰 ( 총 23개 )</span>
                        <div id="graph">
                            <img id="graphImg" src="resources/reviewImg/4.png">
                        </div>
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
                        <div id="hspReview">
                          <div id="hspReview1">
                            <div id="hpName"><p>하얀이비인후과</p></div>
                            <div id="hpStar"><img src="resources/reviewImg/starHeart/star2.png" id="starImg"></div>
                            <div id="hpRate"><p>4</p></div>
                            <div id="hpHeart"><img src="resources/reviewImg/starHeart/heart-full.png" id="heartImg"></div>
                          </div>
                          <div id="hspReview2">
                            <div id="rvProfile">
                              <div id="nickName"><p>정밍</p></div>
                              <div id="profile"><img src="resources/reviewImg/profile/profile1.png" id="profileImg"></div>
                            </div>
                            <div id="rvCont">
                              <p> 비염 때문에 이비인후과 자주가는데
                                약도 잘들고 의사쌤 완전 친절하세요!!!!
                              </p>
                            </div>
                          </div>
                        </div>
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
                        <div id="hspReview">
                          <div id="hspReview1">
                            <div id="hpName"><p>하얀이비인후과</p></div>
                            <div id="hpStar"><img src="resources/reviewImg/starHeart/star2.png" id="starImg"></div>
                            <div id="hpRate"><p>4</p></div>
                            <div id="hpHeart"><img src="resources/reviewImg/starHeart/heart-full.png" id="heartImg"></div>
                          </div>
                          <div id="hspReview2">
                            <div id="rvProfile">
                              <div id="nickName"><p>정밍</p></div>
                              <div id="profile"><img src="resources/reviewImg/profile/profile1.png" id="profileImg"></div>
                            </div>
                            <div id="rvCont">
                              <p> 비염 때문에 이비인후과 자주가는데
                                약도 잘들고 의사쌤 완전 친절하세요!!!!
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
                  <div id="hspReceive">
                    접수하기 화면
                  </div>
                  <div id="hspReserv">
                    예약하기 화면
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

                })

                
            </script>
            <div id="recentView">
              <p>최근 본 의료기관</p>
            </div>
        </div>
    
        <jsp:include page="../common/footer.jsp"/>


</body>
</html>