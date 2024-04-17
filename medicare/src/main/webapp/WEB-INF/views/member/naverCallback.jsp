<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>	
</head>
<body>

	 <script>
          var naver_id_login = new naver_id_login("laHiH9mRP4ErMef14VeP", "http://localhost:8008/medicare/");
          // 접근 토큰 값 출력
          //alert(naver_id_login.oauthParams.access_token);
          
          // 네이버 사용자 프로필 조회
          naver_id_login.get_naver_userprofile("naverSignInCallback()");
          
          // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
          function naverSignInCallback() {
            var id = naver_id_login.getProfileData('id')+"@n";
            // var nickname = naver_id_login.getProfileData('name');
            //var email = naver_id_login.getProfileData('email');
            
            $.ajax({
                 url : "moveLoginPage.me",
                     headers : {
                     "Accept" : "application/json",
                     "Content-Type" : "application/json"
                  },
                  success : function(idChk){
                      
                     if(idChk==true){ //DB에 아이디가 없을 경우 => 회원가입
                          console.log("계정이 없어 회원가입으로 이동합니다.");
                          $.ajax({
                              url : "moveLoginPage.me",
                              method : "POST",
                              headers : {
                                "Accept" : "application/json",
                                "Content-Type" : "application/json"
                              },
                              data : JSON.stringify({
                                  memId : id,
                                  memName : nickname,
                                  password : "naver123",
                              }),
                              success : function(JSONData){
                                 alert("회원가입이 정상적으로 되었습니다.");
                                 window.close();
                                 top.opener.location="/user/snsLogin/"+id;
                              }
                          })
                      }
                      if(idChk==false){ //DB에 아이디가 존재할 경우 => 로그인
                          console.log("로그인 중...");
                          window.close();
                          top.opener.location="/user/snsLogin/"+id;
                      }
                  }
            })
            
          }
    </script>
	
</body>
</html>