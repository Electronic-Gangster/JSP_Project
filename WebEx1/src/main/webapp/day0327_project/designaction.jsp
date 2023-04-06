<%@page import="study.dao.DesignDao"%>
<%@page import="study.dto.DesignDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MultipartRequest mulRequest=null;

	//저장할 경로
	ServletContext context=getServletContext();
	String realPath=context.getRealPath("/save");
	System.out.println(realPath);
	
	//업로드할 사진 사이즈
	int uploadSize=1024*1024*3; //3mb
	
	try{
		mulRequest=new MultipartRequest(request,realPath,uploadSize,"utf-8", new DefaultFileRenamePolicy());
		
		///데이터 읽기
		String writer=mulRequest.getParameter("writer");
		String subject=mulRequest.getParameter("subject");
		String content=mulRequest.getParameter("content");
		String photo=mulRequest.getFilesystemName("upload"); //실제 업로드된 파일명
		System.out.println(photo);
		
		//dto에 담기
		DesignDto dto=new DesignDto(writer, subject, content, photo);
		
		//dao 선언
		DesignDao dao=new DesignDao();
		
		//insert
		dao.insertDesign(dto);
		
		//목록으로 이동
		response.sendRedirect("designlist.jsp");
		
	}catch(Exception e){
		out.print("업로드 중 오류 발생"+e.getMessage());
	}
%>