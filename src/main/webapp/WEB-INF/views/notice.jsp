<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

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
<html lang=en>
<head>
<meta charset=utf-8>
<meta http-equiv=X-UA-Compatible content="IE=edge">
<meta name=viewport content="width=device-width,initial-scale=1">
<link rel=icon href=./favicon.ico>
<style>
.router-link-exact-active {
	color: red;
}

.table {
	margin: 20px auto;
}
</style>
<link rel=stylesheet
	href=https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css
	integrity=sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh
	crossorigin=anonymous>
<title>vue-qna</title>
<link href=./css/chunk-vendors.cbc2a074.css rel=preload as=style>
<link href=./js/app.69ad5715.js rel=preload as=script>
<link href=./js/chunk-vendors.baf5bcc3.js rel=preload as=script>
<link href=./css/chunk-vendors.cbc2a074.css rel=stylesheet>
</head>
<body>
<%@ include file = "/WEB-INF/views/nav.jsp"%>
	<noscript>
		<strong>We're sorry but vue-qna doesn't work properly without
			JavaScript enabled. Please enable it to continue.</strong>
	</noscript>
	<div id=app class=container></div>
	<script src=./js/chunk-vendors.baf5bcc3.js></script>
	<script src=./js/app.69ad5715.js></script>
</body>
</html>