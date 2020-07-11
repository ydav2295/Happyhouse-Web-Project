<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
		<%@ include file="/WEB-INF/views/00.bs4_header.jsp" %>
	<div class="container">
		<div>
			<div class="container">
				<div class="mt-2 mb-2">
					<div class="card my-4 ">
						<div>${errMsg}</div>
						<h3 class="card-header">비밀번호 찾기</h3>
						<div class="card-body">
							<div>
								<form method="post" action="setnewpwd">
									<h5 class="card-title">새로운 비밀번호*</h5>
									<div class="card-text">
										<input class="form-control" type="password" name="pw1" />
									</div>
									<h5 class="card-title">비밀번호 확인*</h5>
									<div class="card-text">
										<input class="form-control" type="password" name="pw2" />
									</div>
									<div>
										<button class="btn btn-secondary btn-xs">비밀번호 설정</button>
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