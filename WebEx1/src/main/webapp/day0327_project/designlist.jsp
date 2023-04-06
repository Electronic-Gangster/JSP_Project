<%@page import="study.dto.DesignDto"%>
<%@page import="java.util.List"%>
<%@page import="study.dao.DesignDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
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
	body{
	background-image: url('../image/art/bg3.png');
	background-position : 100% -20%;
	background-repeat: no-repeat;
	}
	th {
	  text-align: center;
	}
	
	a:link, a:visited{
		text-decoration: none;	
		color: black;
	}
	a:hover{
		text-decoration: underline;
		color: Red;
	}
	div[style="margin: 30px 50px"] {
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	}
	.main-container {
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	}
	
	.table-container {
	  display: flex;
	  justify-content: center;
	}
	
	.button-container {
	  display: flex;
	  justify-content: center;
	}
</style>
</head>
<%
	//1. dao 선언
	DesignDao dao=new DesignDao();
	
	//2. 전체 글 목록 가져오기
	List<DesignDto> list=dao.getAllDatas();
%>
<body>
	<div style="margin: 30px 50px" class="main-container">
		<div class="table-container">
		<table class="table table-bordered" style="width:700px; margin:20px;">
			<caption align="top"><h3>
			<%=list.size()==0?"minterest":"총 "+list.size()+"개의 문의가 있습니다." %>
			</h3></caption>
			<tr bgcolor="lightblue">
					<th width="50">번 호</th>
					<th width="300">제목</th>
					<th width="50">작성자</th>
					<th width="70">작성일</th>
					<th width="50">조회수</th>
			</tr>
			<%
				if(list.size()==0){%>
					<tr height="60">
						<td colspan="5" align="center" valign="middle">
							<b>게시글이 없습니다.</b>
						</td>
					</tr>	
				<%}else{
					int i=0; //전체 사이즈에서 i값을 빼고 주기 위함
					SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd.");
					
					for(DesignDto dto:list)
					{%>
						<tr>
							<td align="center"><%=list.size()-i++ %></td>	<!-- 번호 영역 -->
							<td> <!-- 제목 영역 -->
								<a href="detaildesign.jsp?num=<%=dto.getNum() %>">
									<%=dto.getSubject() %>
										<%
											if(dto.getPhoto()!=null)
											{%>
												<i class="bi bi-image"></i>	
											<%}
										%>
								<%-- 방법 2 <%=dto.getPhoto()==null?"":"<i class='bi bi-image'></i>" %>  --%>
								</a>
							</td>
							<td align="center"><%=dto.getWriter()%></td> <!-- 작성자 영역 -->
							<td align="center"><%=sdf.format(dto.getWriteday())%></td> <!-- 작성일 영역 -->
							<td align="center"><%=dto.getReadcount()%></td> <!-- 조회수 영역 -->
						</tr>	
					<%}
				}
			%>
		</table>
		</div>
		<div class="button-container">
		  <button type="button" class="btn btn-outline-success btn-sm" style="width: 100px;"
		    onclick="location.href='designform.jsp'">
		    <i class="bi bi-pencil-fill"></i>&nbsp; 글쓰기
		  </button>
		  &nbsp; &nbsp;
		  <button type="button" class="btn btn-outline-warning btn-sm" style="width: 100px;"
		    onclick="history.back()">
		    <i class="bi bi-arrow-counterclockwise">&nbsp; 이전</i>
		  </button>
		  &nbsp; &nbsp;
		  <button type="button" class="btn btn-outline-info btn-sm" style="width: 100px;"
		    onclick="location.href='session_project/pptsuccesspage.jsp'">
		    <i class="bi bi-house">&nbsp; 메인페이지</i>
		  </button>
		</div>
	</div>
</body>
</html>