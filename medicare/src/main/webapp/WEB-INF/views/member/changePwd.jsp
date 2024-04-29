<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
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
              <h4>비밀번호 변경</h4>
             
              <form action="changePwd.me" method="post" class="pt-3">               
              <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="memId" name="memId" placeholder="사용중인 이이디 입력" required>               
                </div>                                         
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="memPwd" name="memPwd" placeholder="새 비밀번호" required>               
                </div>
                 <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="checkPwd" placeholder="비밀번호 확인" required>
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
                 <button class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" style="background-color: rgb(240, 130, 120); border-color:rgb(240, 130, 120);">변경</button>  
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

	<script>
		  // 새 비밀번호 필드와 비밀번호 확인 필드를 가져옵니다.
		  var newPassword = document.getElementById('memPwd');
		  var confirmPassword = document.getElementById('checkPwd');
		  // 변경 버튼을 가져옵니다.
		  var changeButton = document.querySelector('.auth-form-btn');
		
		  // 비밀번호 확인 필드가 변경될 때마다 실행되는 함수를 정의합니다.
		  confirmPassword.addEventListener('keyup', function () {
		    // 새 비밀번호와 비밀번호 확인이 같은지 확인합니다.
		    if (newPassword.value === confirmPassword.value) {
		      // 일치할 경우 버튼을 활성화합니다.
		      changeButton.disabled = false;
		    } else {
		      // 일치하지 않을 경우 버튼을 비활성화합니다.
		      changeButton.disabled = true;
		    }
		  });
	</script>

</body>
</html>