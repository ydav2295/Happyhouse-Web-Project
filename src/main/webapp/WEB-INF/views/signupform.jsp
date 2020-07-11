<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	 <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/blog-home.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
		<%@ include file="/WEB-INF/views/00.bs4_header.jsp" %>
	<div class="container">
		<div>
			<div class="container">
				<div class="mt-2 mb-2">
				
				
				</div>
			</div>
		</div>
		<div>
			<div class="card my-4 " >
				<h3 class="card-header">회원가입</h3>
				<div class="card-body">
					<div>
						<form method="post" action="signup">
							<h5 class="card-title">아이디*</h5>
							<div class="card-text">
								<input class="form-control" type="text" name="id" />
							</div>
							<h5 class="card-title">비밀번호*</h5>
							<div class="card-text">
								<input class="form-control" type="password" name="password" />
							</div>
							<h5 class="card-title">이름*</h5>
							<div class="card-text">
								<input class="form-control" type="text" name="name" />
							</div>
							<h5 class="card-title">주소*</h5>
							<div class="card-text">
								<input class="form-control" type="text" name="address" />
							</div>
							<h5 class="card-title">전화번호*</h5>
							<div class="card-text">
								<input class="form-control" type="text" name="phone" />
							</div>
							<div>
								<button class="btn btn-secondary btn-xs">등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			
			
		</div>
	</div>
		<%@ include file="/WEB-INF/views/00.bs4_footer.jsp" %>
</body>
</html>