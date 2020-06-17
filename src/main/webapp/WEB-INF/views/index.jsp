<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script> -->
<head>
<style>
#div1 {
	width: 70%;
	float: left;
}

#div2 {
	width: 30%;
	margin-right:100px;
	height: 100%;
}

#total {
	margin: 0 auto;
}
</style>
</head>
<body>

<div style="display: flex; flex-direction: column;">
	<!-- 이부분 고쳐야함 -->
	<%@ include file="/WEB-INF/views/nav.jsp"%>
	<!-- Main Content -->


	<div id="total" class="container-fluid">
		<div id="div1">
			<%@ include file="/WEB-INF/views/map.jsp"%>
		</div>

		<div class="div2 card-body">
			<img src ="${root}resources/img/newspaper.png" width="50px" align="left"  >
			<h1> &nbsp; 오늘의 부동산 뉴스</h1>
			<form>
				<div id="news"></div>
			</form>
		</div>
	</div>
	

	

	<hr>


	<!-- Footer -->
	<footer>
		<div class="container" id="footer">
			<div class="row">
				<div class="col-lg-8 col-md-8 mx-auto">
					<ul class="list-inline text-center">
						<li class="list-inline-item"><a href="#"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-twitter fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li class="list-inline-item"><a href="#"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li class="list-inline-item"><a href="#"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-github fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
					</ul>
					<p class="copyright text-muted">Copyright &copy; Your Website
						2020</p>
				</div>
			</div>
		</div>
	</footer>
</div>
	<!--  Bootstrap core JavaScript 
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  Custom scripts for this template
  <script src="js/clean-blog.min.js"></script> -->

</body>

<script>
		function getNews() {
			$.ajax({
				type : 'GET',
				url : '/news',
				dataType : 'json',
				success : function(result) {

					$("#news").empty();
					var count = 1;

					
					var htmlTxt = "<p>";
					$.each(result.data, function(index, value) {

						htmlTxt +="뉴스" + (count++) + "번 : " + value
								+ "<br><br>";

					});
					htmlTxt += '</p>';
					$('#news').html(htmlTxt);
				},
				error : function(e) {
					console.log(e.responseText);
					alert("통신 Error" + e);
				}
			});

		}
		getNews();
	</script>

</html>
