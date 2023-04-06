<%@page import="org.json.simple.JSONObject"%>
<%@page import="study.dto.MyCarDto"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="study.dao.MyCarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MyCarDao dao = new MyCarDao();
	List<MyCarDto> list=dao.getAllCars();
	
	JSONArray arr=new JSONArray();
	
	for(MyCarDto dto:list)
	{
		JSONObject ob = new JSONObject();
		ob.put("num",dto.getNum());
		ob.put("carname",dto.getCarname());
		ob.put("carprice",dto.getCarprice());
		ob.put("carphoto",dto.getCarphoto());
		ob.put("guipday",dto.getGuipday());
		//array에 object를 추가한다.
		arr.add(ob);
		
	}
%>
<%=arr.toString()%>