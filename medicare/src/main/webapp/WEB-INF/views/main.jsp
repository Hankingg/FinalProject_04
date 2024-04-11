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
  width: 1400px;
  height: 1000px; 
  /* border: 1px solid blue; */
}
.outer>div{
  width: 1400px;
}
.inner1{
  height: 350px;
  display: flex;
  justify-content: center;
}
.inner2{
  height: 190px;
  display: flex;
  justify-content: center;
}
.inner3{
  height: 190px;
  display: flex;
  justify-content: center;
}
.inner4{
  height: 100px;
}
.inner5{
  height: 120px;
  padding-left: 100px;
  width: 1300px;
}
.inner6{
  height: 30px;
  padding-left: 100px;
  width: 1300px;
}

.inner1s{
  height: 300px;
  float: left;
  margin-left: 80px;
  margin-top: 50px;
  width: 250px;
  background-color: rgb(233, 231, 231);
  border-radius: 15px;
}

.inner2s{
  height: 140px;
  float: left;
  margin-left: 80px;
  margin-top: 50px;
  width: 580px;
  border: 3px solid lightgrey;
  border-radius: 10px;
}

.inner3s{
  height: 140px;
  float: left;
  margin-left: 80px;
  margin-top: 50px;
  width: 580px;
  border: 3px solid lightgrey;
  border-radius: 10px;
}

.inner4s{
  height: 40px;
  margin-top: 50px;
  float: left;
}

.inner4s_1{
  margin-left: 120px;
}

.inner5s{
  height: 120px;
  width: 120px;
  float: left;
  margin-left: 30px;
  border-radius: 20px;
}

.inner6s{
  height: 30px;
  width: 120px;
  float: left;
  margin-left: 30px;
}

/* ==========================================여기까지 큰 틀 나누기============================================== */

/* ------------- inner1 스타일 -------------- */
/* 폰트 스타일 */
.searchAmbulance_1 p{
  font-weight: bolder;
  font-size: 30px;
  line-height: 45px;
}
.receiveHospital_1 p{
  font-weight: bolder;
  font-size: 30px;
  line-height: 45px;
}
.reserveHospital_1 p{
  font-weight: bolder;
  font-size: 30px;
  line-height: 45px;
}
.telemedicine_1 p{
  font-weight: bolder;
  font-size: 30px;
  line-height: 45px;
}
/* div 스타일 */
.searchAmbulance_1{
  height: 150px;
  padding-top: 40px;
  padding-left: 65px;
}
.searchAmbulance_2{
  height: 150px;
  padding-left: 60px;
}

.receiveHospital_1{
  height: 150px;
  padding-top: 70px;
  padding-left: 65px;
}
.receiveHospital_2{
  height: 150px;
  padding-left: 60px;
}

.reserveHospital_1{
  height: 150px;
  padding-top: 70px;
  padding-left: 65px;
}
.reserveHospital_2{
  height: 150px;
  padding-left: 60px;
}

.telemedicine_1{
  height: 150px;
  padding-top: 60px;
  padding-left: 60px;
}
.telemedicine_2{
  height: 150px;
  padding-left: 100px;
}

/* ------------- inner2 스타일 -------------- */
/* ---------- 한의원 ---------- */
.kHospital>div{
  height: 140px;
  float: left;
}
.kHospital_1{
  width: 160px;
}
.kHospital_2{
  width: 415px;
  padding-top: 10px;
}
.searchKHospital_1>p{
  font-weight: bolder;
  font-size: 30px;
  line-height: 45px;
  padding-left: 50px;
  padding-top: 30px;
}
.searchKHospital_2>p{
  font-size: 20px;
  padding-left: 30px;
}

/* ---------- 약국 ---------- */
.pharmacy>div{
  height: 140px;
  float: left;
}
.pharmacy_1{
  width: 180px;
  padding-left: 25px;
  padding-top: 5px;
}
.pharmacy_2{
  width: 395px;
  padding-top: 10px;
  padding-left: 10px;
}
.searchPharmacy_1>p{
  font-weight: bolder;
  font-size: 30px;
  line-height: 45px;
  padding-left: 50px;
  padding-top: 30px;
}
.searchPharmacy_2>p{
  font-size: 20px;
  padding-left: 30px;
}

/* ---------- 멤버십 ---------- */
.membership_1{
  height: 60px;
  padding-left: 160px;
  padding-top: 30px;
}
.membership_2{
  height: 80px;
  padding-left: 67px;
}
.membership_btn{
  width: 440px;
  height: 50px;
  background-color: rgb(249, 118, 133);
  font-size: 23px;
  font-weight: bold;
  color: white;
  border: 0px;
  border-radius: 10px;
}
.membership_1>p{
    font-size: 18px;
    font-weight: bold;
}

