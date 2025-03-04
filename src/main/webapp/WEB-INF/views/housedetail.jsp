<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:url value="/" var="root" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

</head>
<style>
.rounded {
  width: 100px;
  height: 40px;
  color: white;
  text-align: center;
  background: #8585ad;
  border-radius: 50px;
 

}
.tablesheet {
  width: 500px; 
  height: 40px;
  border-collapse: separate;
  border-spacing: 2em .2em;
 
}
</style>

<body>
<%@ include file = "/WEB-INF/views/nav.jsp"%>
<br>

	<h3 align="center">실거래 내역 </h3>

	<div class ="container" align="center" >
	<br>
	<br>
	<div class = block>
	<img src ="${root}/resources/img/${housedeal.img}" width="200px" align="left"  >
	
	
	<c:choose>
		<c:when test="${!empty housedeal}">
	
	<table class = "tablesheet " >
	
		<tr>
			<td class ='rounded'>법정동</td>  <td > ${housedeal.dong }</td> 	
		</tr>
		<tr>
			<td  class ='rounded'>아파트이름</td> <td> ${housedeal.aptName }</td>				
		</tr>
		<tr>
			<td  class ='rounded'>건축년도</td> <td> ${housedeal.buildYear }</td>			
		</tr>
		<tr>
			<td  class ='rounded'>층수 </td> <td> ${housedeal.floor }층</td>			
		</tr>
		<tr>
			<td  class ='rounded'>면적 </td> <td> ${housedeal.area }㎡</td>			
		</tr>
		<tr>
			<td  class ='rounded'>거래 일자 </td> <td> ${housedeal.dealYear }.${housedeal.dealMonth }.${housedeal.dealDay }</td>			
		</tr>
		<tr>
			<td  class ='rounded'>거래 가격 </td> <td> ${housedeal.dealAmount }만원</td>			
		</tr>
	<tbody>
	</tbody>
</table>
<br><br>
<br><br>
<h3><a href = "${root }/houselist"><img src="/resources/img/return2.png" width="50px"> 목록으로 돌아가기 </a></h3>
<h3><img src="/resources/img/heart.png" width="50px"> 총 ${totalLike}명이 이 게시글에 관심을 가지고 있어요!</h3>
<c:if test="${userinfo != null}">

<button id="fav"  type="button" class="btn btn-default"><img src="/resources/img/heart2.png" width="50px">관심목록에 추가하기</button>
<button id="myfavlist" onClick="location.href='${root}/myfavlist/${userinfo.userid}'"  type="button" class="btn btn-default"><img src="/resources/img/register.png" width="50px">내 관심 리스트 확인하기</button>
</c:if>
		</div>
		
		</c:when>
		<c:otherwise>
			<p>건물 정보가 없습니다.</p>
		</c:otherwise>
	</c:choose>
	<br>
	</div>
	
	
	
<script>
$('#fav').click(function () {
	$.ajax({
		type:'POST',
		headers : {
			"Content-Type" : "application/json"
		},
		url:'addfav',
		data:JSON.stringify({
			likeuid : "${userinfo.userid}",
			likehdid:"${housedeal.no}"
		}),
		success:function(data){
			alert("관심목록에 추가되었습니다.");
		
			location.reload();
		},
		error:function(data){
			alert("Error! 다시 한 번 시도바랍니다!");
		}
	});
});
function getMyList(){
	
}



</script>

</body>

</html>