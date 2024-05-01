<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style>
	.form-group{
		
	}
	
	input[type="checkbox"]:checked {
  		background:rgb(240, 130, 120);
	}

	.form-check-input {
		border:rgb(240, 130, 120);
	}
	
	.form-check-label text-muted {
		border-color:rgb(240, 130, 120);
	}
	
	.input-helper:before {
		border-color:solid rgb(240, 130, 120);
	}
	
</style>
</head>
<body>
	<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Skydash Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/vendors/feather/feather.css">
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${ pageContext.request.contextPath }/resources/images/favicon.png" />
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="UTF-8"></script>
  <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="UTF-8"></script> 
  <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
  <!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
</head>

<body>

	<c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert("알림", "${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session"/> <!-- scope를 써줘야 거기서 실행시켜줌!! -->
	</c:if>

  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
              
               <!-- 로고 들어갈 자리 -->
                
              </div>
              <h4><strong>메디케어를 방문해주셔서 감사합니다.</strong></h4>
             <!-- <h6 class="font-weight-light">Sign in to continue.</h6>  -->
              
              
              
              <form action="login.me" class="pt-3">
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="exampleInputEmail1" name="memId" placeholder="아이디">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" name="memPwd" placeholder="비밀번호">
                </div>
                
                <div class="mt-3">
                  <button class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" style="background-color:rgb(240, 130, 120); border-color:rgb(240, 130, 120);" href="${ pageContext.request.contextPath }/resources/index.html">로그인</button>
                </div>
                <div class="my-2 d-flex justify-content-between align-items-center">
                  <div class="form-check">
                    <label class="form-check-label text-muted" style="accent-color:rgb(240, 130, 120);">
                      <input type="checkbox" class="form-check-input" id="login-keep">
                      아이디 기억하기
                    </label>
                  </div>
                  <a href="moveChangePwd.me" class="auth-link text-black">비밀번호 찾기</a>
                </div>             
                <div class="text-center mt-4 font-weight-light">
                 계정이 없으신가요? <a href="enrollForm.me" class="text-primary">회원가입</a>
                </div>
                </form>
                <br>
                 <div class="mb-3" style="margin-left:50px;">
                	<img src="${ pageContext.request.contextPath }/resources/images/kakao_login.png"style="width:40%; height:50px;" id="kakao-login-btn" onlick="return kakao()"></img>   	               		             		
             		<a href="naverlogin"><img src="${ pageContext.request.contextPath }/resources/images/btnG_완성형.png" style="width:40%; height:50px; margin-left:20px; border-radius:5px;"></img></a>      
              	 </div>
              
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="${ pageContext.request.contextPath }/resources/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="${ pageContext.request.contextPath }/resources/js/off-canvas.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/hoverable-collapse.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/template.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/settings.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/js/todolist.js"></script>
  <!-- endinject -->
  
	<script>
    	naver_id_login.setButton("green", 3,50);
	</script>
 
  <script>
    // 카카오 SDK 초기화
    Kakao.init('2e9ad81f2d94fa28edbb4d9ebe990822');
    // 카카오 로그인 버튼 클릭 시 호출되는 함수
    document.getElementById('kakao-login-btn').addEventListener('click', function () {
        // 카카오 로그인 창 열기
        Kakao.Auth.login({
            success: function (response) {
                // 로그인 성공 시 사용자 정보 가져오기
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
                        let id = response.id; // 카카오 사용자 고유 ID
                        let nickname = response.properties.nickname; // 카카오 닉네임
                        let email = response.kakao_account.email;

                        alert("성공적으로 로그인이 완료 되었습니다.")

                        // 로그인 정보를 서버로 전송
                        $.ajax({
                            url: 'kakaoLogin.me',
                            type: 'POST',
                            data: {
                                memId: id,
                                memName: nickname,
                                email: email
                            },
                            success: function (data) {
                            	console.log(data)
                                if (data === 'success') {
                                    // 로그인 성공 시 메인 페이지로 이동
                                    
                                    window.location.replace("${pageContext.request.contextPath}/");
                                } else {
                                    alert('로그인 실패');
                                }
                            },
                            error: function (data) {
                                alert('서버 오류');
                            }
                        });

                    },
                    fail: function (error) {
                        alert(JSON.stringify(error))
                    }
                });
            },
            fail: function (error) {
                alert(JSON.stringify(error))
            }
        });
    });
    
    
    
    function setCookie(cname, cvalue, exdays) {
        var d = new Date();
        d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
        var expires = "expires=" + d.toUTCString();
        document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
    }

    function getCookie(cname) {
        var name = cname + "=";
        var decodedCookie = decodeURIComponent(document.cookie);
        var ca = decodedCookie.split(';');
        for(var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
                return c.substring(name.length, c.length);
            }
        }
        return "";
    }

    // 페이지 로드 시 쿠키에서 아이디 가져와서 입력란에 채우기 및 체크박스 상태 설정
    window.onload = function() {
        var savedId = getCookie("savedId");
        if (savedId !== "") {
            document.getElementById("exampleInputEmail1").value = savedId;
            document.getElementById("login-keep").checked = true; // 쿠키에 아이디가 저장되어 있으면 체크박스 체크
        }
    };

    // "로그인 유지하기" 체크박스 상태에 따라 쿠키 설정
    document.getElementById("login-keep").addEventListener("change", function() {
        var isChecked = this.checked;
        if (isChecked) {
            var userId = document.getElementById("exampleInputEmail1").value;
            setCookie("savedId", userId, 30); // 30일 동안 쿠키 유지
        } else {
            setCookie("savedId", "", -1); // 쿠키 삭제
        }
    });
    
    
</script>
  
</body>

</html>


</body>
</html>