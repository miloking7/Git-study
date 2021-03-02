<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sjw.mybatisboard.dto.*"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>게시글작성</title>
</head>
<body>
	<%
		MyMember vo = (MyMember)session.getAttribute("joinVo");
	%>
	<div class="container">
		<h1 align="center">게시글작성하기</h1>
		<div align="right">
			<button type="button" class="btn btn-primary"
				onclick="location.href='main'">메인</button>
		</div>
		<hr>

		<table class="table table-bordered" width="500" cellpadding="0"
			cellspacing="0" border="1">
			<form action="write" method="post">
				<tr>
					<td>작성자아이디</td>
					<td><input type="text" class="form-control" name="bName"
						size="50" value=<%=vo.getId()%>></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" class="form-control" name="bTitle"
						size="50"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="bContent" class="form-control" rows="10"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" class="btn btn-primary"
						value="입력"> &nbsp;&nbsp; <a href="list"
						class="btn btn-primary">목록보기</a></td>
				</tr>
			</form>
		</table>
	</div>
</body>
</html>