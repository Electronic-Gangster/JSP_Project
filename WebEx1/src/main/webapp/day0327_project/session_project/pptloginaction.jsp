<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//체크 값
	String chksave=request.getParameter("chksave");
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	
	//체크하면 : on, 체크 안하면 : null
	//out.println("chksave="+chksave);
	
	//비밀번호가 맞으면 세션에 3가지를 저장
	if(pass.equals("1234")){
		session.setMaxInactiveInterval(60*60);	//유지 시간 1시간
		session.setAttribute("loginid", id);
		session.setAttribute("chksave", chksave==null?"no":"yes");	//체크하면 yes, 아니면 no
		session.setAttribute("loginstate", "yes");
		
		//successpage로 이동
		response.sendRedirect("pptsuccesspage.jsp");

	}else{%>
		<script>
			alert("비밀번호가 맞지 않습니다.");
			history.back();
		</script>	
	<%}
%>