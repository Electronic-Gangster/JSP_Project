<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//4. 출력은 없고 로직만 있다.
	
	//5. amho값을 읽는다.
	String amho=request.getParameter("amho");
	if(amho.equals("1234")){
		Cookie cookie=new Cookie("amho",amho);
		cookie.setPath("/"); //쿠키 저장 위치를 루트(/)로 설정
		cookie.setMaxAge(60*60); //일단 60초 * 60번 = 한시간으로 설정
		response.addCookie(cookie); //브라우저에 쿠키 추가
		response.sendRedirect("cookiemain.jsp"); //쿠키 메인페이지로 이동
		
	}else{%>
		<script>
			alert("비밀번호가 맞지 않습니다.");
			history.back();
		</script>
	<%}
%>