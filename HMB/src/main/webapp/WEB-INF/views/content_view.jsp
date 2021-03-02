<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sjw.mybatisboard.dto.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<title>게시글작성</title>
</head>
<body>
	<%@include file="Top.jsp"%>
	<%
		String connector = ((MyMember) (session.getAttribute("joinVo"))).getId();
		String contentAuthor = ((BDto) (request.getAttribute("content_view"))).getbName();
	%>

	<h1 align="center">게시글상세보기</h1>
	<div align="right">
		<button type="button" class="btn btn-primary"
			onclick="location.href='main'">메인</button>
	</div>
	<hr>
	<div class="container">
		<table class="table table-bordered" width="500" cellpadding="0"
			cellspacing="0" border="1">
			<form action="modify" method="post">
				<input type="hidden" name="bId" value="${content_view.bId}">
				<tr>
					<td>번호</td>
					<td>${content_view.bId}</td>
				</tr>
				<tr>
					<td>히트</td>
					<td>${content_view.bHit}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" class="form-control" name="bName"
						value="${content_view.bName}"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" class="form-control" name="bTitle"
						value="${content_view.bTitle}"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea class="form-control" rows="10" name="bContent">${content_view.bContent}</textarea></td>
				</tr>
				<tr>
					<td colspan="2">
					<a class="btn btn-primary" href="list">목록</a>
					<a class="btn btn-primary" href="reply_view?bId=${content_view.bId}">답변</a> 
					<%
 	   					if (connector.equals(contentAuthor)) {
 					%> 
 					<a class="btn btn-primary" href="delete?bId=${content_view.bId}">삭제</a>
 					<input type="submit" class="btn btn-danger" value="수정">
 					<%
 					}
 					%></td>
				</tr>
			</form>
		</table>
	</div>

</body>
</html>