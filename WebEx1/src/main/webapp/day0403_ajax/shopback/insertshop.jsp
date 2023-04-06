<%@page import="study.dao.ShopDao"%>
<%@page import="study.dto.ShopDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//데이타 읽기
	String sangpum=request.getParameter("sangpum");
	String color=request.getParameter("color");
	String ipgoday=request.getParameter("ipgoday");
	String photo=request.getParameter("photo");
	int su=Integer.parseInt(request.getParameter("su"));
	int dan=Integer.parseInt(request.getParameter("dan"));	
	
	//dto 에 넣기
	ShopDto dto=new ShopDto();
	dto.setSangpum(sangpum);
	dto.setColor(color);
	dto.setIpgoday(ipgoday);
	dto.setPhoto(photo);
	dto.setSu(su);
	dto.setDan(dan);
	
	//insert 메서드 호출
	ShopDao dao=new ShopDao();
	dao.insertShop(dto);
	
%>