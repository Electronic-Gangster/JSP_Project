<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="study.dto.ShopDto"%>
<%@page import="java.util.List"%>
<%@page import="study.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%
	//1. 검색할 상품을 읽는다.
	String search=request.getParameter("search");

	//2.검색 값이 넘어 오지 않은 경우 null이 된다. 이 때 null은 ""로 변경.
	if(search==null)
		search="";
		
	ShopDao dao=new ShopDao();
	List<ShopDto> list=dao.getSangpumList(search);
	
	JSONArray arr = new JSONArray();
	for(ShopDto dto:list)
	{
		JSONObject ob=new JSONObject();
		ob.put("num",dto.getNum());
		ob.put("sangpum",dto.getSangpum());
		ob.put("color",dto.getColor());
		ob.put("photo",dto.getPhoto());
		ob.put("su",dto.getSu());
		ob.put("dan",dto.getDan());
		ob.put("ipgoday",dto.getIpgoday());
		
		arr.add(ob);
	}
		
%>
<%=arr.toString()%>