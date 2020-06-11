<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<c:choose>
	<c:when test="${update==null}">
		<c:set var="ro" value=" readonly"></c:set>
		<c:set var="title" value="마이 페이지"></c:set>
		<c:set var="pw" value="text"></c:set>
	</c:when>
	
	<c:otherwise>
		<c:set var="title" value="회원 정보 수정"></c:set>
		<c:set var="pw" value="password"></c:set>
	</c:otherwise>
</c:choose>


<!DOCTYPE html>
<html>
<head>
<c:url value="/" var="root1"/>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<br>
<div class="container" align="center">
	<div class="col-lg-6" align="center">
		<h2>${title}</h2>
		<form id="memberform" method="post" action="${root}detail">
		<input type="hidden" name="act" id="act" value="update">
			<div class="form-group" align="left">
				<label for="userid">아이디</label>
				<input type="text" class="form-control" id="userid" name="userid" value="${userinfo.userid}" readonly="readonly">
			</div>
			<div class="form-group" align="left">
				<label for="userPw">비밀번호</label>
				<input type="${pw}" class="form-control" id="userPw" name="userPw" value="${userinfo.userPw}" >
			</div>
			<div class="form-group" align="left">
				<label for="userName">이름</label>
				<input type="text" class="form-control" id="userName" name="userName" value="${userinfo.userName}" >
			</div>
			<div class="form-group" align="left">
				<label for="address">주소</label>
				<input type="text" class="form-control" id="address" name="address" value="${userinfo.address}" >
			</div>
			<div class="form-group" align="left">
				<label for="phone">전화번호</label>
				<input type="text" class="form-control" id="phone" name="phone" value="${userinfo.phone}" >
			</div>
		
			<div class="form-group" align="center">
			<c:choose>
				<c:when test="${update==null}">
					<a href="${root}detail" role="button" class="btn btn-primary">확인</a>
					<a href="${root}logout" role="button" class="btn btn-primary" id = "bt_insert">수정</a>
					<a href="${root}logout" role="button" class="btn btn-primary" id ="bt_del">회원 탈퇴</a>
				</c:when>				
			</c:choose>
			</div>
		</form>
	</div>
</div>

</body>
<script>
$(document).ready(function(){
	$('#bt_insert').click(function(){        	
		$.ajax({
			type:'put',
			headers : {
				"Content-Type" : "application/json"
			},
			url:'${root}detail',
			data:JSON.stringify({
				  userid: $("#memberform input[name=userid]").val(),
				  userPw: $("#memberform input[name=userPw]").val(),
				  userName: $("#memberform input[name=userName]").val(),
				  address: $("#memberform input[name=address]").val(),
				  phone: $("#memberform input[name=phone]").val()
		
			     }),
			success:function(data){    					
				alert("회원수정이 완료되었습니다.");
			},
			error:function(data){
				alert("회원수정 실패했습니다.")
			}
		});
	});
	
	
	 $('#bt_del').click(function(){  
     	$.ajax({
 			type:"DELETE",
 			url:"${root}detail/${userinfo.userid}",    			
 			success:function(result){
 				if(result.status){
 					alert("회원삭제 성공했습니다.")
 				}	
 			},
 			error:function(data){
				alert("회원삭제 실패했습니다.")
			}
 			
 				
 			
 		  });	
     });//삭제요청
  
});




</script>
</html>