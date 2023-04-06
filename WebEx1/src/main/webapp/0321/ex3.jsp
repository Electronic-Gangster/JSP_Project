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
	<!-- 1. 배열을 이용한 표 만들 -->
	<%
		String []colors={"red","orange","yellow","green","blue","purple"};
	%>
	<table class="table table-boredered" style="width: 200px">
		<tr bgcolor="lightgray">
			<th>번호</th>
			<th>색상</th>
		</tr>
		<%
		for(int i=0; i<colors.length; i++)
		{%> 
			<tr>
				<td align="center"><%=i+1%></td>
				<td style="background-color:<%=colors[i]%>"><%=colors[i]%></td>
			</tr>
		<%}
		%>
	</table>
	<hr>
	<!-- 2. 가로 표 만들 -->
	<table class="table table-bordered" style="width:480px">
		<tr>
		<%
		for(String s:colors)
		{%>
			<td style="background-color:<%=s%>"><%=s%></td>
		<%} 
		%>
		</tr>
	</table>
</body>
</html>





