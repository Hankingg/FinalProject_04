<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	#outer{
		width: 1000px;
		margin: auto;
		margin-top: 80px;
		margin-bottom: 50px;
		padding: 50px;
	}

	#address{
		padding-left: 300px;
		margin: 20px 0px;
	}

	/* 우편번호, 주소 input */
	#address>input[type=text]{
		width: 300px;
		height: 50px;
		margin: 10px ;
		border: 1px solid gray;
		border-radius: 10px;
		padding-left: 20px;
	}

	/* 우편번호 찾기 */
	#address>input[type=button]{
		width: 150px;
		height: 50px;
		border-radius: 10px;
		border: 1px solid gray;

	}

	/* 배송지 등록버튼 감싼 div */
	#button{
		display: flex;
		justify-content: center;
		margin: 20px 0px;

	}

	/* 배송지 등록버튼 */
	#button>button{
		width: 200px;
		height: 50px;
		border: none;
		border-radius: 10px;
		background-color: #F96C85;
		color: white;
	}

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="main-panel">
		<div class="content-wrapper" style="background-color: white;">
			<div id="outer">

				<h2 align="center" style="color: gray;">나의 배송지 등록</h2>
					
				<br><br>
				<div id="address">
					<input type="text" placeholder="배송지명" value="">
					<input type="text" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" placeholder="주소"><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목">
				</div>
	
				<div id="button">
					<button>배송지 추가</button>
				</div>
					
					
				
			</div>
			

<!-- 주소 검색 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
		</div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>