<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.hello{
			color: orange;
			font-size:15px;
		}
	
	</style>
</head>
<body>
	<h3 style="color: green;">Hello JSP!!</h3>
	<script type="text/javascript">
		for(let i=1;i<=10;i++){
			//document.write("<b class='hello'>"+i+"</b>&nbsp");
			
			//jsp영역  es6에서 literal 사용시 변수값  가져오는 $ 앞에 \를 붙인다.
			//jsp 기본 영역안에서 $ 의 미리 설정된 기능이 있기 때문이다.
			document.write(`<b class='hello'>\${i}</b>&nbsp;`);
		}
	</script>
	
	<%
		//이 영역은 자바 영역이다. => scriptlet이라고 부른다.
		//이곳에서 선언하는 변수는 지역변수가 된다.
		//따라서 * 선언 후 그 아래쪽에서만 가용 가능하다.
		String name="윤석열";
		int year=2022;
		
		//브라우저 출력시 out이라는 내장객체를 사용해도 된다.(JspWriter)
		out.print("<h2>내 이름은 "+name+"이고 "+year+" 년에 취임했습니다.</h2>");
	%>
	
	<!-- 3. 선언문의 변수나 메서드 호출은 위차가 상관없다. -->
	<%=getAssress() %><br>
	<%=address %><br>
	<%=MESSAGE %><br>
	
	
	<!--1. 표현식을 이용해서 자바영역의 변수 출력이 가능하다! -->
	<h2>내 이름은 <%=name %>이고 <%=year%>년에 취임했습니다.^-^</h2>
	
	<!--2. 클래스 멤버 변수나, 메서드를 선언하려면 선언문을 사용하여야 한다. -->
	<%!
		final static String MESSAGE="Bitcamp 701";
		String address="용산구 한남동";
		
		public String getAssress()
		{
			return "대통령 관저는 " +address;
		}
	%>

</body>
</html>













