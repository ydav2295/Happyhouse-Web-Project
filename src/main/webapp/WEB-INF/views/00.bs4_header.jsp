<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<style>
		.log{
			color:white;
		}
		.mp {
		  	 list-style:none;
		}
		.mp li {
			padding: 5px;
		}
		#index_header {
			background-image:
      		url("https://www.skittal.com/uploads/2018-02-19/banner/WEFMJZnZ0Gx9idyFLA6-_31XWeWrJtxg.png");
   			background-repeat: round;
   			background-size: 100% 100%;
		}
	</style>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
			<nav id="index_nav_login">
			<c:choose>
				<c:when test="${empty loginMember}">
					<div id="usercontroller">
					
					</div>
					<div id="loginform"></div>
				</c:when>
				<c:otherwise>				
						<ul class="mp navbar-nav ml-auto">
							<li class="float-left nav-item active"><a class="nav-link">${loginMember.id}(${loginMember.name})님 로그인 되었습니다.</a></li>
							<li class="float-right nav-item active" ><a class="nav-link" href="logout">로그아웃</a></li>
							<li class="float-right nav-item active"><a class="nav-link" href="memberinfo">회원정보</a></li>
							<li class="float-right nav-item active"><a class="nav-link" href="#" onclick="myzzim('${loginMember.id}')">찜 목록</a></li>
							
						</ul>
				</c:otherwise>
			</c:choose>
		</nav>
		    <div class="container">
		      <a class="navbar-brand" href="<c:url value="/main"/>">Happy House</a>
		      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
		        <span class="navbar-toggler-icon"></span>
		      </button>
		      <div class="collapse navbar-collapse" id="navbarResponsive">
		        <ul class="navbar-nav ml-auto">
		          <li class="nav-item">
		          	<a class="nav-link" href="<c:url value="/main"/>">Home</a>
		              <span class="sr-only">(current)</span>
		            
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="<c:url value="/list"/>">List</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="<c:url value="/noticelist"/>">Notice</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="<c:url value="/qnaindex"/>">QnA</a>
		          </li>
		        </ul>
		      </div>
		    </div>
		  </nav>
		<header id="index_header" class="jumbotron text-center mb-0">
			<h3>Happy House</h3> 
		</header>
		
		
		
		<!-- nav start -->
		 <script src="vendor/jquery/jquery.min.js"></script>
 		 <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script>
		function myzzim(id){
			console.dir(id);
			$.ajax({
				url:'favlist',
				type:"GET",
				data:{
					id:id,
				},
			})
			.done(function(data){
				if(data.length){
					console.dir(data.length);
					location.href="favlistmain";
				}else{
					alert("찜목록이 없습니다");
					location.href="memberinfo";
				}
			});
		}
		function init(){
			$("#usercontroller").html(`
				<ul class="mp navbar-nav ml-auto">
					<li class="float-right"><a class="p-1 nav-link" href="signupform">SignUp</a></li>
					<li class="float-right"><a class="p-1 nav-link" href="javascript:login()">Login</a></li>
				</ul>	
			`);
		}
		function login(){
			$("#loginform").html(`
				<form method="post" action="login">
					<table>
						<c:out value="${errMsg}" />
							<tr>
								<td class="log">아이디</td> <td><input type="text" name="id" /></td>
							</tr>
							<tr>
								<td class="log">암호</td> <td><input type="password" name="password" /></td>
							</tr>
							<tr>
							<td><button class="btn btn-secondary btn-xs">로그인</button></td>
							<td><input type="button" value="비밀번호 찾기" onClick="location.href='findpwdform'" class="btn btn-secondary btn-xs"></td>
						</tr>
					</table>
				</form>
			`);
		}
		init();
		</script>
		<!-- nav end -->
