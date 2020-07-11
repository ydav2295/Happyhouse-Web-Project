<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA게시판</title>
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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

</head>
<body>
	<%@ include file="/WEB-INF/views/00.bs4_header.jsp" %>
	<div class = "container">
		<div class="card my-4 row">
			<h2 class="card-header">QnA 게시판</h2>
			<div id="qnabody" class="card-body">
				<div >
					<select class="form-control" name="searchType" id="searchType">
						<option value="all">전체</option>
						<option value="qnaNo">질문 번호</option>
						<option value="qnaTitle">질문 제목</option>
						<option value="qnaContent">질문 내용</option>
						<option value="qnaUserid">질문자 아이디</option>
					</select> 
		      		<input type="text" id="title"" />
		      		<button class="btn btn-secondary btn-xs" onclick="findQnABoard();">검색</button>
		   		</div>
				<div id="index"></div>
			</div>
		</div>		
		<c:if test="${not empty loginMember}">
			<div class="text-right">
			      <button class="btn btn-secondary btn-xs" onclick="insertQuestionForm();">질문 등록</button>
		    </div>
		</c:if>
	</div>
	<%@ include file="/WEB-INF/views/00.bs4_footer.jsp" %>
	<script>
	function findQnABoard(){
		$.ajax({
			url:"api/qna/bean",
			type:"GET",
			data:{
				searchType:$("#searchType").val(),
				value:$("#title").val(),
			},
			dataType:"json",
		})
		.done(function(list){
			console.dir(list);
			if(list){
				$("#index").html(`
					    <div>
					      	<table id="qnalisttable" class="table">
						        <colgroup>
						          <col :style="{ width: '10%' }" />
						          <col :style="{ width: '50%' }" />
						          <col :style="{ width: '15%' }" />
						          <col :style="{ width: '25%' }" />
						        </colgroup>
						        <tr>
						          <th>질문번호</th>
						          <th>질문제목</th>
						          <th>질문자아이디</th>
						          <th>질문일시</th>
						          <th>답변</th>
						        </tr>						        
				       		</table>
					    </div>
					`);
				list.forEach(function(vo){
					$("#qnalisttable").append(`
							<tr id="\${vo.qnaNo}">
								<td>\${vo.qnaNo}</td>
								<td><a href="#" onclick="qnaDetail(\${vo.qnaNo});">\${vo.qnaTitle}</a></td>
								<td>\${vo.qnaUserid}</td>
								<td>\${vo.qnaDatetime}</td>
								<td class="check"></td>
							</tr>
						`);
					
					$.ajax({
						url:"api/reply/"+vo.qnaNo,
						type:"GET",
						dataType:"json",
					})
					.done(function(replyList){
						if(replyList.length){
							$(`#\${vo.qnaNo}>.check`).html(`<img src="image/check.png" width=20, height=20  alt="">`);
						}else{
							$(`#\${vo.qnaNo}>.check`).html("");
						}
					});
					
				});
			}
			else{
				$("#index").html(`
					<div v-else class="text-center">등록 질문이 없습니다.</div>	
			    `);
			}
		})
	}
	function moveReplyDelete(obj){
		console.dir(obj);
		$.ajax({
			url:"api/reply/"+obj.replyNo,
			type:"DELETE",
			dataType:"json",
		})
		moveList();
	}
	function modifyReply(obj){
		console.log(obj);
		$.ajax({
			url:"api/reply",
			type:"PUT",
			data:{
				replyContent:obj.replyContent,
				replyNo:obj.replyNo,
				replyTitle:obj.replyTitle
			},
			dataType:"json",
		})
		moveList();
	}
	function moveReplyModify(replyNo){
		console.dir(replyNo);
		$.ajax({
			url:"api/reply/detail/"+replyNo,
			type:"GET",
			dataType:"json",
		})
		.done(function(data){
			console.dir(data);
			$("#qnabody").html(`
					<div class="card my-4">
						<h5 class="card-header">답변 수정</h5>
						<div class="card-body" id="modifyReplyForm">
							<table class="table">
							  <tr>
						        <th>아이디</th>
						        <td><input class="form-control" type="text" id="replyUserid" value="\${data.replyUserid}" readonly/></td>
						      </tr>
							  <tr>
						        <th>질문제목</th>
						        <td><input class="form-control" type="text" id="replyTitle" value="\${data.replyTitle}" /></td>
						      </tr>
						      <tr>
						        <th>질문내용</th>
						        <td><textarea class="form-control" rows="3" cols="50" id="replyContent" ></textarea></td>
						      </tr>
						    </table>
		
						    <div class="text-right">
						      <button class="btn btn-secondary" onclick="modifyReply({qnaNo:\${data.qnaNo},replyNo:\${data.replyNo},replyTitle:$(replyTitle).val(),replyContent:$(replyContent).val()})">수정</button>
						      <button class="btn btn-secondary" onclick="moveList();;">목록</button>
						    </div>
						</div>
					</div>
					
			`);
			$("#replyContent").val(data.replyContent);
		});
	}
	function submitReply(obj){
		console.dir(obj);
		$.ajax({
			url:"api/reply",
			type:"POST",
			data:{
				qnaNo:obj.qnaNo,
				replyUserid:obj.replyUserid,
				replyTitle:obj.replyTitle,
				replyContent:obj.replyContent
			},
			dataType:"json",
		})
		moveList();
	}
	function moveInsertReplyForm(qnaNo){
		$("#qnabody").html(`
				<div class="card my-4">
					<h5 class="card-header">답변 등록</h5>
					<div class="card-body" id="insertQuestionForm">
						<table class="table">
						  <tr>
					        <th>답변자 아이디</th>
					        <td><input class="form-control" type="text" id="replyUserid" value="${loginMember.id}" readonly/></td>
					      </tr>
						  <tr>
					        <th>답변제목</th>
					        <td><input class="form-control" type="text" id="replyTitle" /></td>
					      </tr>
					      <tr>
					        <th>답변내용</th>
					        <td><textarea class="form-control" rows="3" cols="50" id="replyContent"></textarea></td>
					      </tr>
					    </table>
	
					    <div class="text-right">
					      <button class="btn btn-secondary" onclick="submitReply({qnaNo:\${qnaNo},replyUserid:$(replyUserid).val(),replyTitle:$(replyTitle).val(),replyContent:$(replyContent).val()})">등록</button>
					      <button class="btn btn-secondary" onclick="qnaDetail(\${qnaNo});">목록</button>
					    </div>
					</div>
				</div>
				
		`);
	}
	function moveDelete(qnaNo){
		console.log(qnaNo);
		$.ajax({
			url:"api/qna/"+qnaNo,
			type:"DELETE",
			dataType:"json",
		})
		moveList();
	}
	function modifyQuestion(obj){
		console.log(obj);
		$.ajax({
			url:"api/qna/"+obj.qnaNo,
			type:"PUT",
			data:{
				qnaNo:obj.qnaNo,
				qnaUserid:obj.qnaUserid,
				qnaTitle:obj.qnaTitle,
				qnaContent:obj.qnaContent
			},
			dataType:"json",
		})
		moveList();
	}
	function moveModify(qnaNo){
		$.ajax({
			url:"api/qna/"+qnaNo,
			type:"GET",
			dataType:"json",
		})
		.done(function(data){
			console.dir(data);
			$("#qnabody").html(`
					<div class="card my-4">
						<h5 class="card-header">질문 수정</h5>
						<div class="card-body" id="modifyQuestionForm">
							<table class="table">
							  <tr>
						        <th>아이디</th>
						        <td><input class="form-control" type="text" id="qnaUserid" value="\${data.qnaUserid}" readonly/></td>
						      </tr>
							  <tr>
						        <th>질문제목</th>
						        <td><input class="form-control" type="text" id="qnaTitle" value="\${data.qnaTitle}" /></td>
						      </tr>
						      <tr>
						        <th>질문내용</th>
						        <td><textarea class="form-control" rows="3" cols="50" id="qnaContent" ></textarea></td>
						      </tr>
						    </table>
		
						    <div class="text-right">
						      <button class="btn btn-secondary" onclick="modifyQuestion({qnaNo:\${data.qnaNo},qnaUserid:$(qnaUserid).val(),qnaTitle:$(qnaTitle).val(),qnaContent:$(qnaContent).val()})">수정</button>
						      <button class="btn btn-secondary" onclick="moveList();">목록</button>
						    </div>
						</div>
					</div>
					
			`);
			$("#qnaContent").val(data.qnaContent);
		});
	}
	function submitQuestion(obj){
		console.log(obj);
		$.ajax({
			url:"api/qna",
			type:"POST",
			data:{
				qnaUserid:obj.qnaUserid,
				qnaTitle:obj.qnaTitle,
				qnaContent:obj.qnaContent
			},
			dataType:"json",
		})
		moveList();
	}
	function insertQuestionForm(){
		$("#qnabody").html(`
				<div class="card my-4">
					<h5 class="card-header">질문 등록</h5>
					<div class="card-body" id="insertQuestionForm">
						<table class="table">
						  <tr>
					        <th>아이디</th>
					        <td><input class="form-control" type="text" id="qnaUserid" value="${loginMember.id}" readonly/></td>
					      </tr>
						  <tr>
					        <th>질문제목</th>
					        <td><input class="form-control" type="text" id="qnaTitle" /></td>
					      </tr>
					      <tr>
					        <th>질문내용</th>
					        <td><textarea class="form-control" rows="3" cols="50" id="qnaContent"></textarea></td>
					      </tr>
					    </table>
	
					    <div class="text-right">
					      <button class="btn btn-secondary" onclick="submitQuestion({qnaUserid:$(qnaUserid).val(),qnaTitle:$(qnaTitle).val(),qnaContent:$(qnaContent).val()})">등록</button>
					      <button class="btn btn-secondary" onclick="moveList();">목록</button>
					    </div>
					</div>
				</div>
				
		`);
	}	
	function moveList(){
			console.log("실행됨");
			location.href = "qnaindex";
		}
		function replydetail(replyNo){
			console.log("함수호출됨");
			$.ajax({
				url:"api/reply/detail/"+replyNo,
				type:"GET",
				dataType:"json",
			})
			.done(function(data){
				console.dir(data);
				$("#qnabody").html(`
						<div class="card my-4">
							<h2 class="card-header">답변 상세</h2>
							<div class="card-body" id="replydetail"></div>
						</div>
				`);
				$("#replydetail").html(`		
						<div>
					    <table class="table">
					      <tr>
					        <th>질문번호</th>
					        <td>\${data.qnaNo }</td>
					      </tr>
					      <tr>
					        <th>답변일시</th>
					        <td>\${data.replyDatetime }</td>
					      </tr>
					      <tr>
					        <th>답변자</th>
					        <td>\${ data.replyUserid }</td>
					      </tr>
					      <tr>
					        <th>답변제목</th>
					        <td>\${ data.replyTitle }</td>
					      </tr>
					      <tr>
					        <th>답변내용</th>
					        <td>\${ data.replyContent }</td>
					      </tr>
					    </table>
					    <div id = "replybutton">
					      <button class="btn btn-secondary btn-xs" onclick="qnaDetail(\${data.qnaNo});">목록</button>
					    </div>
					`); 
					      
					if('${loginMember.id}' == 'admin'){
						console.log("같다");
						$("#replybutton").append(`
								 <button class="btn btn-secondary btn-xs" onclick="moveReplyModify(\${data.replyNo });">수정</button>
							     <button class="btn btn-secondary btn-xs" onclick="moveReplyDelete({replyNo:\${data.replyNo},qnaNo:\${data.qnaNo}});">삭제</button>
						`);
					}
			})
		}
		function qnaDetail(qnaNo){
			$.ajax({
				url:"api/qna/"+qnaNo,
				type:"GET",
				dataType:"json",
			})
			.done(function(data){
				console.dir(data);
				let dataid = data.qnaUserid;
				$("#qnabody").html(`
						<div class="card my-4">
							<h2 class="card-header">질문 상세</h2>
							<div class="card-body" id="question"></div>
							<div class="card-body" id="replybody"></div>
						</div>
				`);
				$("#question").html(`		
						
						<div>
					    <table class="table">
					      <tr>
					        <th>질문번호</th>
					        <td>\${data.qnaNo }</td>
					      </tr>
					      <tr>
					        <th>질문일시</th>
					        <td>\${data.qnaDatetime }</td>
					      </tr>
					      <tr>
					        <th>질문제목</th>
					        <td>\${ data.qnaTitle }</td>
					      </tr>
					      <tr>
					        <th>질문내용</th>
					        <td>\${ data.qnaContent }</td>
					      </tr>
					      <tr>
					        <th>질문자아이디</th>
					        <td>\${ data.qnaUserid }</td>
					      </tr>
					    </table>
					    <div id="questionButton">
					      <button class="btn btn-secondary btn-xs" onclick="moveList();">목록</button>
					      </div>
					      `);
					if(dataid == '${loginMember.id}' || '${loginMember.id}' == 'admin'){
						console.log("같다");
						$("#questionButton").append(`
								 <button class="btn btn-secondary btn-xs" onclick="moveModify(\${data.qnaNo });">수정</button>
							     <button class="btn btn-secondary btn-xs" onclick="moveDelete(\${data.qnaNo});">삭제</button>
								`);
					}
					$("#question").append(`
				    
				    <div>
							<hr>
				    <c:if test="${not empty loginMember}">
						<c:if test='${loginMember.name eq "관리자"}'>
							<div>
							<br>
							<button class="btn btn-secondary btn-xs" onclick="moveInsertReplyForm(\${data.qnaNo});">답변등록</button>
							</div>
						</c:if>
					</c:if>
				    </div>
				  </div>
				`);
				$.ajax({
					url:"api/reply/"+qnaNo,
					type:"GET",
					dataType:"json",
				})
				.done(function(replyList){
						console.dir(replyList);
						if(replyList){
							$("#replybody").html(`
									<div class="card my-4">
										<h2 class="card-header">답변 리스트</h2>
										<div class="card-body" id="replyListBody"></div>
									</div>
							`);
							$("#replyListBody").html(`
									<table id="replyTable" class="table">
										<tr>
											<td>답변자</td>
											<td>답변제목</td>
											<td>답변일시</td>
										</tr>
									</table>
							`);
							replyList.forEach(function(vo){
								console.dir(vo);
								$("#replyTable").append(`
									<tr>
										<td>\${vo.replyUserid}</td>
										<td><a href="#" onclick="replydetail('\${vo.replyNo}');">\${vo.replyTitle}</a></td>
										<td>\${vo.replyDatetime}</td>
									</tr>
								`);
							});
						}else{
							$("#replyListBody").html(`<div>등록된 게시글이 없습니다</div>`)
						}
					});
					
				})
			
		}
		initlist();
		function getFormatDate(regtime) {
		      return moment(new Date(regtime)).format("YYYY.MM.DD");
	    };
		function initlist(){
			$.ajax({
				url:"api/qna",
				type:"GET",
			})
			.done(function(list){
				console.log(list);
				if(list){
					$("#index").html(`
						    <div>
						      	<table id="qnalisttable" class="table">
							        <colgroup>
							          <col :style="{ width: '10%' }" />
							          <col :style="{ width: '50%' }" />
							          <col :style="{ width: '15%' }" />
							          <col :style="{ width: '25%' }" />
							        </colgroup>
							        <tr>
							          <th>질문번호</th>
							          <th>질문제목</th>
							          <th>질문자아이디</th>
							          <th>질문일시</th>
							          <th>답변</th>
							        </tr>						        
					       		</table>
						    </div>
						`);
					list.forEach(function(vo){
						$("#qnalisttable").append(`
								<tr id="\${vo.qnaNo}">
									<td>\${vo.qnaNo}</td>
									<td><a href="#" onclick="qnaDetail(\${vo.qnaNo});">\${vo.qnaTitle}</a></td>
									<td>\${vo.qnaUserid}</td>
									<td>\${vo.qnaDatetime}</td>
									<td class="check"></td>
								</tr>
							`);
						
						$.ajax({
							url:"api/reply/"+vo.qnaNo,
							type:"GET",
							dataType:"json",
						})
						.done(function(replyList){
							if(replyList.length){
								$(`#\${vo.qnaNo}>.check`).html(`<img src="image/check.png" width=20, height=20  alt="">`);
							}else{
								$(`#\${vo.qnaNo}>.check`).html("");
							}
						});
						
					});
				}
				else{
					$("#index").html(`
						<div v-else class="text-center">등록 질문이 없습니다.</div>	
				    `);
				}
			});
			
		};
	</script>
</body>
</html>