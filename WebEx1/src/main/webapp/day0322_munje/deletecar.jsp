<%@page import="study.dao.MyCarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1. int 타입으로 num 읽기
	int num=Integer.parseInt(request.getParameter("num"));

	//2. dao 선언하기
	MyCarDao dao=new MyCarDao();
	
	//3. 삭제 메서드 호출하기
	dao.deleteMycar(num);
	
	//4. 리스트로 다시 이동하기
	response.sendRedirect("mycarlist.jsp");

%>