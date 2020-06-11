<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:set var="root" value="${pageContext.request.contextPath}"/> --%>
<c:url value="/" var="root" />
<!DOCTYPE html>
<html>
<head>
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
	<h2>로그인 화면</h2>
	<form action="${root}login" method="post" id= "userinfo">
		<input type="hidden" name="act" value="login">
		<div class="form-group" align="left">
				<label for="userid">아이디</label>
				<input type="text" class="form-control" id="userid" name="userid" required="required">
			</div>
			<div class="form-group" align="left">
				<label for="userpw">비밀번호</label>
				<input type="password" class="form-control" id="userPw" name="userPw" required="required">
			</div>
		<input type="submit" value="로그인" class="btn btn-primary" id ="login">
		<a href="${root}signup" role="button" class="btn btn-primary" id = "regist">회원가입</a>
		<br>
		<a href="${root}searchpass" role="button" id ="searchpw">비밀번호찾기</a>
	</form>
	
	</div>
</div>

</body>

</html>