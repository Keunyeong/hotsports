<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String profile = request.getParameter("profile");
	if(profile.equals("empty")){
		profile = null;
	}
	String email=request.getParameter("email");
	String id= (String)session.getAttribute("id");
	UsersDto dto = new UsersDto();
	dto.setProfile(profile);
	dto.setEmail(email);
	dto.setId(id);
	
	UsersDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/update.jsp</title>
</head>
<body>
<script>
	alert("<%=id%> 님 정보가 수정되었습니다.");
	location.href="info.jsp";
</script>
</body>
</html>