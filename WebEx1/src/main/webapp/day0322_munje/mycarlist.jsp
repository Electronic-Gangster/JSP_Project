<%@page import="study.dto.MyCarDto"%>
<%@page import="java.util.List"%>
<%@page import="study.dao.MyCarDao"%>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	body, body *{
		font-family: 'Jua'
	}
</style>
</head>
<%
	MyCarDao dao=new MyCarDao();
	List<MyCarDto> list=dao.getAllCars();
%>
<body>
<!-- The Modal -->
<div class="modal" id="photoModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title" id="modalname">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <img src="" id="modalphoto" style="width: 100%; height: 400px;">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

<a href="mycarform.jsp">차량 추가</a>
	<hr>
	<h3 class="alert alert-info">
		<b>총 <%=list.size()%>  대 차량을 보유중입니다.</b>
	</h3>
	<table class="table table-bordered" style="width: 700px;">
		<tr bgcolor="lightgray">
			<th width="50">번호</th>
			<th width="100">차량</th>
			<th width="70">가격(만원)</th>
			<th width="100">구매일자</th>
			<th width="80">삭제</th>
		</tr>
		<%
		int n=1;
		for(MyCarDto dto:list)
		{
			
		%>
			<tr>
				<td align="center"><%=n++ %></td>
				<td>
					<img src="../image/mycarimage/<%=dto.getCarphoto()%>"
					width="30" border="1" hspace="10" class="photo" 
					data-bs-toggle="modal" data-bs-target="#photoModal">
					<b><%=dto.getCarname() %></b>
				</td>
				<td><%=dto.getCarprice() %></td>
				<td><%=dto.getGuipday() %></td>
				
				<td>
					<button type="button" class="btn btn-danger btn-sm" 
					onclick="del(<%=dto.getNum()%>)">삭제</button>
				</td>
			</tr>
			<%}
		%>
	</table>
	
	<script type="text/javascript">
		function del(num)
		{
			//alert(num);
			let b=confirm("삭제하려면 [확인]을 눌러주세요")
			if(b){
				location.href="deletecar.jsp?num="+num;	//파일 이동하는 함수
			}
		}
		
		//작은 사진 클릭시 모달에 사진 나오에 하기
		$(".photo").click(function(){
			//클릭한 곳의 src
			let selectSrc=$(this).attr("src");
			//모달 안의 이미지에 넣기
			$("#modalphoto").attr("src",selectSrc);
			//사진클릭한곳 다음 태그가 b태그이다. 그 태그의 text를 얻는다
			let name=$(this).next().text();
			//modal header에 출력
			$("#modalname").text(name);
			
		});
		
	</script>
</body>
</html>