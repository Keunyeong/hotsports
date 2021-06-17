<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
</head>
<body>
	<h1>인덱스 페이지 입니다.</h1>
	<form action="send.jsp">
		<input type="text" id = "msg" name="msg"/>
		<button>입력</button>
		
	</form>
	<h2>로그인 폼</h2>
	<%
		//session 영역에 id 라는 키값으로 저장된 값이 있는지 어와 본다.
		String id=(String)session.getAttribute("id");
	%>
	<%if(id==null){ %>
		<form action="users/login.jsp" method = "post">
			<input type="hidden" name="url" value="<%=request.getContextPath()%>"/>
			<input type="text" name="id" palceholder="아이디입력..." />
			<button type="submit">로그인</button>
		</form>
	<%}else{ %>
		<p>
			<strong><%=id %></strong> 님이 로그인중...
		</p>
		<a href="users/logout.jsp">로그아웃</a>
	<%} %>
	<ul>
		<li><a href="private/play.jsp">놀러가기</a></li>
		<li><a href="private/study.jsp">공부하러가기</a></li>
		<li><a href="private/buy.jsp?num=1&amount=3">1번 물건 3개 사기</a></li>
	</ul>
	
	
	
</body>
</html>