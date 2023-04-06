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
<h4 class="alert alert-info"style="width:400px">3월 22일 숙제</h4>
	<form action="mycaraction.jsp" method="post">
	<table class="table table-bordered" style="width:400px">
		<tr>
			<th bgcolor="lightgray" width="100">자동차명</th>
			<td>
				<input type="text" name="carname" required="required" class="form-conntrol">
			</td>
		</tr>
		<tr>
			<th bgcolor="lightgray" width="100">가격</th>
			<td>
				<input type="text" name="carprice" required="required" class="form-conntrol">
			</td>
		</tr>
		<tr>
			<th bgcolor="lightgray" width="100">사진</th>
			<td>
				<div class="input-group">
					<select class="form-select" name="carphoto" id="carphoto">
						<%
						for(int i=1; i<=15; i++)
						{%>
							<option value="car<%=i%>.png"><%=i%>번 사진</option>
						<%}
						%>
					</select>
				</div>
			</td>
		</tr>
		<tr>
			<th bgcolor="lightgray" width="100">구입일</th>
			<td>
				<input type="date" name="guipday" required="required" class="form-conntrol">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-success">서버에 전송</button>
			</td>
		</tr>
	</table>
	</form>
	<img src="../image/mycarimage/car1.png" id="photoview" width="200" border="1" 
		style="position: absolute; left:800px top:100px">
		
	<script type="text/javascript">
		// ** 사진을 선택하면 해당 사진으로 바뀌도록 해보세요. **
		$("#carphoto").change(function(){
			let src=$(this).val();
			$("#photoview").attr("src",`../image/mycarimage/\${src}`);
		});
	</script>
</body>
</html>