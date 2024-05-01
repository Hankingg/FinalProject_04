<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
.content-wrapper{
  /* border: 1px solid black; */
  display: flex;
  justify-content: left;
}
.outer{
  width: 1260px;
  height: auto; 
  /* border: 1px solid blue; */
}
.outer>div{
  width: 1260px;
}
.inner1{
  height: 315px;
  display: flex;
  justify-content: center;
}
.inner2{
  height: 171px;
  display: flex;
  justify-content: center;
}
.inner3{
  height: 171px;
  display: flex;
  justify-content: center;
}
.inner4{
  height: 90px;
}
.inner5{
  height: 108px;
  padding-left: 90px;
  width: 1170px;
}
.inner6{
  height: 27px;
  padding-left: 90px;
  width: 1170px;
}

.inner_1{
  height: 270px;
  float: left;
  margin-left: 75px;
  margin-top: 45px;
  margin-right: 62px;
  width: 225px;
  background-color: rgb(233, 231, 231);
  border-radius: 15px;
}

.inner_2{
  height: 270px;
  float: left;
  margin-top: 45px;
  margin-right: 75px;
  width: 225px;
  background-color: rgb(233, 231, 231);
  border-radius: 15px;
}

.inner2s{
  height: 126px;
  float: left;
  margin-left: 72px;
  margin-top: 45px;
  width: 522px;
  border: 3px solid lightgrey;
  border-radius: 10px;
}

.inner3s{
  height: 126px;
  float: left;
  margin-left: 72px;
  margin-top: 45px;
  width: 522px;
  border: 3px solid lightgrey;
  border-radius: 10px;
}

.inner4s{
  height: 36px;
  margin-top: 45px;
  float: left;
}

.inner4s_1{
  margin-left: 108px;
}

.inner5s{
  height: 108px;
  width: 108px;
  float: left;
  margin-left: 27px;
  border-radius: 20px;
}

.inner6s{
  height: 27px;
  width: 108px;
  float: left;
  margin-left: 27px;
}

/* ==========================================여기까지 큰 틀 나누기============================================== */

/* ------------- inner1 스타일 -------------- */
/* 폰트 스타일 */
.searchAmbulance_1 p{
  font-weight: bolder;
  font-size: 27px;
  line-height: 40px;
}
.receiveHospital_1 p{
  font-weight: bolder;
  font-size: 27px;
  line-height: 40px;
}
.reserveHospital_1 p{
  font-weight: bolder;
  font-size: 27px;
  line-height: 40px;
}
.telemedicine_1 p{
  font-weight: bolder;
  font-size: 27px;
  line-height: 40px;
}
/* div 스타일 */
.searchAmbulance_1{
  height: 135px;
  padding-top: 36px;
  padding-left: 58.5px;
}
.searchAmbulance_2{
  height: 135px;
  padding-left: 54px; 
}

.receiveHospital_1{
  height: 135px;
  padding-top: 63px;
  padding-left: 58.5px;
}
.receiveHospital_2{
  height: 135px;
  padding-left: 54px;
}

.reserveHospital_1{
  height: 135px;
  padding-top: 63px;
  padding-left: 58.5px;
}
.reserveHospital_2{
  height: 135px;
  padding-left: 54px;
}

.telemedicine_1{
  height: 135px;
  padding-top: 54px;
  padding-left: 54px;
}
.telemedicine_2{
  height: 135px;
  padding-left: 90px;
}

/* ------------- inner2 스타일 -------------- */
/* ---------- 한의원 ---------- */
.kHospital>div{
  height: 126px;
  float: left;
}
.kHospital_1{
  width: 144px;
}
.kHospital_2{
  width: 372px;
  padding-top: 9px;
}
.searchKHospital_1>p{
  font-weight: bolder;
  font-size: 27px;
  line-height: 40.5px;
  padding-left: 45px;
  padding-top: 20px;
}
.searchKHospital_2>p{
  font-size: 18px;
  padding-left: 27px;
}

