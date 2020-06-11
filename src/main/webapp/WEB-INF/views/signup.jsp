<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<title>회원 가입 페이지</title>
</head>
<body>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<br>
<div class="container" align="center">
	<div class="col-lg-6" align="center">
		<h2>회원 가입 페이지</h2>
		<form id="memberform" method="post" action="${root}logout">
		<input type="hidden" name="act" id="act" value="signup">
			<div class="form-group" align="left">
				<label for="userid">아이디</label>
				<input type="text" class="form-control" id="userid" name="userid" required="required">
			</div>
			<div class="form-group" align="left">
				<label for="userpw">비밀번호</label>
				<input type="password" class="form-control" id="userPw" name="userPw" required="required">
			</div>
			<div class="form-group" align="left">
				<label for="username">이름</label>
				<input type="text" class="form-control" id="userName" name="userName" required="required">
			</div>
			<div class="form-group" align="left">
				<label for="address">주소</label>
				<input type="text" class="form-control" id="address" name="address" required="required">
			</div>
			<div class="form-group" align="left">
				<label for="phone">전화번호</label>
				<input type="text" class="form-control" id="phone" name="phone" required="required">
			</div>
		
			<div class="form-group" align="center">
				<button type="reset" class="btn btn-warning">초기화</button>
				<input type="submit" value="가입" class="btn btn-primary" id= "bt_insert">
			</div>
			
		</form>
	</div>
</div>

<script >



$('#bt_insert').click(function(){        	
	$.ajax({
		type:'POST',
		headers : {
			"Content-Type" : "application/json"
		},
		url:'${root}signup',
		data:JSON.stringify({
			  userid: $("#memberform input[name=userid]").val(),
			  userPw: $("#memberform input[name=userPw]").val(),
			  userName: $("#memberform input[name=userName]").val(),
			  address: $("#memberform input[name=address]").val(),
			  phone: $("#memberform input[name=phone]").val()
	
		     }),
		success:function(data){    					
			alert("회원등록이 완료되었습니다.");
		},
		error:function(data){
			alert("회원 등록 실패했습니다.")
		}
	});
});//입력요청

</script>



</body>
</html>