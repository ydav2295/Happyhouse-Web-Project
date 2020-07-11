<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 찜목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
		<%@ include file="/WEB-INF/views/00.bs4_header.jsp" %>
		<div class="container">
		<div class="card my-4 row">
			<h2 class="card-header">지도정보</h2>
			<div class="card-body">
				<div id="map" NAME="map" style="width: 100%; height: 500px; margin: auto;"></div>
			</div>
		</div>
		
		<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
		<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCm_hAb-P76X7Qkeh9y2-FOujkq_Z6JDDs&callback=initMap"></script>
		<script>
			var seoul = {lat: 37.551256, lng: 126.988262};
			var map;
			var markers = [];
			
					
			function initMap() {
				console.dir()
				map = new google.maps.Map(document.getElementById('map'), {
					center: seoul, zoom: 17
				});
			}
			function addMarker(tmpLat, tmpLng, aptName) {
				console.log("addMarker 실행됨");
				var marker = new google.maps.Marker({
					position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
					label: aptName,
					title: aptName
				});
				marker.addListener('click', function() {
					map.setZoom(20);
					map.setCenter(marker.getPosition());
					console.dir(marker.getPosition());
				});
				map.setCenter(marker.getPosition());
				marker.setMap(map);
				markers.push(marker);
				
			}
			function addCommercialMarker(tmpLat, tmpLng, aptName,codename) {
				/* var GreenIcon = new google.maps.MarkerImage(
						   "http://labs.google.com/ridefinder/images/mm_20_green.png",
						   new google.maps.Size(12, 20),
						   new google.maps.Point(0, 0),
						   new google.maps.Point(6, 20)
						); */
				var food = new google.maps.MarkerImage("image/food.png", null, null, null, new google.maps.Size(50,50));
				var some = new google.maps.MarkerImage("image/some.png", null, null, null, new google.maps.Size(50,50));
				var life = new google.maps.MarkerImage("image/life.png", null, null, null, new google.maps.Size(30,30));
				var rest = new google.maps.MarkerImage("image/rest.png", null, null, null, new google.maps.Size(50,50));
				var hospital = new google.maps.MarkerImage("image/hospital.png", null, null, null, new google.maps.Size(40,40));
				var realestate = new google.maps.MarkerImage("image/realestate.png", null, null, null, new google.maps.Size(40,40));
				var hotel = new google.maps.MarkerImage("image/hotel.png", null, null, null, new google.maps.Size(40,40));
				var academy = new google.maps.MarkerImage("image/academy.png", null, null, null, new google.maps.Size(50,50));
				var sports = new google.maps.MarkerImage("image/sports.png", null, null, null, new google.maps.Size(50,50));
				var myIcon;
				if(codename === '음식'){
					myIcon = food;
				}else if(codename === '소매'){
					myIcon = some;
				}else if(codename === '생활서비스'){
					myIcon = life;
				}else if(codename === '관광/여가/오락'){
					myIcon = rest;
				}else if(codename === '의료'){
					myIcon = hospital;
				}else if(codename === '부동산'){
					myIcon = realestate;
				}else if(codename === '숙박'){
					myIcon = hotel;
				}else if(codename === '학문/교육'){
					myIcon = academy;
				}else if(codename === '스포츠'){
					myIcon = sports;
				}
				console.log("addCommercialMarker 실행됨");
				var marker = new google.maps.Marker({
					position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
					icon: myIcon,
					title: aptName
				});
				marker.addListener('click', function() {
					map.setZoom(20);
					map.setCenter(marker.getPosition());
					console.dir(marker.getPosition());
				});
				map.setCenter(marker.getPosition());
				marker.setMap(map);
				markers.push(marker);
			}
			function clearMarkers(){
				for (var i = 0; i < markers.length; i++) {
					markers[i].setMap(null);
				}
				markers = [];
			}
		</script>