/* ---------- 약국 ---------- */
.pharmacy>div{
  height: 126px;
  float: left;
}
.pharmacy_1{
  width: 162px;
  padding-left: 22.5px;
  padding-top: 4.5px;
}
.pharmacy_2{
  width: 354px;
  padding-top: 9px;
  padding-left: 9px;
}
.searchPharmacy_1>p{
  font-weight: bolder;
  font-size: 27px;
  line-height: 40.5px;
  padding-left: 45px;
  padding-top: 20px;
}
.searchPharmacy_2>p{
  font-size: 18px;
  padding-left: 27px;
}

/* ---------- 멤버십 ---------- */
.membership_1{
  height: 54px;
  padding-left: 144px;
  padding-top: 27px;
}
.membership_2{
  height: 72px;
  padding-left: 60.3px;
}
.membership_btn{
  width: 396px;
  height: 45px;
  background-color: rgb(249, 118, 133);
  font-size: 20.7px;
  font-weight: bold;
  color: white;
  border: 0px;
  border-radius: 10px;
}
.membership_1>p{
    font-size: 16.2px;
    font-weight: bold;
}

/* ---------- 우리아이 몸무게 ---------- */
.weight>div{
  height: 124px;
  float: left;
}
.weight_1{
  width: 372px;
}
.weight_2{
  width: 144px;
  padding-top: 10px;
  padding-left: 10px;
}
.weight_1_1{
  height: 63px;
  padding-left: 90px;
  padding-top: 40.5px;
  text-decoration-line: none;
}
.weight_1_2{
  height: 63px;
  padding-left: 80px;
  padding-top: 18px;
  text-decoration-line: none;
  color:black;
}
.weight_1_1 p{
  font-size: 23px;
  font-weight: bolder;
  text-decoration-line: none;
   color:black;
}
.weight_1_2 p{
  font-size: 18px;
  text-decoration-line: none;
  color:black;
}

/* ---------- 진료과목 별 병원 찾기 ---------- */
.inner4s_1>p{
    font-size: 19.8px;
    font-weight:bolder;
    padding-top: 9px;
}
.h_typeName{
    font-size: 17.1px;
    font-weight: bold;
    text-align: center;
    padding-top: 4.5px;
}

.inner5s{
  display: flex;
  justify-content: center;
  padding-top: 15px;
}
.inner5s_img{
  width: 80px;
  height: 80px;
}
.inner5s_1{background-color: rgb(222, 255, 255);}
.inner5s_2{background-color: rgb(255, 239, 222);}
.inner5s_3{background-color: rgb(232, 255, 232)}
.inner5s_4{background-color: rgb(255, 255, 222);}
.inner5s_5{background-color: rgb(255, 222, 222);}
.inner5s_6{background-color: rgb(222, 255, 239);}
.inner5s_7{background-color: rgb(241, 227, 255);}
.inner5s_8{background-color: rgb(239, 255, 222);}

/* -------------- 효과 css ----------------*/
.inner_1, .inner2s, .weight, .inner5s{overflow: hidden;}

.inner_1:hover{
  background-color: lightgrey;
  cursor: pointer;
}
.inner_1 img{
  transition: all 0.2s linear;
}
.inner_1:hover img{
  transform: scale(1.2);
}

.inner2s:hover{
  background-color: rgb(233, 231, 231);
  cursor: pointer;
}
.inner2s img{
  transition: all 0.2s linear;
}
.inner2s:hover img{
  transform: scale(1.1);
}

.membership_btn{
  transition: all 0.2s linear;
}
.membership_btn:hover{
  background-color: rgb(240, 130, 120);
  transform: scale(1.05);
}

.weight:hover{
  cursor: pointer;
  background-color: rgb(233, 231, 231);
}
.weight img{
  transition: all 0.2s linear;
}
.weight:hover img{
  transform: scale(1.1);
}

.inner5s img{
  transition: all 0.2s linear;
}
.inner5s:hover{
  cursor: pointer;
}
.inner5s:hover img{
  transform: scale(1.2);
}

