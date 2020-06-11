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
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<br>
<div class="container" align="center">
	<div class="col-lg-6" align="center">
		<h2>비밀 번호 찾기</h2>
		<c:if test="${pw==null}">
		${msg}
		<form id="memberform" method="post" action="${root}logout">
		<input type="hidden" name="act" id="act" value="searchpass">
			<div class="form-group" align="left">
				<label for="userid">아이디</label>
				<input type="text" class="form-control" id="userid" name="userid" required="required">
			</div>
			<div class="form-group" align="left">
				<label for="userName">이름</label>
				<input type="text" class="form-control" id="userName" name="userName" required="required">
			</div>
			<div class="form-group" align="left">
				<label for="phone">핸드폰 번호</label>
				<input type="text" class="form-control" id="phone" name="phone" required="required">
			</div>
			<input type="submit" value="비밀번호 찾기" class="btn btn-primary" id="bt_search">
		</form>
		</c:if>
		<c:if test="${pw!=null}">
			<h3>비밀 번호는 ${pw} 입니다</h3>
			<a href="${root}logout" role="button" class="btn btn-primary">메인페이지</a>
		</c:if>
	</div>
</div>
</body>
<script >
$(document).ready(function(){
	$('#bt_search').click(function(){        	
		$.ajax({
			type:'post',
			headers : {
				"Content-Type" : "application/json"
			},
			url:'${root}pw',
			data:JSON.stringify({
				  userid: $("#memberform input[name=userid]").val(),
				  userName: $("#memberform input[name=userName]").val(),
				  phone: $("#memberform input[name=phone]").val()
			     }),
			success:function(val){    					
				alert("비밀번호 찾기  완료되었습니다 : " + val.data);
			},
			error:function(data){
				alert("비밀번호 찾기  실패했습니다.")
			}
		});
	});
	

  
});

</script>


</html>