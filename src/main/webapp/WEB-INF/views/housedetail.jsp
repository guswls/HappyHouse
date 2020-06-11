<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:url value="/" var="root" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.rounded {
  width: 100px;
  height: 40px;
  color: white;
  text-align: center;
  background: #58ACFA;
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
		</tr><tr>
			<td  class ='rounded'>아파트이름</td> <td> ${housedeal.aptName }</td>				
		</tr><tr>
			<td  class ='rounded'>지번</td> <td> ${housedeal.jibun }</td>			
		</tr><tr>
			<td  class ='rounded'>건축년도</td> <td> ${housedeal.buildYear }</td>			
		</tr><tr>
			<td  class ='rounded'>거래 가격 </td> <td> ${housedeal.dealAmount }</td>			
		</tr>
	<tbody>
	</tbody>
</table>
<br><br><br><br>
<h3><a href = "${root }/"> 목록으로 돌아가기 </a></h3>
		</div>
		<%-- 	<p> 1. 식별 번호 : ${houseinfo.no }</p>
			<p> 2. 법정동 명 : ${housedeals.dong }</p>
			<p> 3. 아파트 이름 : ${housedeals.aptName }</p>
			<p> 4. 법정동 코드 : ${housedeals.code }</p>
			<p> 5. 건축 년도 : ${housedeals.buildYear }</p>
			<p> 6. 거래 가격 : ${housedeals.dealAmount }</p>
			<p> 7. 지번 주소 : ${housedeals.jibun }</p>
			<p> 8. 거래 정보 : ${housedeals.type }</p> --%>
		
		</c:when>
		<c:otherwise>
			<p>건물 정보가 없습니다.</p>
		</c:otherwise>
	</c:choose>
	<br>
	</div>
	
	

</body>
</html>