<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래정보 - 상세정보</title>
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
		<br>
		<h3>${deal.aptName} 거래 정보</h3>
		<br>
		<table class="table">
			<tr>
				<th>식별 번호</th>
				<td>${deal.no}</td>
			</tr>
			<tr>
				<th>법정동</th>
				<td>${deal.dong}</td>
			</tr>
			<tr>
				<th>지번</th>
				<td>${deal.jibun}</td>
			</tr>
			<tr>
				<th>아파트 이름</th>
				<td>${deal.aptName}</td>
			</tr>
			<tr>
				<th>거래 금액</th>
				<td>${deal.dealAmount}만원</td>
			</tr>
			<tr>
				<th>건축 년도</th>
				<td>${deal.buildYear}</td>
			</tr>
			<tr>
				<th>등록 일자</th>
				<td>${deal.dealYear}년 ${deal.dealMonth}월 ${deal.dealDay}일</td>
			</tr>
			<tr>
				<th>면적</th>
				<td>${deal.area}</td>
			</tr>
			<tr>
				<th>층</th>
				<td>${deal.floor}</td>
			</tr>
			<tr>
				<th>전월세 가격</th>
				<td>${deal.rentMoney}</td>
			</tr>
		</table>
		</div>
		<div>
			<a href="<c:url value="/list?pageNo=1"/>">목록</a>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/00.bs4_footer.jsp" %>
</body>
</html>