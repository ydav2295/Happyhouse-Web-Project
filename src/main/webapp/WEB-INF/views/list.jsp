<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아파트 목록</title>
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
<style>
.outer {
	height: 25%;
	width: 80%;
	margin: 0px auto;
	padding: 5px;
	overflow: auto;
}

.left {
	background-color: #efefef;
	color: #000;
	height: 25%;
	width: 48%;
	float: left;
}

.right {
	background-color: #efefef;
	color: #000;
	height: 25%;
	width: 48%;
	float: right;
}

.wrapper {
	text-align: center;
	padding: 10px;
}

#resetButton {
	position: relative;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/00.bs4_header.jsp"%>
	<div class="container">
		<div>
			<div class="container">
				<div class="mt-2 mb-2"></div>
			</div>
		</div>
		<div>
			<form method="post" action="<c:url value="/list"/>">
				<select class="form-control" name="searchType">
					<option value="all">전체</option>
					<option value="dong">동 이름</option>
					<option value="aptName">아파트 이름</option>
				</select> <select class="form-control" name="sortType">
					<option value="none">없음</option>
					<option value="lowPrice">낮은 가격 순</option>
					<option value="highPrice">높은 가격 순</option>
				</select> <input class="form-control" type="text" name="searchWord" />
				<button class="btn btn-secondary btn-xs">검색</button>
			</form>
		</div>
		<br>
		<table class="table">
			<tr>
				<th>식별번호</th>
				<th>법정동</th>
				<th>아파트 이름</th>
				<th>거래 금액</th>
				<th>비교하기</th>
			</tr>
			<c:forEach var="houseDeal" items="${list}">
				<tr>
					<td>${houseDeal.no}</td>
					<td>${houseDeal.dong}</td>
					<td><a href="<c:url value="/detail?no=${houseDeal.no}"/>">${houseDeal.aptName}</a></td>
					<td>${houseDeal.dealAmount}</td>
					<td><button class="btn btn-default btn-xs" onclick="location.href=`compare?no=${houseDeal.no}`"><img src="image/compare.png" width=20, height=20 alt=""></button></td>
