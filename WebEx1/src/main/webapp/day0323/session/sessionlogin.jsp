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
	String chksave=(String)session.getAttribute("chksave");
	String loginid=(String)session.getAttribute("loginid");
	boolean b;
	//chksave가 한번도 세션에 저장된 적이 없는 경우는 null 값이 나오고,
	//한번이라도 체크후 로그인을 했다면, yes or no
	if(chksave==null || chksave.equals("no")){
		b=false;
		loginid="";	//체크를 안했을 경우 세션으로부터 얻은 아이디를 지운다.
		
	}else
		b=true;
%>
<body>
	<div style="marign: 100px 100px">
		<form action="loginaction.jsp" method="post">
			<table class="table table-bordered" style="width: 300px">
				<tr>
					<td colspan="2" align="center">
					<label>
					<!-- 체크 후 로그인을 했을 경우 b가 true 값이므로 체크속성 추가 -->
					<input type="checkbox" name="chksave" <%=b?"checked":"" %>>아이디 저장</label>
					</td>
				</tr>
				<tr>
					<th bgcolor="lightgray" width="100">아이디</th>
					<td>
						<input type="text" name="id" class="form-control" value="<%=loginid%>">
					</td>
				</tr>
				<tr>
					<th bgcolor="lightgray" width="100">비밀번호</th>
					<td>
						<input type="password" name="pass" class="form-control">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-secondary">세션 로그인</button>
					</td>
				</tr>
			</table>		
		</form>
	</div>
</body>
</html>