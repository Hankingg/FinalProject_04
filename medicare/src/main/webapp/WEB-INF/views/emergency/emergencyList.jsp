<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응급실</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
   .content {
      margin-top: 50px;
      margin-left: 150px;
   }

   #result {
      margin-left: 50px;
   }
   
   #result th, td {
      text-align:center;
      color:black;
      
   }

   #result th {
      background-color: white;
      border-top: 1px solid rgb(240, 130, 120);
      border-left: 1px solid rgb(240, 130, 120);
      border-right: 1px solid rgb(240, 130, 120);
      padding-top: 15px;
            
   }
   
   #result td {
      border-bottom: 1px solid rgb(240, 130, 120);
      border-left: 1px solid rgb(240, 130, 120);
      border-right: 1px solid rgb(240, 130, 120);
      padding-bottom: 15px;
   }
   
   #er td {
      background-color: white;
      margin-top:10px;
   }
   
   
   
   #emList {
      border:1px solid black;   
      border: 1px solid rgb(240, 130, 120);
   }
   
   #ulh {
      border-top-left-radius: 10px;
   }
   
   #urh {
      border-top-right-radius: 10px;
   }
   
   #uld {
      border-bottom-left-radius: 10px;
   }
   
   #urd {
      border-bottom-right-radius: 10px;
   }
   
   .noLine {
      border-color: white;
   }
   
   .noLine1 {
      border-color: white;
   }
   
   .noLine2 {
      border-color: white;
   }
   
   
   .livemap1 {
      background-color:#FF4747;
      border-radius: 8px;
      color:white;
      border: none;
      height:30px;
      margin-left:450px;
   }
   
   .livemap2 {
      
      background-color:rgb(240, 130, 120);
      border-radius: 8px;
      color:white;
      border: 1px solid ;
      height:50px;      
      margin-bottom:20px;
   }
   
   #liveBtn {
      height:400px;            
      text-align: center;
      width:1120px;
      margin-left: 50px;
   }
   
   #popup1 {
      height:50px;
      margin-left:50px;
   }
   
   #map{
      width: 1000px;
      height: 600px;
      margin-top:20px;
      margin-bottom:20px;
      border: 1px solid gray;
      border-radius: 20px;
      margin-left: 120px;
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
 
   #btn3 {
      background-color: rgb(240, 130, 120);
      border-radius: 8px;
      color:white;
      border:1px solid rgb(240, 130, 120);
   }
   
   .selectArea {
      margin-right:200px;
   }
   
