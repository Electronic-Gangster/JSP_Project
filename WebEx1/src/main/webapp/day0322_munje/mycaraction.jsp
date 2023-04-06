<%@page import="study.dao.MyCarDao"%>
<%@page import="study.dto.MyCarDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1.엔코딩(Endcoding) => 데이터를 다른 형식으로 변환 하는 과정
	request.setCharacterEncoding("utf-8");
	
	
	// 2. 데이터 각각 읽기
	String carname=request.getParameter("carname");
	int carprice=Integer.parseInt(request.getParameter("carprice").trim());
	String carphoto=request.getParameter("carphoto");
	String guipday=request.getParameter("guipday");
	
	
	// 3. dto 선언
	MyCarDto dto=new MyCarDto();
	
	// 4. 데이터 dto에 넣기
	dto.setCarname(carname);
	dto.setCarprice(carprice);
	dto.setCarphoto(carphoto);
	dto.setGuipday(guipday);
	
	// 5. dao 선언
	MyCarDao dao=new MyCarDao();
	
	
	// 6. insert 메서드 호출
	dao.insertMycar(dto);
	
	
	// 7. 페이지 이동
	response.sendRedirect("mycarlist.jsp");
%>