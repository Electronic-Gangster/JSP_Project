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
@import url('https://fonts.googleapis.com/css2?family=Merienda:wght@600&display=swap');
	*{
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	#logo a{
		text-decoration: none;
	}
	ul {
		list-style: none;
	}
	#container{
		margin: 0 auto;
		width: 1200px;
	}
	header{
		width: 100%;
		height: 100px;
		background-color: #07c;
	}
	
	#logo{
		float: left;
		width: 250px;
		height: 100px;
		line-height: 100px;
		padding-left: 80px;
		/*background-color: indigo;*/
		text-align: center;
		display: flex;
  		align-items: center;
		
	}
	#logo h1{
		font-family: 'Merienda', cursive;
		font-weight: 700;
		font-size: 40px;
		color: #fff;
		text-shadow: 0 -1px 0 #222;
		margin: 0;
	}
	nav{
		float: right;
		width: 900px;
		height: 100px;
		/* background-color:green; */
		padding-top: 40px;
	}
	#topMenu{
		height: 65px;
		display: flex;
		align-items: center;
	}
	#topMenu > li{
		float: left;
		position: relative;
	}
	#topMenu > li > a{
		display: block;
		color: #fff;
		font-weight: 600;
		text-shadow: 0 1px #07c;
		padding: 20px 60px;
	}
	#topMenu > li > a > span{
		font-size: 0.5em;
	}
	#topMenu > li > a:hover{
		color: #000;
		text-shadow: 0 -1px #07C;
	}
	#topMenu > li > ul{
		display: none;
		position: absolute;
		width: 160px;
		background-color: rgba(255, 255, 255, 0.6);
		left: 20px;
		margin: 0;
	}
	#topMenu > li > ul > li{
		padding: 10px 10px 10px 30px;
	}
	#topMenu > li > ul > li > a{
		font-size: 14px;
		padding: 10px;
		color: #000;
	}
	#topMenu > li:hover > ul {
		display: block;
		z-index: 1;
		top: 60px;
		left: 0;
		width: 100%;
		background-color: #fff;
		opacity: 0.6;
		
	}
	#topMenu > li > ul > li > a:hover{
		color: #f00;
	}
	#slideShow{
		clear: both;
		width: 100%;
		height: 500px;
		/* background-color: orange; */
		overflow: hidden;
		position: relative;
	}
	#slides{
		position: absolute;
		width: 100%;
		
	}
	#slides > img {
		width: 100%;
		float: left;
		
	}
	#contents{
		width: 100%;
		height: 300px;
		margin-top: 20px;
	}
	#tabMenu{
		float: left;
		width: 600px;
		height: 100%;
		/* background-color: violet; */
		margin-top: 10px;
	}
	#tabMenu input[type="radio"]{
		display: none;
	}
	#tabMenu label{
		display: inline-block;
		margin: 0 0;
		padding: 15px 25px;
		font-weight: 600;
		text-align: center;
		color: #aaa;
		border: 1px solid transparent;
	}
	#tabMenu label:hover{
		color: #222;
		cursor: pointer;
	}
	#tabMenu input:checked + label{
		color: #b00;
		border: 1px solid #ddd;
		background-color: #eee;
	}
	.tabContent{
		display: none;
		padding: 20px 0 0;
		border-top: 1px solid #ddd;
	}
	.tabContent h2{
		display: none;
	}
	#notice ul{
		list-style: disc;
		margin-left: 30px;
	}
	#notice ul li{
		font-size: 16px;
		line-height: 2.5;
	}
	#gallery ul li{
		display: inline;
	}
	#gallery img{
		max-width: 100px;
		height: auto;
		border-radius: 15%;
		border: 1px outset #ddd;
	}
	#tab1:checked ~ #notice,
	#tab2:checked ~ #gallery {
 	 	display: block;
	}

	#links{
		float: right;
		width: 600px;
		height: 100%;
		/* background-color: skyblue; */
		margin-top: 15px;
	}
	#links ul{
		padding: 0;
		overflow: hidden;
	}
	#links ul li{
		float: left;
		width: 33%;
		text-align: center;
		margin: 10px 0;
	}
	#links ul li a{
		text-decoration: none;
	}
	#links ul li a span{
		 display: block;
		 margin: 0 auto;
		 width: 150px;
		 height: 150px;
		 border-radius: 100%;
		 border: 1px solid #ddd;
		 line-height: 150px;
	}
	#quick-icon1{
		background-image:url('../../image/art/travel4.jpg');
		background-size: 100%;
	}
	#quick-icon2{
		background-image:url('../../image/art/travel5.jpg');
		background-size: 100%;
	}
	#quick-icon3{
		background-image:url('../../image/art/travel6.jpg');
		background-size: 100%;
	}
	#links ul li a p{
		margin-top: 15px;
		font-weight: 600;
		color: #666;
	}
	footer{
		width: 100%;
		height: 100px;
		/* background-color: gray; */
		border-top: 2px solid #222;
	}
	#bottomMenu{
		width: 100%;
		height: 20px;
		postion: relative;
	}
	#bottomMenu ul{
		margin-top: 15px;
	}
	#bottomMenu ul li{
		float: left;
		padding: 5px 20px;
		border-right: 1px solid #ddd;
	}
	#bottomMenu ul li:last-child{
		border-right: none;
	}
	#bottomMenu ul li a, #bottomMenu ul li a:visited{
		font-size: 15px;
		color: #666;
	}
	#sns{
		position: absolute;
		right: 20%;
		top: 97%;
		
	}
	#sns ul li{
		 border: none;
		 padding: 5px;
	}
	#sns img{
		width: 30px;
	}
	#company{
		clear: left;
		margin-top: 25px;
		margin-left: 20px;
	}
	#company p{
		font-size: 14px;
		color: #aaa;
		margin-left: 30px;
	}
	button{
	position : absolute;
	height: 100%;
	top: 0;
	border: none;
	padding: 20px;
	background-color: transparent;
	color: #000;
	font-weight: 800;
	font-size: 24px;
	opacity: 0.5;
	}
	#prev{
	left: 0;
	}
	#next{
	right: 0;
	}
	button:hover{
	background-color: #222;
	color: #fff;
	opacity: 0.6;
	cursor: pointer;
	}
	button:focus{
	outline: 0;
	}
	
