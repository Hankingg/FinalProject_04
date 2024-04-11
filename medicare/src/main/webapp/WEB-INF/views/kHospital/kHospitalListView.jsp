<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer>div{
			text-align:center;
			margin: auto;
		}
        .wrap{
	        height: 80px;
	        width: 450px;
            margin:auto;
        }
        .wrap * {
        text-align: center;
    	}
        
        .wrap>form>div{
         float:left;
       		height:100%;
        }
        .wrap_1{ width:15%;}
        .wrap_2{ width:25%;}
        .wrap_3{ width:60%;}
        
        .map-jm{
            border: 1px solid black;
            width: 380px;
            height: 300px;
            margin-top:50px;
        }
        

        #searchBox-jm>div {
            float: left;
        }
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	<div class="main-panel">
        <div class="content-wrapper">
        	<div class="outer">
		        <div class="wrap">
		        	<form action="api.in">
		            <div class="wrap_1">
		                <select name="q0" id="q0">
		                    <option value="서울특별시">서울특별시</option>
		                    <option value="경기도">경기도</option>
		                    <option value="대구시">대구시</option>
		                </select>
		            </div>
		            <div class="wrap_2">
		                <select name="" id="">
		                    <option value="">내과</option>
		                    <option value="">이비인후과</option>
		                    <option value="">정형외과</option>
		                </select>
		            </div>
		            <div class="wrap_3">
		                <div id="searchBox-jm">
		                    <div ><input type="text" name="qn" id="qn"></div>
		                    <div><input type="button" value="검색" ></div>
		                </div>  
		            </div>
		            </form>
		        </div>
		        <div class="map-jm" style="margin-bottom:50px;"><img src="resources/images/mapimg.jpg" style="width:100%; height:100%;"></div>
		        <div><img src="resources/images/병원내역사진.jpg"></div>
				<br> <br> <br> <br> <br> <br> <br> <br> 
				
				<c:if test="">
		    		<textarea rows="20" cols="100"></textarea>
				</c:if>
				
		   		<div>
					
		   		</div>
		
				
				
		    </div>
        </div>
	
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>