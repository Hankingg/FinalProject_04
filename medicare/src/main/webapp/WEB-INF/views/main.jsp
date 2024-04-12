<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content-wrapper{
  /* border: 1px solid black; */
  display: flex;
  justify-content: left;
}
.outer{
  width: 1260px;
  height: 900px; 
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

.inner1s{
  height: 270px;
  float: left;
  margin-left: 72px;
  margin-top: 45px;
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
}
.weight_1_2{
  height: 63px;
  padding-left: 80px;
  padding-top: 18px;
}
.weight_1_1 p{
  font-size: 23px;
  font-weight: bolder;
}
.weight_1_2 p{
  font-size: 18px;
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
.inner1s, .inner2s, .weight, .inner5s{overflow: hidden;}

.inner1s:hover{
  background-color: lightgrey;
  cursor: pointer;
}
.inner1s img{
  transition: all 0.2s linear;
}
.inner1s:hover img{
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

</style>
</head>
<body>
	<jsp:include page="common/header.jsp"/>
	 <div class="main-panel">
        <div class="content-wrapper" style="background-color: white;">
        <div class="outer">
          <div class="inner1">
            <div class="inner1s">
              <div class="searchAmbulance_1">
                <p>응급실</p> 
                <p>바로가기</p> 
              </div>
              <div class="searchAmbulance_2">
                <img style="height: 120px; width: 120px;" src="resources/mainIcon/119.png">
              </div>
            </div>
            <div class="inner1s">
              <div class="receiveHospital_1">
                <p>접수하기</p>
              </div>
              <div class="receiveHospital_2">
                <img style="height: 110px; width: 110px;" src="resources/mainIcon/hospital.png">
              </div>
            </div>
            <div class="inner1s">
              <div class="reserveHospital_1">
                <p>예약하기</p>
              </div>
              <div class="reserveHospital_2">
                <img style="height: 120px; width: 120px;" src="resources/mainIcon/calender.png">
              </div>
            </div>
            <div class="inner1s">
              <div class="telemedicine_1">
                <p>비대면</p> 
                <p>진료</p>
              </div>
              <div class="telemedicine_2">
                <img style="height: 130px; width: 130px;" src="resources/mainIcon/doctor.png">
              </div>
            </div>
          </div>
          <div class="inner2">
            <div class="inner2s kHospital">
              <div class="kHospital_1">
                <img style="height: 120px; width: 130px;" src="resources/mainIcon/kDoctor.png">
              </div>
              <div class="kHospital_2">
                <div class="searchKHospital_1"><p>내 주변 한의원 찾기 ▶</p></div>
                <div class="searchKHospital_2"><p>몸이 허약하다면? 명의를 찾아오세요~</p></div>
              </div>
            </div>
            <div class="inner2s pharmacy">
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
            <div class="inner3s">
              <div class="membership_1"><p>구독 후 접수, 예약이 가능해요!</p></div>
              <div class="membership_2"><button class="membership_btn">멤버십 구독하기</button></div>
            </div>
            <div class="inner3s weight">
                <div class="weight_1">
                    <div class="weight_1_1"><p>우리 아이 키 ▪ 몸무게</p></div>
                    <div class="weight_1_2"><p>또래 중 몇 등인지 확인해보세요!</p></div>
                </div>
                <div class="weight_2">
                    <img style="height: 100px; width: 100px;" src="resources/mainIcon/weight.png">
                </div>
            </div>
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
        <jsp:include page="common/footer.jsp"/>
     
</body>
</html>