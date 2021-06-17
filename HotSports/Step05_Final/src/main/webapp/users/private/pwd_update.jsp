<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	
	String pwd=request.getParameter("pwd");
	String newPwd=request.getParameter("newPwd");
	
	//구비밀번호가 유효한 번호인지 확인
	UsersDto dto = new UsersDto();
	dto = UsersDao.getInstance().getData(id);
	boolean isValid = pwd.equals(dto.getPwd());
	//구비밀번호가 맞다면 비밀번호를 수정
	if(isValid){
		dto.setPwd(newPwd);
		UsersDao.getInstance().updatePwd(dto);
		session.removeAttribute("id");
	}
	//응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_update.jsp</title>
</head>
<body>
<div class="container">
	<%if(isValid){ %>
		<p>
			<strong><%=id %> 님의 비밀번호를 수정하고 로그아웃 되었습니다.</strong>
			<a href="<%=request.getContextPath()%>/users/loginform.jsp">다시 로그인 하러 가기</a>
		</p>
	<%}else{ %>
		<p>이전 비밀번호가 일치하지 않습니다.</p>
		<a href="pwd_updateform.jsp">다시 시도</a>
	<%} %>
</div>
</body>
</html>