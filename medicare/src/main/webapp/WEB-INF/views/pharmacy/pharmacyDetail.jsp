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
  .content-wrapper>div{
    float: left;
  }
  .outer{
    width: 1200px;
    height: 2000px;
    border: 1px solid red;
  }
  .right{
    width: 300px;
    height: 1000px;
    border: 1px solid black;
    margin-left: 50px;
  }
  .right>div{
    position: sticky;
    top: 0;
    border: 1px solid yellowgreen;
  }
  .outer div{
    border: 1px solid blue;
  }


  .mName {
    font-size: 30px;
    font-weight: 600;
  }

  .diagnosis {
    font-size: 25px;
    font-weight: 600;

  }

  .diagnosisStatus {
    width: 200px;
  }

  .map {
    width: 1000px;
    height: 600px;
    border-radius: 10px;
    border: 1px solid black;
  }

  .distance {
    margin-left: 0px
  }

  .distance p {
    font-size:20px;
  }

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

  .infoStatus {
    font-size: 20px;
    border-bottom: 3px solid lightgray;
  }

  .infoDetail {
    margin-top: 20px;
    margin-bottom: 20px;
  }

  .infoMap {
    font-size: 20px;
    border-bottom: 3px solid lightgray;
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

  #strNum {
    color: red;
  }

</style>
<body>
   <jsp:include page="../common/header.jsp"/>
      <div class="main-panel">
        <div class="content-wrapper">
            <br><br><br><br>
            <div class="outer">
                <div class="mName">          
                  태평양 약국
                </div>
                <br>
                <div class="diagnosis">
                  <div class="diagnosisStatus">🔴 진료중</div> 
                  <div class="diagnosisTime">&nbsp;오늘 09:00 ~ 21:00</div> 
                </div>
                <br>
                <div class="distance">
                  <p>현위치와의 거리 : xxxx(m)</p>
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
                  <div class="infoDetail">🔴 지금은 진료 중이에요.</div>
                </div>
                
                <br>
                <div class="infoMap">
                  <strong>위치</strong>
                  <br><br>
                  &nbsp;&nbsp;서울특별시 강남구 강남대로 470
                  <button>주소복사</button>
                  <br><br>
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
                  </div>
                  <br><br>
                  </div>
                  <br><br>
                  
              </div>    
              <div class="right">
                  
                  <div>
                    최근 본 의료기관
                  </div>
               
              </div>
        </div>
    
    <jsp:include page="../common/footer.jsp"/>
     

       
</body>
</html>