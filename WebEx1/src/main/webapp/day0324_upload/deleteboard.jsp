<%@page import="java.io.File"%>
<%@page import="study.dao.SimpleBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//num 읽기
	int num=Integer.parseInt(request.getParameter("num"));
	
	//dao선언
	SimpleBoardDao dao=new SimpleBoardDao();
	
	//만약, 글 삭제시 업로드 했던 사진도 save 폴더에서 지우고자 할 경우 (delete 로직 보다 먼저 작성해야 한다.)
	
	// 1. 업로드 했던 파일명 얻기
	String photo=dao.getData(num).getPhoto();
	// 2. 업로드된 경로 구하기
	String realPath=getServletContext().getRealPath("/save");
	// 3. 파일 객체 생성
	File file=new File(realPath+"/"+photo);
	file.delete();
	
	//delete 로직 작성
	dao.deleteBoard(num);
	
	//목록으로 이동
	response.sendRedirect("boardlist.jsp");

%>