<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="Top.jsp"%>
<h1>메뉴얼을 작성하세요.(제품소프트웨어패키징 과제부분)</h1>
<div align="right">
		<button type="button" onclick="location.href='main'">메인</button>
	</div>
<hr>

<h2>메인로고</h2>
<img src="<spring:url value ='/resources/img/LOGOBIG.png'/>" height="100%" alt="메인이미지"> 
<h2>시스템 전체 기능 구성</h2>
<img src="<spring:url value ='/resources/img/layout.png'/>" height="100%" alt="시스템레이아웃"> 
</body>
</html>