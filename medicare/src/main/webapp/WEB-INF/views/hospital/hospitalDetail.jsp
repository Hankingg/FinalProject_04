<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
  .hName {
    font-size: 30px;
    font-weight: 600;
    margin-left: 70px;
  }

  .diagnosis {
    font-size: 25px;
    font-weight: 600;
    margin-left: 70px;
  }

  .diagnosisStatus {
    width: 200px;
  }

  .distance {
    margin-left: 80px;
  }

  .distance p {
    font-size:25px;
  }

  .hImg {
    width: 1200px;
    height: 800px;
    margin-left: 190px;

  }

  .hImg img{
    width: 1200px;
    height: 800px;
  }

  .hInfo{
   margin-left: 180px;
   border-bottom: 3px solid lightgray;
   padding-left: 110px;
  }

  .hInfo button{
    border: none;
    background-color: #F5F7FF;
    width: 150px;
    height: 70px;
    font-size: 20px;
    font-weight: 600;
  }

  .infoStatus {
    margin-left: 230px;
    font-size: 20px;
    border-bottom: 3px solid lightgray;
  }

  .infoDetail {
    margin-top: 20px;
    margin-bottom: 20px;
  }

  .infoMap {
    margin-left: 230px;
    font-size: 20px;
    border-bottom: 3px solid lightgray;
  }

  .infoMap button {
    margin-left: 750px;
    border-radius: 5px;
    background-color: lightgray;
    border: 0px;
  }

  .map {
    width: 750px;
    height: 900px;
    margin-left: 150px;
    border-radius: 10px;
    background-color: white;
  }


  .phoneDetail button{
    margin-left: 850px;
  }
  
  .hDetail2 button {
    margin-left: 10px;
    width: 100px;
    height: 40px;
    border-radius: 5px;
  }

  .review {
    margin-left: 230px;
    font-size: 20px;
  }

  .reviewDetail {
    width: 1000px;
    height: 400px;
    border-radius: 10px;
    background-color: white;
  }

  #strNum {
    color: red;
  }

</style>
<body>
   <jsp:include page="../common/header.jsp"/>
    <div class="main-panel">
        <div class="content-wrapper">
          <br><br><br><br>
            <div class="content">
                <div class="hName">          
                  힐링안과의원
                </div>
                <br>
                <div class="diagnosis">
                  <div class="diagnosisStatus">🔴 진료중</div> 
                  <div class="diagnosisTime">&nbsp;오늘 09:00 ~ 21:00</div> 
                </div>
                <br>
                <div class="distance">
                  <p>855m | 안과</p>
                </div>   
                <br><br> 
                <div class="hImg"><img src="https://www.modoodoc.com/_next/image?url=https%3A%2F%2Fd23zwvh2kbhdec.cloudfront.net%2Fmedia%2Fpublic%2Fhospitals%2Fphotos%2F12757%2F10%25EC%25B8%25B5_%25EC%25A0%2584%25EA%25B2%25BD1.jpg&w=3840&q=75"></div>
                <br><br><br>
                <div class="hInfo">
                  <button>병원정보</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <button>진료정보</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <button>리뷰</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <button>접수</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <button>예약</button>
                </div>
                <br><br>
                <div class="infoStatus">
                  <strong>진료시간</strong>
                  <div class="infoDetail">🔴 지금은 진료 중이에요.</div>
                </div>
                <br>
                <div class="infoMap">
                  <strong>위치</strong>
                  <br><br>
                  &nbsp;&nbsp;서울특별시 강남구 강남대로 470
                  <button>주소복사</button>
                  <br><br>
                  <div class="map">
                    지도
                  </div>
                  <br><br>
                  <div class="infoPhone">
                    <strong>전화번호</strong>
                    <div class="phoneDetail">
                      02-5560-1222
                      <button>전화번호 복사</button>
                    </div>
                  </div>
                  <br><br>
                  <div class="hDetail2">
                    <strong>진료과목</strong>
                    <br><br>
                    <button readonly>안과</button>
                  </div>
                  <br><br>
                  </div>
                  <br><br>
                  <div class="review">
                    <strong>리뷰</strong><strong id="strNum">&nbsp;&nbsp;69</strong>
                    <br><br><br>
                    <div class="reviewDetail">
                        리뷰존
                    </div>
                </div>
              </div>    
              <br><br><br><br><br><br><br>
          </div>
    </div>
        <jsp:include page="../common/footer.jsp"/>
     

       
</body>
</html>