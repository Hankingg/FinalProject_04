<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        <div class="map-jm" style="margin-bottom:50px;"><img src="${ pageContext.request.contextPath }/resources/images/mapimg.jpg" style="width:100%; height:100%;"></div>
        <div><img src="${ pageContext.request.contextPath }/resources/images/병원내역사진.jpg"></div>
		<br> <br> <br> <br> <br> <br> <br> <br> 
		
		<c:if test="${not empty xmlResponse}">
    <textarea rows="20" cols="100">${xmlResponse}</textarea>
</c:if>
		
   		<div>
   		병원이름 : ${ dutyName }
   		기관코드 : ${ hpid }
   		주소 : ${ dutyAddr }
   		?? : ${ dutyEmcls }
   		??? : ${ dutyDivNam }
   		</div>

		
		
    </div>
        </div>
        <jsp:include page="../common/footer.jsp"/>
     
</body>
</html>