<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	.form-group{
		border-radius: 10px;
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
</head>
<body>

	
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="../../images/logo.svg" alt="logo">
              </div>
              <h4>메디케어 회원가입</h4>
              <h6 class="font-weight-light">아이디, 비밀번호, 이메일, 이름 필수입력</h6>
              
              
              
              <form action="insert.me" method="post" class="pt-3">
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="memId" name="memId" placeholder="아이디" required>
                </div>                              
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="memPwd" name="memPwd" placeholder="비밀번호" required>
                </div>
                 <div class="form-group">
                  <input type="email" class="form-control form-control-lg" id="email" name="email" placeholder="이메일" required>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="memName" name="memName" placeholder="이름" required>
                </div>
                 <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="nickName" name="nickName" placeholder="별명">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="postcode" name="postcode" placeholder="우편번호">
                </div>
                 <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="address" name="address" placeholder="주소">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="detailAddr" name="detailAddr" placeholder="상세주소">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="extraAddr" name="extraAddr" placeholder="참고항목">
                </div>
                 <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="phone" name="phone" placeholder="전화번호">
                </div>  
                <div class="form-group">
                	<select style="color:black" id="mtId" name="mtId">
                		<option value="M">일반회원</option>
                		<option value="H">병원</option>
                		<option value="P">약국</option>                		
                	</select>
                </div>          
                <div class="mb-4">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input type="checkbox" class="form-check-input">
                      I agree to all Terms & Conditions
                    </label>
                  </div>
                </div>
                <div class="mt-3">
                 <button class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" style="background-color: rgb(240, 130, 120); border-color:rgb(240, 130, 120);"> 가입하기</button>  
                </div>
                <div class="text-center mt-4 font-weight-light">
                 이미 가입하신 계정이 있으신가요? <a href="login.me" class="text-primary">Login</a>
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
  <script src="../../vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="../../js/off-canvas.js"></script>
  <script src="../../js/hoverable-collapse.js"></script>
  <script src="../../js/template.js"></script>
  <script src="../../js/settings.js"></script>
  <script src="../../js/todolist.js"></script>
  <!-- endinject -->

</body>
</html>