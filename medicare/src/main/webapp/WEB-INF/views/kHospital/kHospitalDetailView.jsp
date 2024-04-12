<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

  .main-panel{
    border: 1px solid green;
  }
  .content-wrapper{
    border: 1px solid green;
  }
  .outer{
    width: 1200px;
    height: auto;
    border: 1px solid red;
    padding-left: 50px;
  }
  .outer div{
    border: 1px solid blue;
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
  .map {
    width: 1100px;
    height: 600px;
    border-radius: 10px;
    border: 1px solid black;
    margin-top: 20px;
    margin-left: 10px;
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
  }

  .mInfo button{
    border: none;
    background-color: #F5F7FF;
    width: 150px;
    height: 70px;
    font-size: 20px;
    font-weight: 600;
  }

  /* 진료 시간 */
  .infoStatus {
    font-size: 20px;
    border-bottom: 3px solid lightgray;
  }

  .infoDetail {
    margin-top: 20px;
    margin-bottom: 20px;
    margin-left: 20px;
    font-size: 16px;
    color: rgb(58, 58, 58);
  }

  .infoMap {
    font-size: 20px;
    border-bottom: 3px solid lightgray;
    
  }

  .phoneDetail button{
    margin-left: 850px;
  }
  
  .phoneDetail{
    padding-left: 20px;
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
    border: 1px solid purple;
    margin-left: 50px;
  }

  #recentView p {
    font-size: 20px;
    font-weight: 500;
    text-align: center;
    margin-top: 30px;
    
  }

  #recentView>div{
    position: sticky;
    border: 1px solid gray;
    top: 0;
  }

  #recentSticky{
    width: 300px;
    height: 1000px;
    
  }
  .content-wrapper>div{
    float: left;
  }

  /* 리뷰 스타일 */
  #myreview{
		width: 900px;
		height: 250px;
		border: 2px solid #F96C85;
		border-radius: 10px;
		margin: 50px 150px;
	}

	#myreview1{
		width: 900px;
		height: 50px;
	}

	#myreview1>div{
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
    font-size: 18px;
    color: gray;
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
	}

	#starImg, #heartImg{
		width: 25px;
		height: 25px;
		margin-top: 3px;
	}

  /* 리뷰 큰 div */
	#myreview2{
		width: 900px;
		height: 200px;
		
	}

	#myreview2>div{
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
    border: 1px solid red;
    border-radius: 10px;
    margin-left: 250px;
    margin-top: 50px;

  }
</style>
<body>
   <jsp:include page="../common/header.jsp"/>
    <div class="main-panel">
        <div class="content-wrapper">
            <br><br><br><br>
            <div class="outer">
                <div class="mName">          
                  오 이비인후과
                </div>
                <br>
                <div class="diagnosis">
                  <div class="diagnosisStatus">🟢 진료중 | 🔴 진료종료 </div> 
                  <div class="diagnosisTime">&nbsp;오늘 09:00 ~ 21:00</div> 
                </div>
                <br>
                <div class="distance">
                  <p>885m | 이비인후과 </p>
                </div>   
                <div class="map">
                  지도
                </div>
                <br><br><br>
                <div class="mInfo">
                  <button>병원정보</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <button>진료정보</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <button>리뷰</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <button>접수</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <button>예약</button>
                </div>
                <br><br>
                <div class="infoStatus">
                  <strong>진료시간</strong>
                  <div class="infoDetail">
                      월요일 휴진 <br>
                      화요일 09 : 00 ~ 18 : 00 <br>
                      수요일 09 : 00 ~ 18 : 00 <br>
                      목요일 09 : 00 ~ 18 : 00 <br>
                      금요일 09 : 00 ~ 18 : 00 <br>
                      토요일 09 : 00 ~ 13 : 00 <br>
                      일요일 휴진
                  </div>
                </div>
                
                <br>
                <div class="infoMap">
                  <strong>위치</strong>
                  <br><br>
                  &nbsp;&nbsp;서울특별시 강남구 강남대로 470
                  <button id="addressCopy">주소복사</button>
                  <br><br>
                  <br><br>
                  <div class="infoPhone">
                    <strong>전화번호</strong>
                    <div class="phoneDetail">
                      02-5560-1222
                      <button id="phoneCopy">전화번호 복사</button>
                    </div>
                  </div>
                  <br><br>
                </div>
                  <br><br>
                  <!-- 리뷰 -->
                  <div id="myReview" class="info">
                    <div id="reviewList">
                      <div id="review-div">
                        <span>리뷰(총 23개)</span>
                        <div id="graph">

                        </div>
                        <div id="myreview">
                          
                          <div id="myreview1">
                            <div id="hpName"><p>하늘피부과</p></div>
                            <div id="hpStar"><img src="resources/reviewImg/starHeart/star2.png" id="starImg"></div>
                            <div id="hpRate"><p>3.5</p></div>
                            <div id="hpHeart"><img src="resources/reviewImg/starHeart/heart-black2.png" id="heartImg"></div>
                          </div>
                          <div id="myreview2">
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
                        <div id="myreview">
                          <div id="myreview1">
                            <div id="hpName"><p>하얀이비인후과</p></div>
                            <div id="hpStar"><img src="resources/reviewImg/starHeart/star2.png" id="starImg"></div>
                            <div id="hpRate"><p>4</p></div>
                            <div id="hpHeart"><img src="resources/reviewImg/starHeart/heart-full.png" id="heartImg"></div>
                          </div>
                          <div id="myreview2">
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
                      </div>
                    </div>
                  </div>
                  
            </div>    
          
            <div id="recentView">
              <div id="recentSticky">
                  <p>최근 본 의료기관</p>

                </div>
            </div>
        </div>
    
        <jsp:include page="../common/footer.jsp"/>
     

       
</body>
</html>