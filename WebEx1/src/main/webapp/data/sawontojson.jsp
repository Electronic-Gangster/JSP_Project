<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="study.dto.SawonDto"%>
<%@page import="java.util.List"%>
<%@page import="study.dao.SawonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SawonDao dao = new SawonDao();
	List<SawonDto> list=dao.getAllSawon();
	
	JSONArray arr=new JSONArray();
	
	for(SawonDto dto:list)
	{
		JSONObject ob = new JSONObject();
		ob.put("num",dto.getNum());
		ob.put("name",dto.getName());
		ob.put("score",dto.getScore());
		ob.put("gender",dto.getGender());
		ob.put("buseo",dto.getBuseo());
		//array에 object를 추가한다.
		arr.add(ob);
		
	}
%>
<%=arr.toString()%>