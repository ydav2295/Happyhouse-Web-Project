<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/views/00.bs4_header.jsp" %>
		<div>
			<div class="container">
				<div class="mt-2 mb-2">
				
				
				</div>
			</div>
		</div>
		<div>
			<div class="card my-4">
				<h3 class="card-header">회원 정보 수정</h3>
				<div class="card-body">
					<div>
						<form method="post" action="updatemember">
							<table class="table">
								<tr>
									<th>아이디*</th>
									<td><input class="form-control" type="text" name="id" value="${loginMember.id}" readonly/></td>
								</tr>
								<tr>
									<th>비밀번호*</th>
									<td><input class="form-control" type="password" name="password" value="${loginMember.password}"/></td>
								</tr>
								<tr>
									<th>이름*</th>
									<td><input class="form-control" type="text" name="name" value="${loginMember.name}"/></td>
								</tr>
								<tr>
									<th>주소*</th>
									<td><input class="form-control" type="text" name="address" value="${loginMember.address}"/></td>
								</tr>
								<tr>
									<th>전화번호*</th>
									<td><input class="form-control" type="text" name="phone" value="${loginMember.phone}"/></td>
								</tr>
							</table>
							<div><button class="btn btn-secondary btn-xs" type="submit">수정</button></div>
						</form>
					</div>
				</div>
			</div>	
		</div>
	</div>
		<%@ include file="/WEB-INF/views/00.bs4_footer.jsp" %>
</body>
</html>