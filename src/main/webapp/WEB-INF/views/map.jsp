<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<c:url value="/" var="root" />
<!-- 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script> -->
</head>
<body>
<div class="container ">
<section id="index_section">
			<div class="card col-sm-12" style="min-height: 850px; align: center">
				<div class="card-body">

<!-- here start -->
<script>
let colorArr = ['table-primary','table-success','table-danger'];
$(document).ready(function(){
	$.ajax({
		type : "get",
		url : "${root}houseinfo",
		success : function(data, status) {
			//console.log(result);
			//console.log(status);
			if (status == "success") {
				$("#sido").empty();
				$.each(data, function(index, vo) {
					console.log(index, vo);
					$("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
				});
			}
		},
		error : function() {
			alert("잠시 서버 이상으로 시/도 목록 조회 실패");
		}
	});
});//ready


$(document).on("change", "#sido", function() {
	const sido = $("#sido :selected").val();
	console.log(sido);
	$.ajax({
		type : "get",
		url : "${root}houseinfo/"+sido,
		success : function(data, status) {
			if (status == "success") {
				$("#gugun").empty();
				$.each(data, function(index, vo) {
					console.log(index, vo);
					$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
				});
			}
		},
		error : function() {
			alert("잠시 서버 이상으로 시/도 목록 조회 실패");
		}
	});
});


$(document).on("change", "#gugun", function() {
	const gugun = $("#gugun :selected").val();
	console.log(gugun);
	$.ajax({
		type : "get",
		url : "${root}houseinfo/sido/"+gugun,
		success : function(data, status) {
			if (status == "success") {
				$("#dong").empty();
				$.each(data, function(index, vo) {
					console.log(index, vo);
					$("#dong").append("<option value='"+vo.code+"'>"+vo.dong+"</option>");
				});
			}
		},
		error : function() {
			alert("잠시 서버 이상으로 시/도 목록 조회 실패");
		}
	});
});


$(document).on("change", "#dong", function() {
	const dong = $("#dong :selected").html();
	const code = $("#dong :selected").val();
	console.log(dong);
	console.log(code);
	$.ajax({
		type : "get",
		url : "${root}houseinfo/sido/gugun/"+code+"/"+dong,
		success : function(data, status) {
			if (status == "success") {
				$("tbody").empty();
					console.log(data);
				$.each(data, function(index, vo) {
					let str = "<tr class="+colorArr[index%3]+">"
					+ "<td>" + vo.no + "</td>"
					+ "<td>" + vo.dong + "</td>"
					+ "<td>" + vo.aptName + "</td>"
					+ "<td>" + vo.jibun + "</td>"
					+ "<td>" + vo.code
					+ "</td><td id='lat_"+index+"'>"+vo.lat+"</td><td id='lng_"+index+"'>"+vo.lng+"</td></tr>";
					$("tbody").append(str);
					$("#searchResult").append(vo.dong+" "+vo.aptName+" "+vo.jibun+"<br>");
				});
				geocode(data);
			}
		},
		error : function() {
			alert("잠시 서버 이상으로 시/도 목록 조회 실패");
		}
	});
});

function geocode(jsonData) {
	let idx = 0;
	$.each(jsonData, function(index, vo) {
		let tmpLat;
		let tmpLng;
		$.get("https://maps.googleapis.com/maps/api/geocode/json"
				,{	key:'AIzaSyCUXrfnWjlZ0Mc-JesTkovpNbhhafBYbhs'
					, address:vo.dong+"+"+vo.AptName+"+"+vo.jibun
				}
				, function(data, status) {
					//alert(data.results[0].geometry.location.lat);
					tmpLat = data.results[0].geometry.location.lat;
					tmpLng = data.results[0].geometry.location.lng;
					$("#lat_"+index).text(tmpLat);
					$("#lng_"+index).text(tmpLng);
					addMarker(tmpLat, tmpLng, vo.AptName);
				}
				, "json"
		);//get
	});//each
}
</script>
<div class ="container row" style = " align : center" >
시/도 :  <select  class="form-control col-md-4" id="sido">
	<option value="0">선택</option>
</select>
구/군 :  <select  class="form-control col-md-3" id="gugun">
	<option value="0">선택</option>
</select>
읍/면/동 :  <select  class="form-control col-md-3" id="dong">
	<option value="0">선택</option>
</select>
</div>
<br>
<table class = "table table-border table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th>법정동</th>
			<th>아파트이름</th>
			<th>지번</th>
			<th>지역코드</th>
			<th>위도</th>
			<th>경도</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<!-- here end -->
<!-- map start -->
<div id="map" style="width: 100%; height: 500px; margin: auto;"></div>
<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCUXrfnWjlZ0Mc-JesTkovpNbhhafBYbhs&callback=initMap"></script>
<script>
	var multi = {lat: 37.5665734, lng: 126.978179};
	var map;
	function initMap() {
		map = new google.maps.Map(document.getElementById('map'), {
			center: multi, zoom: 12
		});
		//var marker = new google.maps.Marker({position: multi, map: map});
	}
	function addMarker(tmpLat, tmpLng, aptName) {
		var marker = new google.maps.Marker({
			position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
			label: aptName,
			title: aptName
		});
		marker.addListener('click', function() {
			map.setZoom(17);
			map.setCenter(marker.getPosition());
			callHouseDealInfo();
		});
		marker.setMap(map);
	}
	function callHouseDealInfo() {
		alert("you can call HouseDealInfo");
	}
</script>
<!-- map end -->

				</div>
			</div>
		</section>
		<!-- section end -->


</div>

</body>
</html>