<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	Object result = application.getAttribute("count");
	int count= 1;
	//만일 첫번째 출석이라
	if(result == null){
		// application 영역에 count 라는 키값으로 1을 담는다.
		application.setAttribute("count",count);
	}else{
		//원래 type 으로 casting
		count = (int)result;
		//카운트롤 1 증가 시키
		count++;
		//application 영역에 count 라는 키값으로 담는다.
		application.setAttribute("count",count);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/check.jsp</title>
</head>
<body>
	<p><strong><%=count %></strong> 번째 출석이군요!</p>
</body>
</html>