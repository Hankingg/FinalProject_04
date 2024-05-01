<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=gxxbcfildl&submodules=geocoder"></script>

  <style>
    .navbar-brand{
      cursor: pointer;
    }

    #logo{
      width: 80px;
      height: 60px;
    }

    #miniLogo{
      width: 30px;
      height: 30px;
    }
    
    #loginBtn {
    	color:black;
    	margin-top:2px;
    	text-decoration-line: none;
    }

	#myPage{
		cursor:pointer;
	}

    #loginBtn:hover {
    	color:gray;
    }
    
    /* 채팅 이미지 */
    #chatBtn{
    	position: fixed;
        left: 95%;
        top: 83%;
        z-index: 999;
        cursor: pointer;
    }

	#chatImg{
		width: 45px;
	    height: 45px;
	}


	/* 탑버튼 */
	  #topBtn{
	        position: fixed;
	        left: 95%;
	        top: 90%;
	        z-index: 999;
	  }
	
	  #topBtnImg{
	    width: 45px;
	    height: 45px;
	  }

    /* 폰트!!!!!!!!!!! */
    @font-face {
      font-family: 'LINESeedKR-Bd';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
      font-weight: 700;
      font-style: normal;
    }
    * {
    font-family: 'LINESeedKR-Bd';
    }
  
  </style>
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
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${ pageContext.request.contextPath }/resources/images/favicon.png" />
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

  <!-- alertify -->
  <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
  <!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>

  <!-- icon CDN -->
  <script src="https://use.fontawesome.com/releases/v6.5.0/js/all.js"></script>
  

  <!-- sockjs 라이브러리 -->
  <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
  <!-- Bootstrap CSS -->
  <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"> -->
  <!-- Option 1: Bootstrap Bundle with Popper (Bootstrap JS + Popper.js) -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.bundle.min.js"></script>
  
