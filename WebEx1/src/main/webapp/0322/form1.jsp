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
	<h4 class="alert alert-info">get 방식의 폼태그 전송</h4>
	<form action="action1.jsp" method="get"> <!-- 메서드 생략시 기본값이 get -->
		<b>이름 : </b>
		<input type="text" name="irum">
		<br>
		<b>나이 : </b>
		<input type="text" name="nai">
		<br>
			<button type="submit">서버에 전송</button>
	</form>
</body>
</html>