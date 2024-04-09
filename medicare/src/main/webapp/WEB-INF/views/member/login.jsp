<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
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
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="${ pageContext.request.contextPath }/resources/images/logo.svg" alt="logo">
              </div>
              <h4>Hello! let's get started</h4>
              <h6 class="font-weight-light">Sign in to continue.</h6>
              <form class="pt-3">
                <div class="form-group">
                  <input type="email" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="Username">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Password">
                </div>
                <div class="mt-3">
                  <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="${ pageContext.request.contextPath }/resources/index.html">SIGN IN</a>
                </div>
                <div class="my-2 d-flex justify-content-between align-items-center">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input type="checkbox" class="form-check-input">
                      Keep me signed in
                    </label>
                  </div>
                  <a href="#" class="auth-link text-black">Forgot password?</a>
                </div>
                <div class="mb-3">
                	<img src="${ pageContext.request.contextPath }/resources/images/kakao_login.png"style="width:40%; height:50px;" id="kakao-login-btn"></img>   	
                </div>
                <div class="text-center mt-4 font-weight-light">
                  Don't have an account? <a href="register.html" class="text-primary">Create</a>
                </div>
              </form>
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
        // 카카오 SDK 초기화
        Kakao.init('2e9ad81f2d94fa28edbb4d9ebe990822');

        // 카카오 로그인 버튼 클릭 시 호출되는 함수
        document.getElementById('kakao-login-btn').addEventListener('click', function() {
            // 카카오 로그인 창 열기
            Kakao.Auth.login({
                success: function(authObj) {
                    // 로그인 성공 시 사용자 정보 가져오기
                    Kakao.API.request({
                        url: '/v2/user/me',
                        success: function(response) {
                            var kakaoId = response.id; // 카카오 사용자 고유 ID
                            var kakaoNickname = response.properties.nickname; // 카카오 닉네임
                            var kakaoProfileImage = response.properties.profile_image; // 프로필 이미지 URL
                            
                            // 로그인 성공 후 처리할 작업 수행
                            // 예를 들어, 서버에 사용자 정보 전송 등의 작업을 수행할 수 있습니다.
                            console.log('Kakao ID:', kakaoId);
                            console.log('Nickname:', kakaoNickname);
                            console.log('Profile Image:', kakaoProfileImage);
                        },
                        fail: function(error) {
                            console.error('Failed to get user information:', error);
                        }
                    });
                },
                fail: function(error) {
                    console.error('Failed to log in:', error);
                }
            });
        });
   </script>
  
</body>

</html>


</body>
</html>