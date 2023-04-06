<%@page import="java.util.Date"%>
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
<h4 class="alert alert-info" style="width:300px">역대 대통령 모음집</h4>
	<form action="peopleaction.jsp" method="post">
		<table class="table table-bordered" style="width:300px">
			<tr>
				<th bgcolor="skyblue" width="100">이름</th>
				<td>
					<input type="text" name="name" required="required" class="form-control">
				</td>
			</tr>
			<tr>
				<th bgcolor="skyblue" width="100">태어난 연도</th>
				<td>
					<select class="form-select" name="birthyear">
					<%
						// * 현재 연도 구하는 방법 *
						Date date=new Date();
						int currYear=date.getYear()+1900;
						
						for(int i=currYear; i>=1940; i--)
						{%>
							<option value="<%=i%>"><%=i %> 년 생</option>
						<%}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<th bgcolor="skyblue" width="100">주소</th>
				<td>
					<input type="text" name="address" class="form-control">
				</td>
			</tr>
			<tr>
				<th bgcolor="skyblue" width="100">생사 유무</th>
				<td>
					<select class="form-select" name="life">
					<%
						String []life={"생존","사망"};
						
						for(String j:life)
						{%>
							<option value="<%=j%>"><%=j%></option>	
						<%}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<th bgcolor="skyblue" width="100">사진</th>
				<td>
					<div class="input-group">
						<select class="form-select" name="photo" id="photo">
							<%
							for(int i=1; i<=13; i++)
							{%>
								<option value="<%=i%>.jpg"><%=i%>번 사진</option>	
							<%}
							%>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-info">서버에 전송</button>
				</td>
			</tr>
		</table>
	</form>
	<!-- 선택 사진 영역 -->
	<img src="../image/people/1.jpg" id="photoview" width="200" border="1"
	style="position: absoulte; left:403px top:100px">
	<!-- 자바스크립트 영역 -->
	<script type="text/javascript">
		//1. 사진을 선택하면 해당 사진으로 바꾸는 방법
		$("#photo").change(function(){
			let src=$(this).val() -1;
			$("#photoview").attr("src","../image/people/" +src+".jpg");
		});
	</script>
</body>
</html>