<%-- 					<td><a href="<c:url value="/compare?no=${houseDeal.no}"/>">비교하기</a></td> --%>
				</tr>
			</c:forEach>
		</table>

		<ul class="pagination justify-content-center mb-4">
			<c:choose>
				<c:when test="${bean.searchType == 'dong' }">
					<li class="page-item"><a class="page-link"
						href="<c:url value="/list?pageNo=1&searchWord=${bean.dong}&searchType=${bean.searchType}&sortType=${bean.sortType}"/>">처음페이지</a>
					</li>
				</c:when>
				<c:when test="${bean.searchType == 'aptName' }">
					<li class="page-item"><a class="page-link"
						href="<c:url value="/list?pageNo=1&searchWord=${bean.aptname}&searchType=${bean.searchType}&sortType=${bean.sortType}"/>">처음페이지</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="<c:url value="/list?pageNo=1&sortType=${bean.sortType}"/>">처음페이지</a>
					</li>
				</c:otherwise>
			</c:choose>
			<c:if test="${bean.pageNo >= 10}">
				<c:choose>
					<c:when test="${bean.searchType == 'dong' }">
						<li class="page-item"><a class="page-link"
							href="<c:url value="/list?pageNo=${prevIdx}&searchWord=${bean.dong}&searchType=${bean.searchType}&sortType=${bean.sortType}"/>">이전</a>
						</li>
					</c:when>
					<c:when test="${bean.searchType == 'aptName' }">
						<li class="page-item"><a class="page-link"
							href="<c:url value="/list?pageNo=${prevIdx}&searchWord=${bean.aptname}&searchType=${bean.searchType}&sortType=${bean.sortType}"/>">이전</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="<c:url value="/list?pageNo=${prevIdx}&sortType=${bean.sortType}"/>">이전</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:if>
			<c:forEach var="idx" items="${idxlist}">
				<c:choose>
					<c:when test="${bean.searchType == 'dong' }">
						<li class="page-item"><a class="page-link"
							href="<c:url value="/list?pageNo=${idx}&searchWord=${bean.dong}&searchType=${bean.searchType}&sortType=${bean.sortType}"/>">${idx}</a>
						</li>
					</c:when>
					<c:when test="${bean.searchType == 'aptName' }">
						<li class="page-item"><a class="page-link"
							href="<c:url value="/list?pageNo=${idx}&searchWord=${bean.aptname}&searchType=${bean.searchType}&sortType=${bean.sortType}"/>">${idx}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="<c:url value="/list?pageNo=${idx}&sortType=${bean.sortType}"/>">${idx}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${bean.pageNo < lastPage}">
				<c:choose>
					<c:when test="${bean.searchType == 'dong' }">
						<li class="page-item"><a class="page-link"
							href="<c:url value="/list?pageNo=${nextIdx}&searchWord=${bean.dong}&searchType=${bean.searchType}&sortType=${bean.sortType}"/>">다음</a>
						</li>
					</c:when>
					<c:when test="${bean.searchType == 'aptName' }">
						<li class="page-item"><a class="page-link"
							href="<c:url value="/list?pageNo=${nextIdx}&searchWord=${bean.aptname}&searchType=${bean.searchType}&sortType=${bean.sortType}"/>">다음</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="<c:url value="/list?pageNo=${nextIdx}&sortType=${bean.sortType}"/>">다음</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:if>
			<c:choose>
				<c:when test="${bean.searchType == 'dong' }">
					<li class="page-item"><a class="page-link"
						href="<c:url value="/list?pageNo=${lastIdx}&searchWord=${bean.dong}&searchType=${bean.searchType}&sortType=${bean.sortType}"/>">마지막</a>
					</li>
				</c:when>
				<c:when test="${bean.searchType == 'aptName' }">
					<li class="page-item"><a class="page-link"
						href="<c:url value="/list?pageNo=${lastIdx}&searchWord=${bean.aptname}&searchType=${bean.searchType}&sortType=${bean.sortType}"/>">마지막</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="<c:url value="/list?pageNo=${lastIdx}&sortType=${bean.sortType}"/>">마지막</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>


		<c:if test="${not empty cmp1}">

			<div class="card my-4">
				<h3 align="center" class="card-header">비교하기</h3>
				<div class="card-body outer">
					<div class="left">
						<div>
							<h5>${cmp1.aptName}</h5>
							<br>
							<table class="table">
								<tr>
									<th>법정동</th>
									<td>${cmp1.dong}</td>
								</tr>
								<tr>
									<th>거래 금액</th>
									<td>${cmp1.dealAmount}만원</td>
								</tr>
								<tr>
									<th>건축 년도</th>
									<td>${cmp1.buildYear}</td>
								</tr>
								<tr>
									<th>면적</th>
									<td>${cmp1.area}</td>
								</tr>
								<tr>
									<th>층</th>
									<td>${cmp1.floor}</td>
								</tr>
							</table>
						</div>
					</div>

					<div class="right">
						<c:if test="${empty cmp2 }">
							<div>
								<h5>-</h5>
								<br>
								<table class="table">
									<tr>
										<th>법정동</th>
									</tr>
									<tr>
										<th>거래 금액</th>
									</tr>
									<tr>
										<th>건축 년도</th>
									</tr>
									<tr>
										<th>면적</th>
									</tr>
									<tr>
										<th>층</th>
									</tr>
								</table>
							</div>
						</c:if>
						<c:if test="${not empty cmp2 }">
							<div>
								<h5>${cmp2.aptName}</h5>
								<br>
								<table class="table">
									<tr>
										<th>법정동</th>
										<td>${cmp2.dong}</td>
									</tr>
									<tr>
										<th>거래 금액</th>
										<td>${cmp2.dealAmount}만원</td>
									</tr>
									<tr>
										<th>건축 년도</th>
										<td>${cmp2.buildYear}</td>
									</tr>
									<tr>
										<th>면적</th>
										<td>${cmp2.area}</td>
									</tr>
									<tr>
										<th>층</th>
										<td>${cmp2.floor}</td>
									</tr>
								</table>
							</div>
						</c:if>
					</div>
				</div>
			</div>

			<div class="wrapper">
				<input type="button" value="비교 끝내기"
					onClick="location.href='resetCompare'" class="btn btn-secondary"
					id="resetButton">
			</div>
		</c:if>

	</div>
	<%@ include file="/WEB-INF/views/00.bs4_footer.jsp"%>
</body>
</html>