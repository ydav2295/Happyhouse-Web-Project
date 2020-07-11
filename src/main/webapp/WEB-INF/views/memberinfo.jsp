<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/views/00.bs4_header.jsp" %>
		<div>
			<div class="container">
				<div class="mt-2 mb-2">
					
					<div class="card my-4">
						<h5 class="card-header">회원 정보 확인</h5>
						<div class="card-body">
							<table class="table">
								<tr>
									<th>아이디*</th>
									<td>${loginMember.id}</td>
								</tr>
								<tr>
									<th>비밀번호*</th>
									<td>${loginMember.password}</td>
								</tr>
								<tr>
									<th>이름*</th>
									<td>${loginMember.name}</td>
								</tr>
								<tr>
									<th>주소*</th>
									<td>${loginMember.address}</td>
								</tr>
								<tr>
									<th>전화번호*</th>
									<td>${loginMember.phone}</td>
								</tr>
							</table>
							<div>
								<button type="button" class="btn btn-secondary" onclick="location.href='main'">확인</button>
								<button type="button" class="btn btn-secondary" onclick="location.href='memberupdateform'">회원정보 수정</button>
								<button type="button" class="btn btn-secondary" onclick="location.href='deletemember'">회원 탈퇴</button>
								<button type="button" class="btn btn-warning" onclick="location.href='favlistmain'">내 찜목록</button>
							</div>
						</div>
					</div>				
				
				</div>
			</div>
		</div>
		<hr>
		<div class="card my-4 row">
			<h5 class="card-header">나의 선호 아파트 정보</h5>
			<div class="card-body" id="interest">
			</div>
		</div>
			
		</div>
	</div>
	<script>
		initInterest();
		function intoMyAptBask(no){
			console.dir(no);
			let flag = "1";
			$.ajax({
				url:'favlist',
				type:"GET",
				data:{
					id:`${loginMember.id}`,
				},
			})
			.done(function(data){
				data.forEach(function(vo){
					if(vo.no === no){
						console.log(vo.no);
						alert("이미 등록한 아파트 정보입니다.");
						flag = "";
					}
				})

				if(flag){
					console.log(no);
					$.ajax({
						url:'favlist',
						type:"POST",
						data:{
							id:`${loginMember.id}`,
							no:no 
						},
					})
					.done(function(data){
						if(data === 'success'){
							alert("찜 목록에  등록되었습니다!");
						}else{
							alert("찜 목록 등록중 오류가 발생했습니다!");
							initInterest();
						}
					})
					.fail(function(){
						alert("intoMyAptBask() : ajax처리중  오류가 발생했습니다!");
						initInterest();
					});
				}
			})
			.fail(function(){
				alert("intoMyAptBask() : ajax처리중  오류가 발생했습니다!");
				initInterest();
			});
			
		}
		function insertInt(){
			$.ajax({
				url:"intopt",
				type:"POST",
				data: $("#inputForm").serialize(),
			})
			.done(function(data){
				if(data === 'success'){
					alert("선호 아파트 정보가 등록되었습니다!");
					initInterest();
				}else{
					alert("선호 아파트 등록중 오류가 발생했습니다!");
					initInterest();
				}
			})
			.fail(function(){
				alert("insertInt() : ajax처리중  오류가 발생했습니다!");
				initInterest();
			});
		}
		function insertForm(){
			$("#interest").html(`
				<form id="inputForm">
					<table class="table">
				      <tr>
				        <th>사용자 id : </th>
				        <td>
				       		 <input class="form-control" type="text" id="id" name="id" value=${loginMember.id} readonly />
				        </td>
				      </tr>
				      <tr>
				        <th>선호 시도 : </th>
				        <td>
					        <select class="form-control" id="sido" name="sido">
								<option value="0">선택</option>
							</select>
				        </td>
				      </tr>
				      <tr>
				        <th>선호 구군 : </th>
				        <td>
					        <select class="form-control" id="gugun" name="gugun">
								<option value="0">선택</option>
							</select>
				        </td>
				      </tr>
				      <tr>
				        <th>선호 동 : </th>
				        <td>
					        <select class="form-control" id="dong" name="dong">
								<option value="0">선택</option>
							</select>	
				        </td>
				      </tr>
				      <tr>
				        <th>선호 가격 : </th>
				        <td>
				       		 <input class="form-control" type="text" id="price" name="price" value = "0"/>
				        </td>
				      </tr>
				      <tr>
				        <th>선호 평수 : </th>
				        <td>
				        	<input class="form-control" type="text" id="space" name="space" value = "0"/>
				        </td>
				      </tr>
				      <tr>
				        <th>선호 층수 : </th>
				        <td>
				       		 <input class="form-control" type="text" id="floor" name="floor" value = "0"/>
				        </td>
				      </tr>
				    </table>
				</form>	
				<div>
					<button class="btn btn-secondary btn-sm" onclick="insertInt();">등록</button>
					<button class="btn btn-secondary btn-sm" onclick="initInterest();">취소</button>
				</div>
			`);
			readyForm();
		}
		function readyForm(){
			$(document).ready(function(){
				$.get("sido"
					,function(data, status){
						$.each(data, function(index, vo) {
							$("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
						});//each
					}//function
					, "json"
				);//get
			});//ready
			$(document).ready(function(){
				$("#sido").change(function() {
					$.get("gugun"
							, {sido:$("#sido").val()}
							,function(data, status){
								$("#gugun").empty();
								$("#gugun").append('<option value="0">선택</option>');
								$.each(data, function(index, vo) {
									$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
								});//each
							}//function
							, "json"
					);//get
				});//change
				$("#gugun").change(function() {
					$.get("dong"
							, {gugun:$("#gugun").val()}
							,function(data, status){
								$("#dong").empty();
								$("#dong").append('<option value="0">선택</option>');
								$.each(data, function(index, vo) {
									$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
								});//each
							}//function
							, "json"
					);//get
				});//change
			});//ready
		}
		function searchList(){
			let dong;

			$.ajax({
				url:"intopt",
				data:{id:`${loginMember.id}`},
				type: "GET",
				dataType:"json",
			})
			.done(function(data){
				console.dir(data);
				dong = data.dong;
				console.log("searchlist()");
				console.dir(dong);
				$.get("intopt/apt"
						, {
							dong:dong,
							id:`${loginMember.id}`,
//		 					range:range
						}
						,function(data, status){
							console.dir(data);
							let str = 
								`<table class = 'table'>
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
										<td>관심</td>
									</tr>`;
		 					$.each(data, function(index, vo) {
		 						str += `
			 						<tr>
			 							<td>`+vo.aptName+`</td>
										<td>`+vo.jibun+`</td>
										<td>`+vo.buildYear+`</td>
										<td>`+vo.area+`</td>
										<td>`+vo.floor+`</td>
										<td>`+vo.dealAmount+`</td>
										<td>`+vo.dealYear+`</td>
										<td>`+vo.dealMonth+`</td>
										<td>`+vo.dealDay+`</td>
										<td><button class="btn btn-default btn-xs" onclick="intoMyAptBask(`+vo.no+`)"><img src="image/basket.png" width=20, height=20 alt=""></button></td>
									</tr>
		 						`
		 					});//each
		 					str+="</table>";
		 					str+=`
		 						<button class="btn btn-warning btn-xs" onclick="initInterest()">나의 선호아파트 정보</button>
		 					`;
		 					$("#interest").html(str);
						}//function
						, "json"
					);//get
			})
			.fail(function(){
				alert("searchList() : ajax처리중 오류 발생!");
			});	
			
		}
		
		function modifyIntForm(){
			$("#interest").html(`
				<form id="inputForm">
					<table class="table">
				      <tr>
				        <th>사용자 id : </th>
				        <td>
				       		 <input class="form-control" type="text" id="id" name="id" value=${loginMember.id} readonly />
				        </td>
				      </tr>
				      <tr>
				        <th>선호 시도 : </th>
				        <td>
					        <select class="form-control" id="sido" name="sido">
								<option value="0">선택</option>
							</select>
				        </td>
				      </tr>
				      <tr>
				        <th>선호 구군 : </th>
				        <td>
					        <select class="form-control" id="gugun" name="gugun">
								<option value="0">선택</option>
							</select>
				        </td>
				      </tr>
				      <tr>
				        <th>선호 동 : </th>
				        <td>
					        <select class="form-control" id="dong" name="dong">
								<option value="0">선택</option>
							</select>	
				        </td>
				      </tr>
				      <tr>
				        <th>선호 가격 : </th>
				        <td>
				       		 <input class="form-control" type="text" id="price" name="price" value = "0"/>
				        </td>
				      </tr>
				      <tr>
				        <th>선호 평수 : </th>
				        <td>
				        	<input class="form-control" type="text" id="space" name="space" value = "0"/>
				        </td>
				      </tr>
				      <tr>
				        <th>선호 층수 : </th>
				        <td>
				       		 <input class="form-control" type="text" id="floor" name="floor" value = "0"/>
				        </td>
				      </tr>
				    </table>
				</form>	
				<div>
					<button class="btn btn-secondary btn-xs" onclick="modifyInt();">수정</button>
					<button class="btn btn-secondary btn-xs" onclick="initInterest();">취소</button>
				</div>
			`);
			readyForm();
		}
		function deleteInt(){
			const id = $("#id").val();
			$.ajax({
				url:"intopt",
				type:"DELETE",
				data:{id:`${loginMember.id}`},
			})
			.done(function(data){
				console.log("done");
				if(data === 'success'){
					alert("선호 아파트 정보가 삭제되었습니다!");
					initInterest();
				}else{
					alert("선호 아파트 삭제중 오류가 발생했습니다!");
					initInterest();
				}
			})
			.fail(function(){
				console.log("fail");
				alert("ajax처리중  오류가 발생했습니다!");
				initInterest();
			});
		}
		function modifyInt(){
			$.ajax({
				url:"intopt",
				type:"PUT",
				data: $("#inputForm").serialize(),
			})
			.done(function(data){
				if(data === 'success'){
					alert("선호 아파트 정보가 수정되었습니다!");
					initInterest();
				}else{
					alert("선호 아파트 수정중 오류가 발생했습니다!");
					initInterest();
				}
			})
			.fail(function(){
				alert("ajax처리중  오류가 발생했습니다!");
				initInterest();
			});
		}
		function initInterest(){
			$.ajax({
				url:"intopt",
				data:{id:`${loginMember.id}`},
				type: "GET",
				dataType:"json",
			})
			.done(function(data){
				console.dir(data);
				$("#interest").html(`
						<table class="table">
					      <tr>
					        <th>사용자 id : </th>
					        <td>`+
					        	data.id+`
					        </td>
					      </tr>
					      <tr>
					        <th>선호하는 동네 : </th>
					        <td>`+
					        	data.dong+`
					        </td>
					      </tr>
					      <tr>
					        <th>선호 가격 : </th>
					        <td>`+
					       		 data.price+`
					        </td>
					      </tr>
					      <tr>
					        <th>선호 평수 : </th>
					        <td>`+
					       		 data.space+`
					        </td>
					      </tr>
					      <tr>
					        <th>선호 층수 : </th>
					        <td>`+
					       		data.floor+`
					        </td>
					      </tr>
					    </table>
					    <div>
					    	<button class="btn btn-secondary btn-sm" onclick="deleteInt();">아파트정보 삭제</button>
					    	<button class="btn btn-secondary btn-sm" onclick="modifyIntForm();">아파트정보 수정</button>
					    	<button class="btn btn-warning btn-sm" onclick="searchList();">추천 리스트 보기</button>
					    </div>
					   
					`);
			})
			.fail(function(){
				$("#interest").html(`
					<h5>등록된 정보가없습니다.</h5>
					<div>
						<button class="btn btn-secondary btn-sm" onclick="insertForm();">선호 정보 등록하기</button>
					</div>
				`);
			});
			
		}
	</script>
	<%@ include file="/WEB-INF/views/00.bs4_footer.jsp" %>
</body>
</html>