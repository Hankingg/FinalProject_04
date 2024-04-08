<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
	<jsp:include page="common/header.jsp"/>
	 <div class="main-panel">
        <div class="content-wrapper">
        
        </div>
        <jsp:include page="common/footer.jsp"/>
     
</body>
</html>