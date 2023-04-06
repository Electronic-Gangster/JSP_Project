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
button.btn {
      width: 100px;
      height: 40px;
      position: absolute;
      right: 20%;
      top: 5.2%;
      opacity: 1;
      font-size: 14px;
    }

</style>
</head>
<body>
	<%
		//세션에 저장되어 있는 아이디를 얻는다
		String loginid=(String)session.getAttribute("loginid");
	%>
	<button type="button" class="btn btn-danger" onclick="location.href='pptlogoutaction.jsp'">
 	 <span class="spinner-border spinner-border-sm"></span>
 	 	Login..
	 </button>
	
	
	<!-- <div><button type="button" class="btn btn-danger btn-sm"
		onclick="location.href='pptlogoutaction.jsp'"><span class="spinner-grow spinner-grow-sm">로그아웃</span>
		</button></div> -->

</body>
</html>