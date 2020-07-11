<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/blog-home.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/views/00.bs4_header.jsp" %>
		<div>
			<div class="container">
				<div class="mt-2 mb-2">
					<div class="card my-4 ">
						<h3 class="card-header">공지사항 등록</h3>
						<div class="card-body">
							<div>
								<form method="post" action="insertNotice">
									<h5 class="card-title">관리자이름</h5>
									<div class="card-text">
										<input class="form-control" name="adminid" value="관리자" readonly />
									</div>
									<h5 class="card-title">제목*</h5>
									<div class="card-text">
										<input class="form-control" type="text" name="subject" />
									</div>
									<h5 class="card-title">내용*</h5>
									<div class="card-text">
										<textarea class="form-control" rows="3" cols="50" name="content" ></textarea>
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
		</div>
		<div>
		</div>
	</div>
		<%@ include file="/WEB-INF/views/00.bs4_footer.jsp" %>
</body>
</html>