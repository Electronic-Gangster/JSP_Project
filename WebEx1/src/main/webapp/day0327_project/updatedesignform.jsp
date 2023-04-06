<%@page import="study.dao.DesignDao"%>
<%@page import="study.dto.DesignDto"%>
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
	 html, body {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 30px;
        }
         .image-container {
            text-align: center;
        }
         #showimg {
            display: inline-block;
            max-width: 300px;
            margin-top: 20px;
        }
         th {
            width: 100px;
            text-align: center;
            color: white;
            vertical-align: middle;
        }
</style>
</head>
<%
	//num 읽기
	int num=Integer.parseInt(request.getParameter("num"));
	
	//dao 선언
	DesignDao dao=new DesignDao();
	
	//dto 얻기
	DesignDto dto=dao.getData(num);
%>
<body>
 <div class="container">
	<div style="margin: 30px 50px">
		<form action="updatedesignaction.jsp" method="post" enctype="multipart/form-data">
			<!-- hidden -->
			<input type="hidden" name="num" value="<%=num%>">
			
			<table class="table table-bordered" style="width: 400px;">
				<caption align="top" style="color: skyblue;"><b>게시글 수정</b></caption>
				<tr>
					<th style="background-color: #598CB6">작성자 수정</th>
					<td>
						<input type="text" name="writer" class="form-control" style="width:130px;"
						autofocus="autofocus" required="required" value="<%=dto.getWriter()%>">
					</td>
				</tr>
				<tr>
					<th style="background-color: #598CB6">제목 수정</th>
					<td>
						<input type="text" name="subject" class="form-control" required="required" 
						value="<%=dto.getSubject()%>"> <!-- 4. 제목 값을 저장하여 표시한다. -->
					</td>
				</tr>
				<tr>
					<th style="background-color: #598CB6">사진 수정</th>
					<td>
						<input type="file" name="upload" class="form-control" id="myfile" >
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea style="width: 100%; height: 200px;" name="content" required="required">
							<%=dto.getContent() %>
						</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-info btn-sm">게시글 수정</button>
						<button type="button" class="btn btn-outline-warning btn-sm" onclick="history.back()">이전</button>
					</td>
				</tr>
			</table>
		</form>
		<!-- 이미지 출력할 영역 -->
		<div class="image-container">
		<h4>업로드된 이미지</h4>
		<img id="showimg" src="../save/<%=dto.getPhoto()%>">
		</div>
	</div>
	</div>
	<script type="text/javascript">
	
	$("#myfile").change(function(){
	  console.log("1:"+$(this)[0].files.length);
	  console.log("2:"+$(this)[0].files[0]);
  		
	//정규표현식
	var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
	var f=$(this)[0].files[0];//현재 선택한 파일

		if(!f.type.match(reg)){
   			alert("확장자가 이미지파일이 아닙니다");
   		return;
		}

		 if($(this)[0].files[0]){
		   var reader=new FileReader();
		   
		   reader.onload=function(e){
		    $("#showimg").attr("src",e.target.result);
		   }
		   
		   reader.readAsDataURL($(this)[0].files[0]);
		}	
	});
</script>
</body>
</html>