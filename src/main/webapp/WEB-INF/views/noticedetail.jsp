<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 - 상세정보</title>
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
					<div class="card my-4 ">
						<h3 class="card-header">공지사항 상세</h3>
						<div class="card-body">
							<div>
								<form method="post" action="insertNotice">
									<table class="table">
										<tr>
											<th>제목</th>
											<td>${notice.subject}</td>
										</tr>
										<tr>
											<th>작성자</th>
											<td>${notice.adminid}</td>
										</tr>
										<tr>
											<th>내용</th>
											<td>${notice.content}</td>
										</tr>
									</table>

									<div>
										<c:if test="${not empty loginMember}">
											<c:if test='${loginMember.name eq "관리자"}'>
												<div>
													<a href="modifyNotice?no=${notice.noticeno}">수정</a> <a
														href="deleteNotice?no=${notice.noticeno}">삭제</a>
												</div>
											</c:if>
										</c:if>
										<div class="text-right">
											<a href="noticelist">목록</a>
<!-- 											<button class="btn btn-secondary btn-xs" -->
<!-- 												onclick="#">확인</button> -->
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/00.bs4_footer.jsp"%>
</body>
</html>