<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style type="text/css">
	body, body *{
		font-family: 'Jua'
		margin:0;
  		padding:0;
  		/* background: linear-gradient(#141e30, #243b55); */
	}
	body{
	background-image: url('../../image/art/bg5.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
	}
	html {
  	height: 100%;
	}
	.login-box {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  width: 400px;
	  padding: 40px;
	  transform: translate(-50%, -50%);
	  background: rgba(0, 0, 0, .7);
	  box-sizing: border-box;
	  box-shadow: 0 15px 25px rgba(0, 0, 0, .6);
	  border-radius: 10px;
	  text-align: center; 
	}
	
	.login-box h2 {
	  margin: 0 0 30px;
	  padding: 0;
	  color: #fff;
	  text-align: center;
	}
	
	.login-box .user-box {
	  position: relative;
	}
	
	.login-box .user-box input {
	  width: 100%;
	  padding: 10px 0;
	  font-size: 16px;
	  color: #fff;
	  margin-bottom: 30px;
	  border: none;
	  border-bottom: 1px solid #fff;
	  outline: none;
	  background: transparent;
	}
	
	.login-box .user-box label {
	  position: absolute;
	  top: 0;
	  left: 0;
	  padding: 10px 0;
	  font-size: 16px;
	  color: #fff;
	  pointer-events: none;
	  transition: .5s;
	}
	
	.login-box .user-box input:focus ~ label,
	.login-box .user-box input:valid ~ label {
	  top: -20px;
	  left: 0;
	  color: #03e9f4;
	  font-size: 12px;
	}
	
	.login-box form .submit-button {
	  position: relative;
	  display: inline-block;
	  padding: 10px 20px;
	  color: #03e9f4;
	  font-size: 16px;
	  text-decoration: none;
	  text-transform: uppercase;
	  overflow: hidden;
	  transition: .5s;
	  margin-top: 40px;
	  letter-spacing: 4px;
	  background: none;
	  border: none;
	  cursor: pointer;
	  outline: none;
	}
	
	.login-box .submit-button:hover {
	  background: #03e9f4;
	  color: #fff;
	  border-radius: 5px;
	  box-shadow: 0 0 5px #03e9f4,
	              0 0 25px #03e9f4,
	              0 0 50px #03e9f4,
	              0 0 100px #03e9f4;
	}
	
	.login-box .submit-button span {
	  position: absolute;
	  display: block;
	}
	
	.login-box .submit-button span:nth-child(1) {
	  top: 0;
	  left: -100%;
	  width: 100%;
	  height: 2px;
	  background: linear-gradient(90deg, transparent, #03e9f4);
	  animation: btn-anim1 1s linear infinite;
	}
	
	@keyframes btn-anim1 {
	  0% {
	    left: -100%;
	  }
	  50%, 100% {
	    left: 100%;
	  }
	}
	
	.login-box .submit-button span:nth-child(2) {
	  top: -100%;
	  right: 0;
	}
	.submit-button-container {
    text-align: center;
}
</style>
</head>
<%
	String chksave=(String)session.getAttribute("chksave");
	String loginid=(String)session.getAttribute("loginid");
	boolean b;
	//chksave가 한번도 세션에 저장된 적이 없는 경우는 null 값이 나오고,
	//한번이라도 체크후 로그인을 했다면, yes or no
	if(chksave==null || chksave.equals("no")){
		b=false;
		loginid="";	//체크를 안했을 경우 세션으로부터 얻은 아이디를 지운다.
		
	}else
		b=true;
%>
<body>
<div class="login-box">
	<h2>"환영합니다"</h2>
	<form action="pptloginaction.jsp" method="post">
		<div class="user-box">
		<h2>로그인</h2>
			<input type="text" name="id" required="required" placeholder="영문 아이디를 입력하세요">
      		<!--  <label>USERNAME</label>-->
		</div>
		 <div class="user-box">
      		<input type="password" name="pass" required="required" placeholder="비밀번호를 입력하세요">
   		 </div>
   		 <div>
			<label>
				<input type="checkbox" name="chksave" <%=b?"checked":"" %>>
				<span style="color: white;">아이디 저장</span>
			</label>	
		</div>
		 <div class="submit-button-container">
   		 <button type="submit" class="submit-button">
			  <span></span>
			  <span></span>
			  <span></span>
			  <span></span>
			  ENTER
		</button>
		
		</div>
	</form>
</div>
</body>
</html>