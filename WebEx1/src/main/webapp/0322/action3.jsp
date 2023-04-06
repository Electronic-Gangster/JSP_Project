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
<%
	//1. post 방식의 경우 데이터를 읽기전에 엔코딩 코드를 넣어준다
	request.setCharacterEncoding("utf-8");
	String sname=request.getParameter("sname");
	String gender=request.getParameter("gender");
	String []hobbys=request.getParameterValues("hobby");
	String email=request.getParameter("email");
	String email2=request.getParameter("email2");

%>
<body>
	<h4>
		사원명 : <%=sname %><br>
		성별 : <%=gender %><br>
		취미 :
		<%
		if(hobbys==null)
		{%>
			<b>취미가 없는 일 중독자!</b>
		<%}else{%>
			취미는
			<%for(String s:hobbys){%>
				 <%=s %> 입니다.
			<%}%>
		<%}%>
		<br>
		이메일 주소 : <%=email %> @ <%=email2 %>
	
	
	
	
	</h4>
</body>
</html>