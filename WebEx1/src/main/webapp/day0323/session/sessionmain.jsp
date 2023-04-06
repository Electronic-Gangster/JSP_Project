<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style type="text/css">
	body, body *{
		font-family: 'Jua'
	}
</style>
</head>
<body>
<!-- 로그인 상태인지 확인 후 로그인 또는 로그아웃 페이지를 include 하면 된다. -->
<%
	String loginstate=(String)session.getAttribute("loginstate");

	if(loginstate==null){%>
		<jsp:include page="sessionlogin.jsp"/>
	<%}else{%>
		<jsp:include page="sessionlogout.jsp"/>
	<%}
%>
<hr>
<a href="successpage.jsp">역대 대통령 보러 가기</a>
</body>
</html>