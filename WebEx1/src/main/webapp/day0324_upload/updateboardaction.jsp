<%@page import="study.dao.SimpleBoardDao"%>
<%@page import="study.dto.SimpleBoardDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	

	//MultipartRequest 객체를 null 값으로 초기화 한다.
	MultipartRequest mulRequest=null;			//MultipartRequest는 파일 업로드 할때 사용하는 객체이다.
												//일반적으로 웹 페이지에서 파일을 업로드 할 때 사용한다.

	//파일이 저장 될 경로를 구한다.
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
		String photo=mulRequest.getFilesystemName("upload");	//실제 업로드 된 파일명
		System.out.println(photo);
		
		//Dto에 데이터를 담는다.
		SimpleBoardDto dto=new SimpleBoardDto(writer, subject, content, photo);
		dto.setNum(num);
		
		//Dao를 선언한다.
		SimpleBoardDao dao=new SimpleBoardDao();
		
		//선언한 정보를 바탕으로 데이터를 update(수정) 한다.
		dao.updateBoard(dto);
		
		//수정된 게시물의 상세페이지로 이동한다.
		response.sendRedirect("detailboard.jsp?num="+num);
		
	}catch(Exception e){
		out.print("업로드 수정 중 오류 발생 : "+e.getMessage());
	}
	
	
%>