<%@page import="study.dao.PersonDao"%>
<%@page import="study.dto.PersonDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. int 타입으로 num 읽기
	int num=Integer.parseInt(request.getParameter("num"));
	
	
	//2. dao 선언
	PersonDao dao=new PersonDao();


	//3. 삭제 메서드 호출
	dao.deletePerson(num);
	
	
	//4. personlist.jsp로 이동
	response.sendRedirect("personlist.jsp");


%>