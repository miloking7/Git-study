<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sjw.mybatisboard.dto.*"%>
<%@ page import="com.sjw.mybatisboard.dao.*"%>
<%@ page import="com.sjw.mybatisboard.service.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 
<dialog id="favDialog">
  <form method="dialog">
    <p><label>좋아하는 동물:
      <select>
        <option></option>
        <option>아르테미아</option>
        <option>레서판다</option>
        <option>거미원숭이</option>
      </select>
    </label></p>
    <menu>
      <button value="cancel">취소</button>
      <button id="confirmBtn" value="default">확인</button>
    </menu>
  </form>
</dialog>
 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="Top.jsp"%>
	<%
	MyMember vo = (MyMember) session.getAttribute("joinVo");
	if(vo==null){
		%>
		<!-- <dialog open>
  			<p>여러분 안녕하세요! 로그인 하시고 들어 가시면 됩니다. </p>
		</dialog>
		-->
		<script>
		alert('로그인 하세요');
		document.location.href="main";
		</script>
		<!-- 
			var favDialog = document.getElementById('favDialog');
			favDialog.showModal();
		-->
		<%
		//response.sendRedirect((String)session.getAttribute("mainpage"));
	}else{
	String pageNumberStr = request.getParameter("xpage");
	BListService service = new BListService();
	//BDao dao = sqlSession.getMapper(BDao.class);
	//BDao dao = new BDao();
	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}
	MessageListView viewData = service.getMessageListView(pageNumber);
	int totalPages = viewData.getPageTotalCount();
	if (pageNumberStr == null)
		pageNumberStr = "1";

	out.println(pageNumberStr + "/" + totalPages);
	List<BDto> subList = viewData.getMessageList();
	 %>
	<div class="container">
	<h1 align="center">
		Spring Mybatis MVC Board(접속자:<%=vo.getId()%>)
	</h1>
	<div align="right">
		<button type="button" class = "btn btn-primary" onclick="location.href='main'">메인</button>
		<a class = "btn btn-primary" href="write_view">글작성</a>
	</div>
	<hr>
	<table class='table table-striped'>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>제목</th>
			<th>날짜</th>
			<th>히트</th>
		</tr>
		<!-- Model.setAttribute("list",dtos)로 서비스에서 등록한 내용을 읽어 뿌려준다. -->
		<!-- 롬복을 사용하면 bId ==> BId, bName ==>BName 등으로 고쳐줘야 한다. 황당함  -->
		<c:forEach items="<%=subList%>" var="dto">
			<tr>

				<td>${dto.bId}</td>
				<td>${dto.bName}</td>
				<td><c:forEach begin="1" end="${dto.bIndent}">-</c:forEach> <a
					href="content_view?bId=${dto.bId}">${dto.bTitle}</a></td>
				<td>${dto.bDate}</td>
				<td>${dto.bHit}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
			<button type="button" class = "btn btn-primary" onclick="location.href='main'">메인</button>
			<a class = "btn btn-primary" href="write_view">글작성</a>
			</td>
		</tr>
	</table>
	<div align="center">
		<%
			for (int i = 1; i <= viewData.getPageTotalCount(); i++) {
		%>
		<a href="list?xpage=<%=i%>">[<%=i%>]
		</a>
		<%
			}
		%>
		<hr>
		<h3>비젼직업전문학교 인공지능과정</h3>
		(2020.10.16~2020.04.26)
	</div>
	<%} %>
	</div>
</body>
</html>