</style>
</head>
<body>

   <jsp:include page="../common/header.jsp"/>
    <div class="main-panel">
        <div class="content-wrapper" style="background-color: white;">
   
   <div class="content">
   <h2 class="selectArea" align="center">🚨응급실 실시간🚨</h2>
   <div class="selectArea" align="center">
   <select id="location1">
      <option>서울특별시</option>      
   </select>
   
   <select id="location2" onchange="liveButton()">
      <option value="강남구" seleted>강남구</option>
      <option value="강서구">강서구</option>
      <option value="강동구">강동구</option>
      <option value="서초구">서초구</option>
      <option value="노원구">노원구</option>
      <option value="중구">중구</option>
      <option value="용산구">용산구</option>
      <option value="성북구">성북구</option>
      <option value="성동구">성동구</option>
      <option value="광진구">광진구</option>
      <option value="관악구">관악구</option>
      <option value="구로구">구로구</option>
      <option value="금천구">금천구</option>
      <option value="도봉구">도봉구</option>
      <option value="동대문구">동대문구</option>
      <option value="동작구">동작구</option>
      <option value="서대문구">서대문구</option>
      <option value="송파구">송파구</option>
      <option value="양천구">양천구</option>
      <option value="영등포구">영등포구</option>
      <option value="은평구">은평구</option>
      <option value="종로구">종로구</option>
      <option value="중랑구">중랑구</option>
   </select>
   <input type="button" value="조회" id="btn3">
   </div>
   
   <br>
   
   <div id="map">
   
   </div>
    
   <button id="popup1" onclick=popup1() class="livemap2">실시간 전체 도로상황 보러가기</button>
   
   <div id="result">
      
   </div>
   
   <br>
         
   <div id="liveBtn">       
        <!-- 강남구 -->
        <button id="popup6" onclick=popup6() class="livemap2">연세대학교 세브란스병원(강남) 근처 실시간 도로상황 보러가기</button>
        <button id="popup7" onclick=popup7() class="livemap2">삼성서울병원(강남) 근처 실시간 도로상황 보러가기</button>        
   </div>
   
   </div>
   <jsp:include page="../common/footer.jsp"/>
   
   <script>   
   
   function liveButton() {
       var location = document.getElementById("location2").value;
       var liveBtnDiv = document.getElementById("liveBtn");
       
       
       liveBtnDiv.innerHTML = "";
       
     
       switch(location) {
           case "강남구":              
               addButton("연세대학교 세브란스병원(강남) 근처 실시간 도로상황 보러가기", "popup6");
               addButton("삼성서울병원(강남) 근처 실시간 도로상황 보러가기", "popup7");
               break;
           case "강서구":
              addButton("이화여자대학교의과대학부속서울병원 근처 실시간 도로상황 보러가기", "popup12");
              addButton("부민병원 근처 실시간 도로상황 보러가기", "popup13");
               break;
           case "강동구":       
               addButton("강동경희대학병원 근처 실시간 도로상황 보러가기", "popup4");
               addButton("성심의료재단 강동성심병원 근처 실시간 도로상황 보러가기", "popup8");
               addButton("한국보훈복지의료재단 중앙보훈병원 근처 실시간 도로상황 보러가기", "popup9");
               break;
           case "서초구":
              addButton("학교법인가톨릭학원가톨릭대학교서울성모병원 근처 실시간 도로상황 보러가기", "popup14");
               break;
           case "노원구":
              addButton("한국원자력의학원원자력병원 근처 실시간 도로상황 보러가기", "popup15");
              addButton("한국원자력의학원원자력병원(화랑사거리) 근처 실시간 도로상황 보러가기", "popup16");
              addButton("인제대학교상계백병원(중계역) 근처 실시간 도로상황 보러가기", "popup17");
              addButton("인제대학교상계백병원(노원역) 근처 실시간 도로상황 보러가기", "popup18");
              addButton("노원을지대학교병원 근처 실시간 도로상황 보러가기", "popup19");
           case "중구":
              addButton("국립중앙의료원 근처 실시간 도로상황 보러가기", "popup20");              
               break;
           case "용산구":
              addButton("순천향대서울병원 근처 실시간 도로상황 보러가기", "popup21");              
               break; 
           case "성북구":
              addButton("고려대학교 안암병원 근처 실시간 도로상황 보러가기", "popup22");              
               break;
           case "성동구":
              addButton("한양대학교병원 근처 실시간 도로상황 보러가기", "popup23");              
               break;    
           case "광진구":      
               addButton("혜민병원병원 근처 실시간 도로상황 보러가기", "popup10");
               addButton("건국대학교병원 근처 실시간 도로상황 보러가기", "popup11");
               break;
           case "관악구":      
               addButton("에이치플러스양지병원 근처 실시간 도로상황 보러가기", "popup24");               
               break;
           case "구로구":      
               addButton("구로성심병원 근처 실시간 도로상황 보러가기", "popup25");
               addButton("고려대학교의과대학부속구로병원 근처 실시간 도로상황 보러가기", "popup26");   
               break;
           case "금천구":      
               addButton("희명병원 근처 실시간 도로상황 보러가기", "popup27");               
               break;
           case "도봉구":      
               addButton("의료법인한전의료재단한일병원 근처 실시간 도로상황 보러가기", "popup28");               
               break;
           case "동대문구":      
               addButton("경희대학교병원 근처 실시간 도로상황 보러가기", "popup29");   
               addButton("삼육서울병원 근처 실시간 도로상황 보러가기", "popup30");   
               addButton("서울특별시동부병원 근처 실시간 도로상황 보러가기", "popup31");   
               addButton("서울성심병원 근처 실시간 도로상황 보러가기", "popup32");   
               break;  
           case "동작구":      
               addButton("서울특별시 보라매병원 근처 실시간 도로상황 보러가기", "popup33");   
               addButton("중앙대학교병원 근처 실시간 도로상황 보러가기", "popup34");                     
               break; 
           case "서대문구":      
               addButton("연세대학교의과대학 세브란스병원 근처 실시간 도로상황 보러가기", "popup35");   
               addButton("의료법인동신의료재단 동신병원 근처 실시간 도로상황 보러가기", "popup36");                     
               break;
           case "송파구":      
               addButton("경찰병원 근처 실시간 도로상황 보러가기", "popup37");   
               addButton("재단법인아산사회복지재단 서울아산병원(올림픽대교-잠실철교) 근처 실시간 도로상황 보러가기", "popup38");
               addButton("재단법인아산사회복지재단 서울아산병원(올림픽대교-남단) 근처 실시간 도로상황 보러가기", "popup39");
               break;
           case "양천구":      
               addButton("홍익병원 근처 실시간 도로상황 보러가기", "popup40");   
               addButton("서울특별시서남병원 근처 실시간 도로상황 보러가기", "popup41");
               addButton("이화여자대학교의과대학부속목동병원 근처 실시간 도로상황 보러가기", "popup42");
               break;
           case "영등포구":      
               addButton("여의도성모병원 근처 실시간 도로상황 보러가기", "popup43");   
               addButton("명지성모병원 근처 실시간 도로상황 보러가기", "popup44");
               addButton("대림성모병원 근처 실시간 도로상황 보러가기", "popup45");
               addButton("한림대학교강남성심병원 근처 실시간 도로상황 보러가기", "popup46");
               addButton("성애의료재단성애병원 근처 실시간 도로상황 보러가기", "popup47");
               break; 
           case "은평구":      
               addButton("가톨릭대학교 은평성모병원 근처 실시간 도로상황 보러가기", "popup48");   
               addButton("의료법인청구성심병원 근처 실시간 도로상황 보러가기", "popup49");             
               break;    
           case "종로구":   
               addButton("세란병원 근처 실시간 도로상황 보러가기", "popup2");
               addButton("강북삼성병원 근처 실시간 도로상황 보러가기", "popup3");
               addButton("서울대학병원 근처 실시간 도로상황 보러가기", "popup5");
               break;
           case "중랑구":   
               addButton("의료법인풍산의료재단동부제일병원 근처 실시간 도로상황 보러가기", "popup50");
               addButton("녹색병원 근처 실시간 도로상황 보러가기", "popup51");
               addButton("서울특별시서울의료원 근처 실시간 도로상황 보러가기", "popup52");
               break;    
           default:                                         
               break;
       }
   }
   
   
   function addButton(text, id) {
       var button = document.createElement("button");
       button.textContent = text;
       button.setAttribute("id", id);
       button.setAttribute("onclick", id + "()");
       button.classList.add("livemap2");
       var liveBtnDiv = document.getElementById("liveBtn");
       liveBtnDiv.appendChild(button);
   }
   
   
   function popup1(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/etc/telMap.do?key=NMmkVM1ukPmnoSzZyfEYj5aCLaHFdgiy2znTVHU2f5Ggd05KbqM3ufP25oe77Slbp9i4a4vYM7T33oYDL2Q", "_blank", options);
   }
   
   function popup2(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010076&cctvname=%25EB%258F%2585%25EB%25A6%25BD%25EB%25AC%25B8&kind=Seoul&cctvip=null&cctvch=51&id=15&cctvpasswd=null&cctvport=null&minX=126.94410006399322&minY=37.56324774352138&maxX=126.97553570901468&maxY=37.58100359683157", "_blank", options);
   }
   
   
   
   function popup3(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010278&cctvname=%25EC%25A0%2595%25EB%258F%2599&kind=Seoul&cctvip=null&cctvch=53&id=300&cctvpasswd=null&cctvport=null&minX=126.95101742867895&minY=37.55624077315048&maxX=126.98553033334291&maxY=37.57523930076997", "_blank", options);
               
   }
   
   function popup4(){
         
         let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
         
         window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010094&cctvname=%25EB%25AA%2585%25EC%259D%25BCE%25EB%25A7%2588%25ED%258A%25B8&kind=Seoul&cctvip=null&cctvch=52&id=232&cctvpasswd=null&cctvport=null&minX=127.11790246719123&minY=37.53436282792721&maxX=127.18516165450215&maxY=37.56558893015956", "_blank", options);
      }
   
   function popup5(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010241&cctvname=%25EC%259B%2590%25EB%2582%25A8R&kind=Seoul&cctvip=null&cctvch=53&id=284&cctvpasswd=null&cctvport=null&minX=126.97797631672101&minY=37.561041038888504&maxX=127.0370176547663&maxY=37.58902177718967", "_blank", options);
   }
   
   function popup6(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010008&cctvname=%25EA%25B0%2595%25EB%2582%25A8%25EC%2584%25B8%25EB%25B8%258C%25EB%259E%2580%25EC%258A%25A4&kind=Seoul&cctvip=null&cctvch=52&id=186&cctvpasswd=null&cctvport=null&minX=127.03572291787675&minY=37.483382393745046&maxX=127.05652699427756&maxY=37.50166744174406", "_blank", options);
   }
   
   function popup7(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010265&cctvname=%25EC%259D%25BC%25EC%259B%2590%25ED%2584%25B0%25EB%2584%2590&kind=Seoul&cctvip=null&cctvch=52&id=238&cctvpasswd=null&cctvport=null&minX=127.05547677945165&minY=37.476575825915944&maxX=127.12267417458094&maxY=37.50783250609512", "_blank", options);
   }

   
   function popup8(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010051&cctvname=%25EA%25B8%25B8%25EB%258F%2599%25EC%2582%25AC%25EA%25B1%25B0%25EB%25A6%25AC&kind=Seoul&cctvip=null&cctvch=51&id=130&cctvpasswd=null&cctvport=null&minX=127.11495628320093&minY=37.52460802377302&maxX=127.15930785578796&maxY=37.54754253305119", "_blank", options);
   }
   
   function popup9(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=E970015&cctvname=%25EC%2583%259D%25ED%2583%259C%25EA%25B3%25B5%25EC%259B%2590&kind=EC&cctvip=null&cctvch=52&id=235&cctvpasswd=null&cctvport=null&minX=127.10380410359154&minY=37.5109956711721&maxX=127.19188120513532&maxY=37.55063094912717", "_blank", options);
   }
   
   function popup10(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010268&cctvname=%25EC%259E%25A0%25EC%258B%25A4%25EB%258C%2580%25EA%25B5%2590%25EB%25B6%2581%25EB%258B%25A8&kind=Seoul&cctvip=null&cctvch=52&id=202&cctvpasswd=null&cctvport=null&minX=127.0478390302516&minY=37.51609760375363&maxX=127.12652312346707&maxY=37.551995716917325", "_blank", options);
   }
   
   function popup11(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010198&cctvname=%25EC%2596%25B4%25EB%25A6%25B0%25EC%259D%25B4%25EB%258C%2580%25EA%25B3%25B5%25EC%259B%2590%25EC%2597%25AD&kind=Seoul&cctvip=null&cctvch=51&id=124&cctvpasswd=null&cctvport=null&minX=127.03437926668727&minY=37.51931042759038&maxX=127.13013541894327&maxY=37.560245083469056", "_blank", options);
   }
   
   function popup12(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010104&cctvname=%25EB%25B0%259C%25EC%2582%25B0%25EC%2597%25AD&kind=Seoul&cctvip=null&cctvch=51&id=102&cctvpasswd=null&cctvport=null&minX=126.81432261957629&minY=37.54418152551521&maxX=126.85863103850137&maxY=37.56720339247953", "_blank", options);
   }
   
   function popup13(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010011&cctvname=%25EA%25B0%2595%25EC%2584%259C%25EA%25B5%25AC%25EC%25B2%25AD&kind=Seoul&cctvip=null&cctvch=51&id=103&cctvpasswd=null&cctvport=null&minX=126.83408443598252&minY=37.54258831415106&maxX=126.87267274159065&maxY=37.563273601687925", "_blank", options);
   }
   
   function popup14(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010140&cctvname=%25EC%2584%259C%25EC%259A%25B8%25EC%2584%25B1%25EB%25AA%25A8%25EB%25B3%2591%25EC%259B%2590&kind=Seoul&cctvip=null&cctvch=51&id=55&cctvpasswd=null&cctvport=null&minX=126.99230850488951&minY=37.493944679472044&maxX=127.0166036557829&maxY=37.5092690849741", "_blank", options);
   }
   
   function popup15(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=E99161&cctvname=%25ED%2599%2594%25EB%259E%2591%25EB%258C%2580%2520%25EC%2582%25AC%25EA%25B1%25B0%25EB%25A6%25AC&kind=EA&cctvip=442&cctvch=null&id=null&cctvpasswd=null&cctvport=null&minX=127.06174139562437&minY=37.61095187577482&maxX=127.11473825747333&maxY=37.637371742176356", "_blank", options);
   }
   
   function popup16(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010334&cctvname=%25ED%2599%2594%25EB%259E%2591%25EB%258C%2580%25EC%2582%25AC%25EA%25B1%25B0%25EB%25A6%25AC&kind=Seoul&cctvip=null&cctvch=53&id=263&cctvpasswd=null&cctvport=null&minX=127.05940616435208&minY=37.60866466283266&maxX=127.11849832433033&maxY=37.636611357348414", "_blank", options);
   }
   
   function popup17(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010285&cctvname=%25EC%25A4%2591%25EA%25B3%2584%25EC%2597%25AD&kind=Seoul&cctvip=null&cctvch=53&id=261&cctvpasswd=null&cctvport=null&minX=127.05061733206223&minY=37.63941979373346&maxX=127.07781250797755&maxY=37.65589751447412", "_blank", options);
   }
   
   function popup18(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=E970009&cctvname=%25EB%2585%25B8%25EC%259B%2590%2520%25EB%25A1%25AF%25EB%258D%25B0&kind=EC&cctvip=null&cctvch=53&id=323&cctvpasswd=null&cctvport=null&minX=127.03777035010759&minY=37.64320027224658&maxX=127.08216320474651&maxY=37.66615693439868", "_blank", options);
   }
   
   function popup19(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010479&cctvname=%25ED%2595%2598%25EA%25B3%2584%25EC%2597%25AD&kind=Seoul&cctvip=null&cctvch=51&id=112&cctvpasswd=null&cctvport=null&minX=127.05316198274673&minY=37.626016415765974&maxX=127.09181351589204&maxY=37.64664845644845", "_blank", options);
   }
   
   function popup20(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010080&cctvname=%25EB%258F%2599%25EB%258C%2580%25EB%25AC%25B8%25EC%259A%25B4%25EB%258F%2599%25EC%259E%25A5&kind=Seoul&cctvip=null&cctvch=52&id=172&cctvpasswd=null&cctvport=null&minX=126.9967713721783&minY=37.559280805464304&maxX=127.0175078201954&maxY=37.573393202821755", "_blank", options);
   }
   
   function popup21(){
   
   let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
   
   window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010322&cctvname=%25ED%2595%259C%25EB%2582%25A8%25EA%25B3%25A0%25EA%25B0%2580&kind=Seoul&cctvip=null&cctvch=52&id=256&cctvpasswd=null&cctvport=null&minX=126.9907122287069&minY=37.52427693087932&maxX=127.0221755979825&maxY=37.54250189899152", "_blank", options);
   }

   function popup22(){
   
   let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
   
   window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010023&cctvname=%25EA%25B3%25A0%25EB%25A0%25A4%25EB%258C%2580&kind=Seoul&cctvip=null&cctvch=52&id=148&cctvpasswd=null&cctvport=null&minX=127.00766842466268&minY=37.57599359650657&maxX=127.05671420342343&maxY=37.60084932491711", "_blank", options);
   }

   function popup23(){
   
   let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
   
   window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010326&cctvname=%25ED%2595%259C%25EC%2596%2591%25EB%258C%2580&kind=Seoul&cctvip=null&cctvch=52&id=180&cctvpasswd=null&cctvport=null&minX=127.02303169769064&minY=37.54686174933027&maxX=127.07206530797237&maxY=37.57171247961208", "_blank", options);
   }

      
   function popup24(){
   
   let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
   
   window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010417&cctvname=%25EC%258B%25A0%25EB%25A6%25BC%25EC%2582%25AC%25EA%25B1%25B0%25EB%25A6%25AC&kind=Seoul&cctvip=null&cctvch=51&id=71&cctvpasswd=null&cctvport=null&minX=126.91899059272826&minY=37.4745350794845&maxX=126.9503982734728&maxY=37.492295585292865", "_blank", options);
   }
   
   function popup25(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010025&cctvname=%25EA%25B3%25A0%25EC%25B2%2599%25EA%25B5%2590&kind=Seoul&cctvip=null&cctvch=51&id=23&cctvpasswd=null&cctvport=null&minX=126.84981511750074&minY=37.489400020937566&maxX=126.88838540935932&maxY=37.51008156439969", "_blank", options);
   }
   
   function popup26(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010035&cctvname=%25EA%25B1%25B0%25EB%25A6%25AC%25EA%25B3%25B5%25EC%259B%2590%25EC%2598%25A4%25EA%25B1%25B0%25EB%25A6%25AC&kind=Seoul&cctvip=null&cctvch=53&id=270&cctvpasswd=null&cctvport=null&minX=126.86329104059271&minY=37.478423525596234&maxX=126.91616821128903&maxY=37.50491593284598", "_blank", options);
   }
   
   function popup27(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=E970007&cctvname=%25EA%25B8%2588%25EC%25B2%259C%25EA%25B5%25AC%25EC%25B2%25AD%25203%25EA%25B1%25B0%25EB%25A6%25AC&kind=EC&cctvip=null&cctvch=53&id=314&cctvpasswd=null&cctvport=null&minX=126.88755633118109&minY=37.445687332993494&maxX=126.91898589324649&maxY=37.46393111838697", "_blank", options);
   }
   
   function popup28(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=E970005&cctvname=%25EA%25B4%2591%25EC%2582%25B0%25204%25EA%25B1%25B0%25EB%25A6%25AC&kind=EC&cctvip=null&cctvch=53&id=313&cctvpasswd=null&cctvport=null&minX=127.01132658853186&minY=37.63428264784422&maxX=127.06040359912058&maxY=37.65913699785519", "_blank", options);
   }
   
   function popup29(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010337&cctvname=%25ED%259A%258C%25EA%25B8%25B0%25EC%2597%25AD&kind=Seoul&cctvip=null&cctvch=52&id=164&cctvpasswd=null&cctvport=null&minX=127.0338908338906&minY=37.58081268903971&maxX=127.07825426964925&maxY=37.60377064752239", "_blank", options);
   }
   
   function popup30(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010286&cctvname=%25EC%25A4%2591%25EB%259E%2591%25EA%25B5%2590&kind=Seoul&cctvip=null&cctvch=51&id=121&cctvpasswd=null&cctvport=null&minX=127.01337177208312&minY=37.56566294453642&maxX=127.1093110134751&maxY=37.60852253409016", "_blank", options);
   }
   
   function popup31(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010168&cctvname=%25EC%258B%259C%25EB%25A6%25BD%25EB%258F%2599%25EB%25B6%2580%25EB%25B3%2591%25EC%259B%2590&kind=Seoul&cctvip=null&cctvch=52&id=160&cctvpasswd=null&cctvport=null&minX=127.0085374683032&minY=37.561140599668434&maxX=127.05757566048054&maxY=37.585996082935516", "_blank", options);
   }
   
   function popup32(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010086&cctvname=%25EB%2596%25A1%25EC%25A0%2584%25EA%25B5%2590&kind=Seoul&cctvip=null&cctvch=52&id=163&cctvpasswd=null&cctvport=null&minX=127.0281013028198&minY=37.57172342856491&maxX=127.07245955670636&maxY=37.5946830970987", "_blank", options);
   }
   
   function popup33(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010065&cctvname=%25EB%258B%25B9%25EA%25B3%25A1%25EC%2582%25AC%25EA%25B1%25B0%25EB%25A6%25AC&kind=Seoul&cctvip=null&cctvch=51&id=70&cctvpasswd=null&cctvport=null&minX=126.89230606425782&minY=37.47648360408392&maxX=126.95945709837578&maxY=37.50781926680522", "_blank", options);
   }
   
   function popup34(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010242&cctvname=%25EC%259B%2590%25EB%25B6%2588%25EA%25B5%2590&kind=Seoul&cctvip=null&cctvch=51&id=80&cctvpasswd=null&cctvport=null&minX=126.94107682627076&minY=37.497842768847505&maxX=126.97966336211839&maxY=37.518502236356596", "_blank", options);
   }

   function popup35(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010068&cctvname=%25EB%258C%2580%25EC%258B%25A0R&kind=Seoul&cctvip=null&cctvch=53&id=286&cctvpasswd=null&cctvport=null&minX=126.91958137698053&minY=37.55035037690811&maxX=126.96391099084954&maxY=37.573341665322175", "_blank", options);
   }
   
   function popup36(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=E99067&cctvname=%25EC%2584%259C%25EB%258C%2580%25EB%25AC%25B8%25EA%25B5%25AC%25EC%25B2%25AD&kind=EA&cctvip=232&cctvch=null&id=null&cctvpasswd=null&cctvport=null&minX=126.91941354381451&minY=37.57084792605804&maxX=126.9580248678341&maxY=37.59151252308447", "_blank", options);
   }
      
   function popup37(){
   
   let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
   
   window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010006&cctvname=%25EA%25B0%2580%25EB%259D%25BD%25EC%258B%259C%25EC%259E%25A5%25EC%2597%25AD&kind=Seoul&cctvip=null&cctvch=52&id=230&cctvpasswd=null&cctvport=null&minX=127.10460144087428&minY=37.483838633492894&maxX=127.14893253114795&maxY=37.506776284805206", "_blank", options);
   }
   
   function popup38(){
   
   let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
   
   window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=E99121&cctvname=%25EC%259E%25A0%25EC%258B%25A4%25EC%25B2%25A0%25EA%25B5%2590~%25EC%2598%25AC%25EB%25A6%25BC%25ED%2594%25BD%25EB%258C%2580%25EA%25B5%2590&kind=EA&cctvip=725&cctvch=null&id=null&cctvpasswd=null&cctvport=null&minX=127.08570573222251&minY=37.51084877564718&maxX=127.15293784335655&maxY=37.54209062969946", "_blank", options);
   }
   
   function popup39(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010231&cctvname=%25EC%2598%25AC%25EB%25A6%25BC%25ED%2594%25BD%25EB%258C%2580%25EA%25B5%2590%25EB%2582%25A8%25EB%258B%25A8&kind=Seoul&cctvip=null&cctvch=52&id=217&cctvpasswd=null&cctvport=null&minX=127.08382822073808&minY=37.51099436308938&maxX=127.14286207610077&maxY=37.53893130204309", "_blank", options);
   }
   
   function popup40(){
   
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010096&cctvname=%25EB%25AA%25A9%25EB%258F%2599%25EC%2598%25A4%25EA%25B1%25B0%25EB%25A6%25AC&kind=Seoul&cctvip=null&cctvch=51&id=98&cctvpasswd=null&cctvport=null&minX=126.84582690775828&minY=37.51603324001375&maxX=126.89012795159441&maxY=37.5390460023359", "_blank", options);
   }
   
   function popup41(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010136&cctvname=%25EC%2584%259C%25EB%25B6%2580%25ED%258A%25B8%25EB%259F%25AD%25ED%2584%25B0%25EB%25AF%25B8%25EB%2584%2590&kind=Seoul&cctvip=null&cctvch=51&id=93&cctvpasswd=null&cctvport=null&minX=126.80189865379901&minY=37.49535463700259&maxX=126.88047843335093&maxY=37.531395733919254", "_blank", options);
   }
      
      function popup42(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L903075&cctvname=%25EC%2596%2591%25ED%258F%2589%25EA%25B5%2590%25EB%258F%2599%25EB%258B%25A8&kind=EE&cctvip=6101&cctvch=null&id=null&cctvpasswd=null&cctvport=null&minX=126.87667441058399&minY=37.530781523118385&maxX=126.90096834253073&maxY=37.54611988921812", "_blank", options);
   }
   
      function popup43(){
         
         let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
         
         window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010003&cctvname=63%25EB%25B9%258C%25EB%2594%25A9&kind=Seoul&cctvip=null&cctvch=51&id=83&cctvpasswd=null&cctvport=null&minX=126.9179500864272&minY=37.507912190969705&maxX=126.95653716582036&maxY=37.528577237689596", "_blank", options);
      }
      
   function popup44(){
         
         let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
         
         window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010184&cctvname=%25EC%258B%25A0%25ED%2592%258D&kind=Seoul&cctvip=null&cctvch=52&id=245&cctvpasswd=null&cctvport=null&minX=126.8693520065034&minY=37.47800214776242&maxX=126.92831288220796&maxY=37.50602817310739", "_blank", options);
      }   
   
   function popup45(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010067&cctvname=%25EB%258C%2580%25EB%25A6%25BC%25EC%2582%25BC%25EA%25B1%25B0%25EB%25A6%25AC&kind=Seoul&cctvip=null&cctvch=51&id=67&cctvpasswd=null&cctvport=null&minX=126.88900945753007&minY=37.481093854799184&maxX=126.92758219017246&maxY=37.50176593775089", "_blank", options);
   }
   
   
   function popup46(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010067&cctvname=%25EB%258C%2580%25EB%25A6%25BC%25EC%2582%25BC%25EA%25B1%25B0%25EB%25A6%25AC&kind=Seoul&cctvip=null&cctvch=51&id=67&cctvpasswd=null&cctvport=null&minX=126.8969434497335&minY=37.48371362834009&maxX=126.92408954691503&maxY=37.50021386611323", "_blank", options);
   }
   
   function popup47(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010201&cctvname=%25EC%2597%25AC%25EC%259D%2598%25EA%25B5%2590%25EB%25B6%2581%25EB%258B%25A8&kind=Seoul&cctvip=null&cctvch=51&id=39&cctvpasswd=null&cctvport=null&minX=126.89087756503055&minY=37.49560172464198&maxX=126.95804275820183&maxY=37.526938021210874", "_blank", options);
   }
   
   function popup48(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010041&cctvname=%25EA%25B5%25AC%25ED%258C%258C%25EB%25B0%259C&kind=Seoul&cctvip=null&cctvch=51&id=10&cctvpasswd=null&cctvport=null&minX=126.89277042613442&minY=37.6167423433622&maxX=126.96002878240601&maxY=37.6480773610707", "_blank", options);
   }
   
   function popup49(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010101&cctvname=%25EB%25B0%2595%25EC%2584%259D%25EA%25B3%25A0%25EA%25B0%259CR&kind=Seoul&cctvip=null&cctvch=53&id=283&cctvpasswd=null&cctvport=null&minX=126.90380431191018&minY=37.61590445860792&maxX=126.94243065383756&maxY=37.6365727721649", "_blank", options);
   }
   
   function popup50(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010090&cctvname=%25EB%25A7%259D%25EC%259A%25B0%25EC%2582%25AC%25EA%25B1%25B0%25EB%25A6%25AC&kind=Seoul&cctvip=null&cctvch=52&id=167&cctvpasswd=null&cctvport=null&minX=127.07261467703708&minY=37.58355061605717&maxX=127.13989879013103&maxY=37.61479845985398", "_blank", options);
   }
   
   function popup51(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010273&cctvname=%25EC%259E%25A5%25EC%2595%2588%25EA%25B5%2590&kind=Seoul&cctvip=null&cctvch=51&id=113&cctvpasswd=null&cctvport=null&minX=127.06188992810141&minY=37.568114150522675&maxX=127.12915916355476&maxY=37.599367279447996", "_blank", options);
   }
   
   function popup52(){
      
      let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1900, height=1500, top=8000,left=650";
      
      window.open("http://www.utic.go.kr/view/map/cctvStream.jsp?cctvid=L010064&cctvname=%25EB%258A%25A5%25EC%2582%25B0%25EC%2582%25AC%25EA%25B1%25B0%25EB%25A6%25AC&kind=Seoul&cctvip=null&cctvch=54&id=339&cctvpasswd=null&cctvport=null&minX=127.06093596994668&minY=37.590297137082715&maxX=127.13969282007322&maxY=37.6261871811004", "_blank", options);
   }
   
   
   
   $(function(){
      
       // 저장된 값이 있는지 확인합니다.
        var selectedLocation = localStorage.getItem("selectedLocation");
        if(selectedLocation !== null) {
            // 저장된 값이 있다면 해당 옵션을 선택합니다.
            $("#location2").val(selectedLocation);
        }
      
      // 조회 버튼 클릭 시 선택된 값을 저장합니다.
        $("#btn3").click(function(){
            var selectedLocation = $("#location2").val();
            localStorage.setItem("selectedLocation", selectedLocation);
            sendAjaxRequest();
            
        });
      
       function sendAjaxRequest() {
           $.ajax({
               url:"emer.do",
               data:{location1:$("#location1").val(), location2:$("#location2").val()},
               success:function(data){
                   
                   let bodyTr = "";
                   $(data).find("item").each(function(i, item){
                       bodyTr  += "<tr id='emList'>"                          
                               + "<th width='300' id='ulh'>기관명</th>"
                               + "<th width='120'>응급실</th>"
                               + "<th width='100'>수술실</th>"                                      
                               + "<th width='100'>일반중환자</th>"
                               + "<th width='100'>입원실</th>"                                         
                               + "<th width='150'>구급차가용여부</th>"                          
                               + "<th width='100'>소아</th>"                                            
                               + "<th width='150' id='urh'>응급실전화</th>"                        
                               + "</tr>"   
                               
                               + "<tr id='er'>"
                               + "<td id='uld'>" + $(item).find("dutyName").text() + "</td>"                              
                               + "<td>" + ($(item).find("hvec").text() < 0 ? "대기자  : " + $(item).find("hvec").text().substring(1) + "명" + "</td>" : "잔여 : " + $(item).find("hvec").text() + "</td>") 
                               + "<td>" + ($(item).find("hvoc").text() < 0 ? "대기자  : " + $(item).find("hvoc").text().substring(1) + "명" + "</td>" : "잔여 : " + $(item).find("hvoc").text() + "</td>")                                                             
                               + "<td>" + $(item).find("hvicc").text() + "</td>"
                               + "<td>" + $(item).find("hvgc").text() + "</td>"                                                           
                               + "<td>" + $(item).find("hvamyn").text() + "</td>"                            
                               + "<td>" + $(item).find("hv10").text() + "</td>"                                                             
                               + "<td id='urd'>" + $(item).find("dutyTel3").text() + "</td>"                                                
                               + "</tr>"
                               + "<tr class='noLine' style='height:30px;>"
                               + "<td class='noLine' colspan=11>" + "</td>"
                               + "</tr>";
                               
                               
                      $.ajax({
                         url:"hospitalInfo.em",
                         data:{hpid:$(item).find("hpid").text()},
                         success:function(data){
                            
                            var items = $(data).find("item");
                            
                               // 첫 번째 아이템의 위도와 경도로 지도 중심 설정
                               var firstItem = $(items[0]);
                               var firstLat = firstItem.find("wgs84Lat").text();
                               var firstLon = firstItem.find("wgs84Lon").text();
                               var firstPosition = new naver.maps.LatLng(firstLat, firstLon);

                               // 지도 생성
                               map = new naver.maps.Map('map', {
                                   center: firstPosition,
                                   zoom: 14
                               });

                         items.each(function(i, item){
                           
                            var lat = $(item).find("wgs84Lat").text();
                               var lon = $(item).find("wgs84Lon").text();
                               var position = new naver.maps.LatLng(lat, lon);
                             
                             var marker = new naver.maps.Marker({
                                position: position,
                                map: map, // map 변수는 전역으로 선언되어야 함
                                icon: {
                                   url: 'resources/map/pin2.png',
                                   scaledSize: new naver.maps.Size(40, 40)
                                }
                             });
                                  
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
                            
                    });        
                     }                       
                     
                   });
                   }); 
                   $("#result").html(bodyTr);                         
               },
               error:function(){
                   console.log("응급실 아작스 통신실패");
               }
           });
       }
       
     
       sendAjaxRequest();
       
       // setInterval(sendAjaxRequest, 1000);
   });


   </script>

   </div>
   

</body>
</html>