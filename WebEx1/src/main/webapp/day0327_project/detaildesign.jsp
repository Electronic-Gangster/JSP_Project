<%@page import="java.text.SimpleDateFormat"%>
<%@page import="study.dto.DesignDto"%>
<%@page import="study.dao.DesignDao"%>
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
	body, html {
	  height: 100%;
	  margin: 0;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  position: relative;
	}
	body{
	background-image: url('../image/art/bg6.png');
	background-position : 57.5% 4.6%;
	background-repeat: no-repeat;
	background-size: 15%
	}
	.centered-wrapper {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  position: absolute;
 	  top: 5%; /* 이 값을 조정하여 세로 위치를 변경할 수 있습니다. */
	}
	.table-buttons {
  	  text-align: center;
	}
	.day{
		color: gray;
		font-size: 12px;
		float: right;
	}
	
</style>
<%
	//num 읽기
	int num=Integer.parseInt(request.getParameter("num"));
	
	//dao 선언
	DesignDao dao=new DesignDao();
	
	//조회수 증가 - * dto를 얻기 전에 꼭 미리 작성해야 한다!
	dao.updateReadCount(num);
	
	//dto 얻기
	DesignDto dto=dao.getData(num);
	
	//날짜 출력 형식
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
</head>
<body>
 <div class="centered-wrapper">
	<div style="margin: 30px 50px">
		<table class="table" style="width:500px;">
			<tr>
				<td>
					<h3><b><%=dto.getSubject()%></b></h3>
				</td>
			</tr>
			<tr>
				<td>
					<b><%=dto.getWriter() %></b>
					<span class="day"><%=sdf.format(dto.getWriteday()) %></span>
				</td>
			</tr>
			<tr>
				<td valign="top">
					<span style="color:gray; font-size: 12px">조회수<%=dto.getReadcount()%></span>
					<br><br>
					
					<%=dto.getContent().replace("\n","<br>")%>
					<br><br>
					
					<%
						if(dto.getPhoto()!=null)
						{
					%>
						<h5><b>업로드한 사진</b></h5>
						<img src="../save/<%=dto.getPhoto()%>" style="max-width: 300px" 
						onerror="this.src='../image/noimage.png'">
						<%}
					%>
				</td>
			</tr>
			<tr class="table-buttons">
				<td>
				<button type="button" class="btn btn-sm btn-outline-primary" style="width: 80px;"
				onclick="location.href='designform.jsp'"><i class="bi bi-pencil-fill"></i>&nbsp; 글쓰기</button>
				
				<button type="button" class="btn btn-sm btn-outline-success" style="width: 80px;"
				onclick="location.href='updatedesignform.jsp?num=<%=dto.getNum()%>'">
				<i class="bi bi-pencil-square"></i>&nbsp; 수정</button>
				
				<button type="button" class="btn btn-sm btn-outline-danger" style="width: 80px;"
				onclick="del(<%=dto.getNum()%>)"><i class="bi bi-trash3-fill"></i>&nbsp; 삭제</button>
				
				<button type="button" class="btn btn-sm btn-outline-warning" style="width: 80px;"
				onclick="location.href='designlist.jsp'"><i class="bi bi-list-task"></i>&nbsp; 목록</button>
				</td>
			</tr>
		</table>
	</div>
</div>
<script type="text/javascript">
function del(num)
{
	let b=confirm("삭제하려면 [확인]을 눌러주세요");
	if(b){
		location.href="deletedesign.jsp?num="+num;
	}
}
</script>
</body>
</html>