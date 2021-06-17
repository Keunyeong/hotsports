<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   
   //로그인 처리
   String id = (String)session.getAttribute("id");

	if(id==null){
		String cPath=request.getContextPath();
		response.sendRedirect(cPath+"/users/loginform.jsp");
	}
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로인된 회원의 전용 공간입니다.</h1>
	<p> 
      <strong><%=id %></strong> 님 신나게 놀아보아요
   </p>
</body>
</html>