/* ---------- 우리아이 몸무게 ---------- */
.weight>div{
  height: 140px;
  float: left;
}
.weight_1{
  width: 415px;
}
.weight_2{
  width: 160px;
  padding-top: 20px;
}
.weight_1_1{
  height: 70px;
  padding-left: 100px;
  padding-top: 45px;
}
.weight_1_2{
  height: 70px;
  padding-left: 60px;
  padding-top: 20px;
}
.weight_1_1 p{
  font-size: 21px;
  font-weight: bolder;
}
.weight_1_2 p{
  font-size: 20px;
}

/* ---------- 진료과목 별 병원 찾기 ---------- */
.inner4s_1>p{
    font-size: 22px;
    font-weight:bolder;
    padding-top: 10px;
}
.h_typeName{
    font-size: 19px;
    font-weight: bold;
    text-align: center;
    padding-top: 5px;
}
.innser5s_img{
    padding-left: 30px;
    padding-top: 10px;
}
.inner5s_1{background-color: rgb(222, 255, 255);}
.inner5s_2{background-color: rgb(255, 239, 222);}
.inner5s_3{background-color: rgb(232, 255, 232)}
.inner5s_4{background-color: rgb(255, 255, 222);}
.inner5s_5{background-color: rgb(255, 222, 222);}
.inner5s_6{background-color: rgb(222, 255, 239);}
.inner5s_7{background-color: rgb(241, 227, 255);}
.inner5s_8{background-color: rgb(239, 255, 222);}


</style>
</head>
<body>
	<jsp:include page="common/header.jsp"/>
	 <div class="main-panel">
        <div class="content-wrapper" style="background-color: white;">
        <div class="outer">
          <div class="inner1">
            <div class="inner1s searchAmbulance">
              <div class="searchAmbulance_1">
                <p>응급실</p> 
                <p>바로가기</p> 
              </div>
              <div class="searchAmbulance_2">
                <img style="height: 130px; width: 130px;" src="resources/mainIcon/119.png">
              </div>
            </div>
            <div class="inner1s">
              <div class="receiveHospital_1">
                <p>접수하기</p>
              </div>
              <div class="receiveHospital_2">
                <img style="height: 130px; width: 130px;" src="resources/mainIcon/hospital.png">
              </div>
            </div>
            <div class="inner1s">
              <div class="reserveHospital_1">
                <p>예약하기</p>
              </div>
              <div class="reserveHospital_2">
                <img style="height: 140px; width: 140px;" src="resources/mainIcon/calender.png">
              </div>
            </div>
            <div class="inner1s">
              <div class="telemedicine_1">
                <p>비대면</p> 
                <p>진료</p>
              </div>
              <div class="telemedicine_2">
                <img style="height: 140px; width: 140px;" src="resources/mainIcon/doctor.png">
              </div>
            </div>
          </div>
          <div class="inner2">
            <div class="inner2s kHospital">
              <div class="kHospital_1">
                <img style="height: 130px; width: 150px;" src="resources/mainIcon/kDoctor.png">
              </div>
              <div class="kHospital_2">
                <div class="searchKHospital_1"><p>내 주변 한의원 찾기 ▶</p></div>
                <div class="searchKHospital_2"><p>몸이 허약하다면? 명의를 찾아오세요~</p></div>
              </div>
            </div>
            <div class="inner2s pharmacy">
              <div class="pharmacy_1">
                <img style="height: 120px; width: 140px;" src="resources/mainIcon/pharmacy.png">
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
            <div class="inner5s inner5s_1"><img class="innser5s_img" style="width: 100px; height: 100px;" src="resources/mainIcon/hType_child.png"></div>
            <div class="inner5s inner5s_2"><img class="innser5s_img" style="width: 100px; height: 100px;" src="resources/mainIcon/hType_ear.png"></div>
            <div class="inner5s inner5s_3"><img class="innser5s_img" style="width: 100px; height: 100px;" src="resources/mainIcon/hType_home.png"></div>
            <div class="inner5s inner5s_4"><img class="innser5s_img" style="width: 100px; height: 100px;" src="resources/mainIcon/hType_love.png"></div>
            <div class="inner5s inner5s_5"><img class="innser5s_img" style="width: 100px; height: 100px;" src="resources/mainIcon/hType_inbody.png"></div>
            <div class="inner5s inner5s_6"><img class="innser5s_img" style="width: 100px; height: 100px;" src="resources/mainIcon/hType_bone.png"></div>
            <div class="inner5s inner5s_7"><img class="innser5s_img" style="width: 100px; height: 100px;" src="resources/mainIcon/hType_skin.png"></div>
            <div class="inner5s inner5s_8"><img class="innser5s_img" style="width: 100px; height: 100px;" src="resources/mainIcon/hType_eye.png"></div>
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