</style>
</head>
<body>
<%
		//로그인 상태인지 확인
		String loginstate=(String)session.getAttribute("loginstate");

		if(loginstate==null){%>
			<h3>이 페이지를 보려면 먼저 로그인을 해주세요</h3>	
			<a href="pptmain.jsp">로그인 페이지</a>
		<%}else{%>
			
			<jsp:include page="designlogout.jsp"/>
			
		<%
		%>
				
		<%}
		%>
		
		<div id="container">
			<header>
				<div id="logo">
					<a href="pptsuccesspage.jsp">
						<h1>Minterest</h1>
					</a>
				</div>
				<nav>
					<ul id="topMenu">
						<li><a href='#'>단체여행  <span>▾</span></a>
							<ul>
								<li><a href="#">가족 여행</a></li>
								<li><a href="#">친구 여행</a></li>
							</ul>
						</li>
						<li><a href='#'>맞춤여행  <span>▾</span></a>
							<ul>
								<li><a href="#">역사 투어</a></li>
								<li><a href="#">체험 여행</a></li>
								<li><a href="#">힐링 여행</a></li>
							</ul>
						</li>
						<li><a href="#">갤러리</a></li>
						<li><a href="#">게시판</a></li>
					</ul>
				</nav>
			</header>
		<div id="slideShow">
			<div id="slides">
				<img src="../../image/art/travel1.jpg" alt="Art 1">
				<img src="../../image/art/travel2.jpg" alt="Art 2">
				<img src="../../image/art/travel3.jpg" alt="Art 3">
				<!-- <button id="prev">&lang;</button>
				<button id="next">&rang;</button> -->
			</div>
		</div>
			<div id="contents">
				<div id="tabMenu">
					<input type="radio" id="tab1" name="tabs" checked>
					<label for="tab1">공지사항</label>
					<input type="radio" id="tab2" name="tabs">
					<label for="tab2">갤러리</label>
					
					<div id="notice" class="tabContent">
						<h2>공지사항 내용입니다.</h2>
						<ul>
							<li>사무실을 이전했습니다.</li>
							<li>[참가모집] UMF Miami 2023</li>
							<li>[참가모집] 여름 방학 기간, 세계일주 모집합니다.</li>
							<li>4월, 추천 여행지</li>
							<li>5월, 추천 여행지</li>
						</ul>
					</div>
					<div id="gallery" class="tabContent">
						<h2>갤러리 내용입니다.</h2>
						<ul>
							<li><img src="../../image/art/gal1.jpg"></li>
							<li><img src="../../image/art/gal2.jpg"></li>
							<li><img src="../../image/art/gal3.jpg"></li>
							<li><img src="../../image/art/gal4.jpg"></li>
						</ul>
					</div>
				</div>
				<div id="links">
					<ul>
						<li>
							<a href="#">
								<span id="quick-icon1"></span>
								<p>역사 투어</p>
							</a>
						</li>
						<li>
							<a href="#">
								<span id="quick-icon2"></span>
								<p>힐링 여행</p>
							</a>
						</li>
						<li>
							<a href="../designlist.jsp">
								<span id="quick-icon3"></span>
								<p>문의하기</p>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<footer>
				<div id="bottomMenu">
					<ul>
						<li><a href="#">회사 소개</a></li>
						<li><a href="#">개인정보처리방침</a></li>
						<li><a href="#">여행약관</a></li>
						<li><a href="#">사이트맵</a></li>
					</ul>
					<div id="sns">
						<ul>
							<li><a href="#"><img src="../../image/art/sns1.png"></a></li>
							<li><a href="#"><img src="../../image/art/sns2.png"></a></li>
							<li><a href="#"><img src="../../image/art/sns3.png"></a></li>
						</ul>
					</div>
				</div>
				<div id="company">
					<p>서울특별시 용산구 한남동 (대표전화) 02-1234-5678</p>
				</div>
			</footer>
		</div>
<script type="text/javascript">
	var currentIndex = 0;
	showSlides();
	
	function showSlides() {
		var slides = document.querySelectorAll("#slides > img");
		for (let i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		currentIndex++;
		if (currentIndex > slides.length) {
			currentIndex = 1;
		}
		slides[currentIndex - 1].style.display = "block";
		setTimeout(showSlides, 3000);
	}
</script>
</body>
</html>