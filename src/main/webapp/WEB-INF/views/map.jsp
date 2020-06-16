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
<div class="container">
<section id="index_section">
			<div class="card col-sm-12" style="min-height: 850px; align: center">
				<div class="card-body">

<!-- here start -->
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
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAF4qweFIAhUwelzQWZ1x8h0IDHEks2o9E&callback=initMap"></script>
<script>
	var multi = {lat: 37.5665734, lng: 126.978179};
	var map;

	var markers =[];
	
	function initMap() {
		map = new google.maps.Map(document.getElementById('map'), {
			center: multi, zoom: 12
		});
		var marker = new google.maps.Marker({position: multi, map: map});
		markers.push(marker);
	}

	let currentInfo = null;	
	function addMarker(tmpLat, tmpLng, aptName) {
		var marker = new google.maps.Marker({
			position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
			title: aptName
		});
		
		markers.push(marker);
		
		
		
		marker.addListener('click', function() {
			if(currentInfo!=null) {
				currentInfo.close();
			}
			map.setZoom(18);
			map.setCenter(marker.getPosition());
			
			let amount;
			
			$.ajax({
				type : "get",
				url : "${root}recent/"+aptName,
				success : function(data, status) {
					if (status == "success") {
						document.getElementById("recentAmount").innerHTML = data;	
					}
				},
				error : function() {
					alert("잠시 서버 이상으로 최근 거래가 조회 실패");
				}
			});
		
			var infowindow = new google.maps.InfoWindow({
	            content: "<div style='width : 160px; height: 60px; text-align: center;'>"+
	            aptName+
	            "<br/>최근 거래가 : "+"<span id='recentAmount'></span>"+
	            "만원<button style='border-radius:10px;' onClick='location.href=\"houselist\"'>실거래내역 검색</button></div>"
	        });
			
			infowindow.open(map, marker);
			currentInfo = infowindow;
		});
		marker.setMap(map);
	}
	
	deleteMarkers = function (markers) {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
	}
	
	$(document).ready(function(){
		$.ajax({
			type : "get",
			url : "${root}houseinfo",
			success : function(data, status) {
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
		const code = $("#dong :selected").val();
		const sido = $("#sido :selected").html();
		const gugun = $("#gugun :selected").html();
		const dong = $("#dong :selected").html();
		codeAddress(sido+" "+gugun+" "+dong);
		$.ajax({
			type : "get",
			url : "${root}houseinfo/sido/gugun/"+code+"/"+dong,
			success : function(data, status) {
				if (status == "success") {
					$("tbody").empty();
					deleteMarkers(markers);
					$.each(data, function(index, vo) {
						let str = "<tr>"
						+ "<td>" + vo.no + "</td>"
						+ "<td>" + vo.dong + "</td>"
						+ "<td>" + vo.aptName + "</td>"
						+ "<td>" + vo.jibun + "</td>"
						+ "<td>" + vo.code
						+ "</td><td id='lat_"+index+"'>"+vo.lat+"</td><td id='lng_"+index+"'>"+vo.lng+"</td></tr>";
						$("tbody").append(str);
						addMarker(vo.lat, vo.lng, vo.aptName);
						$("#searchResult").append(vo.dong+" "+vo.aptName+" "+vo.jibun+"<br>");
					});
				}
			},
			error : function() {
				alert("잠시 서버 이상으로 시/도 목록 조회 실패");
			}
		});
	});
	
	var geocoder;
	
	function codeAddress(addr) {
		geocoder = new google.maps.Geocoder();
		var loc=[];

		geocoder.geocode({'address': addr}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
		    	loc[0]=results[0].geometry.location.lat();
		    	loc[1]=results[0].geometry.location.lng();
		    	var latlng = new google.maps.LatLng(parseFloat(loc[0]), parseFloat(loc[1]));
		    	map.setZoom(16);
				map.setCenter(latlng);
		    } 
			else {
		        alert("Geocode was not successful for the following reason: " + status);
		    }
		    }
		);
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