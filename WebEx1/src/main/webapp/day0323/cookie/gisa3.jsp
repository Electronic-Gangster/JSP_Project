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
	}
</style>
</head>
<%
	//1. amho 쿠키가 존재하면 true로 변경
	boolean b=false; 
	
	//2. 브라우저에 저장된 모든 쿠키값들을 얻는다.
	Cookie []cookies=request.getCookies();
		if(cookies != null)
		{
			for(int i=0; i<cookies.length; i++)
			{
				String cname=cookies[i].getName();
				String cvalue=cookies[i].getValue();
					if(cname.equals("amho") && cvalue.equals("1234"))
					{
						//3. 쿠키가 존재하므로 b를 true로 변경한다.
						b=true;
					}
			}
		}
%>
<body>
<%
	if(b){
%>
	<pre>
		웨이보 등 중국 소셜미디어에서 네티즌들의 반응은 뜨겁습니다. 
		학생들에게 연애를 장려하는 학교'라는 해시태그로 이들 대학의 봄방학이 실시간 검색어 상위에 올랐고 2만여 명이 '좋아요'를 누르는 등 주목받고 있습니다. 
		누리꾼들은 "쓰촨이 중국에서 행복감이 가장 높은 도시인 이유가 있다"거나 "전국으로 확대해야 한다"는 글들을 올리며 부러워했습니다. 
		또 "대학이 학생들에게 연애를 장려하다니 세상이 많이 바뀌었다", "시대 변화를 실감한다", "젊은이들의 결혼 기피 풍조가 반영된 것" 등의 
		반응도 나타났습니다. 
		지난해 중국 인구는 한해 전보다 85만 명이 줄어든 14억 1천175만 명으로, 61년 만에 감소했습니다. 
		1978년 도입한 '한 자녀' 정책을 2016년 폐기해 두 자녀를 허용했고, 2021년에는 세 자녀까지 낳을 수 있도록 완화했지만 
		최근 들어 출산율 저하가 두드러지고 있습니다. 
		인구 감소에 비상이 걸린 중국은 지방정부들이 출산·육아 보조금을 지원하고 출산 휴가를 늘리는 등 
		다양한 출산 장려책을 내놨지만, 경제적 부담 때문에 출산은 물론 결혼조차 꺼리는 젊은 층이 늘고 있습니다.
	</pre>
<%}else{%>
	<script type="text/javascript">
		alert("먼저 로그인 후 기사를 확인하세요");
		history.back();
	</script>	
<%}
%>
</body>
</html>