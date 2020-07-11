<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
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
	<%@ include file="/WEB-INF/views/00.bs4_header.jsp"%>
	<div class="container">
		<div>
			<div class="container">
				<div class="mt-2 mb-2">
					<div class="card my-4">
						<h5 class="card-header">공지사항</h5>
						<div class="card-body">
							<div class=row>
								<form method="post" action="<c:url value="/noticelist"/>">

									<select class="form-control" name="searchType">
										<option value="all">전체</option>
										<option value="subject">제목</option>
										<option value="content">내용</option>
									</select> <input type="text" name="searchWord" />
									<button class="btn btn-secondary btn-xs">검색</button>
								</form>
							</div>
							<div class=row>
								<c:if test="${not empty loginMember}">
									<c:if test='${loginMember.name eq "관리자"}'>
										<button class="btn btn-secondary btn-xs"
											onclick="location.href='writeNotice'">글쓰기</button>
									</c:if>
								</c:if>
							</div>
							<br>
							<table class="table">
								<tr>
									<th>글번호</th>
									<th>제목</th>
									<th></th>
								</tr>
								<c:forEach var="notice" items="${noticeList}">
									<tr>
										<td>${notice.noticeno}</td>
										<td>${notice.subject}</td>
										<td><a
											href="<c:url value="noticedetail?no=${notice.noticeno}"/>">조회</a></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>

				</div>
			</div>
		</div>


	</div>
	<%@ include file="/WEB-INF/views/00.bs4_footer.jsp"%>
</body>
</html>