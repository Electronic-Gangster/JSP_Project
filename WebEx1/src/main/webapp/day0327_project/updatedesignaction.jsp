<%@page import="study.dao.DesignDao"%>
<%@page import="study.dto.DesignDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//MutipartRequset 객체를 null 값으로 초기화 한다.
	MultipartRequest mulRequest=null;

	//파일이 저장될 경로를 구한다.
	ServletContext context=getServletContext();
	String realPath=context.getRealPath("/save");
	System.out.println(realPath);
	
	//업로드할 사진 파일의 최대 크기를 3MB로 설정한다.
	int uploadSize=1024*1024*3;
	
	try{
		//MultipartRequest 객체를 생성하여 파일을 업로드 한다.
		mulRequest=new MultipartRequest(request,realPath,uploadSize,"utf-8", new DefaultFileRenamePolicy());
		
		//게시글 수정에 필요한 데이터를 읽는다.
		int num=Integer.parseInt(mulRequest.getParameter("num"));
		String writer=mulRequest.getParameter("writer");
		String subject=mulRequest.getParameter("subject");
		String content=mulRequest.getParameter("content");
		String photo=mulRequest.getFilesystemName("upload");	//실제 업로드된 파일명
		System.out.println(photo);
		
		//Dto에 데이터를 담는다.
		DesignDto dto=new DesignDto(writer, subject, content, photo);
		dto.setNum(num);
		
		//Dao를 선언한다.
		DesignDao dao=new DesignDao();
		
		//선언한 정보를 바탕으로 데이터를 update한다.
		dao.updateDesign(dto);
		
		//수정된 게시물의 상세페이지로 이동한다.
		response.sendRedirect("detaildesign.jsp?num="+num);
		
		
	}catch(Exception e){
		out.print("업로드 수정 중 오류 발생 : "+e.getMessage());
	}

%>