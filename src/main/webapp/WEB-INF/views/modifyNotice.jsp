<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/views/00.bs4_header.jsp" %>
		<div>
			<div class="container">
				<div class="mt-2 mb-2">
					
					<div class="card my-4">
						<h5 class="card-header">공지사항 수정</h5>
						<div class="card-body">
							<div >
								<form method="post" action="updateNotice">
									<input class="form-control" type="hidden" name="noticeno" value="${notice.noticeno}" />
									<table class="table">
										<tr>
											<th>관리자이름</th>
											<td><input class="form-control" type="text" name="adminid" value="관리자" readonly/></td>
										</tr>
										<tr>
											<th>제목</th>
											<td><input class="form-control" type="text" name="subject" value="${notice.subject}"/></td>
										</tr>
										<tr>
											<th>내용</th>
											<td><textarea class="form-control" rows="3" cols="30" name="content" >${notice.content}</textarea></td>
										</tr>
									</table>
									<div><button class="btn btn-secondary btn-xs" >수정</button></div>
								</form>
							</div>
						</div>
					</div>				
				
				</div>
			</div>
		</div>
	</div>
		<%@ include file="/WEB-INF/views/00.bs4_footer.jsp" %>
</body>
</html>