<!-- map end -->
		<div class="card my-4 row">
			<h2 class="card-header">찜한 아파트 목록</h2>
			<div class="card-body" id="zzim">
			</div>
		</div>
		<div class="card my-4 row">
			<div id = "commercialHeader"class="card-header"></div>
			<div class="card-body" id="zzim">
				<div id="commercial"></div>
			</div>
		</div>
	</div>
	<script>
		initZzim();
		function findcome(arg){
			console.dir(arg);
			addCommercialMarker(arg.lat,arg.lng,arg.shopname,arg.codename);
			location.href="#map";
		}
		function commercial(dong){
			console.dir(dong);
			$("#commercialHeader").html("<h2 class=`card-header`>주변 상권정보</h2>");
			$("#commercial").html(`
					<div>
						<input type="text" id="dong" name="dong" value="\${dong}" readonly />
						<select id="codename1">
							<option value="0">선택</option>
						</select>

					</div>
					<div id="commercialcontent">
					
					</div>
			`);
			$(document).ready(function(){
				$.get("commercial/codename"
					,function(data, status){
						$.each(data, function(index, vo) {
							$("#codename1").append(`<option value="\${vo}">\${vo}</option>`);
						});//each
					}//function
					, "json"
				);//get
			});//ready
			$("#codename1").change(function() {
				$.ajax({
					url:"commercial/bean",
					type:"GET",
					data:{
							dong:$("#dong").val(),
							codename1:$("#codename1").val()
						},
					dataType:"json",
				})
				.done(function(data){
					let codename = $("#codename1").val();
					console.dir(data);
					$("#commercialcontent").html(`
						<table class="table" id="comtable">
							<tr>
								<th>이름</th>
								<th>주소</th>
								<th>대분류</th>
								<th>중분류</th>
								<th>소분류</th>
								<th>위치보기</th>
							</tr>
						</table>
							`);
					data.forEach(function(vo){
						$("#comtable").append(`
							<tr>
								<td>\${vo.shopname}</td>
								<td>\${vo.address}</td>
								<td>\${vo.codename1}</td>
								<td>\${vo.codename2}</td>
								<td>\${vo.codename3}</td>
								<th><button class="btn btn-default btn-sm" onclick='findcome({lat:\${vo.lat},lng:\${vo.lng},shopname:"\${vo.shopname}",codename:"\${codename}" })'><img src="image/location.png" width=25, height=25 alt=""></button></th>
							</tr>
						`);
					});
					
					
				});
			});
			
		}
		function pos(no){
			$.ajax({
				url:"favlist/housedeal",
				type:"GET",
				data:{no:no},
			})
			.done(function(deal){
				console.log("deal 정보:")
				console.dir(deal);

				$.ajax({
					url:"selectByBean",
					type:"GET",
					dataType:"json",
					data:{
						dong:deal.dong,
						AptName:deal.aptName,
						jibun:deal.jibun
					}
				})
				.done(function(info){
					console.dir(info[0].lat);
					addMarker(info[0].lat, info[0].lng, info[0].aptName);
				});
				location.href="#";
			})
			.fail(function(){
				alert("pos() : ajax처리중 오류 발생!");
			});
		}
		function deleteFavList(no){
			console.log(no);
			$.ajax({
				url:"favlist/deleteByNo",
				type:"DELETE",
				data:{
					no:no
				},
			})
			.done(function(data){
				if(data === 'success'){
					alert("찜 목록이 삭제되었습니다!");
					initZzim();
				}else{
					alert("찜 목록 삭제중 오류가 발생했습니다!");
					initZzim();
				}
			})
			.fail(function(){
				alert("deleteFavList() : ajax처리중  오류가 발생했습니다!");
				initZzim();
			});
		}
		function initZzim(){
			$.ajax({
				url:"favlist",
				type:"GET",
				data:{id:`${loginMember.id}`},
				dataType:"json",
			})
			.done(function(data){
				if(data.length){
					clearMarkers();
					let str = 
						`<table class = 'table' id="content">
							<tr>
								<td>아파트명</td>
								<td>지번</td>
								<td>준공 년도</td>
								<td>면적</td>
								<td>층</td>
								<td>거래가격</td>
								<td>거래 년도</td>
								<td>거래 월</td>
								<td>거래 일</td>
								<td>위치</td>
								<td>상권</td>
								<td>삭제</td>
							</tr>
						</table>`;
						$("#zzim").html(str);
					data.forEach(function(vo){
						console.dir(vo);
						$.ajax({
							url:"favlist/housedeal",
							type:"GET",
							data:{no:vo.no},
						})
						.done(function(deal){
							console.log("deal 정보:")
							console.dir(deal);
							let dong = deal.dong;
							console.log(dong);
							let con = `
		 						<tr>
		 							<td>\${deal.aptName}</td>
									<td>\${deal.jibun}</td>
									<td>\${deal.buildYear}</td>
									<td>\${deal.area}</td>
									<td>\${deal.floor}</td>
									<td>\${deal.dealAmount}</td>
									<td>\${deal.dealYear}</td>
									<td>\${deal.dealMonth}</td>
									<td>\${deal.dealDay}</td>
									<td><button class="btn btn-default btn-sm" onclick="pos(\${deal.no})"><img src="image/location.png" width=25, height=25 alt=""></button></td>
									<td><button class="btn btn-default btn-sm" onclick="commercial('\${deal.dong}')"><img src="image/search.png" width=20, height=20 alt=""></button></td>
									<td><button class="btn btn-default btn-sm" onclick="deleteFavList(\${deal.no})"><img src="image/delete.png" width=20, height=20 alt=""></button></td>
								</tr>
							`;
							$("#content").append(con);
							
							$.ajax({
								url:"selectByBean",
								type:"GET",
								dataType:"json",
								data:{
									dong:deal.dong,
									AptName:deal.aptName,
									jibun:deal.jibun
								}
							})
							.done(function(info){
								console.dir(info[0].lat);
								addMarker(info[0].lat, info[0].lng, info[0].aptName);
							});
						})
						.fail(function(){
							alert("initZzim()1 : ajax처리중 오류 발생!");
						});
					})

					
				}else{
					alert("찜목록이 비었습니다.");
					location.href="memberinfo";
				}
				
			})
			.fail(function(){
				alert("initZzim()2 : ajax처리중  오류가 발생했습니다!");
				initInterest();
			});
		}
	</script>
	<%@ include file="/WEB-INF/views/00.bs4_footer.jsp" %>
</body>
</html>