</head>
<body>
	<c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert("알림", "${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session"/> <!-- scope를 써줘야 거기서 실행시켜줌!! -->
	</c:if>
	
	 <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5"><img id="logo" src="${ pageContext.request.contextPath }/resources/logo/logo.png" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini"><img id="miniLogo" src="${ pageContext.request.contextPath }/resources/logo/logo-mini.png" alt="logo"/></a>
      </div>
      <script>
        $(function(){
          $(".navbar-brand").click(function(){
            location.href="/medicare";
          });
        });
      </script>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav mr-lg-2">
          <li class="nav-item nav-search d-none d-lg-block">
            <div class="input-group">
              <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                <span class="input-group-text" id="search">
                  <i class="icon-search"></i>
                </span>
              </div>
              <input type="text" class="form-control" id="navbar-search-input" placeholder="Search now" aria-label="search" aria-describedby="search">
            </div>
          </li>
        </ul>
        
        
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item dropdown">
            <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
           
          <!-- 로그인 칸 -->
          <c:choose> 
          	<c:when test="${ empty loginUser }">
             <a href="moveLoginPage.me" id="loginBtn">로그인</a>                        
              <span class="count"></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <div class="preview-icon bg-success">
                    <i class="ti-info-alt mx-0"></i>
                  </div>
                </div>
                <div class="preview-item-content">
                  <h6 class="preview-subject font-weight-normal">Application Error</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    Just now
                  </p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <div class="preview-icon bg-warning">
                    <i class="ti-settings mx-0"></i>
                  </div>
                </div>
                <div class="preview-item-content">
                  <h6 class="preview-subject font-weight-normal">Settings</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    Private message
                  </p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <div class="preview-icon bg-info">
                    <i class="ti-user mx-0"></i>
                  </div>
                </div>
                <div class="preview-item-content">
                  <h6 class="preview-subject font-weight-normal">New user registration</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    2 days ago
                  </p>
                </div>
              </a>
            </div>
          </li>
          </c:when>
          <c:otherwise>
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <!-- <img src="${ pageContext.request.contextPath }/resources/images/faces/face28.jpg" alt="profile"/> -->
              <i class="icon-bell mx-0" style="width: 30px; height: 30px; margin-bottom: 5px;"></i>
              <i class="fa-solid fa-circle-user" style="width: 30px; height: 30px; margin-top: 10px;"></i>&nbsp;&nbsp;&nbsp;           	
            </a>	
             <label style="margin-top: 8px;"><strong style="color: black;">${ loginUser.memName }님</strong>&nbsp;&nbsp;&nbsp;&nbsp;환영합니다</label>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <a href="myPage.me" class="dropdown-item">
                <i class="fa-solid fa-user text-primary"></i>&nbsp;&nbsp;
                마이페이지
              </a>
              <a href="logout.me" class="dropdown-item">
                <i class="ti-power-off text-primary"></i>
                Logout
              </a>
            </div>
          </li>
			</c:otherwise>
		</c:choose>
		<!-- 여기까지 로그인칸 -->
          
          <li class="nav-item nav-settings d-none d-lg-flex">
            <a class="nav-link" href="#">
              <i class="icon-ellipsis"></i>
            </a>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_settings-panel.html -->
      <div class="theme-setting-wrapper">
      
      	<!-- chat 버튼 -->
          <div id="chatBtn">
          	   <a href="chat"><img id="chatImg" src="resources/mainIcon/chat2.png"></a>
          </div>
        
        <!-- top 버튼 -->
            <div id="topBtn">
				<a href="#">
				  <svg xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"
					viewBox="0 0 32 32" fill="#F96C85" data-svg-content="true">
					  <g>
						<path
						  d="M 17,2C 8.716,2, 2,8.716, 2,17S 8.716,32, 17,32S 32,25.284, 32,17S 25.284,2, 17,2z M 23.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0L 18,11.414L 18,27 C 18,27.552, 17.552,28, 17,28S 16,27.552, 16,27L 16,11.414 L 11.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0c-0.39-0.39-0.39-1.024,0-1.414l 6-6C 16.296,8.29, 16.298,8.29, 16.3,8.288 c 0.090-0.088, 0.198-0.162, 0.316-0.21c 0.244-0.102, 0.52-0.102, 0.764,0C 17.504,8.128, 17.614,8.2, 17.708,8.292l 6,6 C 24.098,14.684, 24.098,15.316, 23.708,15.708z">
						</path>
					  </g>
				  </svg>
				</a>
			  </div>
        <div id="theme-settings" class="settings-panel">
          <i class="settings-close ti-close"></i>
          <p class="settings-heading">SIDEBAR SKINS</p>
          <div class="sidebar-bg-options selected" id="sidebar-light-theme"><div class="img-ss rounded-circle bg-light border mr-3"></div>Light</div>
          <div class="sidebar-bg-options" id="sidebar-dark-theme"><div class="img-ss rounded-circle bg-dark border mr-3"></div>Dark</div>
          <p class="settings-heading mt-2">HEADER SKINS</p>
          <div class="color-tiles mx-0 px-4">
            <div class="tiles success"></div>
            <div class="tiles warning"></div>
            <div class="tiles danger"></div>
            <div class="tiles info"></div>
            <div class="tiles dark"></div>
            <div class="tiles default"></div>
          </div>
        </div>
      </div>

      <div id="right-sidebar" class="settings-panel">
        <i class="settings-close ti-close"></i>
        <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" id="todo-tab" data-toggle="tab" href="#todo-section" role="tab" aria-controls="todo-section" aria-expanded="true">알림</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="chats-tab" data-toggle="tab" href="#chats-section" role="tab" aria-controls="chats-section">CHATS</a>
          </li>
        </ul>

        <div class="tab-content" id="setting-content">
          <div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
            <div class="add-items d-flex px-3 mb-0">
              <div id="msgStack"> </div>
				
              <!-- 
              <script>
                $(document).ready(function(){
                
                  // 웹소켓 연결
                   sock = new SockJS("<c:url value='/echo-ws'/>");
                   socket = sock;
        
                  // 데이터를 전달 받았을 때
                  sock.onmessage = function(evt){
                    onMessage(evt);
                    // localStorage에 데이터 저장
                    saveData(evt.data);
                  };
        
                  // 페이지 로드 시 localStorage에서 데이터 로드
                  loadDataAndDisplay();
                });
        
                // toast 생성 및 추가
                function onMessage(evt){
                  var data = evt.data;
                  displayToast(data);
                };

                function displayToast(data, id, createdAt) { // ID 인자 추가
                  let timeString = getTimeDifferenceString(createdAt); // 시간 문자열 계산
                  let toast = "<div class='toast' id='toast-" + id + "' role='alert' aria-live='assertive' aria-atomic='true'>";
                  toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
                  toast += "<small class='text-muted'>" + timeString + "</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
                  toast += "<span aria-hidden='true'>&times;</span></button>";
                  toast += "</div> <div class='toast-body'>" + data + "</div></div>";
                  $("#msgStack").prepend(toast);
                  $(".toast").toast({"animation": true, "autohide": false});
                  $('.toast').toast('show');
                  // x 버튼에 이벤트 리스너 추가
                  $("#toast-" + id + " .close").click(function() {
                    removeMessage(id);
                  });
                }
        
                function saveData(data){
                  var userId = "${loginUser.memId}";
                  var messages = JSON.parse(localStorage.getItem(userId)) || [];
                  // 고유 ID 생성 (예: 현재 시간)
                  var id = new Date().getTime();
                  var message = { id: id, content: data, createdAt: new Date().toISOString()  };
                  messages.push(message);
                  localStorage.setItem(userId, JSON.stringify(messages));
                }
                //////////////////////////////////////
                function removeMessage(id) {
                  var userId = "${loginUser.memId}";
                  var messages = JSON.parse(localStorage.getItem(userId)) || [];
                  // 고유 ID를 이용하여 해당 메시지를 배열에서 제거
                  messages = messages.filter(function(message) {
                    return message.id !== id;
                  });
                  localStorage.setItem(userId, JSON.stringify(messages));
                  // 화면에서도 알림 제거
                  $("#toast-" + id).remove();
                }
        
                function loadDataAndDisplay(){
                  var userId = "${loginUser.memId}";
                  var messages = JSON.parse(localStorage.getItem(userId)) || [];
                  messages.forEach(function(message){
                    displayToast(message.content, message.id, message.createdAt); // displayToast 호출 시 ID 전달
                  });
                }

                function getTimeDifferenceString(createdAt) {
                  const now = new Date();
                  const messageTime = new Date(createdAt);
                  const timeDiffInSeconds = Math.floor((now - messageTime) / 1000);

                  if (timeDiffInSeconds < 60) {
                    return '방금 전';
                  } else if (timeDiffInSeconds < 3600) {
                    return Math.floor(timeDiffInSeconds / 60) + '분 전';
                  } else if (timeDiffInSeconds < 86400) {
                    return Math.floor(timeDiffInSeconds / 3600) + '시간 전';
                  } else {
                    return Math.floor(timeDiffInSeconds / 86400) + '일 전';
                  }
                }
              </script>
			 -->




            </div>
            
            
            <div class="events pt-4 px-3">
              <div class="wrapper d-flex mb-2">
                
              </div>
            </div>
            <div class="events pt-4 px-3">
              <div class="wrapper d-flex mb-2">
                
              </div>
            </div>
          </div>
          <!-- To do section tab ends -->
          <div class="tab-pane fade" id="chats-section" role="tabpanel" aria-labelledby="chats-section">
            <div class="d-flex align-items-center justify-content-between border-bottom">
              <p class="settings-heading border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">Friends</p>
              <small class="settings-heading border-top-0 mb-3 pt-0 border-bottom-0 pb-0 pr-3 font-weight-normal">See All</small>
            </div>
            <ul class="chat-list">
              <li class="list active">
                <div class="profile"><img src="${ pageContext.request.contextPath }/resources/images/faces/face1.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>Thomas Douglas</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">19 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="${ pageContext.request.contextPath }/resources/images/faces/face2.jpg" alt="image"><span class="offline"></span></div>
                <div class="info">
                  <div class="wrapper d-flex">
                    <p>Catherine</p>
                  </div>
                  <p>Away</p>
                </div>
                <div class="badge badge-success badge-pill my-auto mx-2">4</div>
                <small class="text-muted my-auto">23 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="${ pageContext.request.contextPath }/resources/images/faces/face3.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>Daniel Russell</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">14 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="${ pageContext.request.contextPath }/resources/images/faces/face4.jpg" alt="image"><span class="offline"></span></div>
                <div class="info">
                  <p>James Richardson</p>
                  <p>Away</p>
                </div>
                <small class="text-muted my-auto">2 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="${ pageContext.request.contextPath }/resources/images/faces/face5.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>Madeline Kennedy</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">5 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="${ pageContext.request.contextPath }/resources/images/faces/face6.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>Sarah Graves</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">47 min</small>
              </li>
            </ul>
          </div>
          <!-- chat tab ends -->
        </div>
      </div>
      <!-- partial -->
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <!-- <li class="nav-item">
            <a class="nav-link" href="${ pageContext.request.contextPath }/index.jsp">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">Dashboard</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">UI Elements</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${ pageContext.request.contextPath }/resources/pages/ui-features/buttons.html">Buttons</a></li>
                <li class="nav-item"> <a class="nav-link" href="${ pageContext.request.contextPath }/resources/pages/ui-features/dropdowns.html">Dropdowns</a></li>
                <li class="nav-item"> <a class="nav-link" href="${ pageContext.request.contextPath }/resources/pages/ui-features/typography.html">Typography</a></li>
              </ul>
            </div>
          </li>
          -->      
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
              <i class="fa-solid fa-truck-medical"></i> &nbsp;&nbsp;&nbsp;&nbsp;
              <span class="menu-title">응급실</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="form-elements">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><a class="nav-link" href="">가용병상조회</a></li>
              </ul>
            </div>
          </li>

          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
              <i class="fa-solid fa-hospital"></i>&nbsp;&nbsp;&nbsp;&nbsp;
              <span class="menu-title">병원</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="tables">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="hospital.do">병원 목록</a></li>
                <li class="nav-item"> <a class="nav-link" href="">비대면 진료</a></li>
                <li class="nav-item"> <a class="nav-link" href="">접수하기</a></li>
                <c:if test="${ loginUser.mtId == 'H' }">
                	<li class="nav-item"> <a class="nav-link" href="doctorMyPage.in">병원 마이페이지</a></li>
                </c:if>
              </ul>
            </div>
          </li>

          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
              <i class="fa-solid fa-capsules"></i> &nbsp;&nbsp;&nbsp;&nbsp;
              <span class="menu-title">약국</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="charts">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="selectList.ph">약국 목록</a></li>
                <li class="nav-item"> <a class="nav-link" href="selectList.md">의약품 목록</a></li>
              </ul>
            </div>
          </li>

          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="fa-solid fa-mortar-pestle"></i> &nbsp;&nbsp;&nbsp;&nbsp;
              <span class="menu-title">한의원</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="list.kh">한의원 목록</a></li>
              </ul>
            </div>
          </li>
			
		  <c:if test="${ not empty loginUser }">
	          <li class="nav-item">
	            <a class="nav-link" data-toggle="collapse" href="#icons" aria-expanded="false" aria-controls="icons">
	              <i class="fa-solid fa-user"></i> &nbsp;&nbsp;&nbsp;&nbsp;
	              <span class="menu-title">마이페이지</span>
	              <i class="menu-arrow"></i>
	            </a>
	            <div class="collapse" id="icons">
	              <ul class="nav flex-column sub-menu">
	                <li class="nav-item">
		               <a class="nav-link" href="myPage.me">마이페이지</a>
	                </li>
	              </ul>
	            </div>
	          </li>
	      </c:if>

          <!-- <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#error" aria-expanded="false" aria-controls="error">
              <i class="icon-ban menu-icon"></i>
              <span class="menu-title">Error pages</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="error">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${ pageContext.request.contextPath }/resources/pages/samples/error-404.html"> 404 </a></li>
                <li class="nav-item"> <a class="nav-link" href="${ pageContext.request.contextPath }/resources/pages/samples/error-500.html"> 500 </a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${ pageContext.request.contextPath }/resources/pages/documentation/documentation.html">
              <i class="icon-paper menu-icon"></i>
              <span class="menu-title">Documentation</span>
            </a>
          </li> -->
          
        </ul>
      </nav>
      
</body>
</html>