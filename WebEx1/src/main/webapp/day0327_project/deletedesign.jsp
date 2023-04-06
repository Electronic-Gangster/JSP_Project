<%@page import="java.io.File"%>
<%@page import="study.dao.DesignDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. num 읽기
	int num=Integer.parseInt(request.getParameter("num"));

	//2. DAO 선언
	DesignDao dao=new DesignDao();
	
	//3. 게시글 삭제 시 업로드 했던 사진도 함께 삭제
	
	//3-1. 업로드 했던 파일명 얻기
	String photo=dao.getData(num).getPhoto();
	
	//3-2. 업로드 경로 얻기
	String realPath=getServletContext().getRealPath("/save");
	
	//3-3. 파일 객체 생성
	File file=new File(realPath+"/"+photo);
	file.delete();
	
	//4. delete 로직 작성
	dao.deleteDesign(num);
	
	//5. 목록으로 이동
	response.sendRedirect("designlist.jsp");
%>