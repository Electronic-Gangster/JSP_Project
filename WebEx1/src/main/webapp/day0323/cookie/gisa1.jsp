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
		그럼에도 우리는 우리가 할 일을 해야 합니다. 정부 산하 위원회를 만들어 진상 조사를 시작하자는 제안은 몇 년 전부터 거론돼 왔습니다.
		최근 국회에서는 특별법이 발의됐습니다. 민간위원으로 구성된 피해조사위원회를 설치해 의혹을 규명하고 정부에는
		피해자의 명예 회복을 위해 필요한 조치를 권고하도록 하는 내용입니다. 일단 직권 조사가 가능한 진실화해위원회부터 움직여야 합니다.
		하미 학살 사건 피해자들은 지난 2020년 진화위에 진실규명을 신청했지만 지금까지 아무런 답변도 듣지 못했습니다. 
		
		베트남 정부의 태도에서도 변화가 감지됩니다. 지난 9일 한국 정부가 퐁니 사건 1심 판결에 대해 항소한 직후
		외교부 부대변인을 통해 이례적으로 강한 유감을 표명한 게 대표적 예입니다. 법원의 판단 등으로 사실 관계가 어느 정도 확인된 영역에서는
		목소리를 내기 시작했다는 해석이 나옵니다. 퐁니 사건의 진상을 이 정도라도 밝혀낸 건 
		한겨레 고경태 기자와 같은 우리나라 언론인과 시민단체 그리고 변호사들이었습니다. 여기까지 오는 데 한국 민간의 역할이 컸다는 건 불행 중 다행인 일입니다.
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