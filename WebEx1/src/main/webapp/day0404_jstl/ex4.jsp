<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	div.box{
		float: left;
		width:50px;
		height:50px;
		margin-right: 5px;
		border: 1px solid black;
		color: white;
	}
</style>
</head>
<body>
	<c:set var="colors" value="red,orange,green,blue,purple"/>
	<h4>${colors}</h4>
	<c:forTokens var="a" items="${colors}" delims=",">
		<div class="box" style="background-color: ${a}">${a}</div>
	</c:forTokens>
	<br><br>
	<hr>
	
	<h5 style="clear: both;">숫자, 날짜 포맷 양식</h5>
	<c:set var="today" value="<%=new Date() %>"/>
	<c:set var="money" value="1234567"/>
	<c:set var="num1" value="23.12345678"/>
	<c:set var="num2" value="0.8"/>
	
	${today}
	<hr>
	
	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/><br>
	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm"/><br>
	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd a hh:mm"/><br>
	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd EEEE"/><br>
	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd EEE"/><br>
	<fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일 EEEE"/><br>
	<hr>
	
	${money}<br>
	${num1}<br>
	<hr>
	type number: <fmt:formatNumber value="${money}" type="number"/><br> <!-- , 추가 -->
	type currency: <fmt:formatNumber value="${money}" type="currency"/><br> <!-- , 화폐 단위 추가 -->
	type currency symbol: <fmt:formatNumber value="${money}" type="currency" currencySymbol="$"/><br>
	<hr>																			<!-- , 화폐 단위 추가 -->
	
	<fmt:formatNumber value="${num1 }" pattern="0.00"/><br>
	<fmt:formatNumber value="${num2 }" pattern="0.00"/><br>
	<fmt:formatNumber value="${money}" pattern="#,##0"/><br> <!-- 3자리 마다 , 추가  -->
	
	
</body>
</html>