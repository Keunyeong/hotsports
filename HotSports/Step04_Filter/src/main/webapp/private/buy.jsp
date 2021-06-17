<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//GET 방식 저니송되는 파라미터 추출
    	int num = Integer.parseInt(request.getParameter("num"));
    	int amount = Integer.parseInt(request.getParameter("amount"));
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/private/buy.jsp</title>
</head>
<body>
	<strong><%=num %></strong> 번 상품 <strong><%=amount %></strong> 개를 주문 했습니다.
</body>
</html>