#emerList {
  text-decoration-line: none;
  color: black;
}

#membership {
  text-decoration-line: none;
  color: black;
}

/* 날씨 관련 */
.weather{
  display: flex;
  justify-content: center;
}


.weather-form{
  width: 520px;
  height: 270px;
  border-radius: 10px;
  border: none;
  margin-top: 47px;
  margin-left: 10px;
}

.weatherInfo>div{
  float: left;
}

/* 날짜 */
.weather-date{
  font-size: 16px;
  margin-left: 50px;
  margin-top: 30px;
  color: black;
  width: 310px;

}

/* 현재 시간에 기온 */
.curTime{
    font-size: 45px;
    margin-left: 90px;
    
}

/* 날씨이미지 */
#weatherImg{
  width: 65px;
  height: 65px;
  margin-top: 20px;
  margin-bottom: 10px;
  margin-left: 85px;
}

/* 최저, 최고기온 담긴 div */
.temp>div{
  float: left;
  margin-bottom: 20px;
}

.maxTemp{
  margin-left: 50px;
}

.minTemp{
  margin-left: 20px;
}

/* 하늘상태 글씨로 나타냄 */
.weather-bottom{
  margin-left: 90px;
  margin-bottom: 10px;
}


.right{
  margin-top: 20px;
}

.kh, .pm, .rain, .wind, .humidity{
	margin-left: 70px;
}

.right>div{
	margin-bottom: 7px;
}

.pmGrade{
	font-size: 20px;
	margin-left: 4px;
	margin-bottom: 15px;
}

.weatherPosition{
    margin-right: 30px;
    margin-top: 30px;
}

.weatherPosition>div{
  float: left;
}

.weatherTop>div{
    float: left;
}

#naviImg{
  width: 20px;
  height: 20px;
  margin-left: 5px;
  padding-bottom: 4px;
}

.weight_1_3 {
	text-decoration-line: none;
}

p {
	text-decoration-line: none;
}

