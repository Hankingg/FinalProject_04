<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원복구</title>

<style>
	#adminMember th,td{		
		text-align:center;
		height:50px;
	}
	
	#adminMember {
	 width:1150px;
	 border:1px solid red;
	}	
	
	#deleteTable {
		margin-left:100px;
		margin-top:50px;
	}
	
	#deleteTable th, td {
		text-align:center;
		color:black;
	}
	
	#deleteTable th {
		height:40px;
	}
	
	#deleteBtn {
		float:right;
		margin-right:265px;
		background-color: white;
		border-color:rgb(240, 130, 120);
		border-radius:10px;
		color:gray;
		height:35px;
	}
	
	#restoreBtn {
		float:right;
		margin-right:15px;
		background-color: white;
		border-color:rgb(240, 130, 120);
		border-radius:10px;
		color:gray;
		height:35px;
	}
	
	#restoreBtn a {
		text-decoration: none;
		color:gray;
	}
	
	#admin_title {
		margin-top:30px;		
		margin-left:580px;
	}
	
	#pagingArea {
		margin-top:25px;
		margin-left:580px;
	}
	
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<div class="main-panel">
		<div class="content-wrapper">
		

		<div id="selectMember">
			<h2 style="color:gray;" id="admin_title">관리자 회원 복구</h4>
			<br><br>
			 <table id="deleteTable" style="border:1px solid gray;">
			 		<thead style="border:1px solid gray;">
			 			<tr>
			 			 <th width="50">선택</th>
                                  <th id="detailInfo" width="100">회원번호</th>
                                  <th width="200">회원계정</th>
                                  <th width="100">회원명</th>
                                  <th width="150">별명</th>
                                  <th width="150">이메일</th>
                                  <th width="200">주소</th>
                                  <th width="140">전화번호</th>	                                    		                                 			                                    
                                  <th width="150">가입일</th>
                              </tr>
			 		</thead>									
					<tbody style="border:1px solid gray;">
						<form id="deleteForm" action="restoreMember.me" method="post" onsubmit="return confirmDelete()">
							<c:forEach var="am" items="${ adminSelectMem }"> 								
								<tr>									
		                            <th><input type="checkbox" value="${ am.memNo }" name="restoreMember"></th>
		                            <td id="detailInfo">${ am.memNo }</td>
		                            <c:choose>
		                            <c:when test="${ am.enrollType eq 'K' }">
		                            	<td>카카오계정</td>
		                            </c:when>
		                            <c:when test="${ am.enrollType eq 'N' }">
		                            	<td>네이버계정</td>		                            	
		                            </c:when>
		                            <c:otherwise>
		                            	<td>${ am.memId }</td>
		                            </c:otherwise>
		                            </c:choose>
		                              
		                            <td>${ am.memName }</td>
		                            
		                            <c:choose>
		                            <c:when test="${ am.nickName eq null }">
		                            	<td>미입력</td>
		                            </c:when>
		                            <c:otherwise>
		                            <td>${ am.nickName }</td>
		                            </c:otherwise>
		                            </c:choose>
		                            
		                            <c:choose>
		                            <c:when test="${ am.email eq null }">
		                            	<td>미입력</td>
		                            </c:when>
		                            <c:otherwise>
		                            <td>${ am.email }</td>
		                            </c:otherwise>
		                            </c:choose>
		                           
		                           <c:choose>
		                           <c:when test="${ am.address eq null }">
		                            	<td>미입력</td>
		                            </c:when>
		                            <c:otherwise>
		                             <td>${ am.address }</td>
		                            </c:otherwise>
		                            </c:choose>
		                           
		                           <c:choose>
		                           <c:when test="${ am.phone eq null }">
		                            	<td>미입력</td>
		                            </c:when>
		                            <c:otherwise>
		                              <td>${ am.phone }</td>
		                            </c:otherwise>
		                            </c:choose>
		                           	     		                          
		                            <td>${ am.enrollDate }</td>
		                                                                                               
		                       	</tr> 
	                       </c:forEach>	                              
					  </form>
					  <button type="submit" id="deleteBtn" onclick="deleteConfirm()">회원복구</button>					  
					  <button type="submit" id="restoreBtn"><a href="adminCheckPwd.me">회원삭제 페이지 이동</a></button>
                    </tbody>
                   
              </table>  	
              
             
              			
		</div>
		
		<script>			
		    function deleteConfirm() {	
		    	
		        var check = $("input[type=checkbox]").is(":checked") == true;
				  if(!check){ // 아무것도 체크안함
			        	alert("체크박스를 선택 후 복구버튼을 눌러주세요");
			        	return;
			        }       
				  
		        var result = confirm("해당 회원을 복구 하시겠습니까?");
			       if(result){
			            document.getElementById("deleteForm").submit();
			            alert("복구 완료되었습니다!");
			        } else {							        	
			        	alert("취소 되었습니다.");
			        }	        
				     
			}					
		</script>
		
		
		  <div id="pagingArea">
                <ul class="pagination">
                		<c:choose>
	                		<c:when test="${ pi.currentPage eq 1 }">
		                    	<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="adminCheckPwd.me?cpage=${ pi.currentPage - 1 }">Previous</a></li>
	                    	</c:otherwise>
                    	</c:choose>
                    	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    		<li class="page-item"><a class="page-link" href="adminCheckPwd.me?cpage=${ p }">${ p }</a></li>
                    	</c:forEach>
                    	<c:choose>
	                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
		                   		 <li class="page-item disabled"><a class="page-link" href="">Next</a></li>
	               			</c:when>
	               			<c:otherwise>
	               				<li class="page-item"><a class="page-link" href="adminCheckPwd.me?cpage=${ pi.currentPage + 1 }">Next</a></li>
	               			</c:otherwise>
               			</c:choose>
                </ul>
            </div>
		
		
		
		
		<br><br>
		
		
		
		
		
      </div>
	<jsp:include page="../common/footer.jsp" />         
                

</body>
</html>