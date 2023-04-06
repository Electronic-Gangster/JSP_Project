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
		메이저리거 군단을 꺾고 만화 같은 활약으로 일본을 우승으로 이끈 오타니, 
		대중들이 잘 모르는 알려지지 않은 이야기 5가지를 정리해봤습니다. 

		1. 우월한 DNA 오타니는 2남 1녀 중 막내입니다. 특이한 건 가족 모두 스포츠인.
		사회인 야구선수 출신 아버지, 배드민턴선수 출신 어머니, 독립리그 야구선수 형, 배구선수 출신 누나. 심지어 모두 키까지 큽니다. 
		아빠 182cm, 엄마 170cm, 형 187cm, 누나 168cm. 
		
		2. 공부도 잘했다.
		고교 때부터 메이저리그의 주목을 받는 특급선수였던 오타니. 그의 고교 스승 사사키 히로시에 따르면 오타니의 고등학교 전체 교과목 평균은 85점, 
		야구선수가 아니었더라도 훌륭한 성적에 글짓기 등 과제물도 거의 빼먹은 적 없던 성실한 학생이었습니다.
		게다가 그림 실력도 뛰어나 미국 진출을 위해 니혼햄 파이터스를 떠날 때는 구단 라커룸에 '신세 많이 졌습니다'라는 말과 함께
		평소 좋아하던 정대만의 그림을 그렸고 본인이 입는 야구복 일러스트도 직접 그렸습니다.
		 
		3. 취미는 쓰레기 줍기?
		한때 일본에서 '만다라트 계획표(목적 달성의 틀)'가 유행했는데요. 
		고등학교 1학년 때 오타니가 직접 쓴 계획에는 '운'을 얻기 위해 쓰레기를 줍고 부실 청소까지 한다고 기록되어 있습니다.
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