</style>
</head>
<body>
	<jsp:include page="common/header.jsp"/>
	 <div class="main-panel">
        <div class="content-wrapper" style="background-color: white;">
        <div class="outer">
          <div class="inner1">
            <div class="inner_1">
              <a href="emergencyList.em" id="emerList">
              <div class="searchAmbulance_1">
                <p>응급실</p> 
                <p>바로가기</p> 
              </div>
              <div class="searchAmbulance_2">
                <img style="height: 120px; width: 120px;" src="resources/mainIcon/119.png">
              </div>
              </a>
            </div>
            <div class="inner_2">
              <div class="telemedicine_1">
               <a href="webrtc.go" style="text-decoration: none; color: black;"><p>비대면</p> 
                <p>진료</p></a>
              </div>
              <div class="telemedicine_2">
                <img style="height: 130px; width: 130px;" src="resources/mainIcon/doctor.png">
              </div>
            </div>
            <!-- 날씨 -->
          <div class="weather">
            <div class="weather-form">
              <div class="weatherTop">
                <div class="weather-date"></div>
                <div class="weatherPosition">
                    <div class="spanDiv">
                      <span>서울특별시</span>
                    </div>
                    <div>
                      <img id="naviImg" src="resources/weather/navi3.png">
                    </div>
                </div>
              </div>
              <div class="weatherInfo">
                <div class="left">
                  <div class="skyState"></div>
                  <div class="curTime"></div>
                  <div class="weather-bottom"></div>
                  <div class="temp">
                    <div class="maxTemp"></div>
                    <div class="minTemp"></div>
                  </div>
                </div>
                <div class="right">
                  <div class="pmGrade"></div>
                  <div class="kh"></div>
                  <div class="pm"></div>
                  <div class="rain"></div>
                  <div class="wind"></div>
                  <div class="humidity"></div>
                </div>
              </div>
            </div>
          </div>
          </div>
          <div class="inner2">
            <div class="inner2s kHospital" onclick="location.href='list.kh'">
              <div class="kHospital_1">
                <img style="width: 140px; height: 115px; margin-left: 10px;" src="resources/kHospital/kDoctor7.png">
              </div>
              <div class="kHospital_2">
                <div class="searchKHospital_1"><p>내 주변 한의원 찾기 ▶</p></div>
                <div class="searchKHospital_2"><p>몸이 허약하다면? 명의를 찾아오세요~</p></div>
              </div>
            </div>
            <div class="inner2s pharmacy" onclick="location.href='selectList.ph'">
              <div class="pharmacy_1">
                <img style="height: 120px; width: 120px;" src="resources/mainIcon/pharmacy.png">
              </div>
              <div class="pharmacy_2">
                <div class="searchPharmacy_1"><p>내 주변 약국 찾기 ▶</p></div>
                <div class="searchPharmacy_2"><p>주변에 있는 약국을 확인해보세요!</p></div>
              </div>
            </div>
          </div>

         
          <div class="inner3 membership">
         	<c:choose>
         	  <c:when test="${ !empty loginUser and !empty loginUser.endDate }">
             <div class="inner3s">             
              <div class="membership_2"><button class="membership_btn" style="margin-top:30px; height:60px;">멤버십 만료일 : ${ loginUser.endDate } </button></div>      
             </div>
           </c:when>
          <c:otherwise>			           		            			         	         	
           	<div class="inner3s">
	          	<a href="membership.me" id="membership">	           
	              <div class="membership_1"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구독 후 접수, 예약이 가능해요!</p></div>
	              <div class="membership_2"><button class="membership_btn">멤버십 구독하기</button></div>		           
	            </a>
            </div>     	                	            		           	           	         		  	
     	  </c:otherwise>
     	  </c:choose>
         
           <c:choose>
           <c:when test="${ !empty loginUser }">
           <div class="inner3s weight">
                <div class="weight_1">
                	<a href="moveChatList.ch" class="weight_1_3" style="text-decoration-line: none;">
                    <div class="weight_1_1"><p>메디케어 커뮤니티</p></div>
                    <div class="weight_1_2"><p id="chat_font">단체 채팅으로 의료정보를 공유 해보세요!</p></div>
                    </a>
                </div>
                <div class="weight_2">
                    <img style="height: 100px; width: 100px;" src="resources/mainIcon/weight.png">
                </div>
            </div>
            </c:when>
            <c:otherwise>
             <div class="inner3s weight">
            	<div class="weight_1">              	
                    <div class="weight_1_1"><p>메디케어 커뮤니티</p></div>
                    <div class="weight_1_2"><p id="chat_font">로그인 후 이용 해보세요!</p></div>                   
                </div>
                <div class="weight_2">
                    <img style="height: 100px; width: 100px;" src="resources/mainIcon/weight.png">
                </div>
               </div>
            </c:otherwise>
           	</c:choose>
          
          </div>
                   
          <div class="inner4">
            <div class="inner4s inner4s_1"><p>진료과로 병원찾기</p></div>
            <div class="inner4s"><img style="width: 100%; height: 100%;" src="resources/mainIcon/whereHospital.png"></div>
          </div>
          <div class="inner5">
            <div class="inner5s inner5s_1"><img class="inner5s_img" src="resources/mainIcon/hType_child.png"></div>
            <div class="inner5s inner5s_2"><img class="inner5s_img" src="resources/mainIcon/hType_ear.png"></div>
            <div class="inner5s inner5s_3"><img class="inner5s_img" src="resources/mainIcon/hType_home.png"></div>
            <div class="inner5s inner5s_4"><img class="inner5s_img" src="resources/mainIcon/hType_love.png"></div>
            <div class="inner5s inner5s_5"><img class="inner5s_img" src="resources/mainIcon/hType_inbody.png"></div>
            <div class="inner5s inner5s_6"><img class="inner5s_img" src="resources/mainIcon/hType_bone.png"></div>
            <div class="inner5s inner5s_7"><img class="inner5s_img" src="resources/mainIcon/hType_skin.png"></div>
            <div class="inner5s inner5s_8"><img class="inner5s_img" src="resources/mainIcon/hType_eye.png"></div>
          </div>
          <div class="inner6">
            <div class="inner6s"><p class="h_typeName">소아청소년과</p></div>
            <div class="inner6s"><p class="h_typeName">이비인후과</p></div>
            <div class="inner6s"><p class="h_typeName">가정의학과</p></div>
            <div class="inner6s"><p class="h_typeName">산부인과</p></div>
            <div class="inner6s"><p class="h_typeName">내과</p></div>
            <div class="inner6s"><p class="h_typeName">정형외과</p></div>
            <div class="inner6s"><p class="h_typeName">피부과</p></div>
            <div class="inner6s"><p class="h_typeName">안과</p></div>
          </div>
        </div>
        
        
        </div>
        
       
        <!-- 날씨 스크립트 -->
        <script>
	      // 현재 날짜
	      let date = new Date();
	      let year = date.getFullYear(); //2024
	      let month = "0"+(date.getMonth() + 1); // 04 "012"
	      let month2 = month.substr(-2);
	      let day = '0'+date.getDate(); //16
	      let day2 = day.substr(-2);
	      let initDate = year +month2 + day2;
	      
	      let initDate2 = year + "년 " + month2 + "월 " + day2 + "일"
	      
	      // 오늘 날짜 년월일
	      $(".weather-date").html(initDate2);
	   
	      // 현재 시각
	      let curHour = "0" +date.getHours();
	      let curHour1 = curHour.substr(-2);
	      let curMin = "00";
	   
	      // 예보시각에 쓰일 현재시각 '0000' 이런식으로 시는 '00'~'23', 분은 '00' 고정
	      let curTime = curHour1 + curMin;
	   
	      $.ajax({
	         url:`https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=nLhHeLPzVGZH0bvIiEZjRSBa00JzdsLVTEDO%2BTyhwhjKNB94zP5Q8sM5IavINwEogJAPHHE85bhGLlUqBbjiLA%3D%3D&pageNo=1&numOfRows=900&dataType=json&base_date=\${initDate}&base_time=0200&nx=61&ny=125`,
	         success: function(result){
	            console.log(result)
	            let item = result.response.body.items.item
	            let temp = result.response.body.items.item[0].fcstValue
	            console.log(temp)
	            let tmx; // 일 최고 온도
	            let tmn;  // 일 최저 온도
	            let skyState = ""; // 하늘 상태
	            let value = "";
	            let sky = "";
	              let pop = ""; // 강수확률
	              let wsd = ""; // 풍속
	              let reh = ""; // 습도
	   			
	            for(let i=0; i<item.length; i++){
	               if(item[i].category == "SKY" && item[i].fcstDate == initDate && item[i].fcstTime == curTime){
	                  sky = item[i].fcstValue;
	               }
	            }
	            
	            console.log(sky)
	   
	            for(let i=0; i<item.length; i++){
	               
	               // 당일 
	               if(item[i].fcstDate == initDate){
	                  // 최고기온
	                  if(item[i].category == "TMX"){
	                     tmx = parseInt(item[i].fcstValue) + '℃';
	                  }
	                  
	                  // 최저기온
	                  if(item[i].category == "TMN"){
	                     tmn = parseInt(item[i].fcstValue) + '℃';
	                  }
	   					
	                  // 강수확률
	                  if(item[i].category == "POP"){
	                	 pop = item[i].fcstValue + '%';
	                  }
	                  
	                  // 바람
	                  if(item[i].category == "WSD"){
	                	 wsd = item[i].fcstValue + 'm/s';
	                  }
	                  
	                  // 습도
	                  if(item[i].category == "REH"){
	                	 reh = item[i].fcstValue + '%';
	                  }
	                  
	                  
	                  // 하늘 상태는 현재시각을 기준으로 가져와야 하니까
	                  // 현재 날짜(initDate)와 시간(curTime) 조건식으로 걸기
	                  if(item[i].fcstTime == curTime){
	                     if(item[i].category == "PTY"){
	                        if(item[i].fcstValue != "0"){
	                           switch(item[i].fcstValue){
	                              case "1":
	                                 $(".skyState").html('<img id="weatherImg" src="resources/weather/rain1.png">');
	                                 $(".weather-bottom").html('비');
	                                 break;
	                              case "2":
	                                 $(".skyState").html('<img id="weatherImg" src="resources/weather/rainSnow.png">');
	                                 $(".weather-bottom").html('비/눈');
		                                 break;   
	                              case "3":
	                                 $(".skyState").html('<img id="weatherImg" src="resources/weather/snow1.png">');
	                                 $(".weather-bottom").html('눈');
	                                 break;
	                              case "4":
	                                 $(".skyState").html('<img id="weatherImg" src="resources/weather/rain2.png">');
	                                 $(".weather-bottom").html('소나기');
	                                 break;
	                           }
	                           $(".weather-form").css({
	                                  "background-image": "url('resources/weather/rain6.jfif')",
	                                  "background-size": "cover",
	                                  "color" : "white"
	                              });
	                           $(".weather-date").css({
	                        	   "color" : "white"
	                           })
	                           
	                        }else{
	                           switch(sky){
	                           case "1":
	                              $(".skyState").html('<img id="weatherImg" src="resources/weather/sunny.png">');
	                              $(".weather-bottom").html('맑음');
	                              break;
	                           case "3":
	                              $(".skyState").html('<img id="weatherImg" src="resources/weather/cloudy1.png">');
	                              $(".weather-bottom").html('구름 많음');
	                              break;
	                           case "4":
	                              $(".skyState").html('<img id="weatherImg" src="resources/weather/cloudy2.png">');
	                              $(".weather-bottom").html('흐림');
	                              break;
	                           }
	                           $(".weather-form").css({
	                                  "background-image": "url('resources/weather/sky1.jpg')",
	                                  "background-size": "cover",
	                                 
	                              });
	                          
	                        }
	                     }               
	   
	                     if(item[i].category == "TMP"){
	                        $(".curTime").html(item[i].fcstValue + '°');
	                     }
	                  }
	               }

	            }
	            //$(".result").html(value);
	            $(".maxTemp").html(`최고 \${tmx}`);
	            $(".minTemp").html(`최저 \${tmn}`);
	            $(".rain").html(`강수 확률 : \${pop}`);
	            $(".wind").html(`바람 : \${wsd}`);
	            $(".humidity").html(`습도 : \${reh}`);
	            
	         },
	      })
	      
			   /* 미세먼지 api */
			   $.ajax({
						url:"air.do",
						success:function(data){
		
							let itemArr = $(data).find("item");
							let kh = "";
							let pm = "";
							
							itemArr.each(function(i, item){
								
								kh = $(item).find("khaiValue").text();
								pm = $(item).find("pm10Value").text() + '㎍/㎥';
								
								switch($(item).find("pm10Grade").text()){
									case "1":
                    					$(".pmGrade").html(`오늘의 미세먼지는 <span style="color:blue">좋음😄</span> 입니다`);
										break;
									case "2":
                    					$(".pmGrade").html(`오늘의 미세먼지는 <span style="color:green">보통🙂</span> 입니다`);
										break;
									case "3":
                   						$(".pmGrade").html(`오늘의 미세먼지는 <span style="color:orange">나쁨😷</span> 입니다`);
                   						// $(".pmGrade").html(`😷오늘의 미세먼지는 <span style="color:orange">나쁨</span> 입니다😷`);
										break;
									case "4":
               							$(".pmGrade").html(`오늘의 미세먼지는 <span style="color:red">매우나쁨😵</span> 입니다`);
										break;
								}

							});
							
							$(".kh").html(`통합대기환경수치 : \${kh}`);
							$(".pm").html(`미세먼지농도 : \${pm}`);
							
						}, error:function(){
							console.log("ajax 통신 실패!");
						}
					})

	   </script>
   
        <jsp:include page="common/footer.jsp"/>
        
</body>
</html>