<%@page import="study.dao.PersonDao"%>
<%@page import="study.dto.PersonDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1.엔코딩(Endcoding) => 데이터를 다른 형식으로 변환 하는 과정
	request.setCharacterEncoding("utf-8");
	
	
	// 2. 데이터 각각 읽기
	String name=request.getParameter("name");
	int birthyear=Integer.parseInt(request.getParameter("birthyear").trim());
	String address=request.getParameter("address");
	String job=request.getParameter("job");
	String photo=request.getParameter("photo");
	
	
	// 3. dto 선언
	PersonDto dto=new PersonDto();
	
	// 4. 데이터 dto에 넣기
	dto.setName(name);
	dto.setAddress(address);
	dto.setBirthyear(birthyear);
	dto.setJob(job);
	dto.setPhoto(photo);
	
	// 5. dao 선언
	PersonDao dao=new PersonDao();
	
	
	// 6. insert 메서드 호출
	dao.insertPerson(dto);
	
	
	// 7. 페이지 이동
	response.sendRedirect("personlist.jsp");
%>