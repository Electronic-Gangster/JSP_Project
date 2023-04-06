<%@page import="java.text.SimpleDateFormat"%>
<%@page import="study.dto.SimpleBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="study.dao.SimpleBoardDao"%>
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
	a:link, a:visited{
		text-decoration: none;	
		color: black;
	}
	a:hover{
		text-decoration: underline;
		color: Red;;
	}
</style>
</head>
<%
	//1. dao 선언
	SimpleBoardDao dao=new SimpleBoardDao();
	
	//2. 전체 글 목록 가져오기
	List<SimpleBoardDto> list=dao.getAllDatas();
%>
<body>
	<div style="margin: 30px 50px">
		<button type="button" class="btn btn-secondary btn-sm" style="width:120px;"
		onclick="location.href='boardform.jsp'"><i class="bi bi-pencil-fill"></i>&nbsp;글쓰기</button>
		
		<table class="table table-bordered" style="width: 700px; margin: 20px;">
			<caption align="top"><b>
			<%=list.size()==0?"Simple Board":"총 "+list.size()+"개의 글이 있습니다." %>
			</b></caption>
			
			<tr bgcolor="lightgray">
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
					
					for(SimpleBoardDto dto:list)
					{%>
						<tr>
							<td align="center"><%=list.size()-i++ %></td>	<!-- 번호 영역 -->
							<td> <!-- 제목 영역 -->
								<a href="detailboard.jsp?num=<%=dto.getNum() %>">
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
</body>
</html>