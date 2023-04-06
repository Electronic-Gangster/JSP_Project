<%@page import="java.util.Date"%>
<%@page import="study.dto.PersonDto"%>
<%@page import="java.util.List"%>
<%@page import="study.dao.PersonDao"%>
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
	div.box{
		width: 40px;
		height: 40px;
		border: 1px solid black;
		border-radius: 100px;
	}
	table thead tr{
	background-color: #ffc;
	}
</style>
</head>
<%
	PersonDao dao=new PersonDao();
	List<PersonDto> list=dao.getAllPersons();
	Date date=new Date();
	int currYear=date.getYear()+1900; //현재 연
%>
<body>
<table class="table table-bordered" style="width:400px">
	<caption align="top">
		<h4 class="alert alert-danger">Mysql Person 직원</h4>
	</caption>
		<%
		for(PersonDto dto:list)
		{
			//나이
			int age=currYear-dto.getBirthyear();
			//띠
			int m=dto.getBirthyear()%12;
			String ddi=m==0?"원숭이":m==1?"닭":m==2?"개":m==3?"돼지":m==4?"쥐":
				m==5?"소":m==6?"호랑이":m==7?"토끼":m==8?"용":m==9?"뱀":m==10?"말":"양";
			%>
			<tr>
				<td align="center">
					<img src="../image/moviestar/<%=dto.getPhoto() %>"
					 class="img=tumbnail" width="150" height="200">
				</td>
				<td valign="middle">
					이름 : <%=dto.getName() %><br>
					<%=dto.getBirthyear() %>년 생 (<%=age%>세,<%=ddi %>)<br>
					주소 : <%=dto.getAddress() %>
					직업 : <%=dto.getJob() %>
				</td>
			</tr>
		<%} 
		%>
	</table>
</body>
</html>