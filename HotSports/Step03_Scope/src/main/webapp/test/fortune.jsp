<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		FortuneServlet 이 오늘의 운세를 대신 응답해 달라고 한다.
		오늘의 운세가 도대체 어디에 있지
	*/
	//object type
	String fortuneToday = (String)request.getAttribute("fortuneToday");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p> 오늘의 운세 : <strong><%=fortuneToday %></strong></p>
</body>
</html>