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

<title>댓글작성</title>
</head>
<body>
	<%@include file="Top.jsp"%>
	<h1 align="center">댓글달기</h1>
	<div align="right">
		<button type="button" class="btn btn-primary"
			onclick="location.href='main'">메인</button>
	</div>

	<%
		MyMember vo = (MyMember) session.getAttribute("joinVo");
		System.out.println(vo.getId());
	%>
	<div class="container">
		<table width="500" class="table table-bordered" cellpadding="0" cellspacing="0" border="1">
			<form action="reply" method="post">
				<input type="hidden" name="bId" value="${reply_view.bId}"> 
				<input type="hidden" name="bGroup" value="${reply_view.bGroup}"> 
				<input type="hidden" name="bStep" value="${reply_view.bStep}"> 
				<input type="hidden" name="bIndent" value="${reply_view.bIndent}">
				<input type="hidden" name="bName" value=<%=vo.getId() %>>
				<tr>
					<td>번호</td>
					<td>${reply_view.bId}</td>
				</tr>
				<tr>
					<td>히트</td>
					<td>${reply_view.bHit}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><%=vo.getId() %></td>
				</tr>
			
				
				<tr>
					<td>제목</td>
					<td><input type="text" class="form-control" name="bTitle"
						value="${reply_view.bTitle}"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="10" class="form-control" name="bContent">${reply_view.bContent}</textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input class="btn btn-primary" type="submit" value="답변"> <a class="btn btn-primary"
						href="list">목록</a></td>
				</tr>
			</form>
		</table>
	</div>
</body>
</html>