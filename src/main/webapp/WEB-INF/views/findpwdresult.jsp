<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
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
		<h2>비밀번호 찾기</h2>
		<c:choose>
			<c:when test="${not empty memberInfo}">
				<c:redirect url="setnewpwdform"></c:redirect>
			</c:when>
			<c:otherwise>
				<h3>${errMsg}</h3>
				<a href="findpwdform">비밀번호 찾기</a>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
		<%@ include file="/WEB-INF/views/00.bs4_footer.jsp" %>
	
</body>
</html>